#!/usr/bin/env python3
"""Mechanical validator for the PB-DELETE-SCHEDULE Stage A delivery."""

from __future__ import annotations

import argparse
import csv
import hashlib
import json
import math
import pathlib
import statistics


ROOT = pathlib.Path(r"<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\PB-DELETE-SCHEDULE")
DISK_CEILING = 4_294_967_296
EXPECTED = {
    "CORPUS_MANIFEST.json": "3A1F4255B3EAAE7A02EB948EAF2E4BB409B42D2BB07C1585684B33C166A8C705",
    "LEGAL_CHOICE_RESULTS.json": "97F371E8A7ADA04038584FF04F67553747E0D126A4A3A56666A9D71A8BA80CA7",
    "FULL_COST_RESULTS.json": "07A8F907343B694DB280BCE06ECDCFFD55B61F815B42DF26E797E0D27E572C59",
    "FULL_COST_MATRIX.csv": "9A089076AE15ACEF54F98B207B8723C04DC33F1DD11749EBF5AAFB691076A883",
    "SOURCE_TREE_HASHES.json": "402FB2B1349A46BAE7ACE73E84A1AE9120D0C18D46A758C2977A4088D283E7ED",
    "certified_maxpre_experimental_data.zip": "4FC61DBED2881BED29D59F4B790E96153051F6CC2873432F231BCFE705014716",
    "build/maxpre.exe": "8B1C5CD5752A69CC2A0D949173C53E6586756675872F28E585593BC82E2BABF9",
    "build/veripb-target-system/release/veripb.exe": "2E38A50D8D85CD3D1AC4D870F449A53CB42A177D37E2A3FAA9876A0EE1B5D9F4",
    "build/cake_pb_wcnf_v3.exe": "19B0820803CBD6274B9A4712BA0D74AE35C6BCAF28AF0CAF12A226B5AE336953",
}
REQUIRED_DOCS = [
    "STAGEA_REPORT.md",
    "EXPERIMENT_CONTRACT.yaml",
    "COMMAND_LOG.md",
    "RESULTS.md",
    "USER_REVIEW_PACKET.md",
    "handoff.yaml",
    "SOURCE_MANIFEST.yaml",
    "ENVIRONMENT.md",
    "FAILURE_LOG.md",
    "CONTROL_MATRIX.md",
    "Q1_COMPARATOR_MATRIX.md",
    "REPRODUCIBILITY.md",
    "BUILD_PROVENANCE.md",
    "SOURCE_AUDIT.md",
    "LANE_STATUS.yaml",
]


def sha256(path: pathlib.Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest().upper()


def percentile(values: list[float], p: float) -> float:
    ordered = sorted(values)
    position = (len(ordered) - 1) * p
    lower = int(position)
    upper = min(lower + 1, len(ordered) - 1)
    fraction = position - lower
    return ordered[lower] * (1 - fraction) + ordered[upper] * fraction


def close(a: float, b: float) -> bool:
    return math.isclose(a, b, rel_tol=1e-12, abs_tol=0.5)


def validate() -> dict:
    checks = []

    def check(name: str, condition: bool, detail: str) -> None:
        checks.append({"name": name, "pass": bool(condition), "detail": detail})

    for name in REQUIRED_DOCS:
        check(f"required:{name}", (ROOT / name).is_file(), name)
    for name, expected in EXPECTED.items():
        actual = sha256(ROOT / name)
        check(f"sha256:{name}", actual == expected, f"actual={actual} expected={expected}")

    corpus = json.loads((ROOT / "CORPUS_MANIFEST.json").read_text(encoding="utf-8"))
    accepted = corpus["accepted"]
    check("corpus_count", len(accepted) == 30, f"count={len(accepted)}")
    check(
        "unique_trace_ids",
        len({item["trace_id"] for item in accepted}) == 30,
        "30 unique trace IDs",
    )
    input_hashes = [item["frozen_files"]["input_wcnf"]["sha256"] for item in accepted]
    check("unique_inputs", len(set(input_hashes)) == 30, f"unique={len(set(input_hashes))}")
    minimum = min(item["checked_deletions"] for item in accepted)
    check("minimum_checked_deletions", minimum >= 2 and minimum == 153, f"minimum={minimum}")
    trace_file_failures = []
    for trace in accepted:
        for role, item in trace["frozen_files"].items():
            path = ROOT / item["path"]
            if not path.is_file() or path.stat().st_size != item["bytes"] or sha256(path) != item["sha256"]:
                trace_file_failures.append(f"{trace['trace_id']}:{role}")
    check("trace_file_hashes", not trace_file_failures, f"failures={trace_file_failures}")

    choice = json.loads((ROOT / "LEGAL_CHOICE_RESULTS.json").read_text(encoding="utf-8"))
    check("choice_trace_count", choice["trace_count"] == 30, str(choice["trace_count"]))
    check("choice_count", choice["traces_with_legal_choice"] == 24, str(choice["traces_with_legal_choice"]))
    check("choice_rate", close(choice["legal_scheduling_choice_rate"], 0.8), str(choice["legal_scheduling_choice_rate"]))
    check("choice_killer_not_triggered", not choice["killer_triggered"], str(choice["killer_triggered"]))

    full = json.loads((ROOT / "FULL_COST_RESULTS.json").read_text(encoding="utf-8"))
    with (ROOT / "FULL_COST_MATRIX.csv").open("r", encoding="utf-8", newline="") as handle:
        rows = list(csv.DictReader(handle))
    check("full_rows", len(rows) == 240, f"rows={len(rows)}")
    groups: dict[tuple[str, str], list[dict]] = {}
    bad_contract = []
    for row in rows:
        groups.setdefault((row["trace_id"], row["variant"]), []).append(row)
        for field in (
            "output_hash_equal_to_frozen",
            "objective_equality",
            "veripb_forced_checked_accept",
            "cakepb_equioptimal_accept",
        ):
            if row[field] != "True":
                bad_contract.append((row["trace_id"], row["variant"], row["replay"], field))
    check("trace_method_pairs", len(groups) == 120 and all(len(group) == 2 for group in groups.values()), f"pairs={len(groups)}")
    check("fixed_contract_rows", not bad_contract, f"failures={bad_contract}")
    replay_mismatch = []
    for key, pair in groups.items():
        if len({row["proof_sha256"] for row in pair}) != 1 or len({row["kernel_sha256"] for row in pair}) != 1:
            replay_mismatch.append(key)
    check("dual_replay_hashes", not replay_mismatch, f"mismatches={replay_mismatch}")

    recomputed = {}
    for variant in ("original", "stable_legal", "greedy_earliest_ready", "candidate_frontier"):
        per_trace = []
        for trace_id in {row["trace_id"] for row in rows}:
            pair = groups[(trace_id, variant)]
            per_trace.append(
                {
                    "time": statistics.median(float(row["full_time_ns"]) for row in pair),
                    "bytes": statistics.median(float(row["certificate_bytes"]) for row in pair),
                }
            )
        recomputed[variant] = {
            "p50_full_time_ns": percentile([item["time"] for item in per_trace], 0.5),
            "p90_full_time_ns": percentile([item["time"] for item in per_trace], 0.9),
            "p50_certificate_bytes": percentile([item["bytes"] for item in per_trace], 0.5),
            "p90_certificate_bytes": percentile([item["bytes"] for item in per_trace], 0.9),
        }
    aggregate_mismatch = []
    for variant, metrics in recomputed.items():
        for metric, value in metrics.items():
            if not close(value, full["aggregates"][variant][metric]):
                aggregate_mismatch.append((variant, metric, value, full["aggregates"][variant][metric]))
    check("aggregate_recompute", not aggregate_mismatch, f"mismatches={aggregate_mismatch}")
    check(
        "scientific_stop",
        full["candidate_residual_at_p50_and_p90_against_every_baseline"] is False
        and recomputed["candidate_frontier"]["p50_full_time_ns"] > recomputed["original"]["p50_full_time_ns"]
        and recomputed["candidate_frontier"]["p90_full_time_ns"] > recomputed["original"]["p90_full_time_ns"],
        "candidate has no required residual and is slower than original at p50/p90",
    )

    handoff = (ROOT / "handoff.yaml").read_text(encoding="utf-8")
    check("handoff_no_pending", "PENDING_FINAL_MANIFEST" not in handoff, "no pending placeholders")
    check("stageb_false", "stageb_authorized: false" in handoff, "stageb_authorized=false")
    check("user_stageb_false", "pending_user_stageb_review: false" in handoff, "pending=false")
    check("approval_null", "stageb_user_approval_id: null" in handoff, "approval=null")
    check("lane_idle", "lane_status_after_handoff: IDLE_REUSABLE_AWAITING_MAINLINE" in handoff, "lane idle reusable")

    canonical_text = "\n".join(
        path.read_text(encoding="utf-8", errors="ignore")
        for path in ROOT.iterdir()
        if path.is_file() and path.suffix.lower() in {".md", ".yaml", ".json", ".csv"}
    )
    root_drive_letter = ROOT.drive[0]
    forbidden_prefix = chr(ord(root_drive_letter.upper()) + 1) + ":" + chr(92)
    check(
        "no_disallowed_drive_path",
        forbidden_prefix.lower() not in canonical_text.lower(),
        "canonical top-level delivery contains no disallowed drive path",
    )

    total_bytes = sum(path.stat().st_size for path in ROOT.rglob("*") if path.is_file())
    check("disk_ceiling", total_bytes <= DISK_CEILING, f"bytes={total_bytes} ceiling={DISK_CEILING}")
    passed = sum(item["pass"] for item in checks)
    return {
        "schema_version": "stagea-delivery-validation-v1",
        "passed": passed,
        "total": len(checks),
        "all_pass": passed == len(checks),
        "candidate_directory_bytes": total_bytes,
        "checks": checks,
    }


def verify_manifest() -> dict:
    path = ROOT / "HASH_MANIFEST.sha256"
    failures = []
    count = 0
    for raw in path.read_text(encoding="utf-8").splitlines():
        if not raw:
            continue
        digest, rel = raw.split("  ", 1)
        file = ROOT / pathlib.PurePosixPath(rel)
        count += 1
        if not file.is_file() or sha256(file) != digest:
            failures.append(rel)
    actual_files = {
        file.relative_to(ROOT).as_posix()
        for file in ROOT.rglob("*")
        if file.is_file() and file.name != "HASH_MANIFEST.sha256"
    }
    listed = {
        raw.split("  ", 1)[1]
        for raw in path.read_text(encoding="utf-8").splitlines()
        if raw
    }
    missing = sorted(actual_files - listed)
    extra = sorted(listed - actual_files)
    return {
        "manifest_sha256": sha256(path),
        "entries": count,
        "hash_failures": failures,
        "unlisted_files": missing,
        "missing_files": extra,
        "all_pass": not failures and not missing and not extra,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--manifest", action="store_true")
    args = parser.parse_args()
    if args.manifest:
        report = verify_manifest()
        print(json.dumps(report, sort_keys=True))
        raise SystemExit(0 if report["all_pass"] else 1)
    report = validate()
    out = ROOT / "VALIDATION_REPORT.json"
    out.write_text(json.dumps(report, indent=2) + "\n", encoding="utf-8")
    print(json.dumps({key: report[key] for key in ("passed", "total", "all_pass", "candidate_directory_bytes")}))
    raise SystemExit(0 if report["all_pass"] else 1)


if __name__ == "__main__":
    main()
