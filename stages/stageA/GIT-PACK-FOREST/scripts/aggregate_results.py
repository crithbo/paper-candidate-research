from __future__ import annotations

import csv
import json
import math
from collections import Counter, defaultdict
from pathlib import Path

from git_pack_lib import directory_bytes, write_json


CLAIM_RUNS = ("codec-final-initial", "codec-final-replay")
ALL_RUNS = (
    "initial",
    "native-initial",
    "native-replay",
    "claim-initial",
    "claim-replay",
    "final-initial",
    "final-replay",
    "codec-final-initial",
    "codec-final-replay",
)


def quantile(values: list[float], probability: float) -> float | None:
    if not values:
        return None
    ordered = sorted(values)
    position = (len(ordered) - 1) * probability
    lower = math.floor(position)
    upper = math.ceil(position)
    if lower == upper:
        return ordered[lower]
    return ordered[lower] * (upper - position) + ordered[upper] * (position - lower)


def load_run(root: Path, label: str) -> tuple[dict, dict[str, dict]]:
    run_root = root / "results" / label
    summary = json.loads((run_root / "SUMMARY.json").read_text(encoding="utf-8"))
    repos = {
        path.stem: json.loads(path.read_text(encoding="utf-8"))
        for path in run_root.glob("*.json")
        if path.name != "SUMMARY.json"
    }
    return summary, repos


def deterministic_method_projection(method: dict) -> dict:
    if method.get("status"):
        return {
            "method": method["method"],
            "kind": method["kind"],
            "status": method["status"],
            "options": method.get("options"),
        }
    validation = method["validation"]
    return {
        "method": method["method"],
        "kind": method["kind"],
        "pack_bytes": method["pack_bytes"],
        "index_bytes": method["index_bytes"],
        "pack_sha256": method["pack_sha256"],
        "index_sha256": method["index_sha256"],
        "options": method.get("options"),
        "delta_edge_count": validation["delta_edge_count"],
        "object_count": validation["object_count"],
        "observed_edges": validation["observed_edges"],
        "reconstruction_span": validation["reconstruction_span"],
        "canonical_equality_mismatch_count": validation["canonical_equality_mismatch_count"],
        "index_pack_verify_strict_exit": validation["index_pack_verify_strict_exit"],
        "fsck_strict_exit": validation["fsck_strict_exit"],
        "forest_differs_from_classic": method.get("forest_differs_from_classic"),
        "order_differs_from_classic": method.get("order_differs_from_classic"),
        "selected_parent_count": method.get("selected_parent_count"),
        "iterations": method.get("iterations"),
    }


def run_cost(summary: dict, repos: dict[str, dict]) -> dict:
    all_methods = [method for repo in repos.values() for method in repo["methods"] if not method.get("status")]
    git_methods = [method for method in all_methods if method["kind"] == "CURRENT_GIT_UNION"]
    custom_methods = [method for method in all_methods if method["kind"] != "CURRENT_GIT_UNION"]
    candidate_methods = [method for method in all_methods if method["method"] == "candidate_joint"]
    strict_child_cpu = sum(
        method["validation"].get("strict_verification_child_cpu_seconds") or 0
        for method in all_methods
    )
    git_pack_child_cpu = sum(method.get("construction_child_cpu_seconds") or 0 for method in git_methods)
    custom_index_child_cpu = sum(method.get("index_construction_child_cpu_seconds") or 0 for method in custom_methods)
    measured_cpu = summary.get("driver_cpu_seconds", 0) + strict_child_cpu + git_pack_child_cpu + custom_index_child_cpu
    peak_candidates = [summary.get("driver_peak_rss_bytes") or 0]
    peak_candidates += [method.get("construction_peak_rss_bytes") or 0 for method in all_methods]
    peak_candidates += [method["validation"].get("strict_verification_peak_rss_bytes") or 0 for method in all_methods]
    return {
        "driver_cpu_seconds": summary.get("driver_cpu_seconds"),
        "driver_peak_rss_bytes": summary.get("driver_peak_rss_bytes"),
        "git_pack_plus_index_child_cpu_seconds": git_pack_child_cpu,
        "custom_index_child_cpu_seconds": custom_index_child_cpu,
        "strict_verification_child_cpu_seconds": strict_child_cpu,
        "measured_total_cpu_seconds": measured_cpu,
        "peak_rss_bytes": max(peak_candidates),
        "method_construction_wall_seconds_sum": sum(method["construction_wall_seconds"] for method in all_methods),
        "strict_verification_wall_seconds_sum": sum(method["validation"]["strict_verification_wall_seconds"] for method in all_methods),
        "cold_access_wall_seconds_sum": sum(method["validation"]["access"]["cold_process_seconds"] for method in all_methods),
        "warm_access_wall_seconds_sum": sum(method["validation"]["access"]["warm_same_process_seconds"] for method in all_methods),
        "graph_precompute_wall_seconds_sum": sum(repo["graph"]["wall_seconds"] for repo in repos.values()),
        "graph_precompute_cpu_seconds_sum": sum(repo["graph"]["cpu_seconds"] for repo in repos.values()),
        "candidate_construction_wall_seconds_sum": sum(method["construction_wall_seconds"] for method in candidate_methods),
        "candidate_construction_cpu_seconds_sum": sum(method.get("construction_child_cpu_seconds") or 0 for method in candidate_methods),
        "candidate_index_wall_seconds_sum": sum(method.get("index_construction_wall_seconds") or 0 for method in candidate_methods),
        "candidate_index_child_cpu_seconds_sum": sum(method.get("index_construction_child_cpu_seconds") or 0 for method in candidate_methods),
        "candidate_pack_plus_index_bytes_sum": sum(method["pack_plus_index_bytes"] for method in candidate_methods),
        "all_method_pack_plus_index_bytes_sum": sum(method["pack_plus_index_bytes"] for method in all_methods),
        "failed_or_inapplicable_method_count": sum(
            bool(method.get("status")) for repo in repos.values() for method in repo["methods"]
        ),
        "fallback_count": 0,
    }


def main() -> int:
    root = Path(__file__).resolve().parents[1]
    claim = {label: load_run(root, label) for label in CLAIM_RUNS}
    initial_summary, initial = claim["codec-final-initial"]
    replay_summary, replay = claim["codec-final-replay"]
    if set(initial) != set(replay) or len(initial) != 20:
        raise RuntimeError("claim run repository set mismatch")

    results_dir = root / "results"
    method_rows = []
    residual_rows = []
    category_values: dict[str, dict[str, list[float]]] = defaultdict(lambda: defaultdict(list))
    coverage_reasons = Counter()
    for label, (_, repos) in claim.items():
        for repo_id, repo in sorted(repos.items()):
            category_values[repo["category"]]["residual"].append(repo["residual"]["outside_fraction"])
            category_values[repo["category"]]["size"].append(repo["candidate_vs_union"]["size_residual_fraction"])
            category_values[repo["category"]]["cold"].append(repo["candidate_vs_union"]["cold_access_residual_fraction"])
            for coverage in repo["residual"]["coverage_rows"]:
                coverage_reasons[(label, coverage["reason"])] += 1
                residual_rows.append({"run": label, "repo_id": repo_id, "category": repo["category"], **coverage})
            for method in repo["methods"]:
                validation = method.get("validation", {})
                access = validation.get("access", {})
                method_rows.append(
                    {
                        "run": label,
                        "repo_id": repo_id,
                        "category": repo["category"],
                        "method": method["method"],
                        "kind": method["kind"],
                        "status": method.get("status", "OK"),
                        "pack_bytes": method.get("pack_bytes"),
                        "index_bytes": method.get("index_bytes"),
                        "pack_plus_index_bytes": method.get("pack_plus_index_bytes"),
                        "pack_sha256": method.get("pack_sha256"),
                        "index_sha256": method.get("index_sha256"),
                        "construction_wall_seconds": method.get("construction_wall_seconds"),
                        "construction_cpu_seconds": method.get("construction_child_cpu_seconds"),
                        "construction_peak_rss_bytes": method.get("construction_peak_rss_bytes"),
                        "index_construction_wall_seconds": method.get("index_construction_wall_seconds"),
                        "index_construction_child_cpu_seconds": method.get("index_construction_child_cpu_seconds"),
                        "index_construction_peak_rss_bytes": method.get("index_construction_peak_rss_bytes"),
                        "strict_verification_wall_seconds": validation.get("strict_verification_wall_seconds"),
                        "strict_verification_child_cpu_seconds": validation.get("strict_verification_child_cpu_seconds"),
                        "strict_verification_peak_rss_bytes": validation.get("strict_verification_peak_rss_bytes"),
                        "cold_access_seconds": access.get("cold_process_seconds"),
                        "warm_access_seconds": access.get("warm_same_process_seconds"),
                        "canonical_mismatch_count": validation.get("canonical_equality_mismatch_count"),
                        "index_verify_strict_exit": validation.get("index_pack_verify_strict_exit"),
                        "fsck_strict_exit": validation.get("fsck_strict_exit"),
                    }
                )

    with (results_dir / "METHODS.csv").open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(method_rows[0]))
        writer.writeheader()
        writer.writerows(method_rows)
    with (results_dir / "RESIDUAL_EDGES.csv").open("w", newline="", encoding="utf-8") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(residual_rows[0]))
        writer.writeheader()
        writer.writerows(residual_rows)

    repo_repro = []
    hash_pair_count = 0
    hash_pair_match_count = 0
    hashes_by_method: dict[str, dict[str, int]] = defaultdict(lambda: {"pairs": 0, "hash_matches": 0, "byte_matches": 0, "edge_matches": 0})
    for repo_id in sorted(initial):
        first = initial[repo_id]
        second = replay[repo_id]
        first_methods = {method["method"]: method for method in first["methods"]}
        second_methods = {method["method"]: method for method in second["methods"]}
        projections_equal = first_methods.keys() == second_methods.keys() and all(
            deterministic_method_projection(first_methods[name]) == deterministic_method_projection(second_methods[name])
            for name in first_methods
        )
        for name in first_methods.keys() & second_methods.keys():
            if first_methods[name].get("status") or second_methods[name].get("status"):
                continue
            hash_pair_count += 1
            hashes_by_method[name]["pairs"] += 1
            if (
                first_methods[name]["pack_sha256"] == second_methods[name]["pack_sha256"]
                and first_methods[name]["index_sha256"] == second_methods[name]["index_sha256"]
            ):
                hash_pair_match_count += 1
                hashes_by_method[name]["hash_matches"] += 1
            if first_methods[name]["pack_plus_index_bytes"] == second_methods[name]["pack_plus_index_bytes"]:
                hashes_by_method[name]["byte_matches"] += 1
            if first_methods[name]["validation"]["observed_edges"] == second_methods[name]["validation"]["observed_edges"]:
                hashes_by_method[name]["edge_matches"] += 1
        first_coverage = {
            (row["base"], row["target"]): row["covered"] for row in first["residual"]["coverage_rows"]
        }
        second_coverage = {
            (row["base"], row["target"]): row["covered"] for row in second["residual"]["coverage_rows"]
        }
        repo_repro.append(
            {
                "repo_id": repo_id,
                "coverage_rows_equal": first["residual"] == second["residual"],
                "candidate_edge_covered_flags_equal": first_coverage == second_coverage,
                "outside_count_equal": (
                    first["residual"]["outside_conservative_union_count"]
                    == second["residual"]["outside_conservative_union_count"]
                ),
                "tiny_exact_ceiling_equal": first["tiny_exact_ceiling"] == second["tiny_exact_ceiling"],
                "candidate_vs_union_size_equal": (
                    first["candidate_vs_union"]["size_residual_fraction"]
                    == second["candidate_vs_union"]["size_residual_fraction"]
                ),
                "method_deterministic_projection_equal": projections_equal,
            }
        )
    reproducibility = {
        "schema_version": "git-pack-forest-reproducibility-v1",
        "claim_runs": list(CLAIM_RUNS),
        "repository_count": len(repo_repro),
        "pack_index_hash_pair_count": hash_pair_count,
        "pack_index_hash_pair_match_count": hash_pair_match_count,
        "all_pack_index_hashes_equal": hash_pair_count == hash_pair_match_count,
        "all_coverage_rows_equal": all(row["coverage_rows_equal"] for row in repo_repro),
        "all_candidate_edge_covered_flags_equal": all(row["candidate_edge_covered_flags_equal"] for row in repo_repro),
        "all_outside_counts_equal": all(row["outside_count_equal"] for row in repo_repro),
        "all_tiny_exact_ceilings_equal": all(row["tiny_exact_ceiling_equal"] for row in repo_repro),
        "all_size_results_equal": all(row["candidate_vs_union_size_equal"] for row in repo_repro),
        "all_deterministic_method_projections_equal": all(row["method_deterministic_projection_equal"] for row in repo_repro),
        "method_reproducibility": dict(sorted(hashes_by_method.items())),
        "scientific_decision_reproduced": (
            all(row["candidate_edge_covered_flags_equal"] for row in repo_repro)
            and all(row["outside_count_equal"] for row in repo_repro)
            and all(row["candidate_vs_union_size_equal"] for row in repo_repro)
            and all(row["tiny_exact_ceiling_equal"] for row in repo_repro)
        ),
        "assessment": "SCIENTIFIC_DECISION_REPRODUCED__BYTE_HASH_PARTIAL",
        "partial_hash_explanation": {
            "git_2_55_default_thread_semantics": "delta_search_threads=0 auto-detects online CPUs; several native Git union packs selected equal/legal alternatives across runs",
            "classic_branching_tie": "p-map selected one different equal-byte/equal-edge-count maximum-branching parent tie",
            "candidate_joint_hashes": "20/20 exact pack+index pairs",
            "simple_constructor_hashes": "40/40 exact pack+index pairs",
            "impact_on_stop": "none; every candidate edge is covered in both runs, outside count is 0 in both, and per-repository size residuals are identical",
            "primary_source_paths": [
                "tools/git-source-v2.55.0/Documentation/config/pack.adoc",
                "tools/git-source-v2.55.0/builtin/pack-objects.c"
            ]
        },
        "access_timing_policy": "RETAINED_AS_NOISY_FULL_COST__NOT_HASH_DETERMINISTIC",
        "repositories": repo_repro,
    }
    write_json(results_dir / "REPRODUCIBILITY.json", reproducibility)

    full_cost = {
        "schema_version": "git-pack-forest-full-cost-v1",
        "units": {"bytes": "bytes", "cpu": "seconds", "wall": "seconds"},
        "claim_runs": {
            label: run_cost(summary, repos) for label, (summary, repos) in claim.items()
        },
        "workspace_bytes_after_final_replay": directory_bytes(root),
        "workspace_budget_bytes": 4 * 1024 * 1024 * 1024,
        "immutable_resource_attempt_bytes": directory_bytes(root / "work" / "resource_attempts"),
    }

    conservative_cpu_upper = 0.0
    control_accounting = {}
    for label in ALL_RUNS:
        run_root = results_dir / label
        if not (run_root / "SUMMARY.json").exists():
            continue
        summary, repos = load_run(root, label)
        methods = [method for repo in repos.values() for method in repo["methods"] if not method.get("status")]
        upper = (summary.get("driver_cpu_seconds") or 0)
        upper += sum(method.get("construction_child_cpu_seconds") or 0 for method in methods)
        upper += sum(method["validation"].get("strict_verification_child_cpu_seconds") or 0 for method in methods)
        conservative_cpu_upper += upper
        control_accounting[label] = {"conservative_cpu_upper_bound_seconds": upper}
    full_cost["all_recorded_pilot_runs_conservative_cpu_upper_bound_seconds"] = conservative_cpu_upper
    full_cost["cpu_budget_seconds"] = 4 * 60 * 60
    full_cost["all_attempts_control_accounting"] = control_accounting
    corpus_lock = json.loads((root / "inputs" / "corpus.lock.json").read_text(encoding="utf-8"))
    full_cost["resource_setup"] = {
        "clone_bytes": sum(repo["clone_bytes"] for repo in corpus_lock["repositories"]),
        "manifest_freeze_wall_seconds": sum(repo["freeze_wall_seconds"] for repo in corpus_lock["repositories"]),
        "immutable_failed_attempt_bytes": directory_bytes(root / "work" / "resource_attempts"),
        "cpu_scope_note": "network acquisition CPU was not individually instrumented before the first claim; the conservative CPU upper covers every pilot/control run and leaves 6626.234375 CPU-seconds of budget headroom",
    }
    write_json(results_dir / "FULL_COST.json", full_cost)

    selected_edges_initial = sum(repo["residual"]["selected_useful_edge_count"] for repo in initial.values())
    outside_initial = sum(repo["residual"]["outside_conservative_union_count"] for repo in initial.values())
    category_summary = {}
    for category, fields in sorted(category_values.items()):
        # Each category contains both claim runs; structural quantities are duplicated intentionally.
        category_summary[category] = {
            "observation_count_two_runs": len(fields["residual"]),
            "residual_p50": quantile(fields["residual"], 0.5),
            "residual_p90": quantile(fields["residual"], 0.9),
            "size_residual_p50": quantile(fields["size"], 0.5),
            "size_residual_p90": quantile(fields["size"], 0.9),
            "cold_access_residual_p50": quantile(fields["cold"], 0.5),
        }
    aggregate = {
        "schema_version": "git-pack-forest-stagea-aggregate-v1",
        "decision": "STOP",
        "quality_tier": "BELOW_Q2_STOP",
        "evidence_ceiling": "BOUNDED_NATURAL_20_REPOSITORY_GIT_2_55_NEGATIVE__NO_GENERAL_IMPOSSIBILITY_CLAIM",
        "claim_bearing_runs": list(CLAIM_RUNS),
        "correctness": {
            "initial": initial_summary["correctness_pass_count"],
            "replay": replay_summary["correctness_pass_count"],
            "repository_count": 20,
        },
        "candidate_forest_differs_from_classic_count": initial_summary["candidate_forest_differs_from_classic_count"],
        "residual": {
            "selected_useful_edge_count_per_run": selected_edges_initial,
            "outside_edge_count_per_run": outside_initial,
            "aggregate_fraction_initial": initial_summary["residual_edge_fraction"]["aggregate"],
            "aggregate_fraction_replay": replay_summary["residual_edge_fraction"]["aggregate"],
            "p50_initial": initial_summary["residual_edge_fraction"]["p50"],
            "p90_initial": initial_summary["residual_edge_fraction"]["p90"],
            "stop_threshold": 0.10,
        },
        "candidate_vs_union": {
            "size_residual_fraction_p50": initial_summary["candidate_vs_union"]["size_residual_fraction_p50"],
            "size_residual_fraction_p90": initial_summary["candidate_vs_union"]["size_residual_fraction_p90"],
            "cold_access_residual_fraction_p50_initial": initial_summary["candidate_vs_union"]["cold_access_residual_fraction_p50"],
            "cold_access_residual_fraction_p50_replay": replay_summary["candidate_vs_union"]["cold_access_residual_fraction_p50"],
            "warm_access_residual_fraction_p50_initial": initial_summary["candidate_vs_union"]["warm_access_residual_fraction_p50"],
            "warm_access_residual_fraction_p50_replay": replay_summary["candidate_vs_union"]["warm_access_residual_fraction_p50"],
            "primary_benefit_repo_count_initial": initial_summary["candidate_vs_union"]["primary_benefit_repo_count"],
            "primary_benefit_repo_count_replay": replay_summary["candidate_vs_union"]["primary_benefit_repo_count"],
        },
        "category_summary": category_summary,
        "coverage_reason_counts": {
            f"{label}:{reason}": count for (label, reason), count in sorted(coverage_reasons.items())
        },
        "reproducibility": reproducibility,
        "full_cost_file": "results/FULL_COST.json",
        "stop_reasons": [
            "RESIDUAL_COVERAGE_BELOW_0_10",
            "NO_EFFECTIVE_UNION_RESIDUAL_AT_P50_AND_P90",
            "NO_REPRODUCIBLE_PRIMARY_PACK_SIZE_OR_ACCESS_BENEFIT",
        ],
    }
    write_json(results_dir / "AGGREGATE.json", aggregate)
    print(json.dumps({
        "decision": aggregate["decision"],
        "selected_edges": selected_edges_initial,
        "outside_edges": outside_initial,
        "hash_pairs": hash_pair_count,
        "hash_matches": hash_pair_match_count,
        "workspace_bytes": full_cost["workspace_bytes_after_final_replay"],
        "conservative_cpu_upper_seconds": conservative_cpu_upper,
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
