#!/usr/bin/env bash
# Webtoon render driver: codex generates, we copy. Concurrency <= 5.
# Usage: render.sh <jobsdir> <outdir>
#   jobsdir: directory of NAME.txt files, each holding one full codex prompt
#   outdir : where to write NAME.png
set -u
REPO="C:/Users/somni/Desktop/webtoon-harness-main"
GEN="C:/Users/somni/.codex/generated_images"
JOBSDIR="$1"
OUTDIR="$2"
LOGDIR="$REPO/_workspace/_render_logs"
mkdir -p "$LOGDIR" "$OUTDIR"

SUFFIX=$'\n\n(Use the image_generation tool to create exactly ONE image for the above. Do NOT copy, move, or write any file yourself. After the image is generated, output the absolute path of the generated PNG file on the final line.)'

render_one() {
  local name="$1"
  local promptfile="$2"
  local out="$OUTDIR/$name.png"
  local log="$LOGDIR/$name.log"
  local prompt
  prompt="$(cat "$promptfile")$SUFFIX"
  codex exec --sandbox workspace-write --skip-git-repo-check --cd "$REPO" "$prompt" < /dev/null > "$log" 2>&1
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
for f in "$JOBSDIR"/*.txt; do
  [ -e "$f" ] || continue
  name="$(basename "$f" .txt)"
  # skip if already rendered non-empty
  if [ -s "$OUTDIR/$name.png" ]; then echo "SKIP $name (exists)"; continue; fi
  render_one "$name" "$f" &
  n=$((n+1))
  if [ $((n % 5)) -eq 0 ]; then wait; fi
done
wait
echo "==== DONE ($n launched) ===="
