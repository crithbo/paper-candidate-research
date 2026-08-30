#!/usr/bin/env python3
"""Byte-exact deterministic rerun validator for the contract outputs."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def digest(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--original", required=True, type=Path)
    parser.add_argument("--rerun", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    comparisons = []
    all_match = True
    scientific_checks = True
    for name in ("exhaustive.json", "natural.json"):
        original = args.original / name
        rerun = args.rerun / name
        original_data = json.loads(original.read_text(encoding="utf-8"))
        rerun_data = json.loads(rerun.read_text(encoding="utf-8"))
        exact = original.read_bytes() == rerun.read_bytes()
        all_match &= exact
        mode_ok = (
            original_data.get("semantic_or_invariant_failures") == 0
            and rerun_data.get("semantic_or_invariant_failures") == 0
        )
        scientific_checks &= mode_ok
        comparisons.append(
            {
                "file": name,
                "original_sha256": digest(original),
                "rerun_sha256": digest(rerun),
                "byte_exact_match": exact,
                "zero_failures_both_runs": mode_ok,
            }
        )

    result = {
        "schema_version": "o4-pdec-validation-v1",
        "method": "deterministic byte-for-byte rerun",
        "comparisons": comparisons,
        "all_outputs_byte_exact": all_match,
        "all_scientific_checks_zero_failure": scientific_checks,
        "statistical_fallacy_scan": {
            "applicable": False,
            "coverage": "N/A",
            "reason": "complete deterministic state enumeration and exact replay checks; no inferential statistics or p-values",
        },
        "verification_status": "VERIFIED" if all_match and scientific_checks else "RED_FLAG",
        "reproducibility_verdict": "REPRODUCIBLE" if all_match and scientific_checks else "NOT_REPRODUCIBLE",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"output": str(args.output), "verification_status": result["verification_status"]}, sort_keys=True))
    return 0 if all_match and scientific_checks else 2


if __name__ == "__main__":
    raise SystemExit(main())
