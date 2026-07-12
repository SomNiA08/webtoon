#!/usr/bin/env python3
"""Expand a panel->reference-sheet map into the per-job .refs files _render.sh reads.

The map (TSV) is the authored artifact: one row per panel that shows a character,
`panel_NNN <TAB> path [<TAB> path ...]`. Panels with no character (evidence screens,
prop close-ups, end cards) are simply absent — attaching a sheet there would bleed
that species into a frame it never appears in.

Usage: _make_refs.py <refs_map.tsv> <jobsdir>
"""
import sys
import os

if len(sys.argv) != 3:
    sys.exit("usage: _make_refs.py <refs_map.tsv> <jobsdir>")

tsv, jobsdir = sys.argv[1], sys.argv[2]
repo = os.path.dirname(os.path.abspath(__file__))

written = 0
missing_job = []
missing_ref = []

with open(tsv, encoding="utf-8") as fh:
    for lineno, line in enumerate(fh, 1):
        line = line.strip()
        if not line or line.startswith("#"):
            continue
        parts = [p.strip() for p in line.split("\t") if p.strip()]
        if len(parts) < 2:
            sys.exit(f"{tsv}:{lineno}: row has no reference path: {line!r}")
        name, refs = parts[0], parts[1:]

        if not os.path.isfile(os.path.join(jobsdir, name + ".txt")):
            missing_job.append(name)
        for r in refs:
            if not os.path.isfile(os.path.join(repo, r)):
                missing_ref.append(f"{name} -> {r}")

        with open(os.path.join(jobsdir, name + ".refs"), "w", encoding="utf-8", newline="\n") as out:
            out.write("\n".join(refs) + "\n")
        written += 1

# A dangling row means the map and the prompts disagree about what exists; a missing
# sheet means the render would silently fall back to text-only for that panel. Both
# are consistency failures, not warnings.
if missing_job:
    sys.exit(f"ERROR: refs map names panels with no job file: {', '.join(missing_job)}")
if missing_ref:
    sys.exit("ERROR: reference sheets not found:\n  " + "\n  ".join(missing_ref))

print(f"wrote {written} .refs files to {jobsdir}")
