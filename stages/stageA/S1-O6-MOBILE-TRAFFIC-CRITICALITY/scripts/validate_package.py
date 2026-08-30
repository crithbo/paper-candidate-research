from __future__ import annotations

import hashlib
import json
import pathlib
import sys


ROOT = pathlib.Path(__file__).resolve().parents[1]
WORKSPACE = ROOT.parents[2]

REQUIRED = [
    "INPUT_FREEZE.yaml",
    "EXPERIMENT_CONTRACT.yaml",
    "CONTROL_MATRIX.md",
    "PRE_CLAIM_CONTRACT_FIDELITY_GATE.md",
    "SOURCE_MANIFEST.yaml",
    "SOURCE_AUDIT.md",
    "COMMAND_LOG.md",
    "FAILURE_LOG.md",
    "ENVIRONMENT.md",
    "RESULTS.md",
    "Q1_COMPARATOR_MATRIX.md",
    "STAGEA_REPORT.md",
    "USER_REVIEW_PACKET.md",
    "USER_RESEARCH_REQUEST.md",
    "REPRODUCIBILITY.md",
    "handoff.yaml",
    "LANE_STATUS.yaml",
    "HASH_MANIFEST.sha256",
]

INPUT_HASHES = {
    "stages/discovery/round-20260803-v8/S1-boundary-contradiction/S1-O6-MOBILE-TRAFFIC-CRITICALITY.md": "B960656D906AE912EFEEEC36C94195A7E18D277F6A9BA7E9E5142552DCFBFBDF",
    "stages/stage0/_reviews/round-20260803-v8-s1-decisive/SCOPE_CORRECTION.md": "E11E3F963B189B4D6A1E0AC175AC7B7D87D9950154F671DAB4258099BBA0D602",
    "stages/stage0/_reviews/round-20260803-v8-s1-potential-rescreen-v8.4-primary/handoff.yaml": "7BE1A64ED91869EE8DB4C8DF4E88CD67F631518429C30B0DB3E85E1667D418F0",
    "stages/stage0/_reviews/round-20260803-v8-s1-potential-rescreen-v8.4-primary/HASH_MANIFEST.sha256": "DA3F4AF81B1F7CBDDC896904BBAEB0D2ECFEDA1F23B90DAD2FE322895CA5B7CD",
    "stages/stage0/_reviews/round-20260803-v8-s1-potential-rescreen-v8.4-confirmation/handoff.yaml": "513CC45C1DD1FB276A18F786F9A17143871E134A1E19D8AA9238094A64744C98",
    "stages/stage0/_reviews/round-20260803-v8-s1-potential-rescreen-v8.4-confirmation/HASH_MANIFEST.sha256": "C02CA4D1F42B9A39147DAD36E468C2194C83777A7BE718EB66A2E98BAEC45F2F",
}


def digest(path: pathlib.Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def check(condition: bool, name: str, failures: list[str]) -> None:
    if not condition:
        failures.append(name)


def main() -> int:
    failures: list[str] = []
    for relative in REQUIRED:
        check((ROOT / relative).is_file(), f"missing:{relative}", failures)

    for relative, expected in INPUT_HASHES.items():
        path = WORKSPACE / relative
        check(path.is_file(), f"missing_input:{relative}", failures)
        if path.is_file():
            check(digest(path) == expected, f"input_hash:{relative}", failures)

    acquisition = json.loads((ROOT / "sources" / "ACQUISITION_MANIFEST.json").read_text(encoding="utf-8"))
    for record in acquisition["records"]:
        path = ROOT / str(record["file"])
        check(path.is_file(), f"missing_source:{record['file']}", failures)
        if path.is_file():
            check(path.stat().st_size == int(record["bytes"]), f"source_size:{record['file']}", failures)
            check(digest(path) == str(record["sha256"]), f"source_hash:{record['file']}", failures)

    contract = (ROOT / "EXPERIMENT_CONTRACT.yaml").read_text(encoding="utf-8")
    report = (ROOT / "STAGEA_REPORT.md").read_text(encoding="utf-8")
    results = (ROOT / "RESULTS.md").read_text(encoding="utf-8")
    handoff = (ROOT / "handoff.yaml").read_text(encoding="utf-8")
    lane = (ROOT / "LANE_STATUS.yaml").read_text(encoding="utf-8")

    check("status: FAIL_CLOSED_HUMAN_CORE_MAPPING_UNCLOSED" in contract, "contract_gate", failures)
    check("claim-bearing observation: `false`" in results.lower(), "claim_observation_false", failures)
    check("RESERVE_RECOMMENDED_WITH_USER_RESEARCH_REQUEST" in report, "report_decision", failures)
    check("decision: RESERVE_RECOMMENDED_WITH_USER_RESEARCH_REQUEST" in handoff, "handoff_decision", failures)
    check("scientific_revision_consumed: false" in handoff, "revision_false", failures)
    check("pending_user_stageb_review: false" in handoff, "pending_stageb_false", failures)
    check("stageb_user_approval_id: null" in handoff, "approval_null", failures)
    check("execution_authority: STAGEA_ONLY__NO_STAGEB" in handoff, "stageb_forbidden", failures)
    check("status: IDLE_REUSABLE_AWAITING_MAINLINE" in lane, "lane_idle", failures)

    manifest_path = ROOT / "HASH_MANIFEST.sha256"
    if manifest_path.is_file():
        listed: dict[str, str] = {}
        for line in manifest_path.read_text(encoding="utf-8").splitlines():
            if not line.strip():
                continue
            parts = line.split("  ", 1)
            check(len(parts) == 2, "manifest_format", failures)
            if len(parts) == 2:
                listed[parts[1]] = parts[0].upper()
        actual_files = {
            p.relative_to(ROOT).as_posix()
            for p in ROOT.rglob("*")
            if p.is_file() and p.name != "HASH_MANIFEST.sha256"
        }
        check(set(listed) == actual_files, "manifest_membership", failures)
        for relative, expected in listed.items():
            check(digest(ROOT / relative) == expected, f"manifest_hash:{relative}", failures)

    summary = {
        "validator": "s1-stagea-package-validator-v1",
        "checks_passed": len(failures) == 0,
        "failure_count": len(failures),
        "failures": failures,
        "claim_bearing_observation": False,
        "scientific_revision_consumed": False,
        "stageb_authorized": False,
        "lane_status": "IDLE_REUSABLE_AWAITING_MAINLINE",
    }
    print(json.dumps(summary, indent=2))
    return 0 if not failures else 1


if __name__ == "__main__":
    sys.exit(main())
