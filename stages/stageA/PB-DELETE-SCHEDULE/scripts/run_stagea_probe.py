#!/usr/bin/env python3
"""Run the frozen dependency-frontier checked-deletion scheduling probe."""

from __future__ import annotations

import csv
import json
import pathlib
import re
import statistics
import sys
import time


SCRIPT_DIR = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(SCRIPT_DIR))
import prepare_corpus as pc  # noqa: E402


ROOT = pc.ROOT
CORPUS = ROOT / "runs" / "corpus" / "CORPUS_MANIFEST.json"
PACKAGED_PREPROCESSING = (
    ROOT / "runs" / "preprocess_cost" / "PACKAGED_PREPROCESSING_COST.json"
)
OUT = ROOT / "runs" / "probe"
COMMAND_LOG = OUT / "PROBE_COMMANDS.jsonl"
CHOICE_RESULTS = OUT / "LEGAL_CHOICE_RESULTS.json"
FULL_RESULTS = OUT / "FULL_COST_RESULTS.json"
FULL_CSV = OUT / "FULL_COST_ROWS.csv"
SUMMARY = OUT / "PROBE_SUMMARY.json"
WITNESS_VAR_RE = re.compile(r"~?x[0-9]+")
VARIANTS = ("original", "stable_legal", "greedy_earliest_ready", "candidate_frontier")
REPLAYS = (1, 2)


def deletion_records(proof: pathlib.Path) -> tuple[list[str], list[dict], int]:
    started = time.perf_counter_ns()
    lines = proof.read_text(encoding="utf-8", errors="strict").splitlines(keepends=True)
    records = []
    prior_line = None
    block = -1
    for line_index, line in enumerate(lines):
        match = pc.CHECKED_RE.match(line.rstrip("\r\n"))
        if not match:
            continue
        if prior_line is None or line_index != prior_line + 1:
            block += 1
        target_match = pc.TARGET_RE.search(match.group(1))
        target_ids = (
            tuple(int(token) for token in target_match.group(1).split())
            if target_match
            else tuple()
        )
        witness = " ".join(match.group(2).split())
        records.append(
            {
                "ordinal": len(records),
                "line_index": line_index,
                "proof_line": line_index + 1,
                "block": block,
                "target_ids": target_ids,
                "witness": witness,
                "witness_vars": frozenset(WITNESS_VAR_RE.findall(witness)),
                "command_bytes": len(line.encode("utf-8")),
            }
        )
        prior_line = line_index
    return lines, records, time.perf_counter_ns() - started


def frontier_pairs(records: list[dict]) -> tuple[list[dict], int]:
    started = time.perf_counter_ns()
    pairs = []
    for left, right in zip(records, records[1:]):
        if left["block"] != right["block"]:
            continue
        if left["line_index"] + 1 != right["line_index"]:
            continue
        # Frozen dependency graph: preserve order when explicit witness support or
        # deleted IDs overlap.  Only graph-frontier pairs are offered to the legal
        # checker oracle; every emitted order remains sequential.
        witness_overlap = left["witness_vars"] & right["witness_vars"]
        target_overlap = set(left["target_ids"]) & set(right["target_ids"])
        if witness_overlap or target_overlap:
            continue
        left_key = left["target_ids"] or (2**63 - 1,)
        right_key = right["target_ids"] or (2**63 - 1,)
        pairs.append(
            {
                "left_ordinal": left["ordinal"],
                "right_ordinal": right["ordinal"],
                "left_line_index": left["line_index"],
                "right_line_index": right["line_index"],
                "left_target_key": left_key,
                "right_target_key": right_key,
                "left_bytes": left["command_bytes"],
                "right_bytes": right["command_bytes"],
            }
        )
    return pairs, time.perf_counter_ns() - started


def trial_candidates(pairs: list[dict]) -> list[dict]:
    candidates = []
    selectors = [
        ("fixed_trace_id", lambda p: True),
        ("stable_target_tie_break", lambda p: p["right_target_key"] < p["left_target_key"]),
        ("greedy_shorter_first", lambda p: p["right_bytes"] < p["left_bytes"]),
        ("candidate_longer_first", lambda p: p["right_bytes"] > p["left_bytes"]),
    ]
    seen = set()
    for reason, predicate in selectors:
        selected = next((pair for pair in pairs if predicate(pair)), None)
        if selected is None:
            continue
        key = (selected["left_line_index"], selected["right_line_index"])
        if key in seen:
            continue
        seen.add(key)
        candidates.append({**selected, "selection_reason": reason})
    return candidates


def swapped_proof(lines: list[str], pair: dict, path: pathlib.Path) -> None:
    out = list(lines)
    left, right = pair["left_line_index"], pair["right_line_index"]
    out[left], out[right] = out[right], out[left]
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text("".join(out), encoding="utf-8", newline="\n")


def verify_variant(
    trace_id: str,
    variant: str,
    replay: str,
    input_wcnf: pathlib.Path,
    proof: pathlib.Path,
    output_wcnf: pathlib.Path,
    run_dir: pathlib.Path,
) -> dict:
    run_dir.mkdir(parents=True, exist_ok=True)
    kernel = run_dir / "kernel.v3.pbp"
    veri_stdout = run_dir / "veripb.stdout.txt"
    veri_stderr = run_dir / "veripb.stderr.txt"
    veri = pc.run_process(
        f"{trace_id}:{variant}:{replay}:veripb",
        [
            str(pc.VERIPB),
            "--wcnf",
            "--force-checked-deletion",
            "--stats",
            "--elaborate",
            str(kernel),
            str(input_wcnf),
            str(proof),
            str(output_wcnf),
        ],
        veri_stdout,
        veri_stderr,
        180,
    )
    veri_text = veri_stdout.read_text(encoding="utf-8", errors="replace")
    veri_ok = (
        veri["returncode"] == 0
        and not veri["timed_out"]
        and "s VERIFIED OUTPUT EQUIOPTIMAL" in veri_text
        and kernel.is_file()
    )
    cake = None
    cake_ok = False
    if veri_ok:
        cake_stdout = run_dir / "cakepb.stdout.txt"
        cake_stderr = run_dir / "cakepb.stderr.txt"
        cake = pc.run_process(
            f"{trace_id}:{variant}:{replay}:cakepb",
            [str(pc.CAKEPB), str(input_wcnf), str(kernel), str(output_wcnf)],
            cake_stdout,
            cake_stderr,
            180,
            {"CML_HEAP_SIZE": "512", "CML_STACK_SIZE": "128"},
        )
        cake_text = cake_stdout.read_text(encoding="utf-8", errors="replace")
        cake_ok = (
            cake["returncode"] == 0
            and not cake["timed_out"]
            and "s VERIFIED OUTPUT EQUIOPTIMAL" in cake_text
        )
    return {
        "verified": veri_ok and cake_ok,
        "veripb": veri,
        "cakepb": cake,
        "kernel_path": kernel.relative_to(ROOT).as_posix() if kernel.exists() else None,
        "kernel_bytes": kernel.stat().st_size if kernel.exists() else None,
        "kernel_sha256": pc.file_sha256(kernel) if kernel.exists() else None,
    }


def percentile(values: list[float], p: float) -> float:
    ordered = sorted(values)
    if len(ordered) == 1:
        return ordered[0]
    position = (len(ordered) - 1) * p
    lower = int(position)
    upper = min(lower + 1, len(ordered) - 1)
    fraction = position - lower
    return ordered[lower] * (1 - fraction) + ordered[upper] * fraction


def main() -> None:
    OUT.mkdir(parents=True, exist_ok=True)
    if COMMAND_LOG.exists():
        COMMAND_LOG.unlink()
    pc.COMMANDS = COMMAND_LOG
    corpus = json.loads(CORPUS.read_text(encoding="utf-8"))
    packaged_cost_payload = json.loads(PACKAGED_PREPROCESSING.read_text(encoding="utf-8"))
    packaged_cost = {
        record["trace_id"]: record for record in packaged_cost_payload["records"]
    }
    choice_records = []
    trace_context = {}

    # Phase 1: deterministic dependency extraction, then exact checker-oracle
    # validation of at most four distinct adjacent frontier choices per trace.
    for trace in corpus["accepted"]:
        trace_id = trace["trace_id"]
        input_wcnf = ROOT / trace["frozen_files"]["input_wcnf"]["path"]
        output_wcnf = ROOT / trace["frozen_files"]["output_wcnf"]["path"]
        proof = ROOT / trace["frozen_files"]["augmented_proof"]["path"]
        lines, records, extraction_ns = deletion_records(proof)
        pairs, graph_ns = frontier_pairs(records)
        candidates = trial_candidates(pairs)
        legal = []
        trials = []
        for trial_index, pair in enumerate(candidates):
            trial_dir = OUT / "choice" / trace_id / f"trial-{trial_index:02d}"
            trial_proof = trial_dir / "swapped.augmented.pbp"
            order_started = time.perf_counter_ns()
            swapped_proof(lines, pair, trial_proof)
            proof_hash = pc.file_sha256(trial_proof)
            order_ns = time.perf_counter_ns() - order_started
            result = verify_variant(
                trace_id,
                "legal_choice",
                f"trial-{trial_index:02d}",
                input_wcnf,
                trial_proof,
                output_wcnf,
                trial_dir,
            )
            trial = {
                **pair,
                "proof_path": trial_proof.relative_to(ROOT).as_posix(),
                "proof_sha256": proof_hash,
                "order_construction_ns": order_ns,
                "verification": result,
            }
            trials.append(trial)
            if result["verified"]:
                legal.append(trial)
        record = {
            "trace_id": trace_id,
            "checked_deletions": len(records),
            "dependency_extraction_ns": extraction_ns,
            "dependency_graph_ns": graph_ns,
            "frontier_pair_count": len(pairs),
            "trial_count": len(trials),
            "legal_alternate_count": len(legal),
            "has_legal_alternate": bool(legal),
            "trials": trials,
        }
        choice_records.append(record)
        trace_context[trace_id] = {
            "trace": trace,
            "lines": lines,
            "records": records,
            "pairs": pairs,
            "choice": record,
        }

    choice_rate = sum(r["has_legal_alternate"] for r in choice_records) / len(choice_records)
    choice_payload = {
        "schema_version": "pb-delete-choice-v1",
        "metric": "fraction of 30 complete natural traces with at least one dependency-frontier alternate order accepted by forced-checked VeriPB and CakePB",
        "trace_count": len(choice_records),
        "traces_with_legal_choice": sum(r["has_legal_alternate"] for r in choice_records),
        "legal_scheduling_choice_rate": choice_rate,
        "killer_threshold": 0.20,
        "killer_triggered": choice_rate < 0.20,
        "records": choice_records,
    }
    CHOICE_RESULTS.write_text(json.dumps(choice_payload, indent=2) + "\n", encoding="utf-8")
    if choice_rate < 0.20:
        summary = {
            "decision": "SCIENTIFIC_KILLER_LEGAL_CHOICE_RATE",
            "choice_rate": choice_rate,
            "full_cost_executed": False,
        }
        SUMMARY.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
        print(json.dumps(summary))
        return

    # Freeze one legal schedule for each fair method.  Each method may fall back
    # to original, and fallback discovery/checking cost remains charged.
    final_proofs: dict[tuple[str, str], pathlib.Path] = {}
    selection_records = []
    for trace_id, context in trace_context.items():
        trace = context["trace"]
        original = ROOT / trace["frozen_files"]["augmented_proof"]["path"]
        legal = [trial for trial in context["choice"]["trials"] if trial["verification"]["verified"]]

        def choose(predicate, score=None):
            matches = [trial for trial in legal if predicate(trial)]
            if not matches:
                return None
            return max(matches, key=score) if score else matches[0]

        selected = {
            "original": None,
            "stable_legal": choose(
                lambda t: tuple(t["right_target_key"]) < tuple(t["left_target_key"])
            ),
            "greedy_earliest_ready": choose(lambda t: t["right_bytes"] < t["left_bytes"]),
            "candidate_frontier": choose(
                lambda t: True,
                score=lambda t: (t["right_bytes"] - t["left_bytes"], -t["left_ordinal"]),
            ),
        }
        for variant, trial in selected.items():
            final_dir = OUT / "final_proofs" / trace_id
            final_dir.mkdir(parents=True, exist_ok=True)
            final = final_dir / f"{variant}.augmented.pbp"
            if trial is None:
                final.write_bytes(original.read_bytes())
                fallback = variant != "original"
                pair = None
            else:
                final.write_bytes((ROOT / trial["proof_path"]).read_bytes())
                fallback = False
                pair = [trial["left_ordinal"], trial["right_ordinal"]]
            if variant == "original":
                charged_trial = None
            elif trial is not None:
                charged_trial = trial
            else:
                reason_by_variant = {
                    "stable_legal": "stable_target_tie_break",
                    "greedy_earliest_ready": "greedy_shorter_first",
                    "candidate_frontier": "candidate_longer_first",
                }
                charged_trial = next(
                    (
                        item
                        for item in context["choice"]["trials"]
                        if item["selection_reason"] == reason_by_variant[variant]
                    ),
                    None,
                )
            legality_ns = 0
            legality_peak = 0
            order_ns = 0
            if charged_trial is not None:
                verification = charged_trial["verification"]
                legality_ns = verification["veripb"]["duration_ns"] + (
                    verification["cakepb"] or {"duration_ns": 0}
                )["duration_ns"]
                legality_peak = max(
                    verification["veripb"]["peak_rss_bytes"],
                    (verification["cakepb"] or {"peak_rss_bytes": 0})["peak_rss_bytes"],
                )
                order_ns = charged_trial["order_construction_ns"]
            final_proofs[(trace_id, variant)] = final
            selection_records.append(
                {
                    "trace_id": trace_id,
                    "variant": variant,
                    "fallback_to_original": fallback,
                    "selected_pair_ordinals": pair,
                    "proof_path": final.relative_to(ROOT).as_posix(),
                    "proof_bytes": final.stat().st_size,
                    "proof_sha256": pc.file_sha256(final),
                    "charged_legality_trial_reason": (
                        charged_trial["selection_reason"] if charged_trial else None
                    ),
                    "order_and_batch_construction_time_ns": order_ns,
                    "legality_oracle_and_fallback_time_ns": legality_ns,
                    "legality_oracle_peak_rss_bytes": legality_peak,
                }
            )

    # Phase 2: two clean checker replays for every frozen trace/method pair.
    rows = []
    replay_records = []
    for trace_id, context in trace_context.items():
        trace = context["trace"]
        input_wcnf = ROOT / trace["frozen_files"]["input_wcnf"]["path"]
        output_wcnf = ROOT / trace["frozen_files"]["output_wcnf"]["path"]
        if trace["preprocessing"]:
            preprocess_ns = trace["preprocessing"]["duration_ns"]
            preprocess_peak = trace["preprocessing"]["peak_rss_bytes"]
            preprocess_cost_source = "LOCAL_FROZEN_MAXPRE_RUN"
        else:
            official_cost = packaged_cost[trace_id]
            preprocess_ns = round(official_cost["official_artifact_solving_time_s"] * 1e9)
            preprocess_peak = official_cost["peak_rss_bytes"]
            preprocess_cost_source = "OFFICIAL_ARTIFACT_DATA_MAXPRE_DEFAULT_CHECKED_SOLVING_TIME"
        extraction_graph_ns = (
            context["choice"]["dependency_extraction_ns"]
            + context["choice"]["dependency_graph_ns"]
        )
        output_hash = pc.file_sha256(output_wcnf)
        for variant in VARIANTS:
            proof = final_proofs[(trace_id, variant)]
            selected = next(
                r
                for r in selection_records
                if r["trace_id"] == trace_id and r["variant"] == variant
            )
            for replay in REPLAYS:
                run_dir = OUT / "replays" / trace_id / variant / f"replay-{replay}"
                result = verify_variant(
                    trace_id,
                    variant,
                    f"replay-{replay}",
                    input_wcnf,
                    proof,
                    output_wcnf,
                    run_dir,
                )
                if not result["verified"]:
                    raise RuntimeError(f"final contract failure: {trace_id} {variant} replay {replay}")
                verifier_ns = result["veripb"]["duration_ns"]
                cake_ns = result["cakepb"]["duration_ns"]
                if variant == "original":
                    dependency_cost_ns = 0
                    order_cost_ns = 0
                    legality_cost_ns = 0
                else:
                    dependency_cost_ns = extraction_graph_ns
                    order_cost_ns = selected["order_and_batch_construction_time_ns"]
                    legality_cost_ns = selected["legality_oracle_and_fallback_time_ns"]
                construction_ns = dependency_cost_ns + order_cost_ns + legality_cost_ns
                full_time_ns = preprocess_ns + construction_ns + verifier_ns + cake_ns
                disk_io_bytes = (
                    input_wcnf.stat().st_size
                    + output_wcnf.stat().st_size
                    + proof.stat().st_size
                    + result["kernel_bytes"]
                )
                row = {
                    "trace_id": trace_id,
                    "variant": variant,
                    "replay": replay,
                    "preprocessing_time_ns": preprocess_ns,
                    "preprocessing_cost_source": preprocess_cost_source,
                    "dependency_graph_and_extraction_time_ns": dependency_cost_ns,
                    "order_and_batch_construction_time_ns": order_cost_ns,
                    "fallback_and_legality_oracle_time_ns": legality_cost_ns,
                    "scheduling_total_time_ns": construction_ns,
                    "veripb_checker_time_ns": verifier_ns,
                    "cakepb_checker_time_ns": cake_ns,
                    "full_time_ns": full_time_ns,
                    "proof_bytes": proof.stat().st_size,
                    "kernel_bytes": result["kernel_bytes"],
                    "certificate_bytes": proof.stat().st_size + result["kernel_bytes"],
                    "disk_io_bytes": disk_io_bytes,
                    "peak_rss_bytes": max(
                        preprocess_peak,
                        selected["legality_oracle_peak_rss_bytes"],
                        result["veripb"]["peak_rss_bytes"],
                        result["cakepb"]["peak_rss_bytes"],
                    ),
                    "fallback_to_original": selected["fallback_to_original"],
                    "output_wcnf_sha256": output_hash,
                    "output_hash_equal_to_frozen": output_hash
                    == trace["frozen_files"]["output_wcnf"]["sha256"],
                    "objective_equality": True,
                    "veripb_forced_checked_accept": True,
                    "cakepb_equioptimal_accept": True,
                    "proof_sha256": pc.file_sha256(proof),
                    "kernel_sha256": result["kernel_sha256"],
                }
                rows.append(row)
                replay_records.append({"row": row, "verification": result})

    # Exact replay check: proof and elaborated kernel hashes must match across both runs.
    nondeterministic = []
    for trace_id in trace_context:
        for variant in VARIANTS:
            pair = [
                row
                for row in rows
                if row["trace_id"] == trace_id and row["variant"] == variant
            ]
            if len(pair) != 2 or pair[0]["proof_sha256"] != pair[1]["proof_sha256"] or pair[0]["kernel_sha256"] != pair[1]["kernel_sha256"]:
                nondeterministic.append({"trace_id": trace_id, "variant": variant})
    if nondeterministic:
        raise RuntimeError(f"dual replay hash mismatch: {nondeterministic}")

    with FULL_CSV.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=list(rows[0].keys()))
        writer.writeheader()
        writer.writerows(rows)

    aggregates = {}
    for variant in VARIANTS:
        # Per-trace replay medians prevent double-weighting a trace.
        trace_metrics = []
        for trace_id in trace_context:
            pair = [
                row for row in rows if row["trace_id"] == trace_id and row["variant"] == variant
            ]
            trace_metrics.append(
                {
                    "full_time_ns": statistics.median(r["full_time_ns"] for r in pair),
                    "certificate_bytes": statistics.median(r["certificate_bytes"] for r in pair),
                }
            )
        aggregates[variant] = {
            "p50_full_time_ns": percentile([m["full_time_ns"] for m in trace_metrics], 0.50),
            "p90_full_time_ns": percentile([m["full_time_ns"] for m in trace_metrics], 0.90),
            "p50_certificate_bytes": percentile([m["certificate_bytes"] for m in trace_metrics], 0.50),
            "p90_certificate_bytes": percentile([m["certificate_bytes"] for m in trace_metrics], 0.90),
            "fallback_trace_count": sum(
                1
                for r in selection_records
                if r["variant"] == variant and r["fallback_to_original"]
            ),
        }

    candidate = aggregates["candidate_frontier"]
    pareto = {}
    residual_both = True
    for baseline in ("original", "stable_legal", "greedy_earliest_ready"):
        base = aggregates[baseline]
        per_percentile = {}
        for pct in ("p50", "p90"):
            time_key = f"{pct}_full_time_ns"
            bytes_key = f"{pct}_certificate_bytes"
            no_worse = candidate[time_key] <= base[time_key] and candidate[bytes_key] <= base[bytes_key]
            strictly_better = candidate[time_key] < base[time_key] or candidate[bytes_key] < base[bytes_key]
            residual = no_worse and strictly_better
            per_percentile[pct] = {
                "candidate_no_worse_both_dimensions": no_worse,
                "candidate_strictly_better_at_least_one": strictly_better,
                "pareto_residual": residual,
            }
            residual_both = residual_both and residual
        pareto[baseline] = per_percentile

    payload = {
        "schema_version": "pb-delete-full-cost-v1",
        "choice_rate": choice_rate,
        "selection_records": selection_records,
        "aggregates": aggregates,
        "pareto_against_each_baseline": pareto,
        "candidate_residual_at_p50_and_p90_against_every_baseline": residual_both,
        "dual_replay_hash_mismatch_count": len(nondeterministic),
        "rows": rows,
    }
    FULL_RESULTS.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    decision = "PASS_RECOMMENDED" if residual_both else "STOP_RECOMMENDED"
    summary = {
        "decision": decision,
        "evidence_ceiling": (
            "PRELIMINARY_SUPPORT_NOT_FALSIFIED" if residual_both else "SCIENTIFIC_NEGATIVE_STAGEA"
        ),
        "trace_count": len(trace_context),
        "legal_scheduling_choice_rate": choice_rate,
        "full_cost_pareto_residual": residual_both,
        "dual_replay_hash_closed": not nondeterministic,
        "choice_results_sha256": pc.file_sha256(CHOICE_RESULTS),
        "full_cost_results_sha256": pc.file_sha256(FULL_RESULTS),
        "full_cost_csv_sha256": pc.file_sha256(FULL_CSV),
    }
    SUMMARY.write_text(json.dumps(summary, indent=2) + "\n", encoding="utf-8")
    print(json.dumps(summary))


if __name__ == "__main__":
    main()
