#!/usr/bin/env python3
"""Verify executable-section and relocation identity for the sole positive site."""

import hashlib
import json
import re
import subprocess
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
READOBJ = ROOT.parent / "resume1" / "build" / "bin" / "llvm-readobj.exe"
SITE = ROOT / "resources" / "build" / "natural_run04" / "n02_crtbegin" / "site_02"
OUT = ROOT / "SITE02_BEHAVIOR_EQUIVALENCE.json"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def run(obj):
    p = subprocess.run([str(READOBJ), "--sections", "--section-data", "--relocations", str(obj)], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return p.returncode, p.stdout.decode("utf-8", errors="replace") + p.stderr.decode("utf-8", errors="replace")


def alloc_sections(text):
    result = {}
    for block in re.findall(r"(?ms)^  Section \{\s*(.*?)^  \}", text):
        if "SHF_ALLOC" not in block:
            continue
        name = re.search(r"(?m)^    Name: ([^ ]*)", block)
        size = re.search(r"(?m)^    Size: (\d+)", block)
        data = re.search(r"(?ms)^    SectionData \((.*?)^    \)", block)
        if name and size:
            payload = "" if data is None else re.sub(r"\s+", " ", data.group(1)).strip()
            result[name.group(1)] = {"size": int(size.group(1)), "data": payload}
    return result


def relocations(text):
    start = text.find("Relocations [")
    if start < 0:
        return ""
    region = text[start:]
    lines = []
    for line in region.splitlines():
        stripped = line.strip()
        if stripped.startswith("Section (") or re.match(r"^0x[0-9A-Fa-f]+ ", stripped):
            lines.append(stripped)
    return "\n".join(lines)


def main():
    base = SITE / "baseline.o"; cand = SITE / "candidate.o"
    be, bt = run(base); ce, ct = run(cand)
    (SITE / "baseline.alloc-readobj.txt").write_text(bt, encoding="utf-8")
    (SITE / "candidate.alloc-readobj.txt").write_text(ct, encoding="utf-8")
    bs = alloc_sections(bt); cs = alloc_sections(ct)
    br = relocations(bt); cr = relocations(ct)
    result = {
        "schema": "native-object-executable-behavior-equivalence-v1",
        "site_index": 2, "function": "__do_fini",
        "baseline_object_sha256": sha(base), "candidate_object_sha256": sha(cand),
        "readers_exit_zero": be == 0 and ce == 0,
        "alloc_section_names": sorted(bs),
        "alloc_sections_byte_identical": bs == cs,
        "relocations_identical": br == cr,
        "baseline_alloc_fingerprint": hashlib.sha256(json.dumps(bs, sort_keys=True).encode()).hexdigest().upper(),
        "candidate_alloc_fingerprint": hashlib.sha256(json.dumps(cs, sort_keys=True).encode()).hexdigest().upper(),
        "baseline_relocation_fingerprint": hashlib.sha256(br.encode()).hexdigest().upper(),
        "candidate_relocation_fingerprint": hashlib.sha256(cr.encode()).hexdigest().upper(),
        "behavior_verification": "PASS__ALL_ALLOCATED_SECTION_BYTES_AND_RELOCATIONS_IDENTICAL" if be == 0 and ce == 0 and bs == cs and br == cr else "FAIL",
        "executed_runtime_latency": "UNOBSERVED__DO_NOT_IMPUTE",
    }
    OUT.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2))
    raise SystemExit(0 if result["behavior_verification"].startswith("PASS") else 2)


if __name__ == "__main__":
    main()
