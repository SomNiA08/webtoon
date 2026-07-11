# fourcut 하네스 구현 계획

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 리서치 소재/개인 이야기를 4컷 웹툰 스트립(컷 4장 + 세로 조립 + SNS 패키지)으로 제작하는 신규 형제 하네스 `harness/fourcut`를 구축한다.

**Architecture:** publish 하네스의 검증된 기계부(_render.sh 신형 codex 저장 계약 포함)를 이식하고, 4컷 전용 자산 규약(cut_1..4 · strip{NNN})으로 분할/게이트/스모크를 개정하며, 에이전트 11명(리서치 3 + 제작 8)과 오케스트레이터 스킬 1개를 신설한다. 스펙: `docs/superpowers/specs/2026-07-11-fourcut-harness-design.md`(webtoon 리포 — Task 12에서 fourcut로 이동).

**Tech Stack:** bash(git-bash) · python 3 + Pillow 12.2.0(확인됨) · codex CLI(image_generation) · gh CLI(SomNiA08 인증 확인됨, 함대 리포 PUBLIC).

## Global Constraints

- 리포 위치: `C:\Users\somni\Desktop\SomNiA\harness\fourcut` (이하 셸 경로 `~/Desktop/SomNiA/harness/fourcut`).
- codex 전역 동시 세션 ≤ 5 (`RENDER_CONCURRENCY`는 하향만).
- `*.sh`/`*.py`는 LF 고정(.gitattributes) — CRLF 체크아웃 파손 방지.
- **SOUL.md·engine.mjs 생성 금지**(.claude/settings.json permissions.deny + CLAUDE.md §함대 관계). 킷 3층 이관 제안 금지.
- 에이전트 frontmatter에 `model:` 고정 금지(세션 상속).
- 스크립트 절대경로 하드코딩 금지 — `REPO="$(cd "$(dirname "$0")" && pwd)"`.
- 자산 명명: 컷 = `cut_1.png`~`cut_4.png`(정확히 4장), 스트립 번호 = 3자리 `strip{NNN}`(strip001부터).
- 발행은 수동(패키지까지만 — 계정 자동 포스팅 금지).
- md5: git-bash/Linux `md5sum`, macOS `md5 -r`.
- 문서·에이전트·스킬은 한국어(형제 하네스 관례).
- 커밋 메시지 끝: `Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>`.
- 테스트 픽스처는 mktemp — 리포 무오염.

## 파일 구조 (최종)

```
fourcut/
├── CLAUDE.md                      # Task 7 — 프로젝트 규약
├── README.md                      # Task 1(스텁) → Task 7(완성)
├── .gitignore  .gitattributes     # Task 1
├── .claude/settings.json          # Task 1 — deny 벽
├── .claude/agents/*.md            # Task 8 — 11명
├── .claude/skills/fourcut-orchestrator/SKILL.md   # Task 9
├── _render.sh  _resume.sh         # Task 2 — publish 원본 그대로
├── _split_prompts.py              # Task 3 — cut_[1-4] 규약 개정판
├── _compose_strip.py              # Task 4 — 신규(PIL 세로 조립)
├── _verify_release.sh             # Task 5 — 6검사 개정판
├── _smoke.sh                      # Task 6 — 4컷 픽스처 개정판
├── docs/superpowers/{specs,plans}/  # Task 12 — 스펙·계획 이동
└── 00_input/ 01_research/ 01_source/ 02_script/ 03_visual/
    04_cuts/ 05_package/ RELEASE/ _render_jobs/ _render_logs/   # Task 1 (.gitkeep)
```

산출물 경로 규약(스크립트·에이전트·스킬 전체가 공유):

| 자산 | 경로 |
|---|---|
| 브리프 | `00_input/strip{NNN}_brief.md` |
| 캐스트 SSOT | `00_input/cast/*.png` (**git 추적**) + `03_visual/cast-sheet.md` |
| 리서치 | `01_research/format-brief.md`(30일 재사용) · `topic-scan_{YYYY-MM-DD}.md` · `material-bank.md` |
| story 원문 | `01_source/*.md` |
| 대본 | `02_script/strip{NNN}_script.md` (script-editor 확정본 = C3 자구 SSOT) |
| 프롬프트 | `03_visual/strip{NNN}_prompts.md` → 분할 `_render_jobs/strip{NNN}/cut_N.txt` |
| 렌더 컷 | `04_cuts/strip{NNN}/cut_N.png` (gitignore) |
| 검증·매니페스트 | `03_visual/strip{NNN}_validation.md` · `strip{NNN}_manifest.md5` |
| 조립·패키지 | `05_package/strip{NNN}/`(strip.png·instagram.md·threads.md·qa_report.md) · `retro_strip{NNN}.md` · `ledger.md` |
| 릴리스 | `RELEASE/strip{NNN}/`(cuts/ + strip.png + 패키지 + 매니페스트 사본) (gitignore) |

---

### Task 1: 리포 스캐폴드

**Files:**
- Create: `fourcut/.gitignore`, `fourcut/.gitattributes`, `fourcut/.claude/settings.json`, `fourcut/README.md`(스텁), 산출물 디렉토리 10종의 `.gitkeep`

**Interfaces:**
- Produces: git 리포 루트(main 브랜치) — 이후 모든 Task가 이 리포에 커밋. deny 벽이 SOUL.md/engine.mjs Write/Edit를 기계 차단.

- [ ] **Step 1: 디렉토리 생성 + git init**

```bash
mkdir -p ~/Desktop/SomNiA/harness/fourcut && cd ~/Desktop/SomNiA/harness/fourcut
git init -b main
mkdir -p .claude/agents .claude/skills/fourcut-orchestrator docs/superpowers/specs docs/superpowers/plans \
  00_input/cast 01_research 01_source 02_script 03_visual 04_cuts 05_package RELEASE _render_jobs _render_logs
for d in 00_input 01_research 01_source 02_script 03_visual 04_cuts 05_package RELEASE _render_jobs _render_logs; do touch "$d/.gitkeep"; done
```

- [ ] **Step 2: .gitignore 작성** (publish 파생 — cast/ 추적 예외가 핵심 차이)

```gitignore
# macOS
.DS_Store
.AppleDouble
.LSOverride

# 작업 산출물 (하네스 실행 시 생성되는 렌더 이미지/릴리스 패키지)
_archive/
RELEASE/
04_cuts/
**/*.png

# 문서용 인포그래픽은 예외 (README 임베드)
!docs/images/
!docs/images/*.png

# 캐릭터 레퍼런스는 예외 — 시리즈 일관성의 SSOT 자산(유실 시 캐스트 닻 소실)
!00_input/cast/
!00_input/cast/*.png

# 로그/임시
*.log
.cache/
node_modules/
```

- [ ] **Step 3: .gitattributes 작성** (publish와 동일)

```gitattributes
# bash/python 스크립트는 LF 고정 — autocrlf 환경에서 CRLF로 체크아웃되면
# git-bash 실행이 깨진다(webtoon/somnia-hub 2026-07-07 동일 조치)
*.sh text eol=lf
*.py text eol=lf
```

- [ ] **Step 4: .claude/settings.json 작성** (publish와 동일 — deny 벽)

```json
{
  "permissions": {
    "deny": [
      "Write(SOUL.md)",
      "Edit(SOUL.md)",
      "Write(**/SOUL.md)",
      "Edit(**/SOUL.md)",
      "Write(soul.md)",
      "Edit(soul.md)",
      "Write(**/soul.md)",
      "Edit(**/soul.md)",
      "Write(**/engine.mjs)",
      "Edit(**/engine.mjs)"
    ]
  }
}
```

- [ ] **Step 5: README.md 스텁 작성**

```markdown
# fourcut — 4컷 웹툰 제작 하네스

리서치 소재 또는 개인 이야기를 4컷 웹툰 스트립(컷 4장 + 세로 조립 + SNS 패키지)으로 자동 제작한다.
webtoon(캐릭터 일관성)·publish(소량 자산 기계부) 형제 하네스 파생 고유 아키텍처.
진입점: `fourcut-orchestrator` 스킬. 규약: `CLAUDE.md`.

(구축 중 — Task 7에서 완성)
```

- [ ] **Step 6: 검증** — `git -C ~/Desktop/SomNiA/harness/fourcut status --short`에 위 파일 전부 등장, `python -c "import json;json.load(open('.claude/settings.json'))"` 무오류.

- [ ] **Step 7: Commit**

```bash
cd ~/Desktop/SomNiA/harness/fourcut && git add -A && git commit -m "리포 스캐폴드: 산출물 레이아웃 + LF 고정 + SOUL/engine 생성 금지 벽

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 2: 기계부 원본 이식 (_render.sh · _resume.sh — 무수정)

**Files:**
- Create: `fourcut/_render.sh`, `fourcut/_resume.sh` (publish 원본 바이트 동일 사본)

**Interfaces:**
- Consumes: publish 리포의 검증 완료 드라이버(신형 codex base64 인라인 저장 계약 반영본, 스모크 15/15 이력).
- Produces: `bash _render.sh <jobsdir> <outdir>` — NAME.txt → NAME.png, 롤링 동시 ≤5, SKIP, 창-내 1회 재시도, `RENDER_TIMEOUT`(기본 900s). `bash _resume.sh <jobsdir> <outdir> <목표수> [HH:MM]`. 두 스크립트 모두 자산명 무관(범용)이라 수정 0.

- [ ] **Step 1: 복사**

```bash
cd ~/Desktop/SomNiA/harness/fourcut
cp ../publish/_render.sh ../publish/_resume.sh .
```

- [ ] **Step 2: 바이트 동일 검증**

```bash
diff ../publish/_render.sh _render.sh && diff ../publish/_resume.sh _resume.sh && echo IDENTICAL
```
Expected: `IDENTICAL` (diff 출력 없음).

- [ ] **Step 3: Commit**

```bash
git add _render.sh _resume.sh && git commit -m "기계부 이식 1/4: 렌더 드라이버 publish 원본 그대로(신형 codex 저장 계약 포함, 자산명 무관 범용)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 3: _split_prompts.py (cut_[1-4] 규약 개정판)

**Files:**
- Create: `fourcut/_split_prompts.py`

**Interfaces:**
- Consumes: `03_visual/strip{NNN}_prompts.md` — 헤더 `### cut_N`(N=1..4) + `- prompt: "…"` 형식.
- Produces: `python _split_prompts.py <prompts_md> <outdir>` → `<outdir>/cut_N.txt`. 프롬프트 없는 헤더 → exit 1. 기존 잡 파일 내용 변경 시 stderr 감사 로그(REGEN 패치 유실 방지). Task 6 스모크 [S1]과 Task 9 스킬 Phase 5가 이 계약에 의존.

- [ ] **Step 1: 파일 작성** (publish판에서 regex·문구만 개정 — 전문)

```python
"""Split a 4-cut strip prompts markdown into one prompt .txt per cut for _render.sh.

Usage: python _split_prompts.py <prompts_md> <outdir>
  e.g. python _split_prompts.py 03_visual/strip001_prompts.md _render_jobs/strip001

Expected input format (per cut):
  ### cut_1            (cut_1 .. cut_4)
  - ...
  - prompt: "<single-line prompt, \" escaped>"
"""
import re, os, sys

if len(sys.argv) != 3:
    sys.exit(f"usage: {sys.argv[0]} <prompts_md> <outdir>")
src, outdir = sys.argv[1], sys.argv[2]
os.makedirs(outdir, exist_ok=True)

text = open(src, encoding="utf-8").read()
lines = text.splitlines()

cur = None
count = 0
headers = []   # every cut header seen, in order
written = set()
overwritten = []   # existing job files whose content changed on this run
i = 0
while i < len(lines):
    line = lines[i]
    m = re.match(r"^###\s+(cut_[1-4])\b", line)
    if m:
        cur = m.group(1)
        headers.append(cur)
    mp = re.match(r'^\s*-\s*prompt:\s*"(.*)$', line)
    if mp and cur:
        # prompt is a single long line ending with a closing quote
        prompt = mp.group(1)
        if prompt.endswith('"'):
            prompt = prompt[:-1]
        prompt = prompt.replace('\\"', '"')
        fn = os.path.join(outdir, f"{cur}.txt")
        data = prompt + "\n"
        if os.path.exists(fn):
            with open(fn, encoding="utf-8") as old:
                if old.read() != data:
                    overwritten.append(f"{cur}.txt")
        with open(fn, "w", encoding="utf-8") as f:
            f.write(data)
        count += 1
        written.add(cur)
        cur = None
    i += 1

print(f"wrote {count} cut prompt files to {outdir}")

# overwrite audit: existing job files whose content changed. Expected to list ONLY
# the cuts just edited in the prompts md. Anything else means the prompts md is
# missing REGEN-patched prompts (job .txt was hand-edited without syncing the md),
# and this run just clobbered those fixes — restore them into the md and re-split.
if overwritten:
    print(f"note: {len(overwritten)} existing file(s) had different content and were "
          f"overwritten: " + ", ".join(overwritten), file=sys.stderr)

# fail loudly if a cut header had no prompt line — a silently short jobs dir
# means the render pass "completes" while cuts are missing (wasted rework).
missing = sorted(set(headers) - written)
if missing:
    print(f"ERROR: {len(missing)} cut header(s) without a prompt line: "
          + ", ".join(missing), file=sys.stderr)
    sys.exit(1)
if count == 0:
    sys.exit("ERROR: no cuts parsed — check the prompts file format (### cut_1..cut_4 / - prompt: \"...\")")
```

- [ ] **Step 2: 정상/실패 경로 수동 테스트** (mktemp 픽스처)

```bash
cd ~/Desktop/SomNiA/harness/fourcut
T=$(mktemp -d)
printf '### cut_1\n- prompt: "one"\n### cut_2\n- prompt: "two"\n### cut_3\n- prompt: "three"\n### cut_4\n- prompt: "four"\n' > "$T/p.md"
python _split_prompts.py "$T/p.md" "$T/jobs" && ls "$T/jobs"
printf '### cut_1\n- prompt: "one"\n### cut_2\n- note: no prompt\n' > "$T/bad.md"
python _split_prompts.py "$T/bad.md" "$T/jobs2"; echo "exit=$?"
printf '### cut_5\n- prompt: "five"\n' > "$T/oob.md"
python _split_prompts.py "$T/oob.md" "$T/jobs3"; echo "exit=$?"
rm -rf "$T"
```
Expected: ① `wrote 4 cut prompt files` + `cut_1.txt cut_2.txt cut_3.txt cut_4.txt` ② `ERROR: 1 cut header(s) without a prompt line: cut_2` + `exit=1` ③ `ERROR: no cuts parsed …` + `exit=1`(cut_5는 헤더로 인정 안 됨 — 4컷 규약).

- [ ] **Step 3: Commit**

```bash
git add _split_prompts.py && git commit -m "기계부 이식 2/4: 프롬프트 분할기 — cut_1..4 규약(범위 밖 헤더 무시, 누락 프롬프트 exit 1)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 4: _compose_strip.py (신규 — PIL 세로 조립)

**Files:**
- Create: `fourcut/_compose_strip.py`

**Interfaces:**
- Consumes: `04_cuts/strip{NNN}/cut_1..4.png` (검증 통과 컷 — 매니페스트 생성 이후에만 실행).
- Produces: `python _compose_strip.py <cutsdir> <out_png> [--gap N] [--margin N] [--bg HEX]` → 세로 스트립 PNG 1장. cut 번호 비연속/2장 미만이면 exit 1. Task 5 게이트 [5]·Task 6 스모크 [S3]·Task 9 스킬 Phase 6이 이 계약에 의존.

- [ ] **Step 1: 파일 작성** (전문)

```python
"""Compose validated cut PNGs into ONE vertical strip PNG (top-to-bottom, cut_1 first).

Usage: python _compose_strip.py <cutsdir> <out_png> [--gap N] [--margin N] [--bg HEX]
  e.g. python _compose_strip.py 04_cuts/strip001 05_package/strip001/strip.png

Run AFTER cut validation + manifest — the strip is derived bytes; the gate
([5] in _verify_release.sh) fails if any cut is newer than the strip.
"""
import argparse, glob, os, re, sys

try:
    from PIL import Image
except ImportError:
    sys.exit("ERROR: Pillow not installed — run: pip install pillow")

p = argparse.ArgumentParser()
p.add_argument("cutsdir")
p.add_argument("out_png")
p.add_argument("--gap", type=int, default=24, help="px between cuts (default 24)")
p.add_argument("--margin", type=int, default=0, help="px outer margin (default 0)")
p.add_argument("--bg", default="#FFFFFF", help="background color (default white)")
a = p.parse_args()

cuts = sorted(glob.glob(os.path.join(a.cutsdir, "cut_[0-9].png")))
if len(cuts) < 2:
    sys.exit(f"ERROR: need >=2 cut_N.png in {a.cutsdir}, found {len(cuts)}")
nums = [int(re.search(r"cut_(\d)\.png$", c.replace(os.sep, "/")).group(1)) for c in cuts]
if nums != list(range(1, len(nums) + 1)):
    sys.exit(f"ERROR: cut numbering not contiguous from 1: {nums}")

imgs = [Image.open(c).convert("RGB") for c in cuts]
w = max(i.width for i in imgs)
h = sum(i.height for i in imgs) + a.gap * (len(imgs) - 1) + a.margin * 2
canvas = Image.new("RGB", (w + a.margin * 2, h), a.bg)
y = a.margin
for i in imgs:
    canvas.paste(i, (a.margin + (w - i.width) // 2, y))
    y += i.height + a.gap

os.makedirs(os.path.dirname(os.path.abspath(a.out_png)), exist_ok=True)
canvas.save(a.out_png, "PNG")
print(f"wrote {a.out_png} ({canvas.width}x{canvas.height}, {len(imgs)} cuts)")
```

- [ ] **Step 2: 수동 테스트** (실제 PIL 픽스처 — 정상 + 비연속 실패)

```bash
cd ~/Desktop/SomNiA/harness/fourcut
T=$(mktemp -d)
python - "$T" <<'PY'
import sys
from PIL import Image
for i, c in enumerate(["#FF0000", "#00FF00", "#0000FF", "#FFFF00"], 1):
    Image.new("RGB", (40, 40), c).save(f"{sys.argv[1]}/cut_{i}.png")
PY
python _compose_strip.py "$T" "$T/strip.png" --gap 10
rm "$T/cut_3.png"
python _compose_strip.py "$T" "$T/strip2.png"; echo "exit=$?"
rm -rf "$T"
```
Expected: ① `wrote …/strip.png (40x190, 4 cuts)` ② `ERROR: cut numbering not contiguous from 1: [1, 2, 4]` + `exit=1`.

- [ ] **Step 3: Commit**

```bash
git add _compose_strip.py && git commit -m "기계부 신설 3/4: 세로 스트립 조립기(PIL) — 검증 통과 컷만, 비연속 번호 exit 1

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 5: _verify_release.sh (릴리스 게이트 — 6검사 개정판)

**Files:**
- Create: `fourcut/_verify_release.sh`

**Interfaces:**
- Consumes: `04_cuts/strip{NNN}/cut_*.png`, `03_visual/strip{NNN}_manifest.md5`, `05_package/strip{NNN}/strip.png`, `RELEASE/strip{NNN}/`.
- Produces: `bash _verify_release.sh <NNN>` — exit 0 = 사인오프 허용. 검사: [1] 컷 수 == CUTS(기본 4)·연속 번호 [2] 0바이트/PNG 헤더(python 단일 스윕, 부재 시 루프 폴백) [3] md5 중복 [4] 매니페스트 정합 [5] **스트립 조립본 신선도(신설)** — 존재·PNG·어느 컷보다도 오래되지 않음 [6] RELEASE 사본(cuts + strip.png). Task 6 스모크·showrunner가 의존.

- [ ] **Step 1: 파일 작성** — publish `_verify_release.sh`를 베이스로 아래 차이를 적용한 전문을 작성한다. **원본을 Read해 구조(배치 md5 1회 계산·awk 대조·python 스윕)를 그대로 유지**하고 다음만 바꾼다:

1. 헤더 주석: 사용법 `_verify_release.sh <NNN>`, 검사 목록을 위 6개로 갱신.
2. 변수부 교체:
```bash
NN="${1:?usage: _verify_release.sh <NNN>}"
REPO="$(cd "$(dirname "$0")" && pwd)"
CUTSDIR="$REPO/04_cuts/strip$NN"
MANIFEST="$REPO/03_visual/strip${NN}_manifest.md5"
STRIP="$REPO/05_package/strip$NN/strip.png"
RELCUTS="$REPO/RELEASE/strip$NN/cuts"
RELSTRIP="$REPO/RELEASE/strip$NN/strip.png"
NCUTS="${CUTS:-4}"
```
3. PNG 시그니처 임시파일을 상단에서 1회 생성(검사 [2] 폴백과 [5]가 공유):
```bash
TMP_ACT="$(mktemp)"; TMP_REL="$(mktemp)"; TMP_SIG="$(mktemp)"
trap 'rm -f "$TMP_ACT" "$TMP_REL" "$TMP_SIG"' EXIT
printf '\x89PNG\r\n\x1a\n' > "$TMP_SIG"
echo "== release gate strip$NN =="
( cd "$CUTSDIR" 2>/dev/null && md5list *.png 2>/dev/null ) > "$TMP_ACT" || true
```
4. 검사 [1] 교체 — thumb 검사 제거, `-ge`를 `-eq`로(정확히 4장):
```bash
ccount=$(ls "$CUTSDIR"/cut_*.png 2>/dev/null | wc -l | tr -d ' ')
echo "[1] cut count: $ccount (expected $NCUTS)"
[ "$ccount" -eq "$NCUTS" ] || { echo "    FAIL: expected exactly $NCUTS cuts"; fail=1; }
last="$(ls "$CUTSDIR"/cut_*.png 2>/dev/null | sed -e 's/.*cut_//' -e 's/\.png$//' | sort -n | tail -1)"
if [ -n "$last" ] && [ "$((10#$last))" -ne "$ccount" ]; then
  echo "    FAIL: cut numbering not contiguous (highest cut_$last vs count $ccount)"; fail=1
fi
```
5. 검사 [2]: python 스윕의 glob을 `glob.glob('cut_*.png')` 하나로, 폴백 루프의 파일 패턴도 `"$CUTSDIR"/cut_*.png`로. 폴백의 시그니처 생성은 3의 `$TMP_SIG` 재사용(중복 생성 줄 삭제).
6. 검사 [3]·[4]·[6]의 awk 자산명 정규식 `^(card|thumb)_.*\.png$` → `^cut_.*\.png$`. 경로 변수 `CARDS`→`CUTSDIR`, `RELCARDS`→`RELCUTS`. 매니페스트 주석의 생성 규약을 `(cd 04_cuts/stripNNN && md5sum *.png > ../../03_visual/stripNNN_manifest.md5)`로.
7. 검사 [5] **신설** — [4]와 [6] 사이에 삽입:
```bash
# 5. strip composite — exists, PNG, and not older than any cut (derived bytes freshness)
if [ -s "$STRIP" ]; then
  if head -c 8 "$STRIP" | cmp -s -- - "$TMP_SIG"; then
    stale=0
    for f in "$CUTSDIR"/cut_*.png; do
      [ -e "$f" ] || continue
      if [ "$f" -nt "$STRIP" ]; then
        echo "    FAIL stale composite: $(basename "$f") is newer than strip.png — re-run _compose_strip.py"; stale=1
      fi
    done
    [ "$stale" -eq 0 ] && echo "[5] strip composite: present and fresh" || fail=1
  else
    echo "[5] FAIL: strip.png is not a valid PNG ($STRIP)"; fail=1
  fi
else
  echo "[5] FAIL: strip composite missing/empty ($STRIP) — run _compose_strip.py after validation."
  fail=1
fi
```
8. 검사 [6](구 [5] RELEASE) 확장 — cuts 대조 뒤 strip.png 대조 추가:
```bash
if [ -d "$RELCUTS" ] || [ -e "$RELSTRIP" ]; then
  # (기존 cuts awk 대조 유지, 번호만 [6]으로)
  if [ -e "$RELSTRIP" ] && [ -s "$STRIP" ]; then
    s1="$(md5list "$STRIP" | awk '{print $1}')"; s2="$(md5list "$RELSTRIP" | awk '{print $1}')"
    [ "$s1" = "$s2" ] || { echo "    FAIL RELEASE copy differs: strip.png"; diffed=1; }
  elif [ -d "$RELCUTS" ] && [ ! -e "$RELSTRIP" ]; then
    echo "    FAIL RELEASE strip.png missing (cuts packaged without composite)"; diffed=1
  fi
  [ "$diffed" -eq 0 ] && echo "[6] RELEASE copy: identical" || fail=1
else
  echo "[6] RELEASE not packaged yet: skipped"
fi
```

- [ ] **Step 2: 수동 테스트 — PASS 경로 + 신설 검사 스팟체크** (전 결함 클래스는 Task 6 스모크가 담당)

```bash
cd ~/Desktop/SomNiA/harness/fourcut
T=$(mktemp -d) && mkdir -p "$T/04_cuts/strip900" "$T/03_visual" "$T/05_package/strip900"
cp _verify_release.sh _compose_strip.py "$T/"
python - "$T" <<'PY'
import sys
from PIL import Image
for i, c in enumerate(["#FF0000", "#00FF00", "#0000FF", "#FFFF00"], 1):
    Image.new("RGB", (40, 40), c).save(f"{sys.argv[1]}/04_cuts/strip900/cut_{i}.png")
PY
( cd "$T/04_cuts/strip900" && md5sum *.png > ../../03_visual/strip900_manifest.md5 )
python "$T/_compose_strip.py" "$T/04_cuts/strip900" "$T/05_package/strip900/strip.png"
bash "$T/_verify_release.sh" 900; echo "exit=$?"
sleep 1 && touch "$T/04_cuts/strip900/cut_2.png"
bash "$T/_verify_release.sh" 900 | grep -E 'stale|GATE'
rm "$T/04_cuts/strip900/cut_4.png"
bash "$T/_verify_release.sh" 900 | grep -E 'expected|GATE'
rm -rf "$T"
```
Expected: ① `GATE PASS` + `exit=0` ② `FAIL stale composite: cut_2.png …` + `GATE FAIL` ③ `FAIL: expected exactly 4 cuts` + `GATE FAIL`.

- [ ] **Step 3: Commit**

```bash
git add _verify_release.sh && git commit -m "기계부 개정 4/4: 릴리스 게이트 6검사 — 컷 수/연속·무결성·md5·매니페스트 + 스트립 조립본 신선도([5] 신설)·RELEASE 사본

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 6: _smoke.sh (기계부 스모크 — 4컷 픽스처 개정판)

**Files:**
- Create: `fourcut/_smoke.sh`

**Interfaces:**
- Consumes: Task 2~5의 스크립트 4종(+ `_compose_strip.py`).
- Produces: `bash _smoke.sh` — 토큰 0·codex 쿼터 0·~10초에 기계부 전체 회귀 검증(17검사). `bash _smoke.sh --live` — 실제 codex 1장만 추가 렌더(옵트인). **스크립트 수정 후·스트립 착수 전 실행** 규약의 근거 장치. CLAUDE.md·오케스트레이터 Phase 1이 의존.

- [ ] **Step 1: 파일 작성** — publish `_smoke.sh`를 베이스로 [S0]~[S2]는 아래 소폭 개정, [S3]~[S5]는 아래 전문으로 교체한다.

**[S0]~[S2] 개정 (publish판 유지 + 차이만):**
1. 헤더 주석: `Publish harness smoke test` → `Fourcut harness smoke test`, 커버리지 목록 갱신(아래 요지 — [S1] cut 분할, [S3] 4컷+스트립 픽스처, [S4] 결함 6종, live 출력 경로 `04_cuts/_smoketest/`). "NOT covered (by design): agent judgment quality — that is the job of the canary 1-cut gate mid-pipeline (fourcut-orchestrator Phase 5)."
2. [S0]에 Pillow 하드 의존성 검사 추가(md5sum 검사 다음 줄):
```bash
python -c "import PIL" >/dev/null 2>&1 && ok "env: Pillow" || bad "env: Pillow missing (strip compose hard dep — pip install pillow)"
```
3. [S1] 픽스처를 cut 규약으로 교체:
```bash
mkdir -p "$T/split"
cat > "$T/split/prompts.md" <<'EOF'
### cut_1
- prompt: "smoke cut one"
### cut_2
- prompt: "smoke cut two"
### cut_3
- prompt: "smoke cut three"
### cut_4
- prompt: "smoke cut four"
EOF
if (cd "$T/split" && python "$REPO/_split_prompts.py" prompts.md jobs >/dev/null 2>&1) \
   && [ -s "$T/split/jobs/cut_1.txt" ] && [ -s "$T/split/jobs/cut_4.txt" ] && [ "$(ls "$T/split/jobs" | wc -l)" -eq 4 ]; then
  ok "split: 4 cut headers -> 4 job files"
else bad "split: expected 4 job files"; fi
cat > "$T/split/missing.md" <<'EOF'
### cut_1
- prompt: "has a prompt"
### cut_2
- note: no prompt line here
EOF
if (cd "$T/split" && python "$REPO/_split_prompts.py" missing.md jobs2 >/dev/null 2>&1); then
  bad "split: header without prompt must exit 1"
else ok "split: header without prompt -> exit 1"; fi
```
4. [S2]는 publish판 그대로 두되 잡 이름·토큰만 치환: `CARD:card_ok/card_flaky/card_dead` → `CUT:cut_ok/cut_flaky/cut_dead`, 파일명 `card_*.txt` → `cut_*.txt`, 가짜 codex의 `case "$prompt" in *CARD:…` → `*CUT:…`, 어서션의 `card_` → `cut_` (검사 4개: 3 launched · RETRY 2/1 · outputs · .retry.log · rerun SKIP — 유지).

**[S3]~[S5] 전문 교체:**

```bash
# ── [S3] release gate — PASS path (real 4-cut fixture + compose + manifest + RELEASE) ──
mkdir -p "$T/gate/04_cuts/strip777" "$T/gate/03_visual" "$T/gate/05_package/strip777"
cp "$REPO/_verify_release.sh" "$REPO/_compose_strip.py" "$T/gate/"
python - "$T/gate/04_cuts/strip777" <<'PYEOF'
import sys
from PIL import Image
for i, c in enumerate(["#FF0000", "#00FF00", "#0000FF", "#FFFF00"], 1):
    Image.new("RGB", (40, 40), c).save(f"{sys.argv[1]}/cut_{i}.png")
PYEOF
( cd "$T/gate/04_cuts/strip777" && md5sum *.png > ../../03_visual/strip777_manifest.md5 )
python "$T/gate/_compose_strip.py" "$T/gate/04_cuts/strip777" "$T/gate/05_package/strip777/strip.png" >/dev/null \
  && [ -s "$T/gate/05_package/strip777/strip.png" ] \
  && ok "compose: 4 cuts -> strip.png" || bad "compose: strip.png not produced"
mkdir -p "$T/gate/RELEASE/strip777/cuts"
cp "$T/gate/04_cuts/strip777/"*.png "$T/gate/RELEASE/strip777/cuts/"
cp "$T/gate/05_package/strip777/strip.png" "$T/gate/RELEASE/strip777/strip.png"
if g3="$(bash "$T/gate/_verify_release.sh" 777 2>&1)"; then
  echo "$g3" | grep -q 'GATE PASS' && ok "gate: clean 4-cut fixture -> GATE PASS (exit 0)" \
    || bad "gate: exit 0 but no GATE PASS line"
else
  bad "gate: clean fixture should pass — $(echo "$g3" | grep FAIL | head -3 | tr '\n' ' ')"
fi
cp -r "$T/gate/04_cuts/strip777" "$T/gate/backup_cuts"   # clean copy for restores

# ── [S4] release gate — defect detection (mutate -> assert -> restore) ─────────
# S4a: zero-byte + bad header + unvalidated byte change (+ RELEASE divergence)
printf 'JUNKHEADER' > "$T/gate/04_cuts/strip777/cut_2.png"
: > "$T/gate/04_cuts/strip777/cut_3.png"
printf 'x' >> "$T/gate/04_cuts/strip777/cut_4.png"
if g4="$(bash "$T/gate/_verify_release.sh" 777 2>&1)"; then
  bad "gate: defect fixture must fail"
else
  echo "$g4" | grep -q 'bad PNG header: .*cut_2' && ok "gate: detects bad PNG header"   || bad "gate: missed bad header"
  echo "$g4" | grep -q 'zero-byte: .*cut_3'      && ok "gate: detects zero-byte"        || bad "gate: missed zero-byte"
  echo "$g4" | grep -q 'md5 mismatch .*cut_4'    && ok "gate: detects unvalidated byte change (manifest)" || bad "gate: missed manifest mismatch"
  echo "$g4" | grep -q 'RELEASE copy differs'    && ok "gate: detects RELEASE divergence" || bad "gate: missed RELEASE divergence"
fi
cp "$T/gate/backup_cuts/"*.png "$T/gate/04_cuts/strip777/"
# S4b: md5 duplicate between two cuts
cp "$T/gate/04_cuts/strip777/cut_1.png" "$T/gate/04_cuts/strip777/cut_2.png"
g5="$(bash "$T/gate/_verify_release.sh" 777 2>&1)" && bad "gate: dup fixture must fail" || true
echo "$g5" | grep -q 'FAIL md5 duplicates' && ok "gate: detects md5 duplicate" || bad "gate: missed md5 duplicate"
cp "$T/gate/backup_cuts/"*.png "$T/gate/04_cuts/strip777/"
# S4c: stale strip composite (a cut re-rendered after compose)
sleep 1 && touch "$T/gate/04_cuts/strip777/cut_1.png"
g6="$(bash "$T/gate/_verify_release.sh" 777 2>&1)" && bad "gate: stale-composite fixture must fail" || true
echo "$g6" | grep -q 'stale composite: cut_1' && ok "gate: detects stale strip composite" || bad "gate: missed stale composite"

# ── [S5] --live: ONE real codex render (opt-in) ──────────────────────────────
if [ "${1:-}" = "--live" ]; then
  echo "-- live: single real codex render (~2-3 min, 1 render of quota) --"
  mkdir -p "$T/live_jobs"
  printf 'A minimal test image: one plain white circle centered on a solid black background. Flat, simple, no text.' \
    > "$T/live_jobs/smoke_001.txt"
  rm -f "$REPO/04_cuts/_smoketest/smoke_001.png"   # force a fresh render (SKIP would prove nothing)
  bash "$REPO/_render.sh" "$T/live_jobs" "$REPO/04_cuts/_smoketest"
  [ -s "$REPO/04_cuts/_smoketest/smoke_001.png" ] \
    && ok "live: codex auth + image_generation OK (04_cuts/_smoketest/smoke_001.png)" \
    || bad "live: codex render failed — check 'codex login status' and _render_logs/smoke_001.log"
fi
```

(맺음부 `echo "== smoke result: PASS $pass / FAIL $fail =="` + exit는 publish판 그대로. S4a의 manifest mismatch 어서션이 cut_2/cut_3도 MISMATCH로 잡히는 것과 무관하게 cut_4 매칭으로 판정됨에 유의 — grep은 cut_4 줄만 본다.)

- [ ] **Step 2: 실행 → 전 검사 PASS**

```bash
cd ~/Desktop/SomNiA/harness/fourcut && bash _smoke.sh
```
Expected: `== smoke result: PASS 17 / FAIL 0 ==` + exit 0. (내역: S0 3 + S1 2 + S2 4 + S3 2 + S4 6 = 17. 실측이 다르면 FAIL 0 + exit 0을 통과 기준으로 삼고 실측 수를 헤더 주석·CLAUDE.md·PORTFOLIO 행에 일치시켜 기록한다.)

- [ ] **Step 3: 결함 검출 자가 확인(메타)** — 스모크가 결함을 정말 잡는지 1회 역검증: `_verify_release.sh`의 `NCUTS="${CUTS:-4}"`를 임시로 `:-3`으로 바꾸고 스모크 실행 → S3가 FAIL해야 정상. 확인 후 원복(`git checkout -- _verify_release.sh` 대신 수동 원복 — 아직 커밋 전이므로 sed 재수정).

- [ ] **Step 4: Commit**

```bash
git add _smoke.sh && git commit -m "스모크 하네스: 4컷 픽스처 17검사 — 분할/드라이버(가짜 codex)/조립/게이트 PASS + 결함 6종(0바이트·손상 헤더·md5 중복·매니페스트 불일치·RELEASE 이탈·스트립 신선도)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 7: CLAUDE.md + README.md 완성

**Files:**
- Create: `fourcut/CLAUDE.md`
- Modify: `fourcut/README.md` (스텁 → 완성)

**Interfaces:**
- Produces: 프로젝트 규약 SSOT. Task 8 에이전트·Task 9 스킬이 여기 정의된 게이트·경로·규약을 인용한다(중복 서술 최소화 — 규약 본문은 CLAUDE.md, 실행 절차는 SKILL.md).

- [ ] **Step 1: CLAUDE.md 작성** (전문)

```markdown
# Fourcut Harness — 프로젝트 규약

리서치 소재 또는 사용자의 개인 이야기를 4컷 웹툰 스트립(컷당 1:1 1080×1080, 말풍선·한글 대사 in-image 베이크)으로 제작해 SNS 발행 패키지까지 출하하는 하네스. 진입점은 `fourcut-orchestrator` 스킬. webtoon(캐릭터 일관성 체계)·publish(소량 자산 기계부) 두 형제 리포에서 파생한 고유 아키텍처.

## 제작 단위와 트랙

발행 단위 = **스트립(strip{NNN}, 3자리)** = 컷 4장(cut_1~cut_4) + 세로 조립 strip.png 1장 + SNS 패키지(인스타 캐러셀·스레드). 컷 순서 = 기승전결(1컷 후킹 → 4컷 펀치라인).

| 트랙 | 소재 원천 | 규율 |
|------|----------|------|
| `research` | `01_research/material-bank.md`에서 소재 선택 | 원문 팩트 왜곡 금지 — script-editor가 원문 대조 |
| `story` | 사용자가 `01_source/`에 넣은 이야기/일기 | 톤·목소리 존중, 사실 검증 생략. **리서치팀 완전 우회** |

## 산출물 레이아웃 (저장소 루트 기준)

```
00_input/     # strip{NNN}_brief.md(트랙·소재 지정) · cast/(캐릭터 레퍼런스 PNG — SSOT, git 추적)
01_research/  # format-brief.md(30일 재사용) · topic-scan_{YYYY-MM-DD}.md · material-bank.md
01_source/    # story 트랙 원문·형제 하네스 반입 소재
02_script/    # strip{NNN}_script.md (script-editor 확정본 = C3 자구 SSOT)
03_visual/    # style-bible.md · cast-sheet.md · strip{NNN}_prompts.md
              # strip{NNN}_validation.md · strip{NNN}_manifest.md5
04_cuts/      # strip{NNN}/cut_1..4.png (gitignore)
05_package/   # strip{NNN}/(strip.png·instagram.md·threads.md·qa_report.md)
              # retro_strip{NNN}.md · ledger.md(누적 — 아카이브 제외)
RELEASE/      # strip{NNN}/ (gitignore)
_render_jobs/ # strip{NNN}/cut_N.txt (렌더 드라이버 입력)
_render_logs/ # codex 세션 로그 (감사 추적)
```

새 기획으로 갈아엎을 때는 위 디렉토리들을 `_archive/{timestamp}/`로 이동 후 새로 시작한다. 단 `00_input/cast/`·`03_visual/cast-sheet.md`·`style-bible.md`(캐스트 아이덴티티)와 `05_package/ledger.md`(중복 소재 방지 원장)는 같은 캐스트로 계속 가는 한 아카이브하지 않는다.

## 렌더 드라이버 (공식 — publish 이식, 신형 codex 저장 계약 반영)

- `python _split_prompts.py 03_visual/strip{NNN}_prompts.md _render_jobs/strip{NNN}` — 프롬프트 분할(`### cut_1..4` 헤더, 프롬프트 없는 헤더 exit 1)
- `bash _render.sh _render_jobs/strip{NNN} 04_cuts/strip{NNN}` — 롤링 동시 ≤5, 기존 PNG SKIP(재실행 = 누락분만), `RENDER_TIMEOUT`(기본 900초) 행 방지, 이번 패스 FAIL분 창-내 즉시 1회 자동 재시도(`RETRY` 라인·`*.retry.log`)
- `bash _resume.sh <jobsdir> <outdir> <목표수> [HH:MM]` — 쿼터 리셋 대기 후 무인 반복 렌더
- `python _compose_strip.py 04_cuts/strip{NNN} 05_package/strip{NNN}/strip.png` — 세로 스트립 조립(검증+매니페스트 **이후**에만 — 게이트 [5]가 신선도를 검사)
- `bash _verify_release.sh {NNN}` — 릴리스 게이트 6검사(컷 수/연속·무결성·md5 중복·매니페스트 정합·스트립 신선도·RELEASE 사본). **exit 0이 아니면 사인오프 금지**
- `bash _smoke.sh` — 기계부 스모크(~10초·토큰 0·쿼터 0): 분할·드라이버(가짜 codex)·조립·게이트 PASS + 결함 검출 6종. `--live`는 실제 codex 1장만. **스크립트 수정 후, 스트립 착수 전 실행**

## 품질 게이트 (webtoon EP01·publish 실사고 이식 — 생략 금지)

1. **검증 매니페스트**: cut-validator는 판정 완료 시 `(cd 04_cuts/strip{NNN} && md5sum *.png > ../../03_visual/strip{NNN}_manifest.md5)`를 남긴다. showrunner는 매니페스트 게이트 통과 없이 사인오프하지 않는다.
2. **재렌더 원자 규약**: QA 이후라도 컷을 1장이라도 재렌더하면 "6축 전체 재검증 → validation/qa 갱신 → 매니페스트 재생성 → **스트립 재조립** → RELEASE 재복사"를 한 묶음으로 완주한다.
3. **전 컷 ★앵커**: 4컷은 전부 앵커다 — 특히 1컷(후킹)·4컷(펀치라인)의 C1·C3 결함은 ACCEPT-FLAG 통과 불가. 기준 만족까지 재렌더하거나 사용자에게 에스컬레이션한다.
4. **재렌더본은 새 결함을 만든다**: 고치려던 축만 확인하지 말고 6축 전부 다시 본다.
5. **C3(자구)는 전수 검사**: 베이크된 모든 한글을 `strip{NNN}_script.md` 확정 대사와 1:1 대조. 4장이므로 전수가 기본이다.

## 검증 6축 (cut-validator)

C1 캐릭터 레퍼런스 일치(`00_input/cast/` 대조) · C2 배경/컷 간 연속성 · C3 텍스트 자구 정확(전수) · C4 프롬프트 충실도 · C5 개그 전달(기승전결 흐름·펀치라인 가독) · C6 기술 무결성(0바이트·PNG 헤더·md5 중복·비율/해상도 — 패스당 스크립트 1회 일괄).

## 성능 규약 (토큰·시간 낭비 금지)

1. **카나리아 1컷**: cut_1만 선렌더·6축 선검증 후 나머지 3컷 렌더(`_render.sh` 재실행 — cut_1 SKIP). 시스템성 결함(스타일/레터링 공통 패턴)이면 prompt-smith가 정본 수정 + 재분할 후 재개.
2. **리서치 2계층 신선도**: `format-brief.md`(4컷 유머 문법·SNS 알고리즘)는 30일 이내면 재사용(gag-analyst 재기동 금지). topic-scout는 배치마다 실행(1명이라 저렴). `material-bank.md`는 누적 소재 뱅크 — 소진 시에만 topic-scout 재기동. **story 트랙은 리서치팀 전체 스킵.**
3. **검증은 렌더와 병행**: (카나리아 이후) cut-validator는 완료 컷부터 검증, 루프 재검증은 재렌더분만.
4. **캐스트 재사용**: `00_input/cast/` + `cast-sheet.md` + `style-bible.md`가 있으면 cast-keeper를 재기동하지 않는다(신규 캐릭터 추가 시에만). 게스트 캐릭터는 토큰만으로 운영, 재등장 확정 시 캐스트 승격.
5. **(선택) 컷 용량 최적화**(pngquant — 설치됨)는 반드시 **매니페스트 생성 전**(검증된 바이트 = 배포 바이트).
6. **스트립 간 학습 루프(retro)**: 사인오프 후 `05_package/retro_strip{NNN}.md`(축별 REGEN 집계·플래그 컷·효과 확인된 보강 패턴)를 남기고, prompt-smith는 새 스트립 전 직전 retro를 Read해 선적용한다. ledger로 소재·펀치라인 중복 방지.

## 에이전트 성능 규약 (publish 동일)

1. **스폰 프롬프트에 경로를 박는다**: ① 읽을 입력 파일 정확 경로 ② 출력 경로 ③ "목록 외 탐색 금지" ④ 스트립 번호·트랙·직전 단계 요약 2~3줄.
2. **모델 티어**: 비전 판정(cut-validator·cast-keeper·showrunner)과 창작 상류(gag-writer·script-editor·prompt-smith)는 세션 모델 유지(다운그레이드 금지). 기계 실행(strip-compositor·sns-packager)은 `sonnet` 오버라이드 허용.
3. **단독 스폰 폴백**: 전 에이전트 공통 — 팀 도구(SendMessage)가 없으면 파일 기반 통신(산출물 저장 + 최종 보고)으로 대체.
4. **이미지 Read는 4~5장 병렬 배치**(cut-validator·showrunner), C6 무결성 측정은 패스당 스크립트 1회 일괄.

## 실행 환경

- 팀 실행: `TeamCreate`/`TeamDelete`가 없는 환경에서는 Agent 도구 팬아웃으로 폴백(오케스트레이터 스킬 참조).
- 에이전트 모델: 세션 모델 상속(frontmatter에 model 고정 금지). 필요 시 호출부에서 오버라이드.
- 스크립트는 저장소 루트를 자기 위치에서 유도(`$(dirname "$0")`)하므로 절대경로 하드코딩 금지. codex 생성물 위치는 `$HOME/.codex/generated_images`(`CODEX_GEN_DIR`로 오버라이드) — 단 신형 codex는 목표 경로 직접 저장(드라이버 프롬프트 서픽스).
- md5 명령: Windows(git-bash)/Linux는 `md5sum`, macOS는 `md5 -r`. 스트립 조립은 Pillow 필요(`pip install pillow`).
- `00_input/cast/`(캐릭터 레퍼런스)는 시리즈 일관성 SSOT — git 추적 예외로 보존, 재렌더 금지.
- **발행은 수동**: 하네스는 플랫폼별 패키지(붙여넣기 원고 + 이미지 순서)까지 만들고 실제 업로드는 사용자가 한다(플랫폼 약관·계정 안전).

## 함대 관계 (somnia-hub 등록 — 고유 아키텍처)

- 이 리포는 SomNia 함대 등록부(somnia-hub `bootstrap.ps1`·`PORTFOLIO.md`)에 **고유 아키텍처** 멤버로 등록되어 있다. 함대 감사(`audit.ps1`)의 등록부 대조·미푸시/미커밋·공개상태 검사만 받고, 킷 공유파일 해시 검사와 fleet-sync 전파·거버넌스 검사는 **파일 보유 기준**(engine.mjs·SOUL.md)이라 이 리포에는 적용되지 않는다.
- **SOUL.md와 `.claude/hooks/engine.mjs`를 만들지 않는다(생성 금지 벽).** `.claude/settings.json`의 `permissions.deny`가 Write/Edit 생성을 기계 차단하며, Bash/스크립트 등 다른 경로로도 만들지 않는다. **킷 3층 이관을 제안하지 말 것** — 이 하네스의 기강 장치는 훅이 아니라 릴리스 게이트(`_verify_release.sh`)·매니페스트·카나리아다.
- git이 지키는 것은 재현의 정본(대본·프롬프트·검증 원장·매니페스트·cast 시트·레퍼런스 PNG)이다. 렌더 컷·RELEASE는 gitignore라 푸시로 구출되지 않는다 — 이미지 바이트 백업은 별도로 한다(cast/만 예외적으로 git 추적).

## 하네스 진화 이력

- **2026-07-11** — 하네스 구축: webtoon(캐릭터 일관성·6축 검증·REGEN 규약)·publish(기계부 최신판 — 신형 codex base64 인라인 저장 계약, 창-내 재시도, python 스윕 게이트) 파생. 에이전트 11명(리서치 3 + 제작 8), 스킬 1종(fourcut-orchestrator), 신설 기계부 `_compose_strip.py` + 게이트 [5] 스트립 신선도 검사 + 스모크 17검사. 설계 스펙: `docs/superpowers/specs/2026-07-11-fourcut-harness-design.md`.
```

- [ ] **Step 2: README.md 완성** (전문)

```markdown
# fourcut — 4컷 웹툰 제작 하네스

리서치 소재(`research` 트랙) 또는 개인 이야기(`story` 트랙)를 **4컷 웹툰 스트립**으로 자동 제작한다:
소재 수집 → 4컷 대본(기승전결·펀치라인) → 고정 캐스트 레퍼런스 기반 컷 4장 렌더(한글 대사 in-image 베이크)
→ 6축 검증 루프 → 세로 스트립 조립 → 인스타/스레드 발행 패키지.

- 진입점: `fourcut-orchestrator` 스킬 ("4컷 만들어줘", "이 얘기 4컷으로")
- 규약: `CLAUDE.md` (품질 게이트·성능 규약·함대 관계)
- 기계부: `_split_prompts.py` → `_render.sh` → `_compose_strip.py` → `_verify_release.sh`, 회귀는 `_smoke.sh`
- 계보: webtoon(캐릭터 일관성)·publish(소량 자산 기계부) 형제 하네스 파생 고유 아키텍처

첫 가동 준비물: 캐릭터 레퍼런스 PNG를 `00_input/cast/`에 배치(오케스트레이터가 안내).
```

- [ ] **Step 3: Commit**

```bash
git add CLAUDE.md README.md && git commit -m "프로젝트 규약(CLAUDE.md): 트랙·게이트·6축·성능 규약·함대 관계 + README 완성

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 8: 에이전트 11명 (.claude/agents/*.md)

**Files:**
- Create: `fourcut/.claude/agents/{gag-analyst,topic-scout,material-synthesizer,gag-writer,script-editor,cast-keeper,prompt-smith,cut-validator,strip-compositor,sns-packager,showrunner}.md`

**Interfaces:**
- Consumes: CLAUDE.md의 경로·게이트 규약(Task 7).
- Produces: Task 9 오케스트레이터가 스폰하는 팀원 11명. **frontmatter에 `model:` 금지**, description은 트리거 판별용 한국어 한 단락. 전원 "단독 스폰 폴백" 명시.

- [ ] **Step 1~11: 각 파일 작성** (전문 — 파일당 하나)

**`gag-analyst.md`:**
```markdown
---
name: gag-analyst
description: "4컷 웹툰 포맷 분석가. 인기 4컷(인스타툰·컷툰)의 유머 문법 — 기승전결/기승전펀치 구조, 컷별 기능(1컷 후킹·4컷 펀치라인), 말풍선 리듬·대사 밀도 한계 — 과 SNS 유통 문법(인스타 캐러셀·스레드 알고리즘)을 역설계해 format-brief.md로 종합한다. 리서치 단계에서 format-brief가 없거나 30일 경과 시에만 호출한다(이내면 재사용 — 재기동 금지)."
---

# Gag Analyst — 4컷 포맷 분석가

당신은 "왜 이 4컷은 웃긴가"를 구조로 분해하는 분석가입니다. 산출물은 소재가 아니라 **문법**입니다(소재는 topic-scout 소관).

## 조사 축
1. **서사 구조**: 기승전결 vs 기승전펀치 vs 3+1(반복 3컷 + 전복 1컷) — 어떤 구조가 어떤 소재 유형에 맞는지.
2. **컷별 기능**: 1컷(스크롤 멈추는 후킹 — 캐러셀 1장이 썸네일), 2~3컷(긴장 적립), 4컷(펀치라인 — 저장/공유 트리거).
3. **레터링 리듬**: 컷당 말풍선 ≤2개·풍선당 ≤2줄(모바일 가독 한계), 무대사 컷의 효과.
4. **SNS 유통**: 인스타 캐러셀 스와이프 유도·캡션 첫 줄, 스레드 텍스트+이미지 결합 문법, 저장 유도 장치.

## 입력/출력
- 입력: WebSearch(인기 인스타툰·4컷 사례), 기존 `01_research/format-brief.md`(있으면 갱신 기준).
- 출력: `01_research/format-brief.md` — **종합 일자 명기**(30일 재사용 게이트 기준). 실행 가능한 규칙 형태로("컷당 대사 2풍선 초과 금지"처럼).

## 팀 통신 프로토콜
- **단독 스폰 폴백**: 팀 메시지 도구가 없으면 메시지 전송을 시도하지 않는다 — 산출물 저장 + 최종 보고로 대신한다.
```

**`topic-scout.md`:**
```markdown
---
name: topic-scout
description: "4컷 소재 스카우트. 지금 뜨는 이슈·밈·공감 소재(일상 공감·직장/학교·관계·계절 이벤트·화제의 뉴스)를 수집해 topic-scan을 남긴다. research 트랙 배치마다 실행한다(소재는 주 단위로 식는다 — 1명이라 저렴). story 트랙에서는 호출하지 않는다."
---

# Topic Scout — 소재 스카우트

당신은 4컷으로 만들 만한 **지금의 소재**를 모으는 스카우트입니다. 판단 기준: ① 4컷 안에 기승전결이 들어가는가(장편감 소재 제외) ② 공감 폭(타겟이 "나도 이랬는데" 하는가) ③ 시효(이번 주 안에 발행해야 사는 소재인지, 상시 소재인지 표기).

## 절차
1. `05_package/ledger.md`를 Read해 이미 다룬 소재를 파악한다(1차 중복 필터 — 최종 판단은 material-synthesizer).
2. WebSearch로 수집: 커뮤니티 화제·밈, 시즌 이벤트, 타겟 일상 공감 소재, (지정 시) 특정 주제 영역.
3. 소재당 3줄: 소재 요약 / 왜 지금인가 / 4컷 감(펀치라인이 보이는가).

## 입력/출력
- 입력: `00_input/strip{NNN}_brief.md`(주제 힌트·제약), `05_package/ledger.md`.
- 출력: `01_research/topic-scan_{YYYY-MM-DD}.md` — 소재 후보 8~15개 + 시효 표기.

## 팀 통신 프로토콜
- **단독 스폰 폴백**: 팀 메시지 도구가 없으면 산출물 저장 + 최종 보고로 대신한다.
```

**`material-synthesizer.md`:**
```markdown
---
name: material-synthesizer
description: "4컷 소재 종합가. gag-analyst의 format-brief와 topic-scout의 topic-scan, ledger(중복 원장)를 결합해 실행 가능한 소재 뱅크(material-bank.md)를 만든다. 소재별로 앵글·4컷 스케치 1줄·펀치라인 후보까지 붙여 gag-writer가 바로 집필 가능하게 한다. 리서치 배치당 1회 호출."
---

# Material Synthesizer — 소재 종합가

당신은 "조사"를 "집필 가능한 소재"로 바꾸는 종합가입니다. 소재 뱅크는 누적 자산 — 한 번 배치로 여러 스트립을 뽑아 쓴다.

## 절차
1. `format-brief.md`(문법) + `topic-scan_*.md`(소재) + `ledger.md`(다룬 것)를 Read.
2. 소재를 선별·랭킹: 공감 폭 × 펀치라인 명확성 × 캐스트 적합성(고정 캐릭터로 연기 가능한가). ledger와 소재·펀치라인이 겹치면 제외하거나 앵글을 뒤집는다(동일 앵글 재발행 금지).
3. 소재당 엔트리: `소재 | 앵글 | 4컷 스케치(기/승/전/결 각 1줄) | 펀치라인 후보 | 시효 | 상태(미사용)`.

## 입력/출력
- 입력: `01_research/format-brief.md`, `01_research/topic-scan_*.md`(최신), `05_package/ledger.md`.
- 출력: `01_research/material-bank.md` — 기존 파일이 있으면 **이어 쓴다**(사용된 소재는 상태를 '사용(strip{NNN})'으로 갱신, 삭제 금지 — 중복 방지 원장 겸용).

## 팀 통신 프로토콜
- **단독 스폰 폴백**: 팀 메시지 도구가 없으면 산출물 저장 + 최종 보고로 대신한다.
```

**`gag-writer.md`:**
```markdown
---
name: gag-writer
description: "4컷 대본 작가. 소재(research: material-bank 선택 소재 / story: 사용자 원문)를 기승전결 4컷 대본으로 만든다 — 컷별 장면·캐릭터·확정 대사(말풍선 종류 포함)·연출 힌트. 1컷 후킹과 4컷 펀치라인을 책임진다. 대본 집필·재집필·펀치라인 보강 요청 시 호출한다."
---

# Gag Writer — 4컷 대본 작가

당신은 4컷의 전부인 **리듬과 펀치라인**을 쓰는 작가입니다. 4컷은 편집의 예술 — 넣을 것을 고르는 게 아니라 뺄 것을 골라냅니다.

## 집필 규칙
1. **구조**: 1컷 후킹(상황 제시+스크롤 멈춤) → 2컷 적립 → 3컷 긴장/전조 → 4컷 펀치라인(전복·과장·공감 폭발 중 택1). format-brief의 검증된 구조 규칙을 따른다.
2. **대사 밀도**: 컷당 말풍선 ≤2, 풍선당 ≤2줄·줄당 ≤12자 내외(베이크 가독 한계). 무대사 컷 허용(3컷에 효과적).
3. **트랙 모드**: `research` — 원문(material-bank 엔트리·출처)의 사실을 왜곡하지 않는다(유머는 반응·연출에서, 사실 변형에서 얻지 않는다). `story` — 사용자 원문의 톤·목소리를 존중하고 사건을 지어내지 않는다(과장은 감정 표현까지만).
4. **캐스트**: `03_visual/cast-sheet.md`의 고정 캐릭터로 배역을 짠다. 게스트가 필요하면 최소화하고 외형 토큰을 대본에 명시한다.

## 출력 형식 — `02_script/strip{NNN}_script.md`
컷당: `## cut_N` / 장면(장소·시간·카메라 힌트 1줄) / 등장(캐릭터 IDTAG) / 대사(화자: "자구" — 말풍선 종류: 대사/생각/외침/나레) / 연출 노트(표정·동작·효과). 말미에 `펀치라인 한 줄 요약`과 `소재 출처`(research: material-bank 엔트리, story: 01_source 파일명).

## 팀 통신 프로토콜
- **단독 스폰 폴백**: 팀 메시지 도구가 없으면 산출물 저장 + 최종 보고로 대신한다.

## 재호출 지침
- 펀치라인 보강/재집필 시 기존 대본을 Read해 지시된 컷만 고친다(무관 컷 재작성 금지 — 이미 렌더된 컷의 C3 기준이 흔들린다).
```

**`script-editor.md`:**
```markdown
---
name: script-editor
description: "4컷 대본 검수 에디터. 펀치라인 전달력(독자가 4컷에서 웃는가), 대사 자연스러움, 자구 확정(C3 검증 기준이 되므로 오탈자 불가), research 트랙의 원문 사실 대조를 수행해 확정본을 만든다. 대본 초고 완성 후, 또는 확정본 재검수 요청 시 호출한다."
---

# Script Editor — 대본 검수 에디터

당신의 확정본이 **C3(자구) 검증의 SSOT**가 됩니다 — 여기서 확정된 대사와 베이크된 이미지가 1:1 대조됩니다. 오탈자가 확정본에 남으면 그대로 이미지에 구워집니다.

## 검수 축
1. **펀치라인 전달**: 4컷만 먼저 읽어도 웃긴가 → 1~3컷이 그 웃음을 키우는가. 4컷이 설명조면 REDO(펀치라인은 보여주기).
2. **리듬**: 컷 간 시간 점프가 자연스러운가, 3컷이 펀치라인을 스포일하지 않는가.
3. **자구 확정**: 오탈자·띄어쓰기·문장부호 최종 확정. 대사 밀도 규칙(컷당 ≤2풍선·풍선당 ≤2줄) 위반은 대사를 줄여서 해결(폰트 축소 발상 금지).
4. **원문 대조(research 트랙)**: 대본의 사실 요소를 material-bank 엔트리·출처와 대조 — 수치·고유명사·사건 관계 왜곡이 있으면 수정. story 트랙은 톤 존중(사실 검증 생략).

## 입력/출력
- 입력: `02_script/strip{NNN}_script.md`(초고), research 트랙이면 `01_research/material-bank.md`의 해당 엔트리.
- 출력: `02_script/strip{NNN}_script.md` **덮어쓰기 갱신**(확정본 — 판정 요약을 파일 말미에 2~3줄 기록).

## 팀 통신 프로토콜
- **단독 스폰 폴백**: 팀 메시지 도구가 없으면 산출물 저장 + 최종 보고로 대신한다.
- 초고의 구조 결함(펀치라인 부재)은 수정 대신 gag-writer 재집필 요청으로 돌려보낸다(에디터가 대필하지 않는다).
```

**`cast-keeper.md`:**
```markdown
---
name: cast-keeper
description: "캐스트 관리자(아트 디렉터 겸 캐릭터 디자이너). 사용자가 보유한 캐릭터 레퍼런스 PNG(00_input/cast/)를 Read해 캐릭터별 외형 일관성 토큰(cast-sheet.md)과 작화 스타일 가이드(style-bible.md)를 추출·확정한다. 최초 1회 + 신규 캐릭터 추가/외형 변경 시에만 호출한다(기존 시트 있으면 재기동 금지). 비전 판정 — 세션 모델 유지."
---

# Cast Keeper — 캐스트 관리자

당신은 이 하네스의 **일관성 SSOT**를 만듭니다. 레퍼런스 이미지는 이미 존재합니다(렌더하지 않는다) — 당신의 일은 그 이미지를 **말로 고정**하는 것입니다: prompt-smith가 프롬프트에 주입할 토큰과, cut-validator가 C1 판정에 쓸 기준을.

## 절차
1. `00_input/cast/*.png`를 병렬 Read(4~5장 배치).
2. 캐릭터별 **IDTAG**(영문 짧은 식별자)와 외형 토큰 추출: 헤어(색·길이·형태)/눈(색·형태)/복장(기본 의상·색)/체형·연령감/식별 특징(안경·점·소품 등 2~3개). 토큰은 codex 프롬프트에 그대로 넣을 영문 구문으로.
3. `style-bible.md`: 레퍼런스에서 관찰되는 화풍(선 굵기·명암·팔레트·비율 데포르메)을 규정하고, 4컷 규격(1:1 1080×1080·말풍선 스타일·한글 손글씨체 지시·컷 프레임)을 확정한다.
4. 레퍼런스가 흐릿한 속성(예: 뒷모습 미확인)은 **모호로 표기**하고 사용자에게 확인 요청 — 지어내지 않는다.

## 입력/출력
- 입력: `00_input/cast/*.png`(사용자 제공 — 없으면 작업 불가, 오케스트레이터에 배치 요청).
- 출력: `03_visual/cast-sheet.md`(캐릭터별 IDTAG·토큰·근거 레퍼런스 파일명), `03_visual/style-bible.md`.

## 팀 통신 프로토콜
- **단독 스폰 폴백**: 팀 메시지 도구가 없으면 산출물 저장 + 최종 보고로 대신한다.

## 재호출 지침
- 신규 캐릭터 추가 시 기존 시트에 **이어 쓴다**(기존 캐릭터 토큰 재작성 금지 — 이미 출하된 스트립의 C1 기준이 흔들린다). 게스트 캐릭터의 캐스트 승격도 동일.
```

**`prompt-smith.md`:**
```markdown
---
name: prompt-smith
description: "4컷 프롬프트 스미스. 확정 대본의 각 컷을 codex-image 프롬프트로 변환한다 — style-bible 스타일 토큰 + cast-sheet 캐릭터 토큰 + 말풍선·한글 대사 in-image 베이크를 모든 프롬프트에 주입. cut-validator의 REGEN 수정 지시를 받아 프롬프트를 보강할 때도 호출한다."
---

# Prompt Smith — 4컷 프롬프트 스미스

당신은 대본과 스타일을 **렌더 가능한 프롬프트 4개**로 굽는 스미스입니다.

## 합성 규칙
1. 프롬프트 = [style-bible 스타일 토큰(전 컷 동일)] + [등장 캐릭터의 cast-sheet 토큰 전문] + [장면·구도·표정] + [말풍선 베이크: 종류·위치·**한글 자구 그대로**(따옴표로 감싸 명시)] + [1:1 1080×1080].
2. **`no text` 금지**(텍스트를 그려야 한다). 부정 지시는 `no English text, no gibberish, no misspelled Hangul`로.
3. 착수 전 직전 스트립 `05_package/retro_strip{NNN-1}.md`를 Read해 검증된 보강 패턴을 선적용한다(동일 결함 클래스 재발 방지).
4. 컷 간 연속성: 같은 장소면 배경 고정 토큰을 컷 간 복사(C2 기준). 4컷 규격·프레임 스타일 통일.

## 출력 형식 — `03_visual/strip{NNN}_prompts.md`
컷당: `### cut_N` 헤더 + 메타 불릿 + `- prompt: "<단일 행, 내부 따옴표는 \" 이스케이프>"`. 작성 후 `python _split_prompts.py 03_visual/strip{NNN}_prompts.md _render_jobs/strip{NNN}` 실행이 exit 0인지 확인한다.

## REGEN 보강
- cut-validator의 지시(축·현상)를 받으면 **정본(prompts.md)을 수정하고 재분할**한다 — job .txt 직접 수정 금지(정본-잡 불일치는 다음 분할 때 패치를 덮어쓴다).

## 팀 통신 프로토콜
- **단독 스폰 폴백**: 팀 메시지 도구가 없으면 산출물 저장 + 최종 보고로 대신한다.
```

**`cut-validator.md`:**
```markdown
---
name: cut-validator
description: "컷 검증가(생성-검증 루프 게이트키퍼). 렌더된 각 컷을 6축(C1 캐릭터 레퍼런스 일치·C2 배경/컷 연속성·C3 텍스트 자구 전수·C4 프롬프트 충실도·C5 개그 전달/흐름·C6 기술 무결성)으로 검사하고, 미달 컷에 구체 수정 지시와 REGEN을 내려 기준 만족까지 재생성시킨다. 판정 완료 시 md5 매니페스트를 생성한다. general-purpose 타입(스크립트+이미지 육안) — 세션 모델 유지."
---

# Cut Validator — 컷 검증가 (게이트키퍼)

4컷은 전 컷이 앵커입니다 — 버릴 수 있는 컷이 한 장도 없습니다. 특히 1컷(후킹)과 4컷(펀치라인)의 C1·C3 결함은 FLAG로 통과시킬 수 없습니다.

## 검증 6축
- **C1 캐릭터 일치**: `00_input/cast/` 레퍼런스 PNG와 직접 대조(헤어·눈·복장·식별 특징) — cast-sheet 토큰이 아니라 **이미지가 기준**.
- **C2 배경/연속성**: 같은 장소 컷 간 배경 일치, 소품 연속.
- **C3 텍스트 자구(전수)**: 베이크된 모든 한글을 `02_script/strip{NNN}_script.md` 확정 대사와 1:1 대조 — 오탈자·유령 글자·누락·뭉개짐. 말풍선 종류·화자 꼬리 방향도 대본과 일치.
- **C4 프롬프트 충실도**: 구도·표정·연출 지시 반영 여부.
- **C5 개그 전달**: 컷 순서로 읽었을 때 기승전결이 서는가, 4컷 펀치라인이 시각적으로 사는가.
- **C6 기술 무결성**: 0바이트·PNG 헤더·md5 중복·1:1 비율 — **패스당 스크립트 1회 일괄**(per-file 판정 금지).

## 운영 규약
1. **카나리아 선검증**: cut_1 선렌더분을 6축 선검증. 시스템성 결함(스타일 이탈·레터링 실패)이면 나머지 렌더 보류 유지, prompt-smith 정본 수정 요청.
2. **렌더와 병행**: 카나리아 이후 완료 컷부터 검증(전체 대기 금지). 이미지 Read는 4장 병렬 배치(레퍼런스 포함 5장).
3. **판정·원장**: 컷별 ACCEPT/REGEN + 구체 수정 지시(축·현상·보강 방향)를 `03_visual/strip{NNN}_validation.md`에 기록. REGEN 회복은 `컷 → 축 → 적용 보강 → 결과` 형식(retro의 원천).
4. **루프**: REGEN → prompt-smith 정본 보강·재분할 → 오케스트레이터가 해당 컷만 재렌더(`_render.sh` — 통과 컷은 SKIP) → **재렌더분만 재검증**. 컷당 최대 3회, 초과 시 ACCEPT-FLAG(한계 기록). **단 1컷·4컷의 C1·C3는 FLAG 불가** — 기준 만족까지, 불가하면 사용자 에스컬레이션.
5. **매니페스트(판정 완료 의무)**: 전 컷 통과 시 `(cd 04_cuts/strip{NNN} && md5sum *.png > ../../03_visual/strip{NNN}_manifest.md5)`. **재렌더 원자 규약**: 이후 1장이라도 재렌더되면 6축 재검증→validation 갱신→매니페스트 재생성→스트립 재조립→RELEASE 재복사 한 묶음.

## 작업 원칙
- 재렌더본은 새 결함을 만든다 — 6축 전부 다시 본다. 판정 근거는 재현 가능하게("C3 위반 — cut_2 두 번째 풍선 '괜찮아요'가 '괜찬아요'로 베이크"). 애매하면 REGEN.

## 입력/출력
- 입력: `04_cuts/strip{NNN}/*.png`, `02_script/strip{NNN}_script.md`(C3), `00_input/cast/*.png`(C1), `03_visual/style-bible.md`(C4), `_render_jobs/strip{NNN}/*.txt`(C4).
- 출력: `03_visual/strip{NNN}_validation.md`, `03_visual/strip{NNN}_manifest.md5`.

## 팀 통신 프로토콜
- **단독 스폰 폴백**: 팀 메시지 도구가 없으면 산출물 저장 + 최종 보고로 대신한다.
- REGEN 지시는 prompt-smith에게, 시스템성 결함·앵커 에스컬레이션은 오케스트레이터에게.

## 재호출 지침
- 재검증 재호출 시 기존 validation.md를 Read해 이어 쓴다(원장 연속성). 범위는 재렌더분만.
```

**`strip-compositor.md`:**
```markdown
---
name: strip-compositor
description: "스트립 조립가. 검증 통과(매니페스트 생성 완료)한 컷 4장을 _compose_strip.py로 세로 스트립 PNG 1장으로 조립하고 결과(치수·컷 순서·간격)를 확인한다. 조립 단계, 또는 재렌더 후 재조립(재렌더 원자 규약) 시 호출한다. 기계 실행 — sonnet 오버라이드 허용."
---

# Strip Compositor — 스트립 조립가

## 절차
1. **선행조건 확인**: `03_visual/strip{NNN}_manifest.md5` 존재(검증 완료 전 조립 금지 — 게이트 [5]가 신선도를 검사하므로 순서가 강제된다).
2. `python _compose_strip.py 04_cuts/strip{NNN} 05_package/strip{NNN}/strip.png` 실행(기본 gap 24px·흰 배경 — style-bible에 별도 규정 있으면 해당 옵션 적용).
3. 결과 확인: exit 0, 출력 로그의 치수(1080 × ~4392), 생성 파일 Read로 컷 순서 1→4 육안 1회.

## 입력/출력
- 입력: `04_cuts/strip{NNN}/cut_1..4.png`, `03_visual/style-bible.md`(간격·배경 규정).
- 출력: `05_package/strip{NNN}/strip.png`.

## 팀 통신 프로토콜
- **단독 스폰 폴백**: 팀 메시지 도구가 없으면 산출물 저장 + 최종 보고로 대신한다.
- 조립 실패(비연속 번호 등)는 오케스트레이터에 보고(컷 결손 = 상류 문제, 여기서 고치지 않는다).
```

**`sns-packager.md`:**
```markdown
---
name: sns-packager
description: "SNS 발행 패키저. 검증 통과한 스트립을 인스타그램(캐러셀 4장 + 캡션·해시태그)·스레드(본문 분할 + 이미지 첨부 순서) 발행 패키지로 만든다. 발행은 수동 — 붙여넣기 가능한 완성 원고까지만. 패키징 단계, 또는 캡션 재작성 요청 시 호출한다. 기계 실행 — sonnet 오버라이드 허용."
---

# SNS Packager — 발행 패키저

## 산출 규격
1. `instagram.md`: 캐러셀 순서(cut_1→4 — 1장이 썸네일), 캡션(첫 줄 후킹 — 4컷 펀치라인 스포일 금지, format-brief 문법 준수), 해시태그(소재·장르·타겟 혼합 10~15개), 대체텍스트.
2. `threads.md`: 본문(스트립 요지 1~2문장 + strip.png 1장 첨부 또는 컷 4장 분할 — format-brief 권고 따름), 후속 답글 여지.
3. 캡션의 사실 서술은 대본 확정본과 일치해야 한다(research 트랙 — 캡션에서 새 주장 추가 금지).

## 입력/출력
- 입력: `02_script/strip{NNN}_script.md`(확정본), `01_research/format-brief.md`(캡션·해시태그 문법), `05_package/strip{NNN}/strip.png`.
- 출력: `05_package/strip{NNN}/instagram.md`, `05_package/strip{NNN}/threads.md`.

## 팀 통신 프로토콜
- **단독 스폰 폴백**: 팀 메시지 도구가 없으면 산출물 저장 + 최종 보고로 대신한다.
```

**`showrunner.md`:**
```markdown
---
name: showrunner
description: "총괄 책임자(사인오프). 스트립의 끝단 QA(컷 4장+스트립 육안 전수 재검·패키지 정합)를 수행하고, 릴리스 게이트(_verify_release.sh) exit 0을 확인한 뒤 RELEASE 패키징·사인오프·retro·ledger 갱신까지 완주한다. 검증 통과 후 릴리스 단계, 또는 사인오프 재검토 시 호출한다. 비전 판정 — 세션 모델 유지."
---

# Showrunner — 총괄 책임자

당신의 서명이 곧 출하입니다. 게이트가 exit 0이 아니면 **어떤 이유로도 사인오프하지 않습니다.**

## 절차
1. **끝단 QA(전수)**: validation.md(FLAG 파악) 선독 → 컷 4장+strip.png 육안 재검(4장뿐이므로 전수 — C1 레퍼런스 대조 포함) → 패키지 정합(캡션↔컷↔대본 사실 일치) → `05_package/strip{NNN}/qa_report.md`(항목별 PASS/FIX 판정).
2. FIX 발생 → 해당 단계 재투입. **재렌더가 1장이라도 발생하면 재렌더 원자 규약**(6축 재검증→리포트 갱신→매니페스트 재생성→스트립 재조립→RELEASE 재복사) 완주 후 1부터 다시.
3. **게이트**: `bash _verify_release.sh {NNN}` → **exit 0 확인**.
4. **RELEASE 패키징**: `RELEASE/strip{NNN}/` = cuts/(컷 4장) + strip.png + instagram.md + threads.md + qa_report.md + 매니페스트 사본. 복사 후 **게이트 1회 재실행**(사본 무결성 — [6] 검사 활성).
5. **사인오프 후**: `05_package/retro_strip{NNN}.md`(축별 REGEN 집계·FLAG 컷·효과 확인된 보강 패턴 — validation.md의 `컷→축→보강→결과` 기록 원천) + `05_package/ledger.md`에 1행(소재·트랙·발행일·펀치라인 요약·성과 메모 자리).

## 입력/출력
- 입력: `03_visual/strip{NNN}_validation.md`, `04_cuts/strip{NNN}/`, `05_package/strip{NNN}/`, `00_input/cast/`(C1 대조).
- 출력: `qa_report.md`, `RELEASE/strip{NNN}/`, `retro_strip{NNN}.md`, `ledger.md` 갱신.

## 팀 통신 프로토콜
- **단독 스폰 폴백**: 팀 메시지 도구가 없으면 산출물 저장 + 최종 보고로 대신한다.
- 게이트 FAIL·앵커 미달은 오케스트레이터/사용자에 에스컬레이션(우회 금지).
```

- [ ] **Step 12: 검증** — 11개 파일 존재 + frontmatter에 `model:` 없음:

```bash
cd ~/Desktop/SomNiA/harness/fourcut
ls .claude/agents/ | wc -l          # 11
grep -l '^model:' .claude/agents/*.md || echo "NO-MODEL-OK"
grep -L '단독 스폰 폴백' .claude/agents/*.md || echo "FALLBACK-OK"
```
Expected: `11` · `NO-MODEL-OK` · `FALLBACK-OK`.

- [ ] **Step 13: Commit**

```bash
git add .claude/agents && git commit -m "에이전트 11명: 리서치 3(gag-analyst·topic-scout·material-synthesizer) + 제작 8(gag-writer·script-editor·cast-keeper·prompt-smith·cut-validator·strip-compositor·sns-packager·showrunner)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 9: fourcut-orchestrator 스킬

**Files:**
- Create: `fourcut/.claude/skills/fourcut-orchestrator/SKILL.md`

**Interfaces:**
- Consumes: Task 8 에이전트 11명, Task 2~6 기계부, CLAUDE.md 규약.
- Produces: 하네스 진입점 스킬 — Phase 0~7 실행 절차. 트리거·팀 구성·데이터 흐름·에러 핸들링 포함.

- [ ] **Step 1: SKILL.md 작성** (전문)

```markdown
---
name: fourcut-orchestrator
description: "4컷 웹툰 제작 에이전트 팀(11명)을 조율하는 메인 오케스트레이터. 소재 수집(research 트랙: 소재 뱅크 / story 트랙: 사용자 이야기) → 4컷 기승전결 대본 → 고정 캐스트 레퍼런스 기반 컷 4장을 말풍선·한글 대사 in-image 베이크로 codex-image 렌더 → cut-validator 6축 검증 루프 → 세로 스트립 조립 + 인스타/스레드 발행 패키지까지 전 과정을 운영한다. 트리거: '4컷 만들어', '4컷 웹툰/만화 제작', '이 얘기(이야기)를 4컷으로', '리서치 소재로 4컷', '인스타툰 만들어', '4컷 하네스 실행'. 후속 작업: '다음 스트립', '이 스트립 다시/수정', '컷 N 다시', '펀치라인 다시', '캡션 다시', '소재 뱅크 갱신'에도 반드시 이 스킬을 사용. 단순 소재 상담은 직접 응답."
---

# Fourcut Orchestrator — 4컷 스트립 제작 팀 조율

4컷 스트립 1개(컷 4장 + 세로 조립 + SNS 패키지)를 소재부터 릴리스까지 만들어내는 통합 오케스트레이터. 11개 전문 에이전트를 단계별로 운영한다. 규약 본문(게이트·6축·성능 규약)은 `CLAUDE.md`가 정본 — 이 스킬은 실행 절차다.

## 실행 모드

**팀 도구(TeamCreate/TeamDelete)가 있으면** Phase별 팀 구성, **없으면 Agent 도구 팬아웃**으로 폴백(독립 작업은 한 메시지에 병렬 스폰, 의존 작업은 순차).

**모델:** 기본 세션 모델 상속(model 미지정). 다운그레이드 금지: cut-validator·cast-keeper·showrunner(비전 판정), gag-writer·script-editor·prompt-smith(창작 상류). `model: "sonnet"` 허용: strip-compositor·sns-packager(기계 실행). 리서치 3인은 기본 상속, 사용자가 비용 절감 요청 시 sonnet 허용.

**스폰 프롬프트 규약:** ① 읽을 입력 파일 정확 경로 ② 출력 경로 ③ "목록 외 저장소 탐색 금지" ④ 스트립 번호·트랙·직전 단계 요약 2~3줄.

## 에이전트 구성 (11명)

| 팀 | 팀원 | 역할 | 주요 출력 |
|----|------|------|----------|
| 리서치(research 트랙만) | gag-analyst | 4컷 유머 문법·SNS 알고리즘(30일 재사용) | 01_research/format-brief.md |
| | topic-scout | 뜨는 이슈·밈·공감 소재(배치마다) | 01_research/topic-scan_{date}.md |
| | material-synthesizer | 종합 → 소재 뱅크(ledger 중복 대조) | 01_research/material-bank.md |
| 대본 | gag-writer | 4컷 기승전결 대본(확정 대사+연출) | 02_script/strip{NNN}_script.md |
| | script-editor | 펀치라인·자구 확정·원문 대조 → 확정본 | 〃 (갱신 = C3 SSOT) |
| 비주얼 | cast-keeper | 캐스트 토큰·스타일 바이블(최초 1회) | 03_visual/cast-sheet.md·style-bible.md |
| | prompt-smith | 컷 4개 프롬프트(토큰+베이크) | 03_visual/strip{NNN}_prompts.md |
| | cut-validator | 6축 검증·REGEN 루프·매니페스트(general-purpose) | 03_visual/strip{NNN}_validation.md·manifest |
| 패키징 | strip-compositor | 세로 스트립 조립 | 05_package/strip{NNN}/strip.png |
| | sns-packager | 인스타·스레드 패키지 | 05_package/strip{NNN}/*.md |
| | showrunner | 끝단 QA·게이트·사인오프·retro·ledger | qa_report·RELEASE/strip{NNN}/·retro |

## 워크플로우

### Phase 0: 컨텍스트 판별

1. `03_visual/cast-sheet.md` 미존재 → **초기 실행**(캐스트 임포트부터, Phase 1→4).
2. 산출물 존재 + "다음 스트립"/새 소재 → **새 스트립**: {NNN} 증가, cast·style-bible·format-brief(30일)·ledger 재사용.
3. "이 스트립의 OO만 다시" → **부분 재실행**: 해당 단계만 재투입, 하위 단계는 영향 범위만. **컷을 1장이라도 재렌더하면 재렌더 원자 규약 완주**(CLAUDE.md 게이트 2).
4. 새 캐스트/새 기획 → 산출물 `_archive/{timestamp}/` 이동(cast·ledger는 같은 캐스트로 가면 보존) 후 초기 실행.

### Phase 1: 준비

1. 사용자 입력 분석 — 스트립 번호 {NNN}(3자리), **트랙(research/story)**, 소재 지정 여부, 제약(수위·타겟·발행 예정). 트랙이 불명확하면 1회 확인: 소재가 사용자 경험담이면 story, 외부 소재면 research.
2. `00_input/strip{NNN}_brief.md` 기록. story 트랙이면 사용자 이야기 원문을 `01_source/strip{NNN}_source.md`로 저장(대화에서 받았으면 그대로 옮겨 적음).
3. 디렉토리 보장: `mkdir -p 00_input/cast 01_research 01_source 02_script 03_visual 04_cuts 05_package RELEASE _render_jobs _render_logs`.
4. **스크립트를 수정했거나 첫 실행이면 `bash _smoke.sh`**(기계부 회귀 ~10초, 토큰 0).

### Phase 2: 리서치 (research 트랙만 — story 트랙은 Phase 3으로 직행)

1. **소재 뱅크 게이트**: `01_research/material-bank.md`에 미사용 소재가 있고 시효가 살아 있으면 리서치팀 전체 스킵 — 소재 선택으로 직행(사용자에게 후보 2~3개 제시 또는 브리프 지정 소재 사용).
2. **format-brief 게이트**: 종합 일자 30일 이내면 gag-analyst 스킵.
3. 실행(필요분만): gag-analyst ∥ topic-scout 병렬 스폰 → 완료 후 material-synthesizer가 `material-bank.md` 생성/증보(ledger 대조 포함).
4. 소재 확정 → material-bank의 해당 엔트리 상태를 '사용(strip{NNN})'으로 갱신.

### Phase 3: 대본

1. gag-writer 스폰 — 입력: 소재(research: material-bank 엔트리 / story: `01_source/strip{NNN}_source.md`), `03_visual/cast-sheet.md`(있으면 — 초기 실행은 Phase 4 후 재개), `01_research/format-brief.md`(research 트랙), 직전 `retro`. 산출: `02_script/strip{NNN}_script.md`.
2. script-editor 스폰 — 펀치라인·자구 확정·(research) 원문 대조 → 확정본 갱신. 구조 결함이면 gag-writer 재집필(최대 2회 루프).
3. **초기 실행 순서 예외**: cast-sheet가 아직 없으면 Phase 4(캐스트)를 먼저 완료하고 Phase 3을 실행한다(배역에 IDTAG가 필요).

### Phase 4: 캐스트 게이트 (최초 1회)

1. `03_visual/cast-sheet.md` + `style-bible.md` 존재 → **스킵**(재생성 금지).
2. 없으면: `00_input/cast/*.png` 확인 — 비어 있으면 **사용자에게 레퍼런스 PNG 배치 요청**(경로 안내 후 대기. 진행 불가 지점 — 지어내서 진행 금지).
3. cast-keeper 스폰 → cast-sheet.md + style-bible.md. 모호 속성이 보고되면 사용자 확인 후 시트 확정.

### Phase 5: 프롬프트 · 렌더 · 검증 루프 — **codex 동시 세션 ≤5 엄수**

1. prompt-smith 스폰 — script 확정본 + cast-sheet + style-bible + 직전 retro → `strip{NNN}_prompts.md` → `python _split_prompts.py … _render_jobs/strip{NNN}` exit 0 확인.
2. **카나리아 1컷**: `cut_1.txt`만 임시 jobsdir로 복사해 `bash _render.sh <임시> 04_cuts/strip{NNN}` → cut-validator 6축 선검증. 시스템성 결함(스타일 이탈·레터링 실패·캐릭터 불일치)이면 prompt-smith 정본 수정 → 재분할 → 카나리아 재실행. 클린이면 계속.
3. **잔여 렌더**: `bash _render.sh _render_jobs/strip{NNN} 04_cuts/strip{NNN}`(cut_1 SKIP, 3장 병렬 — 1웨이브 ~2분).
4. **검증-재생성 루프**: cut-validator 6축(C3 전수·C1 레퍼런스 직접 대조) → REGEN 시: prompt-smith 정본 보강·재분할 → **오케스트레이터가 해당 컷 PNG 삭제 후 `_render.sh` 재실행**(통과 컷 SKIP — 대상 컷만 렌더) → 재렌더분만 재검증. 컷당 최대 3회, 1·4컷 C1/C3는 FLAG 불가(CLAUDE.md 게이트 3).
5. (선택) pngquant 최적화 — **매니페스트 생성 전**에만.
6. 전 컷 통과 → validation.md 완결 + **매니페스트 생성**(cut-validator).

### Phase 6: 조립 · 패키징

1. strip-compositor 스폰 → `05_package/strip{NNN}/strip.png`(매니페스트 후 — 게이트 [5] 신선도).
2. sns-packager 스폰 → instagram.md·threads.md.
3. showrunner 스폰 → 끝단 QA(컷+스트립 육안 전수, 패키지 정합) → qa_report.md. FIX 시 해당 단계 재투입(재렌더 발생 시 원자 규약 완주 — 매니페스트 재생성과 **스트립 재조립** 포함).
4. showrunner: `bash _verify_release.sh {NNN}` **exit 0** → `RELEASE/strip{NNN}/` 패키징 → 게이트 재실행([6] 사본 검사 활성) → 사인오프.

### Phase 7: 마무리

1. showrunner: `retro_strip{NNN}.md` + `ledger.md` 1행 갱신.
2. 사용자 요약: 스트립 경로(RELEASE)·인스타 캐러셀 순서·캡션 미리보기·펀치라인 한 줄. 발행은 수동(패키지 붙여넣기).
3. 피드백 요청: "펀치라인 톤/그림체/캡션에서 고치고 싶은 부분이 있나요?" — 같은 유형 피드백 2회+ 반복 시 에이전트/스킬 정의 개선 제안(CLAUDE.md 이력 기록).

## 데이터 흐름

```
[research] topic-scan(배치) + format-brief(30일) → material-bank(누적, ledger 대조)
[story]    01_source/strip{NNN}_source.md
   └→ script(gag-writer) → 확정본(script-editor = C3 SSOT)
        └→ [cast 게이트: cast-sheet·style-bible — 최초 1회] 
              └→ prompts(토큰+베이크) → 분할 → 카나리아 cut_1 → 잔여 3컷(롤링 ≤5)
                    └→ cut PNG ⇄ cut-validator 6축 루프(C3 전수) ⇄ prompt-smith 보강
                          └→ validation.md + manifest.md5
                                └→ strip.png(조립) + instagram/threads.md → qa_report
                                      └→ _verify_release.sh exit 0 → RELEASE/strip{NNN}/ → retro + ledger
```

## 에러 핸들링

| 상황 | 전략 |
|------|------|
| 카나리아 시스템성 결함 | 잔여 렌더 보류 유지, prompt-smith 정본 수정 → 재분할 → 카나리아 재실행 |
| 한글 자구 오탈자/유령 글자(C3) | REGEN — 대사 축약·따옴표 명시·풍선 위치 보강. 1·4컷은 FLAG 불가(에스컬레이션) |
| 캐릭터 레퍼런스 불일치(C1) | REGEN — cast-sheet 토큰 전문 재주입 + 식별 특징 강조. 반복 시 cast-keeper 토큰 보강(진화) |
| cast/ 비어 있음 | 사용자에게 배치 요청 후 대기 — 지어내서 진행 금지 |
| codex 렌더 0바이트/손상/중복 | 해당 컷만 재렌더(드라이버 창-내 재시도 + RENDER_TIMEOUT) |
| codex 쿼터 소진 | `bash _resume.sh _render_jobs/strip{NNN} 04_cuts/strip{NNN} 4 [리셋시각]` |
| 소재가 ledger와 중복 | material-synthesizer가 앵글 전환 또는 소재 교체(동일 앵글 재발행 금지) |
| 무한 재작업 | 컷당 3회·단계 루프 2회. 초과 시 현 상태 + 한계 보고. 1·4컷 C1/C3만 예외(에스컬레이션) |
| 게이트 FAIL | 사인오프 거부 — FAIL 항목별 처방(게이트 출력의 `->` 안내) 후 재실행 |

## 후속 작업 가이드

- "다음 스트립" → Phase 0 case 2. 소재 뱅크에 미사용 소재 있으면 리서치 스킵, retro 선적용.
- "컷 N 다시" → prompt-smith 보강 → 해당 컷 재렌더 → **재렌더 원자 규약 완주**(재검증→매니페스트→재조립→RELEASE).
- "펀치라인 다시" → gag-writer/script-editor 재투입 → 대사 바뀐 컷만 재렌더 → 원자 규약 완주.
- "캡션만 다시" → sns-packager 부분 재실행(렌더 무관 — 원자 규약 불필요).
- "소재 뱅크 갱신" → topic-scout + material-synthesizer만(format-brief 30일 게이트 유지).
```

- [ ] **Step 2: 검증** — frontmatter 파싱 + 경로 정합 스팟체크:

```bash
cd ~/Desktop/SomNiA/harness/fourcut
head -4 .claude/skills/fourcut-orchestrator/SKILL.md | grep -q '^name: fourcut-orchestrator' && echo FM-OK
grep -o '0[0-9]_[a-z]*' .claude/skills/fourcut-orchestrator/SKILL.md | sort -u
```
Expected: `FM-OK` + 디렉토리 목록이 실재 디렉토리(00_input·01_research·01_source·02_script·03_visual·04_cuts·05_package)와 일치.

- [ ] **Step 3: Commit**

```bash
git add .claude/skills && git commit -m "fourcut-orchestrator 스킬: Phase 0~7 실행 절차(트랙 분기·캐스트 게이트·카나리아 1컷·REGEN 루프·게이트 사인오프)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```

---

### Task 10: GitHub 원격 생성 + 푸시

**Files:** (없음 — 원격 작업)

**Interfaces:**
- Consumes: Task 1~9의 커밋들(main).
- Produces: `github.com/SomNiA08/fourcut` (PUBLIC — 함대 관례: webtoon·publish PUBLIC 실측 확인). Task 11 함대 등록의 선행조건("원격 생성 후 푸시 완료 → 등록 선행조건 충족" — publish 편입 관례).

- [ ] **Step 1: 원격 생성 + 푸시**

```bash
cd ~/Desktop/SomNiA/harness/fourcut
gh repo create SomNiA08/fourcut --public --source . --push --description "4컷 웹툰 제작 하네스 — 소재/이야기 → 4컷 대본 → 컷 4장 렌더(한글 베이크) → 6축 검증 → 세로 스트립 + SNS 패키지"
git log --oneline origin/main | head -3
```
Expected: 리포 생성 + main 푸시 완료, origin/main에 Task 1~9 커밋 존재.

**주의(개인정보/IP):** 이 시점 `00_input/cast/`는 비어 있어 푸시에 이미지가 없다. **사용자 캐릭터 레퍼런스 PNG는 git 추적 대상**(SSOT 보존)이므로, 첫 캐스트 임포트 후의 푸시는 **공개 리포에 사용자 창작 캐릭터가 공개됨**을 의미한다 — 첫 가동 시(Phase 4) 사용자에게 ① 공개 유지 ② cast/를 gitignore로 전환+별도 백업 중 택1을 확인하고, ②면 `.gitignore`의 cast 예외 2줄을 제거한다.

---

### Task 11: 함대 등록 (somnia-hub)

**Files:**
- Modify: `somnia-hub/bootstrap.ps1` (publish 라인 아래 1줄 추가)
- Modify: `somnia-hub/PORTFOLIO.md` (publish 행 아래 1행 + 이력 1항)

**Interfaces:**
- Consumes: Task 10의 원격(등록 선행조건).
- Produces: 함대 감사망([1] 등록부 대조 · [3] 미푸시 감시 · [4] 공개상태 대조) 편입 + bootstrap 재해복구 대상화.

- [ ] **Step 1: bootstrap.ps1 — publish 라인 바로 아래 추가**

기존 앵커(변경 금지):
```powershell
    @{ name = "publish";        url = "https://github.com/SomNiA08/publish.git" }         # 글·카드뉴스 발행 하네스 (webtoon 파생 · 고유 아키텍처 — SOUL/engine 생성 금지 벽, PORTFOLIO 참조)
```
추가할 줄:
```powershell
    @{ name = "fourcut";        url = "https://github.com/SomNiA08/fourcut.git" }         # 4컷 웹툰 하네스 (webtoon·publish 파생 · 고유 아키텍처 — SOUL/engine 생성 금지 벽, PORTFOLIO 참조)
```

- [ ] **Step 2: PORTFOLIO.md — publish 행 아래 표 1행 추가**

```markdown
| fourcut | B 변형 (4컷 파이프라인: 소재→대본→컷4 렌더→검증→조립/SNS 패키지) | `../fourcut` (github: SomNiA08/fourcut) | — (킷 계보 밖 · 고유 아키텍처 · **webtoon·publish 파생**) | ✅ | **구축 완료(2026-07-11)** — 스모크 17검사 PASS·실전 스트립 0. 기계부는 publish 최신판(신형 codex 저장 계약) 이식 + `_compose_strip.py`·게이트 [5] 스트립 신선도 신설. 감사는 [1][3][4]만 적용(파일 보유 기준 자동 비대상). **SOUL.md·engine.mjs 생성 금지 벽**(`.claude/settings.json` deny + CLAUDE.md §함대 관계) — 킷 이관 제안 금지 | 첫 스트립: 사용자 캐릭터 레퍼런스 PNG를 `00_input/cast/`에 배치(공개 리포 공개 여부 확인 필요) → cast-keeper 토큰 추출 → strip001 |
```

- [ ] **Step 3: PORTFOLIO.md — 이력 절(2026-07-08 publish 편입 항 아래)에 추가**

```markdown
- 2026-07-11: **fourcut 함대 편입** — 4컷 웹툰 하네스(webtoon·publish 파생 · 스킬 1·에이전트 11)를 등록
  (bootstrap 한 줄 · 이 표 한 행). 원격 생성(SomNiA08/fourcut) 후 푸시 완료 → 등록 선행조건 충족.
```

- [ ] **Step 4: 감사 실행 + 커밋**

```bash
cd ~/Desktop/SomNiA/harness/somnia-hub
# audit.ps1 헤더 주석의 사용법을 확인 후 실행(관례: pwsh -File audit.ps1)
pwsh -File audit.ps1 2>&1 | grep -i fourcut
git add bootstrap.ps1 PORTFOLIO.md && git commit -m "fourcut 함대 편입: 등록부 1줄 + PORTFOLIO 1행/이력 — 4컷 웹툰 하네스(고유 아키텍처)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>" && git push
```
Expected: 감사에서 fourcut이 [1] 등록부 대조 PASS(클론 존재·원격 일치), [3] 미푸시 없음, [4] 공개상태 일치. 감사 실행법이 다르면 audit.ps1 헤더를 Read해 맞춘다.

---

### Task 12: 최종 검증 · 문서 이관 · 인수인계

**Files:**
- Create: `fourcut/docs/superpowers/specs/2026-07-11-fourcut-harness-design.md`, `fourcut/docs/superpowers/plans/2026-07-11-fourcut-harness.md` (webtoon 리포에서 이관)
- Modify: webtoon 리포의 같은 두 파일(포인터로 교체)

- [ ] **Step 1: 전체 스모크 재실행(최종 회귀)**

```bash
cd ~/Desktop/SomNiA/harness/fourcut && bash _smoke.sh
```
Expected: `FAIL 0` + exit 0.

- [ ] **Step 2: 스펙·계획 이관**

```bash
cp ../webtoon/docs/superpowers/specs/2026-07-11-fourcut-harness-design.md docs/superpowers/specs/
cp ../webtoon/docs/superpowers/plans/2026-07-11-fourcut-harness.md docs/superpowers/plans/
```
이관본에서 스펙 상단의 "위치 주의" 불릿을 "이관 완료(2026-07-11) — 원 위치 webtoon 리포"로 수정. webtoon 리포 쪽 두 파일은 본문을 아래 한 줄로 교체:
`> fourcut 리포로 이관됨(2026-07-11): harness/fourcut/docs/superpowers/ 참조.`

- [ ] **Step 3: 커밋 2건 + 푸시**

```bash
cd ~/Desktop/SomNiA/harness/fourcut && git add docs && git commit -m "설계 스펙·구현 계획 이관(webtoon → fourcut)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>" && git push
cd ../webtoon && git add docs/superpowers && git commit -m "fourcut 설계 문서 이관 포인터(원본은 fourcut 리포)

Co-Authored-By: Claude Fable 5 <noreply@anthropic.com>"
```
(webtoon 푸시는 사용자 관례에 따름 — 미푸시 감시는 함대 감사가 잡는다.)

- [ ] **Step 4: (옵트인) 라이브 스모크** — 사용자 확인 후에만: `bash _smoke.sh --live`(실제 codex 1장, 쿼터 1 소모 — 인증·image_generation 확인). 거절 시 첫 스트립의 카나리아가 동일 역할을 수행함을 안내.

- [ ] **Step 5: 인수인계 보고** — 사용자에게: ① 구축 완료 요약(커밋 수·스모크 결과·등록 상태) ② **첫 가동 안내**: 캐릭터 레퍼런스 PNG를 `00_input/cast/`에 배치(파일명 = 캐릭터명 권장) + 공개 리포 공개 여부 결정 → "4컷 만들어줘: {소재 또는 이야기}"로 시작 ③ 메모리에 fourcut 하네스 존재·경로를 project 타입으로 기록.

---

## 계획 자가 검토 (writing-plans self-review)

1. **스펙 커버리지**: §1 제작 단위(T4·T5) · §2 트랙(T7·T9 Phase 1/2) · §3 에이전트 11명(T8) · §4 캐스트(T8 cast-keeper·T9 Phase 4·T10 공개 주의) · §5 6축(T8 cut-validator) · §6 게이트 6항(T5·T7) · §7 기계부 7종(T2~T6) · §8 디렉토리(T1·T7) · §9 함대·환경(T1·T10·T11) · §10 미결(이름 fourcut 확정, cast 경로는 첫 가동, pngquant는 CLAUDE.md 성능 5) — 전 항목 태스크 매핑 확인.
2. **플레이스홀더**: 코드 스텝은 전문 또는 "원본 Read + 정확 diff" 형식(베이스 파일이 실재하므로 실행 가능). "TBD/추후" 없음.
3. **타입/명명 일관성**: cut_1..4 · strip{NNN}(3자리) · 03_visual 매니페스트 경로 · 05_package/strip{NNN}/strip.png — T3~T9 전체에서 동일 문자열 사용 확인. 스모크 어서션 문자열은 T5 게이트 출력 문자열과 1:1 대응(예: `stale composite:` · `FAIL md5 duplicates` · `GATE PASS`).

## 실행 순서·의존성

T1 → T2~T4(병렬 가능하나 순차 권장) → T5(T4의 compose를 테스트에 사용) → T6(T2~T5 전부) → T7 → T8 → T9 → T10 → T11(T10 선행 필수) → T12. 예상 소요: T1~T9 약 1~1.5시간(전부 로컬·토큰만), T10~T12 약 15분. codex 쿼터 소모 0(옵트인 --live 제외).
