#!/usr/bin/env bash
# Webtoon harness smoke test — verifies the DETERMINISTIC machinery in seconds,
# with ZERO agent tokens and ZERO codex quota (codex is faked via PATH).
# Usage:
#   bash _smoke.sh          # machinery smoke (~10s)
#   bash _smoke.sh --live   # + ONE real codex render (auth + image_generation
#                           #   check, ~2-3 min, 1 render of quota) into
#                           #   05_panels/_smoketest/ (gitignored)
# Coverage:
#   [S0] environment (python/md5sum hard deps; rolling/timeout/codex/pngquant info)
#   [S1] _split_prompts.py  — split + missing-prompt exit 1
#   [S2] _render.sh         — launch count, in-window single retry, .retry.log
#                             audit trail, SKIP-on-rerun (success/flaky/dead cases)
#   [S3] _verify_release.sh — full PASS path (50-panel fixture + manifest + RELEASE)
#   [S4] _verify_release.sh — defect detection: zero-byte / bad header / md5 dup /
#                             manifest mismatch / RELEASE divergence
# NOT covered (by design): agent judgment quality — that is the job of the
# canary 5-panel gate mid-pipeline (webtoon-orchestrator Phase 4-6).
# All fixtures live in mktemp dirs; the repo worktree is not touched
# (--live writes only gitignored outputs: 05_panels/_smoketest + _render_logs).
set -u
REPO="$(cd "$(dirname "$0")" && pwd)"
T="$(mktemp -d)"
trap 'rm -rf "$T"' EXIT
pass=0; fail=0
ok()  { echo "  PASS  $1"; pass=$((pass+1)); }
bad() { echo "  FAIL  $1"; fail=$((fail+1)); }

echo "== webtoon harness smoke =="

# ── [S0] environment ──────────────────────────────────────────────────────────
command -v python >/dev/null 2>&1 && ok "env: python" || bad "env: python missing (pipeline hard dep)"
command -v md5sum >/dev/null 2>&1 && ok "env: md5sum" || bad "env: md5sum missing (gate hard dep)"
if [ "${BASH_VERSINFO[0]:-0}" -gt 4 ] || { [ "${BASH_VERSINFO[0]:-0}" -eq 4 ] && [ "${BASH_VERSINFO[1]:-0}" -ge 3 ]; }; then
  echo "  INFO  rolling window active (bash $BASH_VERSION)"
else
  echo "  INFO  bash < 4.3 — driver falls back to wave mode"
fi
command -v timeout >/dev/null 2>&1 && echo "  INFO  GNU timeout present (hang guard active)" || echo "  INFO  no GNU timeout — RENDER_TIMEOUT inactive"
command -v codex >/dev/null 2>&1 && echo "  INFO  codex CLI present" || echo "  INFO  codex CLI missing (real renders need it; smoke fakes it)"
if command -v pngquant >/dev/null 2>&1; then echo "  INFO  pngquant present (capacity optimization active)"
elif command -v oxipng >/dev/null 2>&1; then echo "  INFO  oxipng present (lossless optimization active)"
else echo "  INFO  no pngquant/oxipng — capacity optimization will be skipped (optional)"; fi

# ── [S1] _split_prompts.py ────────────────────────────────────────────────────
mkdir -p "$T/split"
cat > "$T/split/prompts.md" <<'EOF'
### panel_001
- prompt: "smoke panel one"
### panel_002
- prompt: "smoke panel two"
EOF
if (cd "$T/split" && python "$REPO/_split_prompts.py" prompts.md jobs >/dev/null 2>&1) \
   && [ -s "$T/split/jobs/panel_001.txt" ] && [ -s "$T/split/jobs/panel_002.txt" ]; then
  ok "split: 2 headers -> 2 job files"
else bad "split: expected 2 job files"; fi
cat > "$T/split/missing.md" <<'EOF'
### panel_001
- prompt: "has a prompt"
### panel_002
- note: no prompt line here
EOF
if (cd "$T/split" && python "$REPO/_split_prompts.py" missing.md jobs2 >/dev/null 2>&1); then
  bad "split: header without prompt must exit 1"
else ok "split: header without prompt -> exit 1"; fi

# ── [S2] _render.sh with FAKE codex (no quota, no tokens) ────────────────────
mkdir -p "$T/rd/bin" "$T/rd/gen" "$T/rd/jobs" "$T/rd/out" "$T/rd/state" "$T/rd/repo"
cp "$REPO/_render.sh" "$T/rd/repo/"
cat > "$T/rd/bin/codex" <<'EOF'
#!/usr/bin/env bash
# fake codex — behavior keyed by PANEL:<name> token in the prompt (last arg)
prompt="${@: -1}"
succeed() {
  u="$(python -c "import uuid;print(uuid.uuid4())")"
  mkdir -p "$CODEX_GEN_DIR/$u"
  printf 'FAKEPNG-%s' "$u" > "$CODEX_GEN_DIR/$u/img.png"
  echo "workspace session $u done"
}
case "$prompt" in
  *PANEL:panel_dead*)  echo "error: boom"; exit 1 ;;
  *PANEL:panel_flaky*)
    if [ -e "$FAKESTATE/flaky_done" ]; then succeed
    else touch "$FAKESTATE/flaky_done"; echo "error: transient"; exit 1; fi ;;
  *) succeed ;;
esac
EOF
chmod +x "$T/rd/bin/codex"
printf 'render PANEL:panel_ok'    > "$T/rd/jobs/panel_ok.txt"
printf 'render PANEL:panel_flaky' > "$T/rd/jobs/panel_flaky.txt"
printf 'render PANEL:panel_dead'  > "$T/rd/jobs/panel_dead.txt"
out1="$(CODEX_GEN_DIR="$T/rd/gen" FAKESTATE="$T/rd/state" PATH="$T/rd/bin:$PATH" \
        bash "$T/rd/repo/_render.sh" "$T/rd/jobs" "$T/rd/out" 2>&1)"
echo "$out1" | grep -q '==== DONE (3 launched) ====' && ok "driver: 3 jobs launched" || bad "driver: expected 3 launched"
echo "$out1" | grep -q '==== RETRY (2 retried, 1 recovered) ====' && ok "driver: in-window retry 2 / recovered 1" \
  || bad "driver: expected RETRY 2/1 — got: $(echo "$out1" | grep RETRY | tr '\n' ' ')"
[ -s "$T/rd/out/panel_ok.png" ] && [ -s "$T/rd/out/panel_flaky.png" ] && [ ! -e "$T/rd/out/panel_dead.png" ] \
  && ok "driver: outputs (ok+flaky present, dead absent)" || bad "driver: unexpected output files"
[ -f "$T/rd/repo/_render_logs/panel_flaky.retry.log" ] && [ -f "$T/rd/repo/_render_logs/panel_dead.retry.log" ] \
  && ok "driver: .retry.log audit trail kept" || bad "driver: retry logs missing"
out2="$(CODEX_GEN_DIR="$T/rd/gen" FAKESTATE="$T/rd/state" PATH="$T/rd/bin:$PATH" \
        bash "$T/rd/repo/_render.sh" "$T/rd/jobs" "$T/rd/out" 2>&1)"
[ "$(echo "$out2" | grep -c '^SKIP')" -eq 2 ] && echo "$out2" | grep -q '==== DONE (1 launched) ====' \
  && ok "driver: rerun SKIPs done panels, relaunches only missing" || bad "driver: rerun SKIP behavior wrong"

# ── [S3] release gate — PASS path (50-panel fixture) ─────────────────────────
mkdir -p "$T/gate/05_panels/ep77" "$T/gate/04_visual"
cp "$REPO/_verify_release.sh" "$T/gate/"
i=1
while [ "$i" -le 50 ]; do
  n="$(printf '%03d' "$i")"
  printf '\x89PNG\r\n\x1a\nsmoke-payload-%s' "$n" > "$T/gate/05_panels/ep77/panel_$n.png"
  i=$((i+1))
done
( cd "$T/gate/05_panels/ep77" && md5sum *.png > ../../04_visual/ep77_manifest.md5 )
mkdir -p "$T/gate/RELEASE/ep77/panels"
cp "$T/gate/05_panels/ep77/"*.png "$T/gate/RELEASE/ep77/panels/"
if g3="$(bash "$T/gate/_verify_release.sh" 77 2>&1)"; then
  echo "$g3" | grep -q 'GATE PASS' && ok "gate: clean 50-panel fixture -> GATE PASS (exit 0)" \
    || bad "gate: exit 0 but no GATE PASS line"
else
  bad "gate: clean fixture should pass — $(echo "$g3" | grep FAIL | head -3 | tr '\n' ' ')"
fi

# ── [S4] release gate — defect detection ─────────────────────────────────────
printf 'x' >> "$T/gate/05_panels/ep77/panel_050.png"                              # unvalidated byte change (+ RELEASE divergence)
: > "$T/gate/05_panels/ep77/panel_049.png"                                        # zero-byte
printf 'JUNKHEADER' > "$T/gate/05_panels/ep77/panel_048.png"                      # non-PNG header
cp "$T/gate/05_panels/ep77/panel_046.png" "$T/gate/05_panels/ep77/panel_047.png"  # md5 duplicate
if g4="$(bash "$T/gate/_verify_release.sh" 77 2>&1)"; then
  bad "gate: defect fixture must fail"
else
  echo "$g4" | grep -q 'zero-byte: .*panel_049'      && ok "gate: detects zero-byte"        || bad "gate: missed zero-byte"
  echo "$g4" | grep -q 'bad PNG header: .*panel_048' && ok "gate: detects bad PNG header"   || bad "gate: missed bad header"
  echo "$g4" | grep -q 'FAIL md5 duplicates'         && ok "gate: detects md5 duplicate"    || bad "gate: missed md5 duplicate"
  echo "$g4" | grep -q 'md5 mismatch .*panel_050'    && ok "gate: detects unvalidated byte change (manifest)" || bad "gate: missed manifest mismatch"
  echo "$g4" | grep -q 'RELEASE copy differs'        && ok "gate: detects RELEASE divergence" || bad "gate: missed RELEASE divergence"
fi

# ── [S5] --live: ONE real codex render (opt-in) ──────────────────────────────
if [ "${1:-}" = "--live" ]; then
  echo "-- live: single real codex render (~2-3 min, 1 render of quota) --"
  mkdir -p "$T/live_jobs"
  printf 'A minimal test image: one plain white circle centered on a solid black background. Flat, simple, no text.' \
    > "$T/live_jobs/smoke_001.txt"
  rm -f "$REPO/05_panels/_smoketest/smoke_001.png"   # force a fresh render (SKIP would prove nothing)
  bash "$REPO/_render.sh" "$T/live_jobs" "$REPO/05_panels/_smoketest"
  [ -s "$REPO/05_panels/_smoketest/smoke_001.png" ] \
    && ok "live: codex auth + image_generation OK (05_panels/_smoketest/smoke_001.png)" \
    || bad "live: codex render failed — check 'codex login status' and _render_logs/smoke_001.log"
fi

echo "== smoke result: PASS $pass / FAIL $fail =="
[ "$fail" -eq 0 ] || exit 1
exit 0
