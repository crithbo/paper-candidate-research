#!/usr/bin/env python3
"""Compare two Stage-A probe runs after removing volatile cost fields."""

from __future__ import annotations

import argparse
import json
import pathlib
import sys


def normalized(path: pathlib.Path) -> dict:
    payload = json.loads(path.read_text(encoding="utf-8"))
    payload.pop("full_cost", None)
    return payload


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("primary")
    parser.add_argument("replay")
    args = parser.parse_args()
    left = normalized(pathlib.Path(args.primary))
    right = normalized(pathlib.Path(args.replay))
    exact = left == right
    result = {
        "schema_version": "s6-js-prefixbound-replay-validation-v1",
        "deterministic_fields_exact_match": exact,
        "ignored_as_volatile": [
            "full_cost.wall_time_seconds",
            "full_cost.process_cpu_time_seconds",
            "full_cost.peak_tracemalloc_bytes",
        ],
        "primary_verdict": left.get("verdict"),
        "replay_verdict": right.get("verdict"),
    }
    out = pathlib.Path("artifacts/replay_validation.json")
    out.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0 if exact else 1


if __name__ == "__main__":
    raise SystemExit(main())
