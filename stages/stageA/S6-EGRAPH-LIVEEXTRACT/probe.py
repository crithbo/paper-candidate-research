from __future__ import annotations

import argparse
import ctypes
import hashlib
import json
import os
import time
from pathlib import Path

from liveextract import enumerate_extractions, exact_schedule, parse_instance, selected_map


def peak_rss_bytes() -> int | None:
    """Return Windows PeakWorkingSetSize without third-party dependencies."""
    if os.name != "nt":
        return None
    class Counters(ctypes.Structure):
        _fields_ = [
            ("cb", ctypes.c_ulong), ("PageFaultCount", ctypes.c_ulong),
            ("PeakWorkingSetSize", ctypes.c_size_t), ("WorkingSetSize", ctypes.c_size_t),
            ("QuotaPeakPagedPoolUsage", ctypes.c_size_t), ("QuotaPagedPoolUsage", ctypes.c_size_t),
            ("QuotaPeakNonPagedPoolUsage", ctypes.c_size_t), ("QuotaNonPagedPoolUsage", ctypes.c_size_t),
            ("PagefileUsage", ctypes.c_size_t), ("PeakPagefileUsage", ctypes.c_size_t),
        ]
    counters = Counters()
    counters.cb = ctypes.sizeof(counters)
    get_current_process = ctypes.windll.kernel32.GetCurrentProcess
    get_current_process.restype = ctypes.c_void_p
    get_process_memory_info = ctypes.windll.psapi.GetProcessMemoryInfo
    get_process_memory_info.argtypes = [ctypes.c_void_p, ctypes.POINTER(Counters), ctypes.c_ulong]
    get_process_memory_info.restype = ctypes.c_int
    handle = get_current_process()
    ok = get_process_memory_info(handle, ctypes.byref(counters), counters.cb)
    return int(counters.PeakWorkingSetSize) if ok else None


def solve_instance(raw: dict) -> dict:
    classes, roots = parse_instance(raw)
    extractions = enumerate_extractions(classes, roots)
    runtime_min = min(x.static_cost for x in extractions)
    runtime_first = [x for x in extractions if x.static_cost == runtime_min]
    min_peak = min(x.one_shot_peak for x in extractions)
    min_peak_cost = min(x.static_cost for x in extractions if x.one_shot_peak == min_peak)
    memory_first = [x for x in extractions if x.one_shot_peak == min_peak and x.static_cost == min_peak_cost]
    max_budget = sum(max(n.size for n in nodes) for nodes in classes.values())
    cache = {}

    def scheduled(extraction, budget):
        key = (extraction.signature, budget)
        if key not in cache:
            cache[key] = exact_schedule(selected_map(classes, extraction), roots, budget)
        return cache[key]

    def best_for(candidates, budget):
        feasible = []
        for x in candidates:
            result = scheduled(x, budget)
            if result is not None:
                feasible.append((result["total_execution_cost"], result["emitted_operation_count"], x.signature, x, result))
        if not feasible:
            return None
        _, _, _, x, result = min(feasible)
        return {"extraction": x.signature, **result}

    witnesses = []
    feasible_budgets = 0
    for budget in range(1, max_budget + 1):
        joint = best_for(extractions, budget)
        rt = best_for(runtime_first, budget)
        mem = best_for(memory_first, budget)
        if joint is not None:
            feasible_budgets += 1
        if joint and rt and mem and joint["total_execution_cost"] < rt["total_execution_cost"] and joint["total_execution_cost"] < mem["total_execution_cost"]:
            witnesses.append({"B": budget, "joint": joint, "runtime_first": rt, "memory_first": mem})
    return {
        "id": raw["id"],
        "source_kind": raw["source_kind"],
        "extraction_count": len(extractions),
        "runtime_first_extraction_count": len(runtime_first),
        "memory_first_extraction_count": len(memory_first),
        "budget_count": max_budget,
        "feasible_budget_count": feasible_budgets,
        "schedule_queries": len(cache),
        "witnesses": witnesses,
    }


def main() -> None:
    p = argparse.ArgumentParser()
    p.add_argument("--input", required=True)
    p.add_argument("--output", required=True)
    args = p.parse_args()
    source = Path(args.input)
    output = Path(args.output)
    suite = json.loads(source.read_text(encoding="utf-8"))
    started = time.perf_counter()
    summaries = []
    controlled_witnesses = 0
    public_seen = False
    for raw in suite["instances"]:
        summary = solve_instance(raw)
        summaries.append(summary)
        if raw["source_kind"] == "PUBLIC_ARTIFACT_PROJECTION":
            public_seen = True
        elif summary["witnesses"]:
            controlled_witnesses += 1
        if public_seen and controlled_witnesses >= 8:
            break
    elapsed_ms = round((time.perf_counter() - started) * 1000, 3)
    payload = {
        "schema_version": "stagea-liveextract-probe-v1",
        "input_sha256": hashlib.sha256(source.read_bytes()).hexdigest(),
        "processed_instances": len(summaries),
        "controlled_witness_instances": sum(s["source_kind"] == "CONTROLLED_GENERATOR" and bool(s["witnesses"]) for s in summaries),
        "public_witness_instances": sum(s["source_kind"] == "PUBLIC_ARTIFACT_PROJECTION" and bool(s["witnesses"]) for s in summaries),
        "summaries": summaries,
        "nondeterministic_full_cost": {"wall_time_ms": elapsed_ms, "peak_python_rss_bytes": peak_rss_bytes()},
    }
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({k: payload[k] for k in ("processed_instances", "controlled_witness_instances", "public_witness_instances")}, sort_keys=True))


if __name__ == "__main__":
    main()
