#!/usr/bin/env python3
"""Exact replay comparison for every nonvolatile revision field."""

from __future__ import annotations

import argparse
import copy
import json
import pathlib


PHASE_VOLATILE = {
    "wall_time_seconds",
    "process_cpu_time_seconds",
    "peak_incremental_tracemalloc_bytes",
}
ROOT_VOLATILE = {
    "total_wall_time_seconds",
    "total_process_cpu_time_seconds",
    "overall_peak_tracemalloc_bytes",
}


def normalized(path: pathlib.Path) -> dict:
    payload = copy.deepcopy(json.loads(path.read_text(encoding="utf-8")))
    for key in ROOT_VOLATILE:
        payload.pop(key, None)
    for phase in payload.get("phase_costs", {}).values():
        for key in PHASE_VOLATILE:
            phase.pop(key, None)
    return payload


def first_difference(left, right, path="$"):
    if type(left) is not type(right):
        return {"path": path, "left": left, "right": right}
    if isinstance(left, dict):
        if set(left) != set(right):
            return {"path": path, "left_keys": sorted(left), "right_keys": sorted(right)}
        for key in sorted(left):
            difference = first_difference(left[key], right[key], f"{path}.{key}")
            if difference is not None:
                return difference
        return None
    if isinstance(left, list):
        if len(left) != len(right):
            return {"path": path, "left_length": len(left), "right_length": len(right)}
        for index, (lval, rval) in enumerate(zip(left, right)):
            difference = first_difference(lval, rval, f"{path}[{index}]")
            if difference is not None:
                return difference
        return None
    return None if left == right else {"path": path, "left": left, "right": right}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("primary")
    parser.add_argument("replay")
    parser.add_argument("--output", default="artifacts/replay_validation.json")
    args = parser.parse_args()
    left = normalized(pathlib.Path(args.primary))
    right = normalized(pathlib.Path(args.replay))
    difference = first_difference(left, right)
    exact = difference is None
    result = {
        "schema_version": "s6-js-prefixbound-stagea-revision-replay-validation-v1",
        "all_nonvolatile_fields_exact_match": exact,
        "first_difference": difference,
        "ignored_as_volatile": [
            "phase_costs.*.wall_time_seconds",
            "phase_costs.*.process_cpu_time_seconds",
            "phase_costs.*.peak_incremental_tracemalloc_bytes",
            "total_wall_time_seconds",
            "total_process_cpu_time_seconds",
            "overall_peak_tracemalloc_bytes",
        ],
        "primary_verdict": left.get("verdict"),
        "replay_verdict": right.get("verdict"),
        "stageb_user_approval_id": None,
        "stageb_authorized": False,
    }
    output = pathlib.Path(args.output)
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0 if exact else 1


if __name__ == "__main__":
    raise SystemExit(main())
