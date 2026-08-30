#!/usr/bin/env python3
"""Mechanical validation for the two deterministic Stage A probe replays."""

from __future__ import annotations

import csv
import hashlib
import json
import math
from pathlib import Path


ROOT = Path(__file__).resolve().parent


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def load_rows(path: Path) -> list[dict]:
    with path.open(newline="", encoding="utf-8") as f:
        return list(csv.DictReader(f))


def main() -> None:
    r1 = ROOT / "results" / "run1"
    r2 = ROOT / "results" / "run2"
    checks: dict[str, bool] = {}
    checks["summary_byte_identical"] = (r1 / "summary.json").read_bytes() == (r2 / "summary.json").read_bytes()
    checks["grid_byte_identical"] = (r1 / "grid.csv").read_bytes() == (r2 / "grid.csv").read_bytes()
    checks["summary_hash_identical"] = sha256(r1 / "summary.json") == sha256(r2 / "summary.json")
    checks["grid_hash_identical"] = sha256(r1 / "grid.csv") == sha256(r2 / "grid.csv")

    rows = load_rows(r1 / "grid.csv")
    checks["row_count_6912"] = len(rows) == 6912
    programs = {r["program"] for r in rows}
    checks["two_locked_programs"] = programs == {"ALTIS_PATHFINDER_SIZE1", "ALTIS_BFS_65536"}

    finite = True
    oracle_bound = True
    positive_requires_mixed = True
    for row in rows:
        candidate = float(row["candidate_cost"])
        oracle = float(row["oracle_cost"])
        planner = float(row["planner_cost"])
        residual = float(row["residual_vs_uniform"])
        finite &= all(math.isfinite(x) for x in (candidate, oracle, planner, residual))
        oracle_bound &= candidate + 1e-9 >= oracle and abs(candidate - oracle - planner) <= max(1e-6, candidate * 1e-12)
        if residual > 0:
            positive_requires_mixed &= row["mixed"] == "True"
    checks["all_numeric_finite"] = finite
    checks["candidate_equals_oracle_plus_planner"] = oracle_bound
    checks["positive_result_requires_mixed_plan"] = positive_requires_mixed

    summary = json.loads((r1 / "summary.json").read_text(encoding="utf-8"))
    checks["claim_ceiling_not_main_claim"] = summary["gate"]["main_claim_established"] is False
    checks["no_gh200_measurement_claim"] = summary["gate"]["gh200_performance_measured"] is False

    result = {
        "schema_version": "coh-rl-stagea-validation-v1",
        "method": "deterministic_replay_plus_invariant_scan",
        "verification_status": "VERIFIED" if all(checks.values()) else "FAILED",
        "checks": checks,
        "run1_summary_sha256": sha256(r1 / "summary.json"),
        "run2_summary_sha256": sha256(r2 / "summary.json"),
        "run1_grid_sha256": sha256(r1 / "grid.csv"),
        "run2_grid_sha256": sha256(r2 / "grid.csv"),
    }
    out = ROOT / "results" / "validation.json"
    out.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    if not all(checks.values()):
        raise SystemExit(1)


if __name__ == "__main__":
    main()
