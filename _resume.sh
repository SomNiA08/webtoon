#!/usr/bin/env bash
# Auto-resume: wait until 04:50, then render remaining EP01 panels.
# Driver SKIPs existing non-empty PNGs, so each pass only renders missing ones.
set -u
REPO="C:/Users/somni/Desktop/webtoon-harness-main"
PANELDIR="$REPO/_workspace/05_panels/ep01"
JOBS="$REPO/_workspace/_render_jobs/panels"

# --- wait until 04:50 today (or now if already past) ---
now=$(date +%s)
target=$(date -d "today 04:50" +%s)
if [ "$target" -le "$now" ]; then target=$(date -d "tomorrow 04:50" +%s); fi
wait_s=$((target - now))
echo "[resume] now $(date '+%H:%M'), waiting ${wait_s}s until 04:50 ..."
[ "$wait_s" -gt 0 ] && sleep "$wait_s"
echo "[resume] woke at $(date '+%H:%M'). starting render passes."

count_done() { ls "$PANELDIR"/panel_*.png 2>/dev/null | wc -l | tr -d ' '; }

for attempt in 1 2 3 4 5 6; do
  echo "[resume] === pass $attempt at $(date '+%H:%M') ==="
  bash "$REPO/_workspace/_render.sh" "$JOBS" "$PANELDIR"
  d=$(count_done)
  echo "[resume] after pass $attempt: $d/57 panels present."
  if [ "$d" -ge 57 ]; then echo "[resume] ALL 57 RENDERED."; break; fi
  if [ "$attempt" -lt 6 ]; then
    echo "[resume] $((57-d)) still missing (likely quota). sleeping 1500s then retry."
    sleep 1500
  fi
done
echo "[resume] DONE at $(date '+%H:%M'). final count: $(count_done)/57"
