from __future__ import annotations

import argparse
import ctypes
import hashlib
import json
import os
import time
from pathlib import Path

from oracle_revision import enumerate_extractions, exact_schedule, parse_projection, selected_map


def peak_rss_bytes() -> int | None:
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
    handle_fn = ctypes.windll.kernel32.GetCurrentProcess
    handle_fn.restype = ctypes.c_void_p
    info_fn = ctypes.windll.psapi.GetProcessMemoryInfo
    info_fn.argtypes = [ctypes.c_void_p, ctypes.POINTER(Counters), ctypes.c_ulong]
    return int(counters.PeakWorkingSetSize) if info_fn(handle_fn(), ctypes.byref(counters), counters.cb) else None


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    input_path, output_path = Path(args.input), Path(args.output)
    raw = json.loads(input_path.read_text(encoding="utf-8"))
    classes, roots = parse_projection(raw)
    started = time.perf_counter()
    enum_started = time.perf_counter()
    extractions = enumerate_extractions(classes, roots)
    enumeration_ms = round((time.perf_counter() - enum_started) * 1000, 3)
    if len(extractions) < 2:
        raise ValueError("natural projection does not contain multiple extractions")
    runtime_cost = min(x.static_cost for x in extractions)
    runtime_first = [x for x in extractions if x.static_cost == runtime_cost]
    memory_peak = min(x.one_shot_peak for x in extractions)
    memory_cost = min(x.static_cost for x in extractions if x.one_shot_peak == memory_peak)
    memory_first = [x for x in extractions if x.one_shot_peak == memory_peak and x.static_cost == memory_cost]
    max_budget = sum(max(n.size for n in nodes) for nodes in classes.values())
    cache = {}

    def scheduled(extraction, budget):
        key = (extraction.signature, budget)
        if key not in cache:
            cache[key] = exact_schedule(selected_map(classes, extraction), roots, budget)
        return cache[key]

    def best(candidates, budget):
        feasible = []
        for extraction in candidates:
            result = scheduled(extraction, budget)
            if result is not None:
                feasible.append((result["total_target_operation_millicost"], result["emitted_operations"], extraction.signature, result))
        if not feasible:
            return None
        _, _, signature, result = min(feasible)
        return {"extraction": signature, **result}

    schedule_started = time.perf_counter()
    budgets = []
    for budget in range(4, max_budget + 1, 4):
        joint = best(extractions, budget)
        runtime = best(runtime_first, budget)
        memory = best(memory_first, budget)
        strict = bool(joint and runtime and memory and
                      joint["total_target_operation_millicost"] < runtime["total_target_operation_millicost"] and
                      joint["total_target_operation_millicost"] < memory["total_target_operation_millicost"])
        absorbed_by = []
        if joint and runtime and joint["total_target_operation_millicost"] == runtime["total_target_operation_millicost"]:
            absorbed_by.append("RUNTIME_FIRST_THEN_EXACT_SCHEDULE")
        if joint and memory and joint["total_target_operation_millicost"] == memory["total_target_operation_millicost"]:
            absorbed_by.append("MEMORY_FIRST_THEN_EXACT_SCHEDULE")
        budgets.append({"B": budget, "joint": joint, "runtime_first": runtime, "memory_first": memory,
                        "strict_witness": strict, "absorbed_by": absorbed_by})
    schedule_ms = round((time.perf_counter() - schedule_started) * 1000, 3)
    semantic = {
        "schema_version": "stagea-natural-liveextract-revision-run-v1",
        "input_sha256": hashlib.sha256(input_path.read_bytes()).hexdigest(),
        "structure": {
            "retained_eclasses": len(classes),
            "retained_enodes": sum(len(v) for v in classes.values()),
            "exact_extractions": len(extractions),
            "runtime_first_ties": len(runtime_first),
            "memory_first_ties": len(memory_first),
            "maximum_budget_bytes": max_budget,
        },
        "extractions": [
            {"signature": x.signature, "static_cost_milli": x.static_cost,
             "one_shot_peak_bytes": x.one_shot_peak, "reachable_eclasses": list(x.reachable)}
            for x in extractions
        ],
        "budgets": budgets,
        "strict_witness_count": sum(x["strict_witness"] for x in budgets),
        "feasible_joint_budget_count": sum(x["joint"] is not None for x in budgets),
        "absorbed_joint_budget_count": sum(x["joint"] is not None and bool(x["absorbed_by"]) for x in budgets),
        "schedule_queries": len(cache),
    }
    payload = {**semantic, "nondeterministic_full_cost": {
        "extraction_enumeration_time_ms": enumeration_ms,
        "schedule_search_time_ms": schedule_ms,
        "wall_time_ms": round((time.perf_counter() - started) * 1000, 3),
        "peak_python_rss_bytes": peak_rss_bytes(),
    }}
    output_path.parent.mkdir(parents=True, exist_ok=True)
    output_path.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({k: semantic[k] for k in ("structure", "strict_witness_count", "absorbed_joint_budget_count")}, sort_keys=True))


if __name__ == "__main__":
    main()
