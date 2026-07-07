#!/usr/bin/env bash
# Auto-resume render: repeatedly run _render.sh until all panels exist.
# Driver SKIPs existing non-empty PNGs, so each pass only renders missing ones.
# Usage: _resume.sh <jobsdir> <outdir> <expected_count> [start_HH:MM]
#   start_HH:MM (optional): wait until this local time before the first pass
#                           (useful when a plan quota resets at a known time).
set -u
REPO="$(cd "$(dirname "$0")" && pwd)"
JOBS="$1"
OUTDIR="$2"
EXPECT="$3"
START="${4:-}"

if [ -n "$START" ]; then
  now=$(date +%s)
  target=$(date -d "today $START" +%s)
  if [ "$target" -le "$now" ]; then target=$(date -d "tomorrow $START" +%s); fi
  wait_s=$((target - now))
  echo "[resume] now $(date '+%H:%M'), waiting ${wait_s}s until $START ..."
  [ "$wait_s" -gt 0 ] && sleep "$wait_s"
  echo "[resume] woke at $(date '+%H:%M'). starting render passes."
fi

count_done() { ls "$OUTDIR"/*.png 2>/dev/null | wc -l | tr -d ' '; }

for attempt in 1 2 3 4 5 6; do
  echo "[resume] === pass $attempt at $(date '+%H:%M') ==="
  bash "$REPO/_render.sh" "$JOBS" "$OUTDIR"
  d=$(count_done)
  echo "[resume] after pass $attempt: $d/$EXPECT panels present."
  if [ "$d" -ge "$EXPECT" ]; then echo "[resume] ALL $EXPECT RENDERED."; break; fi
  if [ "$attempt" -lt 6 ]; then
    echo "[resume] $((EXPECT-d)) still missing (likely quota). sleeping 1500s then retry."
    sleep 1500
  fi
done
echo "[resume] DONE at $(date '+%H:%M'). final count: $(count_done)/$EXPECT"
