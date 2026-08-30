"""RVV r6a controller with explicit, non-retrying receipt semantics."""
from __future__ import annotations

import argparse
import hashlib
import json
import os
import re
import subprocess
import time
from pathlib import Path


ASSIGNMENT = Path("E:/project/writing/reserch/stages/stageA/LLVM-RVV-GROUP-MASK-SPILL-PARETODP/r6a-integrated-natural-packet-redesign-20260829")
PYTHON = Path("C:/Users/15383/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe")
LLC = Path("E:/project/writing/reserch/stages/stageA/LLVM-RVV-GROUP-MASK-SPILL-PARETODP/r5d-semantic-injection-20260828/resources/env/rvv-toolchain/bin/llc.exe")
SPLIT_KEYS = ("parent_child_transitive_provenance", "lmul_mask_interference", "physreg_spill_reload", "future_use_obligations", "quotient_successors", "backpointers", "shared_cost_tensor")
COST_UNITS = ("cpu_seconds", "wall_seconds", "peak_rss_bytes", "input_bytes", "output_bytes", "spill_reload_count", "quotient_state_count")


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def extract_function_document(source: Path, function: str, destination: Path) -> dict[str, object]:
    text = source.read_text(encoding="utf-8", errors="strict")
    matches = list(re.finditer(r"(?m)^name:\s+(.+?)\s*$", text))
    selected = [match for match in matches if match.group(1) == function]
    if len(selected) != 1:
        raise ValueError("function name must occur exactly once")
    marker = selected[0]
    start = text.rfind("---", 0, marker.start())
    end_match = re.search(r"(?m)^\.\.\.\s*$", text[marker.end():])
    if start < 0 or end_match is None:
        raise ValueError("MIR YAML document boundaries missing")
    end = marker.end() + end_match.end()
    document = text[start:end]
    if len(re.findall(r"(?m)^name:\s+", document)) != 1:
        raise ValueError("extracted document does not contain exactly one function")
    destination.parent.mkdir(parents=True, exist_ok=True)
    destination.write_text(text[:start] + document + text[end:], encoding="utf-8", newline="\n")
    return {"function": function, "source": str(source), "destination": str(destination), "document_sha256": sha256_bytes(document.encode("utf-8")), "preamble_preserved": True}


def peak_rss_bytes(process: subprocess.Popen[bytes]) -> int | None:
    if os.name != "nt" or not getattr(process, "_handle", None):
        return None
    try:
        import ctypes
        class Counters(ctypes.Structure):
            _fields_ = [("cb", ctypes.c_uint32), ("PageFaultCount", ctypes.c_uint32), ("PeakWorkingSetSize", ctypes.c_size_t), ("WorkingSetSize", ctypes.c_size_t), ("QuotaPeakPagedPoolUsage", ctypes.c_size_t), ("QuotaPagedPoolUsage", ctypes.c_size_t), ("QuotaPeakNonPagedPoolUsage", ctypes.c_size_t), ("QuotaNonPagedPoolUsage", ctypes.c_size_t), ("PagefileUsage", ctypes.c_size_t), ("PeakPagefileUsage", ctypes.c_size_t), ("PrivateUsage", ctypes.c_size_t)]
        counters = Counters()
        counters.cb = ctypes.sizeof(counters)
        ok = ctypes.windll.psapi.GetProcessMemoryInfo(int(process._handle), ctypes.byref(counters), counters.cb)
        return int(counters.PeakWorkingSetSize) if ok else None
    except Exception:
        return None


def run_subprocess(argv: list[str], cwd: Path, stdout_path: Path, stderr_path: Path, timeout_seconds: int) -> dict[str, object]:
    started = time.perf_counter()
    stdout_path.parent.mkdir(parents=True, exist_ok=True)
    stderr_path.parent.mkdir(parents=True, exist_ok=True)
    env = os.environ.copy()
    env.update({"TEMP": str(ASSIGNMENT / "resources" / "tmp"), "TMP": str(ASSIGNMENT / "resources" / "tmp"), "TMPDIR": str(ASSIGNMENT / "resources" / "tmp"), "PYTHONNOUSERSITE": "1"})
    process = subprocess.Popen(argv, cwd=str(cwd), env=env, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=False)
    timed_out = False
    try:
        out, err = process.communicate(timeout=timeout_seconds)
    except subprocess.TimeoutExpired as exc:
        timed_out = True
        process.kill()
        out, err = process.communicate()
        if exc.stdout:
            out = exc.stdout
        if exc.stderr:
            err = exc.stderr
    stdout_path.write_bytes(out)
    stderr_path.write_bytes(err)
    return {"argv": argv, "cwd": str(cwd), "shell": False, "exit_code": process.returncode, "timed_out": timed_out, "cpu_seconds": None, "wall_seconds": time.perf_counter() - started, "peak_rss_bytes": peak_rss_bytes(process), "stdout": str(stdout_path), "stderr": str(stderr_path), "stdout_sha256": sha256_bytes(out), "stderr_sha256": sha256_bytes(err)}


def row_receipt_specs(row: int, function: str, input_path: Path) -> list[dict[str, object]]:
    root = ASSIGNMENT / "resources"
    row_root = root / "build" / "rows" / f"selected-{row:02d}"
    logs = root / "logs" / "rows" / f"selected-{row:02d}"
    return [
        {"id": f"R{row:02d}_GREEDY_R1", "kind": "baseline_greedy", "function": function, "input": str(input_path), "output": str(row_root / "greedy-R1.mir"), "stdout": str(logs / "greedy-R1.stdout"), "stderr": str(logs / "greedy-R1.stderr"), "timeout_seconds": 1800},
        {"id": f"R{row:02d}_GREEDY_R2", "kind": "baseline_greedy", "function": function, "input": str(input_path), "output": str(row_root / "greedy-R2.mir"), "stdout": str(logs / "greedy-R2.stdout"), "stderr": str(logs / "greedy-R2.stderr"), "timeout_seconds": 1800},
        {"id": f"R{row:02d}_SPLIT_CLOSURE", "kind": "split_closure", "function": function, "input": str(input_path), "output": str(row_root / "split_closure.json"), "stdout": str(logs / "split_closure.stdout"), "stderr": str(logs / "split_closure.stderr"), "timeout_seconds": 600},
        {"id": f"R{row:02d}_F4", "kind": "f4_legality", "function": function, "input": str(input_path), "output": str(row_root / "f4.json"), "stdout": str(logs / "f4.stdout"), "stderr": str(logs / "f4.stderr"), "timeout_seconds": 600},
        {"id": f"R{row:02d}_F5", "kind": "f5_oracle", "function": function, "input": str(input_path), "output": str(row_root / "f5.json"), "stdout": str(logs / "f5.stdout"), "stderr": str(logs / "f5.stderr"), "timeout_seconds": 600},
        {"id": f"R{row:02d}_FULL_COST", "kind": "controller_full_cost", "function": function, "input": str(input_path), "output": str(row_root / "full_cost.json"), "stdout": str(logs / "full_cost.stdout"), "stderr": str(logs / "full_cost.stderr"), "timeout_seconds": 600},
    ]


def full_cost_receipt(metrics: list[dict[str, object]], bundles: list[dict[str, object]], legality: dict[str, object]) -> dict[str, object]:
    if len(metrics) != 6 or len(bundles) != 1:
        raise ValueError("one row requires six receipts and one bundle record")
    missing = sorted(set(COST_UNITS) - set(legality.get("units", [])))
    if missing:
        raise ValueError(f"missing cost units: {missing}")
    return {"schema": "rvv-r6a-full-cost-receipt-v1", "metrics": metrics, "bundle_records": bundles, "units": list(COST_UNITS), "status": "PASS", "scientific_inference": "NONE"}


def main() -> None:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--mode", choices=("candidate", "baseline_greedy", "baseline_current_support_probe", "baseline_default_support_probe", "baseline_pbqp_support_probe", "legality_checker", "full_cost_receipt"), required=True)
    parser.add_argument("--input", required=True)
    parser.add_argument("--function", required=True)
    args = parser.parse_args()
    raise SystemExit("controller modes are frozen for a separately authorized execution; no launch in this static assignment")


if __name__ == "__main__":
    main()
