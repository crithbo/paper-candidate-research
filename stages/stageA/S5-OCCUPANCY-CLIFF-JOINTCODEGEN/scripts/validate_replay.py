#!/usr/bin/env python3
"""Replay the static probe twice and check deterministic fields exactly."""

from __future__ import annotations

import argparse
import hashlib
import json
import subprocess
import sys
from pathlib import Path


def projection(path: Path) -> tuple[dict, str]:
    data = json.loads(path.read_text(encoding="utf-8"))
    for case in data["cases"]:
        for method in case["methods"].values():
            method["search"].pop("elapsed_ms", None)
    encoded = json.dumps(data, sort_keys=True).encode()
    return data, hashlib.sha256(encoded).hexdigest()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--python", required=True)
    parser.add_argument("--runner", type=Path, required=True)
    parser.add_argument("--inputs", type=Path, required=True)
    parser.add_argument("--work", type=Path, required=True)
    args = parser.parse_args()
    args.work.mkdir(parents=True, exist_ok=True)
    outputs = [args.work / "replay-1.json", args.work / "replay-2.json"]
    for output in outputs:
        command = [args.python, str(args.runner), "--inputs", str(args.inputs), "--output", str(output), "--candidate-budget", "4096", "--ceiling-budget", "32768"]
        subprocess.run(command, check=True)
    left, left_hash = projection(outputs[0])
    right, right_hash = projection(outputs[1])
    verdict = "VERIFIED" if left == right else "FAILED"
    print(json.dumps({"verification_status": verdict, "projection_sha256_1": left_hash, "projection_sha256_2": right_hash}))
    raise SystemExit(0 if verdict == "VERIFIED" else 1)


if __name__ == "__main__":
    main()
