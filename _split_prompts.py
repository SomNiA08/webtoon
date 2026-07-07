import re, os, sys

src = r"C:\Users\somni\Desktop\webtoon-harness-main\_workspace\04_visual\ep01_prompts.md"
outdir = r"C:\Users\somni\Desktop\webtoon-harness-main\_workspace\_render_jobs\panels"
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
        # prompt may be a single long line ending with closing quote
        body = mp.group(1)
        # accumulate until we hit a line that is the output: marker (prompt is single-line here)
        # strip trailing closing quote
        prompt = body
        if prompt.endswith('"'):
            prompt = prompt[:-1]
        # unescape \" -> "
        prompt = prompt.replace('\\"', '"')
        fn = os.path.join(outdir, f"panel_{cur}.txt")
        with open(fn, "w", encoding="utf-8") as f:
            f.write(prompt + "\n")
        count += 1
        cur = None
    i += 1

print(f"wrote {count} panel prompt files to {outdir}")
