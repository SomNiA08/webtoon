#!/usr/bin/env bash
# Webtoon render driver: codex generates, we copy. Concurrency <= 5.
# Usage: _render.sh <jobsdir> <outdir>
#   jobsdir: directory of NAME.txt files, each holding one full codex prompt
#   outdir : where to write NAME.png
# Env knobs:
#   RENDER_CONCURRENCY: lower the rolling window below 5 (never raise it).
#   RENDER_TIMEOUT    : per-render timeout in seconds (default 900), applied
#                       when GNU `timeout` is available — a hung codex session
#                       would otherwise wedge one of the 5 slots forever.
# Concurrency model: ROLLING window — as soon as one render finishes, the next
# job launches, keeping the cap saturated. (The old wave mode waited for a whole
# batch of 5, so every wave stalled on its slowest render — 150s vs 450s spread.)
# Rolling needs `wait -n` (bash >= 4.3); older bash falls back to wave mode.
# Retry: panels that FAILed THIS pass (never pre-existing SKIPs) are retried
# ONCE, immediately in the SAME slot (in-window). The old post-pass retry wave
# made a panel that failed at minute 2 wait for the whole pass (~26 min for 50
# panels) before retrying; in-window retry hides that latency inside the window.
# Retry launches are labeled "RETRY name" and log to NAME.retry.log so the
# first failure log is kept for the audit trail.
set -u
REPO="$(cd "$(dirname "$0")" && pwd)"
GEN="${CODEX_GEN_DIR:-$HOME/.codex/generated_images}"
JOBSDIR="$1"
OUTDIR="$2"
LOGDIR="$REPO/_render_logs"
mkdir -p "$LOGDIR" "$OUTDIR"

# codex sandbox mode (2026-07-13). `workspace-write` broke on this Windows box:
# codex spawns pwsh.exe from the WindowsApps store path to read its own imagegen
# SKILL.md, and the restricted sandbox token cannot CreateProcessAsUserW there
# ("Windows error 5 / 액세스가 거부되었습니다"), so most sessions burned their slot
# without producing a PNG (measured: 1 panel per 9.5-minute pass). Under
# `danger-full-access` the same panel renders in ~4.4 min. The prompts are authored
# in-repo (no untrusted input) and the task is image generation into this repo, so
# the driver defaults to full access; override with RENDER_SANDBOX=workspace-write
# on a box where the sandboxed spawn works. (User-approved 2026-07-13.)
SANDBOX="${RENDER_SANDBOX:-danger-full-access}"

# Reasoning effort (2026-07-13). The user's global codex config runs at `ultra`,
# which is pure waste here: the drawing is done by the image_generation tool, and
# codex's own reasoning only decides "call imagegen, save to this path". Measured on
# identical-complexity panels: ultra = 265s / 47k tokens, low = 126s / 42k tokens,
# with no difference in the rendered image. Overriding per-invocation (-c) rather
# than editing ~/.codex/config.toml keeps the user's other codex work untouched.
# Raise with RENDER_EFFORT=medium if a future model needs it.
EFFORT="${RENDER_EFFORT:-low}"

# Codex plugins (documents/spreadsheets/pdf/browser/...) are irrelevant to image
# generation but their descriptions ride along in every request: a trivial "reply OK"
# call costs 15.7k tokens with them on, 7.3k with them off. The saving is swamped by
# per-panel variance in real renders, but it is free, so they are off by default.
PLUGINS_OFF="${RENDER_PLUGINS_OFF:-1}"
CODEX_OPTS=( -c "model_reasoning_effort=\"$EFFORT\"" )
[ "$PLUGINS_OFF" = "1" ] && CODEX_OPTS+=( -c 'plugins={}' )

# Hard global cap: 5 concurrent codex sessions (plan limit — never exceeded).
# RENDER_CONCURRENCY may LOWER the cap (e.g. when codex is slow); it is clamped to <=5.
MAXC="${RENDER_CONCURRENCY:-5}"
case "$MAXC" in *[!0-9]*|'') MAXC=5 ;; esac
[ "$MAXC" -ge 1 ] || MAXC=1
[ "$MAXC" -le 5 ] || MAXC=5

# Per-render timeout (seconds). Only enforced when GNU `timeout` exists (git-bash
# and Linux have it; without it the call runs unbounded, exactly as before).
TIMEOUT_S="${RENDER_TIMEOUT:-900}"
case "$TIMEOUT_S" in *[!0-9]*|'') TIMEOUT_S=900 ;; esac
HAVE_TIMEOUT=0
command -v timeout >/dev/null 2>&1 && HAVE_TIMEOUT=1

# `wait -n` support probe (bash >= 4.3). Fallback keeps old wave behavior.
if [ "${BASH_VERSINFO[0]:-0}" -gt 4 ] || { [ "${BASH_VERSINFO[0]:-0}" -eq 4 ] && [ "${BASH_VERSINFO[1]:-0}" -ge 3 ]; }; then
  ROLLING=1
else
  ROLLING=0
fi

# Save contract (2026-07-08 patch, ported from publish harness): newer codex
# builds return image_generation output INLINE (base64) and never write
# ~/.codex/generated_images — the old "Do NOT write any file" suffix then yields
# zero files, and the uuid-grep can accidentally match a STALE month-old dir
# mentioned in the log (real incident in publish: brand samples silently copied
# a months-old image → md5-duplicate pair). So codex is now told to SAVE the PNG
# itself at the exact target path (sandbox is workspace-write, OUTDIR lives in
# the repo); the driver treats a non-empty target file as success first and
# keeps the uuid-copy path only as a legacy fallback for older codex builds that
# still auto-save.
suffix_for() {
  printf '\n\n(Use the image_generation tool to create exactly ONE image for the above. Then save the generated image as a PNG file at exactly this path: %s — if the tool already saved a .png file somewhere, copy it to that path; if the image came back inline as base64 data, decode and write it to that path yourself. Create parent directories if needed. Do not save anywhere else. After saving, output that absolute path on the final line.)' "$1"
}

# absolute OUTDIR once (mixed C:/ form via cygpath when present — codex on
# Windows handles it; plain pwd elsewhere)
OUT_ABS="$(cd "$OUTDIR" && pwd)"
command -v cygpath >/dev/null 2>&1 && OUT_ABS="$(cygpath -m "$OUT_ABS")"

# Reference attachment (2026-07-12): codex `-i` attaches images to the prompt and
# image_generation DOES condition on them — verified by canary (details present in
# the original art but absent from the prompt text, e.g. feather sparkle specks and
# jacket pocket welts, transferred into the output). Before this, consistency rested
# on text tokens alone and the ref sheets were only a validator yardstick.
# Two sources, both optional (no refs => identical behavior to the text-only driver):
#   $JOBSDIR/<name>.refs  — per-panel list, one image path per line ('#' comments ok)
#   $RENDER_REFS          — space-separated list attached to EVERY render
# Paths resolve against the repo root first, then as-is.
collect_refs() {   # -> populates global IARGS
  IARGS=()
  local promptfile="$1" reffile r
  reffile="${promptfile%.txt}.refs"
  if [ -f "$reffile" ]; then
    while IFS= read -r r || [ -n "$r" ]; do
      case "$r" in ''|\#*) continue ;; esac
      if   [ -f "$REPO/$r" ]; then IARGS+=(-i "$REPO/$r")
      elif [ -f "$r" ];       then IARGS+=(-i "$r")
      else echo "WARN ref not found (skipped): $r" >&2; fi
    done < "$reffile"
  fi
  for r in ${RENDER_REFS:-}; do
    if   [ -f "$REPO/$r" ]; then IARGS+=(-i "$REPO/$r")
    elif [ -f "$r" ];       then IARGS+=(-i "$r")
    else echo "WARN ref not found (skipped): $r" >&2; fi
  done
}

render_one() {
  local name="$1"
  local promptfile="$2"
  local out="$OUTDIR/$name.png"
  local log="$LOGDIR/$name${3:-}.log"   # retry pass passes ".retry" (keeps first FAIL log)
  local prompt rc=0
  prompt="$(cat "$promptfile")$(suffix_for "$OUT_ABS/$name.png")"
  collect_refs "$promptfile"
  # The prompt goes on STDIN, never as a positional arg: `-i` is variadic, so a
  # trailing positional prompt gets swallowed as another image path and codex then
  # blocks reading stdin ("No prompt provided via stdin"). Piping is the only form
  # that works with attachments, so it is used uniformly (with or without refs).
  if [ "$HAVE_TIMEOUT" -eq 1 ]; then
    printf '%s' "$prompt" | timeout "$TIMEOUT_S" codex exec --sandbox "$SANDBOX" --skip-git-repo-check --cd "$REPO" "${CODEX_OPTS[@]}" ${IARGS[@]+"${IARGS[@]}"} > "$log" 2>&1 || rc=$?
    if [ "$rc" -eq 124 ]; then
      echo "FAIL $name : timeout (${TIMEOUT_S}s, slot released)"
      return 0
    fi
  else
    printf '%s' "$prompt" | codex exec --sandbox "$SANDBOX" --skip-git-repo-check --cd "$REPO" "${CODEX_OPTS[@]}" ${IARGS[@]+"${IARGS[@]}"} > "$log" 2>&1 || true
  fi
  # primary: codex saved the file directly at the requested path
  if [ -s "$out" ]; then
    echo "OK   $name -> $out ($(wc -c < "$out") bytes, direct)"
    return 0
  fi
  # legacy fallback: older codex auto-saves under $GEN/<session-uuid>/ — but only
  # trust a FRESH dir (mtime within this run) so a stale uuid mentioned in the
  # log can never resurrect a month-old image (the md5-duplicate incident).
  local uuid
  uuid="$(grep -oiE '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}' "$log" | tail -1)"
  if [ -n "$uuid" ] && [ -d "$GEN/$uuid" ]; then
    local png
    png="$(find "$GEN/$uuid" -name '*.png' -newermt '-30 minutes' 2>/dev/null | head -1)"
    if [ -n "$png" ] && [ -s "$png" ]; then
      cp "$png" "$out"
      echo "OK   $name -> $out ($(wc -c < "$out") bytes, legacy-copy)"
    else
      echo "FAIL $name : uuid dir exists but no fresh PNG (stale dir ignored)"
    fi
  else
    echo "FAIL $name : no saved file and no uuid in log"
  fi
}

# retry markers for this pass (background jobs can't set parent variables)
RETRYDIR="$(mktemp -d)"
trap 'rm -rf "$RETRYDIR"' EXIT

# one slot = first attempt + (only if it FAILed) one immediate retry in the
# same slot, so retries overlap the rest of the pass instead of forming a
# post-pass tail. (Wave fallback: a retry extends its wave by one render.)
render_job() {
  local name="$1" promptfile="$2"
  render_one "$name" "$promptfile"
  if [ ! -s "$OUTDIR/$name.png" ]; then
    : > "$RETRYDIR/$name"
    echo "RETRY $name"
    render_one "$name" "$promptfile" ".retry"
  fi
}

n=0
for f in "$JOBSDIR"/*.txt; do
  [ -e "$f" ] || continue
  name="$(basename "$f" .txt)"
  # skip if already rendered non-empty
  if [ -s "$OUTDIR/$name.png" ]; then echo "SKIP $name (exists)"; continue; fi
  if [ "$ROLLING" -eq 1 ]; then
    # rolling window: block until a slot frees, then launch immediately
    while [ "$(jobs -rp | wc -l)" -ge "$MAXC" ]; do wait -n || true; done
  fi
  render_job "$name" "$f" &
  n=$((n+1))
  # wave fallback (bash < 4.3): wait for the whole batch every MAXC launches
  if [ "$ROLLING" -eq 0 ] && [ $((n % MAXC)) -eq 0 ]; then wait; fi
done
wait

# retry summary from markers (SKIPped panels never launch, so markers cover
# exactly the panels that FAILed their first attempt THIS pass)
retried=0
recovered=0
for m in "$RETRYDIR"/*; do
  [ -e "$m" ] || continue
  retried=$((retried+1))
  rname="$(basename "$m")"
  [ -s "$OUTDIR/$rname.png" ] && recovered=$((recovered+1))
done
echo "==== DONE ($n launched) ===="
if [ "$retried" -gt 0 ]; then echo "==== RETRY ($retried retried, $recovered recovered) ===="; fi

# post-pass integrity summary: zero-byte + md5 duplicates (EP01 real incidents)
zero="$(find "$OUTDIR" -name '*.png' -size 0 2>/dev/null)"
[ -n "$zero" ] && printf 'WARN zero-byte PNG:\n%s\n' "$zero"
dups="$(md5sum "$OUTDIR"/*.png 2>/dev/null | awk '{print $1}' | sort | uniq -d)"
[ -n "$dups" ] && echo "WARN md5 duplicates detected — delete the duplicated panel(s) and re-run: $dups"
exit 0
