#!/usr/bin/env python3
"""Recheck immutable resume inputs while recording legitimate live-control drift."""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import pathlib


def sha(path: pathlib.Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--project-root", required=True, type=pathlib.Path)
    ap.add_argument("--resume-root", required=True, type=pathlib.Path)
    ap.add_argument("--output", required=True, type=pathlib.Path)
    args = ap.parse_args()
    frozen: list[dict[str, object]] = []
    live = {"plan.md", "registry.yaml"}
    for line in (args.resume_root / "CONTINUITY_MANIFEST.sha256").read_text(
        encoding="utf-8"
    ).splitlines():
        if not line.strip():
            continue
        expected, rel = line.split(None, 1)
        rel = rel.lstrip("*").replace("/", "\\")
        path = args.project_root / pathlib.PureWindowsPath(rel)
        actual = sha(path) if path.exists() else None
        category = "LIVE_SHARED_CONTROL" if rel.replace("\\", "/") in live else "IMMUTABLE_INPUT"
        frozen.append({
            "path": rel, "category": category, "expected_sha256": expected.lower(),
            "actual_sha256": actual, "match": actual == expected.lower(),
        })

    headers: list[dict[str, object]] = []
    with (args.resume_root / "inputs" / "PINNED_HEADER_MANIFEST.tsv").open(
        encoding="utf-8", newline=""
    ) as handle:
        for row in csv.DictReader(handle, delimiter="\t"):
            path = (
                args.resume_root / "inputs" / "upstream_sources"
                / row["version"] / pathlib.PurePosixPath(row["path"])
            )
            actual = sha(path) if path.exists() else None
            headers.append({
                "version": row["version"], "commit": row["commit"],
                "path": row["path"], "bytes_expected": int(row["bytes"]),
                "bytes_actual": path.stat().st_size if path.exists() else None,
                "sha256_expected": row["sha256"], "sha256_actual": actual,
                "match": (
                    path.exists() and path.stat().st_size == int(row["bytes"])
                    and actual == row["sha256"]
                ),
            })
    immutable_pass = all(
        row["match"] for row in frozen if row["category"] == "IMMUTABLE_INPUT"
    )
    headers_pass = all(row["match"] for row in headers)
    result = {
        "schema": "llvm-resume-continuity-recheck-v1",
        "immutable_inputs_pass": immutable_pass,
        "pinned_headers_pass": headers_pass,
        "live_shared_control_policy": (
            "plan.md and registry.yaml are mainline-owned live files; post-assignment "
            "hash drift is recorded, not treated as frozen scientific-input mutation"
        ),
        "frozen_entries": frozen,
        "pinned_headers": headers,
        "pass": immutable_pass and headers_pass,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "pass": result["pass"], "immutable_inputs_pass": immutable_pass,
        "pinned_headers_pass": headers_pass,
        "live_control_drift": [r["path"] for r in frozen if r["category"] == "LIVE_SHARED_CONTROL" and not r["match"]],
    }, sort_keys=True))
    return 0 if result["pass"] else 2


if __name__ == "__main__":
    raise SystemExit(main())
