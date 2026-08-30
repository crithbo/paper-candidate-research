#!/usr/bin/env python3
"""Mechanical inventory of native LLVM bitcode writer action sites.

The inventory is intentionally broader than the candidate action space. It
records every ordinary-source emission site so the human audit can explicitly
classify ordinary module, ThinLink, combined-index, trace-changing option, and
format-control behavior rather than silently omitting competitors.
"""

from __future__ import annotations

import hashlib
import json
import pathlib
import re


RESUME = pathlib.Path(__file__).resolve().parents[1]
TOPIC = RESUME.parent
OUT = RESUME / "results"
VERSIONS = {
    "release-22.1.8": TOPIC / "inputs" / "upstream_sources" / "release",
    "cutoff-main-a1194be1": TOPIC / "inputs" / "upstream_sources" / "cutoff-main",
}
WRITER = pathlib.PurePosixPath("llvm/lib/Bitcode/Writer/BitcodeWriter.cpp")
BITSTREAM_WRITER = pathlib.PurePosixPath("llvm/include/llvm/Bitstream/BitstreamWriter.h")
BITCODE_WRITER_HEADER = pathlib.PurePosixPath("llvm/include/llvm/Bitcode/BitcodeWriter.h")

ACTION_PATTERNS = [
    ("BLOCKINFO_ABBREV_DEFINE", re.compile(r"\.EmitBlockInfoAbbrev\s*\(")),
    ("LOCAL_ABBREV_DEFINE", re.compile(r"\.EmitAbbrev\s*\(")),
    ("RECORD_WITH_BLOB", re.compile(r"\.EmitRecordWithBlob\s*\(")),
    ("RECORD_WITH_ARRAY", re.compile(r"\.EmitRecordWithArray\s*\(")),
    ("RECORD_WITH_EXPLICIT_ABBREV", re.compile(r"\.EmitRecordWithAbbrev\s*\(")),
    ("RECORD_EMIT", re.compile(r"\.EmitRecord\s*\(")),
    ("BLOCK_ENTER", re.compile(r"\.EnterSubblock\s*\(")),
    ("BACKPATCH", re.compile(r"\.Backpatch")),
]


def sha256(path: pathlib.Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def function_context(lines: list[str], index: int) -> str:
    window = " ".join(line.strip() for line in lines[max(0, index - 7):index + 1])
    matches = re.findall(
        r"((?:[A-Za-z_]\w*::)+[~A-Za-z_]\w*)\s*\([^;{}]*\)\s*(?:const\s*)?\{?",
        window,
    )
    if matches:
        return matches[-1]
    free_matches = re.findall(
        r"(?:^|\s)([A-Za-z_]\w*)\s*\([^;{}]*\)\s*(?:const\s*)?\{",
        window,
    )
    controls = {"if", "for", "while", "switch", "return", "assert"}
    free_matches = [m for m in free_matches if m not in controls]
    return free_matches[-1] if free_matches else "UNRESOLVED_CONTEXT"


def scan_calls(version: str, root: pathlib.Path) -> list[dict[str, object]]:
    path = root / WRITER
    lines = path.read_text(encoding="utf-8").splitlines()
    rows: list[dict[str, object]] = []
    for i, line in enumerate(lines):
        for kind, pattern in ACTION_PATTERNS:
            if pattern.search(line):
                rows.append({
                    "version": version,
                    "path": str(WRITER),
                    "line": i + 1,
                    "kind": kind,
                    "context": function_context(lines, i),
                    "source": line.strip(),
                })
    return rows


def scan_flags(version: str, root: pathlib.Path) -> list[dict[str, object]]:
    path = root / WRITER
    lines = path.read_text(encoding="utf-8").splitlines()
    rows: list[dict[str, object]] = []
    for i, line in enumerate(lines):
        if "cl::opt" not in line:
            continue
        window = " ".join(x.strip() for x in lines[i:i + 14])
        name_match = re.search(r'"([a-z0-9][a-z0-9-]+)"', window)
        default_match = re.search(r"cl::init\(([^)]+)\)", window)
        variable_match = re.search(r"cl::opt<[^>]+>\s*([A-Za-z_]\w*)", window)
        rows.append({
            "version": version,
            "path": str(WRITER),
            "line": i + 1,
            "flag": name_match.group(1) if name_match else "UNRESOLVED",
            "variable": variable_match.group(1) if variable_match else "UNRESOLVED",
            "default": default_match.group(1) if default_match else "BUILD_OR_CONTEXT_DEPENDENT",
            "source_window": window,
        })
    return rows


def main() -> int:
    OUT.mkdir(parents=True, exist_ok=True)
    calls: list[dict[str, object]] = []
    flags: list[dict[str, object]] = []
    sources: list[dict[str, object]] = []
    for version, root in VERSIONS.items():
        calls.extend(scan_calls(version, root))
        flags.extend(scan_flags(version, root))
        for rel in (WRITER, BITSTREAM_WRITER):
            path = root / rel
            sources.append({
                "version": version,
                "path": str(rel),
                "bytes": path.stat().st_size,
                "sha256": sha256(path),
            })
        header_root = RESUME / "inputs" / "upstream_sources" / (
            "release" if version.startswith("release") else "cutoff-main"
        )
        path = header_root / BITCODE_WRITER_HEADER
        sources.append({
            "version": version,
            "path": str(BITCODE_WRITER_HEADER),
            "bytes": path.stat().st_size,
            "sha256": sha256(path),
        })

    call_fields = ["version", "path", "line", "kind", "context", "source"]
    call_lines = ["\t".join(call_fields)]
    call_lines.extend("\t".join(str(row[f]).replace("\t", " ") for f in call_fields) for row in calls)
    (OUT / "B0_ACTION_CALLSITES.tsv").write_text("\n".join(call_lines) + "\n", encoding="utf-8")

    flag_fields = ["version", "path", "line", "flag", "variable", "default", "source_window"]
    flag_lines = ["\t".join(flag_fields)]
    flag_lines.extend("\t".join(str(row[f]).replace("\t", " ") for f in flag_fields) for row in flags)
    (OUT / "B0_FLAG_CALLSITES.tsv").write_text("\n".join(flag_lines) + "\n", encoding="utf-8")

    kind_counts: dict[str, dict[str, int]] = {}
    for row in calls:
        bucket = kind_counts.setdefault(str(row["version"]), {})
        bucket[str(row["kind"])] = bucket.get(str(row["kind"]), 0) + 1
    summary = {
        "schema": "llvm-b0-source-action-inventory-v1",
        "scope": "mechanical callsite inventory; scientific classification is in B0_CURRENT_NATIVE_AUDIT.md",
        "sources": sources,
        "action_counts": kind_counts,
        "flags": flags,
        "callsite_rows": len(calls),
    }
    (OUT / "B0_SOURCE_SUMMARY.json").write_text(
        json.dumps(summary, indent=2, sort_keys=True) + "\n", encoding="utf-8"
    )
    print(json.dumps({"callsite_rows": len(calls), "flags": len(flags), "sources": len(sources)}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
