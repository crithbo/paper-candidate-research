#!/usr/bin/env python3
"""Fail-closed validator for deterministic revision double replay."""

from __future__ import annotations

import csv
import hashlib
import json
import math
from pathlib import Path


ROOT = Path(__file__).resolve().parent
EXPECTED_FROZEN = {
    ROOT.parent / "handoff.yaml": "42E2DB9DC82DAA1BDB07D687A1991939167F31F69713F2C8CC7828ECF44CAB31",
    ROOT.parent / "STAGEA_REPORT.md": "D6D813D4E5E26143D7924A4D644A8ED91D14001F04A1543D8FFFDF6213AC8424",
    ROOT.parent / "USER_REVIEW_PACKET.md": "F400D3E34FB661754A783F593368E50BDD8284B5A59FE0C9663EE643787064DC",
    ROOT.parent.parent / "_reviews" / "gate-v8.2" / "COH-REGION-LIFECYCLE" / "handoff.yaml": "02324399A1DFBE7A51C41B886655AF3846B6B973E9FD8223F3FFDEFFAA91741C",
    ROOT.parent.parent / "_reviews" / "gate-v8.2" / "COH-REGION-LIFECYCLE" / "GATE_REPORT.md": "8733C16290079D148BD6D64FFDD329EDE4A4334AA794808E2BB19A768E1E0B21",
    ROOT.parent.parent / "_reviews" / "gate-v8.2" / "COH-REGION-LIFECYCLE" / "HASH_MANIFEST.sha256": "05D88467E190D438B2E0F8CFB661563198E7717CEC3902FBE7281150A818B119",
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def load_rows(path: Path) -> list[dict]:
    with path.open(newline="", encoding="utf-8") as handle:
        return list(csv.DictReader(handle))


def main() -> None:
    run1 = ROOT / "results" / "run1"
    run2 = ROOT / "results" / "run2"
    summary1 = json.loads((run1 / "summary.json").read_text(encoding="utf-8"))
    rows = load_rows(run1 / "selector_control.csv")
    checks = {
        "six_frozen_inputs_match": all(sha256(path) == expected for path, expected in EXPECTED_FROZEN.items()),
        "summary_byte_identical": (run1 / "summary.json").read_bytes() == (run2 / "summary.json").read_bytes(),
        "control_byte_identical": (run1 / "selector_control.csv").read_bytes() == (run2 / "selector_control.csv").read_bytes(),
        "run_manifest_byte_identical": (run1 / "run_manifest.json").read_bytes() == (run2 / "run_manifest.json").read_bytes(),
        "row_count_6912": len(rows) == 6912,
        "two_locked_programs": len(summary1["program_summaries"]) == 2,
        "all_plans_identical": all(row["plans_identical"] == "True" for row in rows),
        "all_full_costs_identical": all(row["costs_identical"] == "True" for row in rows),
        "all_numeric_residuals_finite": all(math.isfinite(float(row["candidate_only_residual"])) for row in rows),
        "strict_residual_zero_everywhere": all(float(row["candidate_only_residual"]) <= 1e-15 for row in rows),
        "aggregate_strict_count_zero": summary1["aggregate"]["strict_positive_candidate_residual_count"] == 0,
        "selector_absorption_true": summary1["aggregate"]["selector_absorbs_candidate"] is True,
        "recommendation_stop": summary1["aggregate"]["recommendation"] == "STOP_RECOMMENDED",
        "no_gh200_execution": summary1["gh200_b0_b3_executed"] is False,
        "claim_ceiling_honest": summary1["claim_ceiling"] == "ANALYTICAL_SELECTOR_ABSORPTION_ONLY",
        "universal_guard_present": summary1["universal_guard"]["valid_for_every_finite_nonnegative_shared_cost_completion"] is True,
    }
    output = {
        "schema_version": "coh-rl-stagea-revision-validation-v1",
        "verification_status": "VERIFIED" if all(checks.values()) else "FAILED",
        "method": "double_replay_byte_identity_plus_row_level_selector_invariants_plus_frozen_input_hashes",
        "checks": checks,
        "passed": sum(checks.values()),
        "total": len(checks),
        "run1_summary_sha256": sha256(run1 / "summary.json"),
        "run2_summary_sha256": sha256(run2 / "summary.json"),
        "run1_control_sha256": sha256(run1 / "selector_control.csv"),
        "run2_control_sha256": sha256(run2 / "selector_control.csv"),
    }
    path = ROOT / "results" / "validation.json"
    path.write_text(json.dumps(output, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    if not all(checks.values()):
        raise SystemExit(1)


if __name__ == "__main__":
    main()

