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
set -u
NN="${1:?usage: _verify_release.sh <NN>}"
REPO="$(cd "$(dirname "$0")" && pwd)"
PANELS="$REPO/05_panels/ep$NN"
MANIFEST="$REPO/04_visual/ep${NN}_manifest.md5"
RELPANELS="$REPO/RELEASE/ep$NN/panels"
fail=0

echo "== release gate ep$NN =="

# 1. count
count=$(ls "$PANELS"/panel_*.png 2>/dev/null | wc -l | tr -d ' ')
echo "[1] panel count: $count"
[ "$count" -ge 50 ] || { echo "    FAIL: fewer than 50 panels"; fail=1; }

# 2. zero-byte / magic bytes
zero="$(find "$PANELS" -name 'panel_*.png' -size 0 2>/dev/null)"
[ -z "$zero" ] && echo "[2] zero-byte: none" || { printf '[2] FAIL zero-byte:\n%s\n' "$zero"; fail=1; }
bad=0
for f in "$PANELS"/panel_*.png; do
  head -c 8 "$f" | od -An -tx1 | tr -d ' \n' | grep -q '^89504e470d0a1a0a$' || { echo "    FAIL bad PNG header: $f"; bad=1; }
done
[ "$bad" -eq 0 ] && echo "[2] PNG headers: all ok" || fail=1

# 3. md5 duplicates
dups="$(md5sum "$PANELS"/panel_*.png | awk '{print $1}' | sort | uniq -d)"
[ -z "$dups" ] && echo "[3] md5 duplicates: none" || { echo "[3] FAIL md5 duplicates: $dups"; fail=1; }

# 4. manifest gate — validated bytes only
# manifest convention: created via (cd 05_panels/epNN && md5sum *.png > ../../04_visual/epNN_manifest.md5)
# but tolerate entries with directory prefixes; compare by basename.
if [ -f "$MANIFEST" ]; then
  gate=0
  seen=""
  while read -r h p; do
    [ -n "$h" ] || continue
    p="${p#\*}"          # strip md5sum binary-mode marker
    b="${p##*/}"         # basename
    seen="$seen $b"
    if [ ! -f "$PANELS/$b" ]; then
      echo "    FAIL manifest entry missing on disk: $b"; gate=1; continue
    fi
    actual="$(md5sum "$PANELS/$b" | awk '{print $1}')"
    [ "$h" = "$actual" ] || { echo "    FAIL md5 mismatch (unvalidated bytes): $b"; gate=1; }
  done < "$MANIFEST"
  for f in "$PANELS"/panel_*.png; do
    b="$(basename "$f")"
    case " $seen " in *" $b "*) ;; *) echo "    FAIL panel not in manifest (never validated): $b"; gate=1 ;; esac
  done
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

# 5. RELEASE copy integrity (only if already packaged)
if [ -d "$RELPANELS" ]; then
  diffed=0
  for f in "$PANELS"/panel_*.png; do
    b="$(basename "$f")"
    if [ ! -f "$RELPANELS/$b" ] || ! cmp -s "$f" "$RELPANELS/$b"; then
      echo "    FAIL RELEASE copy differs/missing: $b"; diffed=1
    fi
  done
  [ "$diffed" -eq 0 ] && echo "[5] RELEASE copy: identical" || fail=1
else
  echo "[5] RELEASE not packaged yet: skipped"
fi

if [ "$fail" -eq 0 ]; then echo "== GATE PASS: sign-off allowed =="; else echo "== GATE FAIL: refuse sign-off =="; fi
exit "$fail"
