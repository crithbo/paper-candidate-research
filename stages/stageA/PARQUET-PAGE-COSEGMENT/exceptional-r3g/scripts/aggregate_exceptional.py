from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import statistics


def sha256(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1 << 20), b""):
            h.update(chunk)
    return h.hexdigest().upper()


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", required=True, type=Path)
    args = parser.parse_args()
    root = args.root
    replay_names = ("replay1_complete", "replay2")
    replays = []
    for name in replay_names:
        paths = sorted((root / "artifacts" / name).glob("green_tripdata_*/result.json"))
        if len(paths) != 20:
            raise ValueError(f"{name}: expected 20 results, got {len(paths)}")
        replays.append([json.loads(path.read_text(encoding="utf-8")) for path in paths])
    pair_records = []
    for first, second in zip(*replays):
        fields = ("file", "source_sha256", "selected_union", "union_bytes", "candidate_bytes",
                  "union_sha256", "candidate_sha256", "fallback", "catalog_count")
        equal = all(first[field] == second[field] for field in fields)
        pair_records.append({"file": first["file"], "non_timing_fields_equal": equal,
                             "replay1_result_sha256": sha256(root / "artifacts" / "replay1_complete" / Path(first["file"]).stem / "result.json"),
                             "replay2_result_sha256": sha256(root / "artifacts" / "replay2" / Path(second["file"]).stem / "result.json"),
                             "union_output_hash_equal": first["union_sha256"] == second["union_sha256"],
                             "candidate_output_hash_equal": first["candidate_sha256"] == second["candidate_sha256"]})
    all_results = replays[0] + replays[1]
    cost_keys = ("shared", "baseline_only", "candidate_only", "union_write", "candidate_write", "verification_shared")
    completed_cpu_ns = sum(item["cost"][key]["cpu_ns"] for item in all_results for key in cost_keys)
    completed_cpu_ns += sum(item["latin"][arm]["total_cpu_ns"] for item in all_results for arm in ("union", "candidate"))
    completed_wall_ns = sum(json.loads((root / "artifacts" / name / "probe_summary.json").read_text(encoding="utf-8"))["total_wall_ns"] for name in replay_names)
    logical_query_read_upper = sum((item["union_bytes"] + item["candidate_bytes"]) * 110 for item in all_results)
    aggregate = {
        "schema_version": "exceptional-r3g-aggregate-v1",
        "natural_objects": 20,
        "replays": 2,
        "result_records": 40,
        "catalog_points_per_file": 106,
        "catalog_materializations": 4240,
        "fallbacks": sum(item["fallback"] for item in all_results),
        "semantic_equivalence": sum(item["equivalence"]["union"]["pass"] and item["equivalence"]["candidate"]["pass"] for item in all_results),
        "replay_non_timing_equal": sum(item["non_timing_fields_equal"] for item in pair_records),
        "replay_union_hash_equal": sum(item["union_output_hash_equal"] for item in pair_records),
        "replay_candidate_hash_equal": sum(item["candidate_output_hash_equal"] for item in pair_records),
        "selected_union": sorted({item["selected_union"] for item in all_results}),
        "actions": sum(item["actions"] for item in all_results),
        "outside_actions": sum(item["outside_actions"] for item in all_results),
        "useful_outside_actions": sum(item["useful_outside_actions"] for item in all_results),
        "useful_action_rate": 0.0,
        "replay_summaries": [json.loads((root / "artifacts" / name / "probe_summary.json").read_text(encoding="utf-8")) for name in replay_names],
        "full_cost_ratio": {
            "median_all_40": statistics.median(item["cost"]["candidate_union_full_wall_ratio"] for item in all_results),
            "min_all_40": min(item["cost"]["candidate_union_full_wall_ratio"] for item in all_results),
            "max_all_40": max(item["cost"]["candidate_union_full_wall_ratio"] for item in all_results),
            "strict_residual_files": sum(item["cost"]["candidate_union_full_wall_ratio"] < 1 for item in all_results),
        },
        "budget": {
            "completed_claim_runs_cpu_ns": completed_cpu_ns,
            "completed_claim_runs_cpu_hours": completed_cpu_ns / 3_600_000_000_000,
            "completed_claim_runs_wall_ns": completed_wall_ns,
            "completed_claim_runs_wall_hours": completed_wall_ns / 3_600_000_000_000,
            "max_peak_rss_bytes_conservative_process_sum": max(item["peak_rss_bytes"] for item in all_results),
            "temporary_bytes_materialized_and_deleted": sum(item["cost"]["baseline_only"]["temporary_bytes"] for item in all_results),
            "logical_query_read_bytes_upper_bound": logical_query_read_upper,
            "network_bytes": 0,
            "gpu": False,
            "exclusive_device": False,
        },
        "decision": "STOP_RECOMMENDED__NARROW_FROZEN_MECHANISM",
        "evidence_ceiling": "STAGEA_CORRECTED_FAIR_20_OBJECT_DOUBLE_REPLAY_SCIENTIFIC_NEGATIVE",
        "pair_records": pair_records,
    }
    out = root / "artifacts" / "aggregate.json"
    out.write_text(json.dumps(aggregate, indent=2, sort_keys=True), encoding="utf-8", newline="\n")
    lines = ["replay\tfile\tfallback\tselected_union\tp50_improvement\tp90_improvement\tsize_ratio\tfull_cost_ratio\tbaseline_wall_ns\tcandidate_wall_ns\tpeak_rss_bytes"]
    for replay, rows in zip(("replay1", "replay2"), replays):
        for item in rows:
            lines.append("\t".join(map(str, [replay, item["file"], item["fallback"], item["selected_union"],
                item["p50_improvement"], item["p90_improvement"], item["size_ratio"],
                item["cost"]["candidate_union_full_wall_ratio"], item["cost"]["baseline_only"]["wall_ns"],
                item["cost"]["candidate_only"]["wall_ns"], item["peak_rss_bytes"]])))
    (root / "artifacts" / "per_file_summary.tsv").write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")
    hash_lines = ["file\tsource_sha256\treplay1_union_sha256\treplay1_candidate_sha256\treplay2_union_sha256\treplay2_candidate_sha256"]
    for first, second in zip(*replays):
        hash_lines.append("\t".join([first["file"], first["source_sha256"], first["union_sha256"],
                                     first["candidate_sha256"], second["union_sha256"], second["candidate_sha256"]]))
    (root / "artifacts" / "exact_hashes.tsv").write_text("\n".join(hash_lines) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps({key: aggregate[key] for key in ("natural_objects", "replays", "fallbacks", "semantic_equivalence", "replay_non_timing_equal", "full_cost_ratio", "budget", "decision")}, indent=2, sort_keys=True))


if __name__ == "__main__":
    main()
