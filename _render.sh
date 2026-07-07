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
# ONCE under the same window; retry launches are labeled "RETRY name" and log
# to NAME.retry.log so the first failure log is kept for the audit trail.
set -u
REPO="$(cd "$(dirname "$0")" && pwd)"
GEN="${CODEX_GEN_DIR:-$HOME/.codex/generated_images}"
JOBSDIR="$1"
OUTDIR="$2"
LOGDIR="$REPO/_render_logs"
mkdir -p "$LOGDIR" "$OUTDIR"

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

SUFFIX=$'\n\n(Use the image_generation tool to create exactly ONE image for the above. Do NOT copy, move, or write any file yourself. After the image is generated, output the absolute path of the generated PNG file on the final line.)'

render_one() {
  local name="$1"
  local promptfile="$2"
  local out="$OUTDIR/$name.png"
  local log="$LOGDIR/$name${3:-}.log"   # retry pass passes ".retry" (keeps first FAIL log)
  local prompt rc=0
  prompt="$(cat "$promptfile")$SUFFIX"
  if [ "$HAVE_TIMEOUT" -eq 1 ]; then
    timeout "$TIMEOUT_S" codex exec --sandbox workspace-write --skip-git-repo-check --cd "$REPO" "$prompt" < /dev/null > "$log" 2>&1 || rc=$?
    if [ "$rc" -eq 124 ]; then
      echo "FAIL $name : timeout (${TIMEOUT_S}s, slot released)"
      return 0
    fi
  else
    codex exec --sandbox workspace-write --skip-git-repo-check --cd "$REPO" "$prompt" < /dev/null > "$log" 2>&1 || true
  fi
  local uuid
  uuid="$(grep -oiE '[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}' "$log" | tail -1)"
  if [ -n "$uuid" ] && [ -d "$GEN/$uuid" ]; then
    local png
    png="$(ls -t "$GEN/$uuid"/*.png 2>/dev/null | head -1)"
    if [ -n "$png" ] && [ -s "$png" ]; then
      cp "$png" "$out"
      echo "OK   $name -> $out ($(wc -c < "$out") bytes)"
    else
      echo "FAIL $name : no PNG in $uuid"
    fi
  else
    echo "FAIL $name : no uuid in log"
  fi
}

n=0
launched=()
for f in "$JOBSDIR"/*.txt; do
  [ -e "$f" ] || continue
  name="$(basename "$f" .txt)"
  # skip if already rendered non-empty
  if [ -s "$OUTDIR/$name.png" ]; then echo "SKIP $name (exists)"; continue; fi
  if [ "$ROLLING" -eq 1 ]; then
    # rolling window: block until a slot frees, then launch immediately
    while [ "$(jobs -rp | wc -l)" -ge "$MAXC" ]; do wait -n || true; done
  fi
  render_one "$name" "$f" &
  launched+=("$name")
  n=$((n+1))
  # wave fallback (bash < 4.3): wait for the whole batch every MAXC launches
  if [ "$ROLLING" -eq 0 ] && [ $((n % MAXC)) -eq 0 ]; then wait; fi
done
wait

# bounded retry: collect panels that FAILed THIS pass (missing/empty PNG among
# the jobs launched above — SKIPped panels never enter `launched`) and retry
# them exactly once, respecting the same concurrency window.
retry_list=()
if [ "$n" -gt 0 ]; then
  for name in "${launched[@]}"; do
    [ -s "$OUTDIR/$name.png" ] || retry_list+=("$name")
  done
fi
retried=${#retry_list[@]}
recovered=0
if [ "$retried" -gt 0 ]; then
  r=0
  for name in "${retry_list[@]}"; do
    if [ "$ROLLING" -eq 1 ]; then
      while [ "$(jobs -rp | wc -l)" -ge "$MAXC" ]; do wait -n || true; done
    fi
    echo "RETRY $name"
    render_one "$name" "$JOBSDIR/$name.txt" ".retry" &
    r=$((r+1))
    if [ "$ROLLING" -eq 0 ] && [ $((r % MAXC)) -eq 0 ]; then wait; fi
  done
  wait
  for name in "${retry_list[@]}"; do
    [ -s "$OUTDIR/$name.png" ] && recovered=$((recovered+1))
  done
fi
echo "==== DONE ($n launched) ===="
if [ "$retried" -gt 0 ]; then echo "==== RETRY ($retried retried, $recovered recovered) ===="; fi

# post-pass integrity summary: zero-byte + md5 duplicates (EP01 real incidents)
zero="$(find "$OUTDIR" -name '*.png' -size 0 2>/dev/null)"
[ -n "$zero" ] && printf 'WARN zero-byte PNG:\n%s\n' "$zero"
dups="$(md5sum "$OUTDIR"/*.png 2>/dev/null | awk '{print $1}' | sort | uniq -d)"
[ -n "$dups" ] && echo "WARN md5 duplicates detected — delete the duplicated panel(s) and re-run: $dups"
exit 0
