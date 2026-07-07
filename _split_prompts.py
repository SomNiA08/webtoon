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
i = 0
while i < len(lines):
    line = lines[i]
    m = re.match(r"^###\s+panel_(\d{3})", line)
    if m:
        cur = m.group(1)
    mp = re.match(r'^\s*-\s*prompt:\s*"(.*)$', line)
    if mp and cur:
        # prompt is a single long line ending with a closing quote
        prompt = mp.group(1)
        if prompt.endswith('"'):
            prompt = prompt[:-1]
        prompt = prompt.replace('\\"', '"')
        fn = os.path.join(outdir, f"panel_{cur}.txt")
        with open(fn, "w", encoding="utf-8") as f:
            f.write(prompt + "\n")
        count += 1
        cur = None
    i += 1

print(f"wrote {count} panel prompt files to {outdir}")
