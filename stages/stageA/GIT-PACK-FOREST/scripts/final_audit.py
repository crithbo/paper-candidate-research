from __future__ import annotations

import json
from pathlib import Path

from git_pack_lib import sha256_file, write_json


def main() -> int:
    root = Path(__file__).resolve().parents[1]
    checks: dict[str, object] = {}
    checks["corpus_lock_sha256"] = sha256_file(root / "inputs" / "corpus.lock.json")
    checks["corpus_lock_match"] = checks["corpus_lock_sha256"] == "22985F5747AC66717BF35557951FE542AEE43BB6FE4B141DCB819EB1B418A1DB"
    codec = json.loads((root / "results" / "GIT_NATIVE_CODEC_PARITY.json").read_text(encoding="utf-8"))
    checks["native_codec_parity"] = {
        "comparisons": codec["comparison_count"],
        "delta_exact": codec["byte_exact_count"],
        "zlib_exact": codec["zlib_byte_exact_count"],
        "pass": codec["all_byte_exact"] and codec["all_zlib_byte_exact"],
    }
    witness = json.loads((root / "results" / "PRECLAIM_WITNESS_NATIVE_CODEC.json").read_text(encoding="utf-8"))
    checks["small_witness_pass"] = witness["gate_witness_pass"]
    run_checks = {}
    for label in ("codec-final-initial", "codec-final-replay"):
        run_root = root / "results" / label
        summary = json.loads((run_root / "SUMMARY.json").read_text(encoding="utf-8"))
        repos = [
            json.loads(path.read_text(encoding="utf-8"))
            for path in run_root.glob("*.json")
            if path.name != "SUMMARY.json"
        ]
        methods = [method for repo in repos for method in repo["methods"]]
        strict_pass = all(
            not method.get("status")
            and method["validation"]["index_pack_verify_strict_exit"] == 0
            and method["validation"]["fsck_strict_exit"] == 0
            and method["validation"]["canonical_equality_mismatch_count"] == 0
            for method in methods
        )
        run_checks[label] = {
            "repository_count": len(repos),
            "method_count": len(methods),
            "correctness_summary": summary["correctness_pass_count"],
            "strict_all_methods": strict_pass,
            "residual": summary["residual_edge_fraction"],
            "primary_benefit_repo_count": summary["candidate_vs_union"]["primary_benefit_repo_count"],
            "driver_peak_rss_bytes": summary["driver_peak_rss_bytes"],
            "native_compressor": summary["representation_compressor"],
        }
    checks["claim_runs"] = run_checks
    aggregate = json.loads((root / "results" / "AGGREGATE.json").read_text(encoding="utf-8"))
    full_cost = json.loads((root / "results" / "FULL_COST.json").read_text(encoding="utf-8"))
    reproducibility = json.loads((root / "results" / "REPRODUCIBILITY.json").read_text(encoding="utf-8"))
    checks["decision"] = aggregate["decision"]
    checks["quality_tier"] = aggregate["quality_tier"]
    checks["outside_edges"] = aggregate["residual"]["outside_edge_count_per_run"]
    checks["selected_edges"] = aggregate["residual"]["selected_useful_edge_count_per_run"]
    checks["scientific_decision_reproduced"] = reproducibility["scientific_decision_reproduced"]
    checks["recorded_pilot_cpu_upper_seconds"] = full_cost["all_recorded_pilot_runs_conservative_cpu_upper_bound_seconds"]
    checks["pre_manifest_workspace_bytes"] = full_cost["workspace_bytes_after_final_replay"]
    checks["cpu_budget_pass"] = checks["recorded_pilot_cpu_upper_seconds"] < full_cost["cpu_budget_seconds"]
    checks["workspace_budget_pass"] = checks["pre_manifest_workspace_bytes"] < full_cost["workspace_budget_bytes"]
    handoff_text = (root / "handoff.yaml").read_text(encoding="utf-8")
    checks["stageb_user_approval_id"] = None if "  stageb_user_approval_id: null\n" in handoff_text else "PARSE_ASSERTION_FAILED"
    checks["stageb_authorized"] = False if "  stageb_authorized: false\n" in handoff_text else "PARSE_ASSERTION_FAILED"
    required = [
        "STAGEA_REPORT.md",
        "EXPERIMENT_CONTRACT.yaml",
        "Q1_COMPARATOR_MATRIX.md",
        "COMMAND_LOG.md",
        "RESULTS.md",
        "USER_REVIEW_PACKET.md",
        "handoff.yaml",
    ]
    checks["required_deliverables"] = {name: (root / name).is_file() for name in required}
    passed = (
        checks["corpus_lock_match"]
        and checks["native_codec_parity"]["pass"]
        and checks["small_witness_pass"]
        and all(
            run["repository_count"] == 20
            and run["method_count"] == 280
            and run["correctness_summary"] == 20
            and run["strict_all_methods"]
            and run["residual"]["aggregate"] == 0
            for run in run_checks.values()
        )
        and checks["decision"] == "STOP"
        and checks["quality_tier"] == "BELOW_Q2_STOP"
        and checks["outside_edges"] == 0
        and checks["selected_edges"] == 832
        and checks["scientific_decision_reproduced"]
        and checks["cpu_budget_pass"]
        and checks["workspace_budget_pass"]
        and checks["stageb_user_approval_id"] is None
        and checks["stageb_authorized"] is False
        and all(checks["required_deliverables"].values())
    )
    result = {
        "schema_version": "git-pack-forest-final-audit-v1",
        "status": "PASS" if passed else "FAIL",
        "checks": checks,
    }
    write_json(root / "results" / "FINAL_AUDIT.json", result)
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0 if passed else 2


if __name__ == "__main__":
    raise SystemExit(main())
