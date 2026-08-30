#!/usr/bin/env python3
"""Recompute paired statistics and the pre-registered killer audit from run04."""

import json
import math
import statistics
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
RAW = ROOT / "NATURAL_CORPUS_RESULTS.json"
OUT = ROOT / "FULL_COST_LEDGER.json"


def q(values, fraction):
    if not values:
        return None
    ordered = sorted(values)
    return ordered[max(0, math.ceil(fraction * len(ordered)) - 1)]


def dist(values):
    return {
        "n": len(values), "p50": statistics.median(values) if values else None,
        "p90_nearest_rank": q(values, 0.90), "min": min(values) if values else None,
        "max": max(values) if values else None,
    }


def main():
    raw = json.loads(RAW.read_text(encoding="utf-8"))
    rows = raw["rows"]
    executable = [r for r in rows if "arms" in r]
    accepted = [r for r in rows if r["disposition"].startswith("PAIRED_NATIVE_RECONSTRUCTIBILITY_GAIN")]
    gains30 = [1 if r in accepted else 0 for r in rows]
    gainsexec = [r["paired_delta"]["reconstructible_parameters"] for r in executable]
    coordinates = {}
    for key in ("object_bytes", "text_bytes", "debug_payload_bytes", "debug_relocation_bytes", "eh_frame_bytes"):
        coordinates[key] = dist([r["paired_delta"][key] for r in executable])
    writer_wall = [r["candidate_writer"]["wall_seconds"] - r["baseline_writer"]["wall_seconds"] for r in executable]
    writer_cpu = [r["candidate_writer"]["cpu_seconds"] - r["baseline_writer"]["cpu_seconds"] for r in executable if r["candidate_writer"]["cpu_seconds"] is not None and r["baseline_writer"]["cpu_seconds"] is not None]
    writer_rss = [r["candidate_writer"]["peak_rss_bytes"] - r["baseline_writer"]["peak_rss_bytes"] for r in executable if r["candidate_writer"]["peak_rss_bytes"] is not None and r["baseline_writer"]["peak_rss_bytes"] is not None]
    reader_wall = [r["arms"]["candidate"]["reader_full_cost"]["wall_seconds"] - r["arms"]["baseline"]["reader_full_cost"]["wall_seconds"] for r in executable]
    reader_cpu = [r["arms"]["candidate"]["reader_full_cost"]["cpu_seconds"] - r["arms"]["baseline"]["reader_full_cost"]["cpu_seconds"] for r in executable if r["arms"]["candidate"]["reader_full_cost"]["cpu_seconds"] is not None and r["arms"]["baseline"]["reader_full_cost"]["cpu_seconds"] is not None]
    reader_rss = [r["arms"]["candidate"]["reader_full_cost"]["peak_rss_bytes"] - r["arms"]["baseline"]["reader_full_cost"]["peak_rss_bytes"] for r in executable]
    unique_prera = {}
    for r in rows:
        unique_prera.setdefault(r["input"], r["preRA"])
    process_cpu = []
    process_wall = []
    for p in unique_prera.values():
        process_wall.append(p["wall_seconds"])
        if p["cpu_seconds"] is not None: process_cpu.append(p["cpu_seconds"])
    for r in rows:
        process_wall.append(r["planner"]["wall_seconds"])
        if r["planner"]["cpu_seconds"] is not None: process_cpu.append(r["planner"]["cpu_seconds"])
        for key in ("baseline_writer", "candidate_machine_verifier", "candidate_writer"):
            if key in r:
                process_wall.append(r[key]["wall_seconds"])
                if r[key]["cpu_seconds"] is not None: process_cpu.append(r[key]["cpu_seconds"])
        if "arms" in r:
            for arm in ("baseline", "candidate"):
                process_wall.append(r["arms"][arm]["reader_full_cost"]["wall_seconds"])
                cpu = r["arms"][arm]["reader_full_cost"]["cpu_seconds"]
                if cpu is not None: process_cpu.append(cpu)
    success = accepted[0] if accepted else None
    result = {
        "schema": "llvm-dwarf-stagea-directional-full-cost-v1",
        "denominator": 30,
        "dispositions": {
            "accepted_static_equivalence_gain": len(accepted),
            "native_baseline_roundtrip_or_writer_failure": sum("LEGALITY_OR_WRITER_FAILURE" in r["disposition"] for r in rows),
            "mapper_or_fidelity_inapplicable": sum("MAPPER_INAPPLICABLE" in r["disposition"] for r in rows),
            "executable_no_gain": sum(r["disposition"].startswith("NO_ACCEPTED") for r in rows),
        },
        "reconstructibility": {
            "all_30_failure_retained": dist(gains30),
            "executable_pairs_only": dist(gainsexec),
            "accepted_fraction_all_30": len(accepted) / 30,
            "accepted_fraction_executable_18": len(accepted) / len(executable),
        },
        "paired_executable_coordinates": coordinates,
        "writer_delta": {"wall_seconds": dist(writer_wall), "cpu_seconds": dist(writer_cpu), "peak_rss_bytes": dist(writer_rss)},
        "reader_delta": {"wall_seconds": dist(reader_wall), "cpu_seconds": dist(reader_cpu), "peak_rss_bytes": dist(reader_rss)},
        "planner": {"wall_seconds": dist([r["planner"]["wall_seconds"] for r in rows]), "cpu_seconds": dist([r["planner"]["cpu_seconds"] for r in rows])},
        "successful_site": None if success is None else {
            "index": success["index"], "function": success["site"]["function"],
            "paired_delta": success["paired_delta"], "baseline_object": success["arms"]["baseline"]["object_sha256"],
            "candidate_object": success["arms"]["candidate"]["object_sha256"],
            "baseline_writer": success["baseline_writer"], "candidate_writer": success["candidate_writer"],
            "candidate_verifier": success["candidate_machine_verifier"],
            "baseline_reader": success["arms"]["baseline"]["reader_full_cost"],
            "candidate_reader": success["arms"]["candidate"]["reader_full_cost"],
            "behavior": success["behavior_verification"],
        },
        "observed_experiment_process_totals": {
            "cpu_seconds_sum": sum(process_cpu), "wall_seconds_sum_nonoverlap_child_and_planner": sum(process_wall),
            "note": "Exact process CPU/RSS are captured per invoked child; OS/app overhead outside these processes is unobserved and not estimated."
        },
        "runtime": "UNOBSERVED__NO_SELF_CONTAINED_NATURAL_HARNESS__DO_NOT_IMPUTE",
        "killer_audit": {
            "p50_has_gain": False, "p90_has_gain": False,
            "natural_nontrivial_boundary": "FAIL__ONE_OF_30_ONLY_AND_ZERO_P50_P90",
            "candidate_fidelity_on_denominator": "PARTIAL__18_EXECUTABLE_11_NATIVE_MIR_ROUNDTRIP_FAILURES_1_FROZEN_MAPPING_MISMATCH",
            "positive_stagea_recommendation_supported": False,
        },
        "scientific_revision_consumed": False,
        "stageb_authorized": False,
    }
    OUT.write_text(json.dumps(result, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(result, indent=2))


if __name__ == "__main__":
    main()
