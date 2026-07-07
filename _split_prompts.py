"""Split a panel prompts markdown into one prompt .txt per panel for _render.sh.

Usage: python _split_prompts.py <prompts_md> <outdir>
  e.g. python _split_prompts.py 04_visual/ep01_prompts.md _render_jobs/panels

Expected input format (per panel):
  ### panel_001
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
headers = []   # every panel header seen, in order
written = set()
overwritten = []   # existing job files whose content changed on this run
i = 0
while i < len(lines):
    line = lines[i]
    m = re.match(r"^###\s+panel_(\d{3})", line)
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
        fn = os.path.join(outdir, f"panel_{cur}.txt")
        data = prompt + "\n"
        if os.path.exists(fn):
            with open(fn, encoding="utf-8") as old:
                if old.read() != data:
                    overwritten.append(f"panel_{cur}.txt")
        with open(fn, "w", encoding="utf-8") as f:
            f.write(data)
        count += 1
        written.add(cur)
        cur = None
    i += 1

print(f"wrote {count} panel prompt files to {outdir}")

# overwrite audit: existing job files whose content changed. Expected to list ONLY
# the panels just edited in the prompts md. Anything else means the prompts md is
# missing REGEN-patched prompts (job .txt was hand-edited without syncing the md),
# and this run just clobbered those fixes — restore them into the md and re-split.
if overwritten:
    print(f"note: {len(overwritten)} existing file(s) had different content and were "
          f"overwritten: " + ", ".join(overwritten), file=sys.stderr)

# fail loudly if a panel header had no prompt line — a silently short jobs dir
# means the render pass "completes" while panels are missing (wasted rework).
missing = sorted(set(headers) - written)
if missing:
    print(f"ERROR: {len(missing)} panel header(s) without a prompt line: "
          + ", ".join(f"panel_{p}" for p in missing), file=sys.stderr)
    sys.exit(1)
if count == 0:
    sys.exit("ERROR: no panels parsed — check the prompts file format (### panel_NNN / - prompt: \"...\")")
