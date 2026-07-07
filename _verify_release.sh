#!/usr/bin/env bash
# Release gate: verify panels are exactly the validated bytes before sign-off.
# Usage: _verify_release.sh <NN>   (e.g. _verify_release.sh 01)
# Checks, in order:
#   1. panel count >= 50 and contiguous numbering
#   2. no zero-byte / non-PNG files
#   3. no md5 duplicates between different panels
#   4. every panel matches 04_visual/ep{NN}_manifest.md5 (validated-bytes gate)
#   5. if RELEASE/ep{NN}/panels exists, it matches 05_panels/ep{NN} exactly
# Exit 0 = gate passed (sign-off allowed). Non-zero = sign-off must be refused.
# Perf note: md5 is computed ONCE per tree (single batch call) and reused by
# checks 3/4/5 — one process spawn per file is slow on Windows (git-bash).
# Check 2 (zero-byte + PNG signature) runs as ONE python sweep for the same
# reason (the old per-file head|cmp loop spawned ~2 processes per panel);
# python absent falls back to that loop.
set -u
NN="${1:?usage: _verify_release.sh <NN>}"
REPO="$(cd "$(dirname "$0")" && pwd)"
PANELS="$REPO/05_panels/ep$NN"
MANIFEST="$REPO/04_visual/ep${NN}_manifest.md5"
RELPANELS="$REPO/RELEASE/ep$NN/panels"
fail=0

# md5 batch: GNU md5sum (Windows git-bash / Linux) or macOS `md5 -r`; both emit "<hash> <name>"
md5list() {
  if command -v md5sum >/dev/null 2>&1; then md5sum "$@"; else md5 -r "$@"; fi
}

TMP_ACT="$(mktemp)"; TMP_REL="$(mktemp)"; TMP_SIG="$(mktemp)"
trap 'rm -f "$TMP_ACT" "$TMP_REL" "$TMP_SIG"' EXIT

echo "== release gate ep$NN =="

# md5 of every png in the panels dir, computed once (basenames only)
( cd "$PANELS" 2>/dev/null && md5list *.png 2>/dev/null ) > "$TMP_ACT" || true

# 1. count + contiguous numbering
count=$(ls "$PANELS"/panel_*.png 2>/dev/null | wc -l | tr -d ' ')
echo "[1] panel count: $count"
[ "$count" -ge 50 ] || { echo "    FAIL: fewer than 50 panels"; fail=1; }
last="$(ls "$PANELS"/panel_*.png 2>/dev/null | sed -e 's/.*panel_//' -e 's/\.png$//' | sort -n | tail -1)"
if [ -n "$last" ] && [ "$((10#$last))" -ne "$count" ]; then
  echo "    FAIL: numbering not contiguous (highest panel_$last vs count $count)"; fail=1
fi

# 2. zero-byte / magic bytes — single python sweep (fallback: per-file loop)
if command -v python >/dev/null 2>&1; then
  hdr_out="$( (cd "$PANELS" 2>/dev/null && python - <<'PYEOF'
import glob, os
sig = b'\x89PNG\r\n\x1a\n'
for f in sorted(glob.glob('panel_*.png')):
    if os.path.getsize(f) == 0:
        print('ZERO ' + f)
        continue
    with open(f, 'rb') as fh:
        if fh.read(8) != sig:
            print('BADHDR ' + f)
PYEOF
) )"
  zbad=0; hbad=0
  while IFS= read -r line; do
    [ -n "$line" ] || continue
    case "$line" in
      ZERO\ *)   echo "    FAIL zero-byte: $PANELS/${line#ZERO }"; zbad=1 ;;
      BADHDR\ *) echo "    FAIL bad PNG header: $PANELS/${line#BADHDR }"; hbad=1 ;;
    esac
  done <<< "$hdr_out"
  [ "$zbad" -eq 0 ] && echo "[2] zero-byte: none" || fail=1
  [ "$hbad" -eq 0 ] && echo "[2] PNG headers: all ok" || fail=1
else
  zero="$(find "$PANELS" -name 'panel_*.png' -size 0 2>/dev/null)"
  [ -z "$zero" ] && echo "[2] zero-byte: none" || { printf '[2] FAIL zero-byte:\n%s\n' "$zero"; fail=1; }
  printf '\x89PNG\r\n\x1a\n' > "$TMP_SIG"
  bad=0
  for f in "$PANELS"/panel_*.png; do
    [ -e "$f" ] || continue
    head -c 8 "$f" | cmp -s -- - "$TMP_SIG" || { echo "    FAIL bad PNG header: $f"; bad=1; }
  done
  [ "$bad" -eq 0 ] && echo "[2] PNG headers: all ok" || fail=1
fi

# 3. md5 duplicates (reuses the batch md5s)
# note: Windows md5sum emits binary-mode names as "*panel_001.png" — strip the marker
dups="$(awk '{ n=$2; sub(/^\*/, "", n); if (n ~ /^panel_.*\.png$/) print $1 }' "$TMP_ACT" | sort | uniq -d)"
[ -z "$dups" ] && echo "[3] md5 duplicates: none" || { echo "[3] FAIL md5 duplicates: $dups"; fail=1; }

# 4. manifest gate — validated bytes only
# manifest convention: created via (cd 05_panels/epNN && md5sum *.png > ../../04_visual/epNN_manifest.md5)
# but tolerate entries with directory prefixes; compare by basename against the batch md5s.
if [ -f "$MANIFEST" ]; then
  gate=0
  gate_out="$(awk '
    NR==FNR { if (NF>=2) { n=$2; sub(/^\*/, "", n); act[n]=$1 } next }
    NF>=2 {
      h=$1; p=$2; sub(/^\*/, "", p); n=p; sub(/.*\//, "", n); seen[n]=1
      if (!(n in act))      printf "MISSING %s\n", n
      else if (act[n]!=h)   printf "MISMATCH %s\n", n
    }
    END { for (n in act) if (!(n in seen) && n ~ /^panel_.*\.png$/) printf "EXTRA %s\n", n }
  ' "$TMP_ACT" "$MANIFEST")"
  while IFS= read -r line; do
    [ -n "$line" ] || continue
    b="${line#* }"
    case "$line" in
      MISSING\ *)  echo "    FAIL manifest entry missing on disk: $b"; gate=1 ;;
      MISMATCH\ *) echo "    FAIL md5 mismatch (unvalidated bytes): $b"; gate=1 ;;
      EXTRA\ *)    echo "    FAIL panel not in manifest (never validated): $b"; gate=1 ;;
    esac
  done <<< "$gate_out"
  if [ "$gate" -eq 0 ]; then
    echo "[4] manifest gate: all panels match validated md5"
  else
    echo "[4] FAIL: panels differ from validation manifest — unvalidated re-render present."
    echo "    -> re-run panel-validator on changed panels, update reports, regenerate manifest."
    fail=1
  fi
else
  echo "[4] FAIL: manifest missing ($MANIFEST) — ask panel-validator to generate it. No gate, no sign-off."
  fail=1
fi

# 5. RELEASE copy integrity (only if already packaged) — batch md5 compare, no per-file cmp
if [ -d "$RELPANELS" ]; then
  ( cd "$RELPANELS" 2>/dev/null && md5list *.png 2>/dev/null ) > "$TMP_REL" || true
  rel_out="$(awk '
    NR==FNR { if (NF>=2) { n=$2; sub(/^\*/, "", n); rel[n]=$1 } next }
    NF>=2 {
      n=$2; sub(/^\*/, "", n)
      if (n ~ /^panel_.*\.png$/ && (!(n in rel) || rel[n]!=$1)) print n
    }
  ' "$TMP_REL" "$TMP_ACT")"
  diffed=0
  while IFS= read -r b; do
    [ -n "$b" ] || continue
    echo "    FAIL RELEASE copy differs/missing: $b"; diffed=1
  done <<< "$rel_out"
  [ "$diffed" -eq 0 ] && echo "[5] RELEASE copy: identical" || fail=1
else
  echo "[5] RELEASE not packaged yet: skipped"
fi

if [ "$fail" -eq 0 ]; then echo "== GATE PASS: sign-off allowed =="; else echo "== GATE FAIL: refuse sign-off =="; fi
exit "$fail"
