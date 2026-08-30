#!/usr/bin/env python3
"""Validate two independent deterministic replays of the revision outputs."""

from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--original", type=Path, required=True)
    parser.add_argument("--replay-a", type=Path, required=True)
    parser.add_argument("--replay-b", type=Path, required=True)
    parser.add_argument("--output", type=Path, required=True)
    args = parser.parse_args()

    comparisons = []
    all_exact = True
    zero_failures = True
    verdicts_stable = True
    for filename in ("exhaustive.json", "natural.json"):
        paths = [args.original / filename, args.replay_a / filename, args.replay_b / filename]
        payloads = [path.read_bytes() for path in paths]
        data = [json.loads(payload.decode("utf-8")) for payload in payloads]
        exact = payloads[0] == payloads[1] == payloads[2]
        clean = all(item.get("semantic_or_accounting_failures") == 0 for item in data)
        stable = len({item.get("gate_verdict") for item in data}) == 1
        all_exact &= exact
        zero_failures &= clean
        verdicts_stable &= stable
        comparisons.append(
            {
                "file": filename,
                "original_sha256": sha256(paths[0]),
                "replay_a_sha256": sha256(paths[1]),
                "replay_b_sha256": sha256(paths[2]),
                "all_three_byte_exact": exact,
                "all_three_zero_failures": clean,
                "gate_verdict_stable": stable,
                "gate_verdict": data[0].get("gate_verdict"),
            }
        )
    result = {
        "schema_version": "o4-pdec-revision-validation-v1",
        "method": "original plus two independent deterministic replays",
        "comparisons": comparisons,
        "all_outputs_byte_exact": all_exact,
        "all_scientific_checks_zero_failure": zero_failures,
        "all_gate_verdicts_stable": verdicts_stable,
        "statistical_fallacy_scan": {
            "applicable": False,
            "coverage": "N/A",
            "reason": "deterministic joint-state closure and exact vector equality; no inferential statistics",
        },
        "verification_status": "VERIFIED" if all_exact and zero_failures and verdicts_stable else "RED_FLAG",
        "reproducibility_verdict": "REPRODUCIBLE" if all_exact and zero_failures and verdicts_stable else "NOT_REPRODUCIBLE",
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"output": str(args.output), "verification_status": result["verification_status"]}, sort_keys=True))
    return 0 if result["verification_status"] == "VERIFIED" else 2


if __name__ == "__main__":
    raise SystemExit(main())
