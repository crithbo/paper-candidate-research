"""APX r9 static controller with serial, first-failure receipt semantics.

This file is deliberately an execution controller only.  It obtains measured
costs from the child process and filesystem receipts; values printed by the
future row driver are never used as measurements.
"""
from __future__ import annotations

import argparse
import ctypes
import hashlib
import json
import os
import subprocess
import time
from pathlib import Path, PureWindowsPath
from typing import Any


COMMAND_ORDER = (
    "prepare_same_object_trace",
    "llvm_current_complete",
    "llvm_finite_tuning_grid",
    "orbit_candidate",
    "labeled_pareto_dp",
    "generic_exact_subtractor",
    "independent_micro_oracle",
    "checker",
    "full_cost",
)
PATH_FLAGS = {
    "--input",
    "--output-root",
    "--llc",
    "--trace",
    "--out",
    "--candidate",
    "--labeled",
    "--generic",
    "--oracle",
    "--llvm-current",
    "--llvm-tuning",
    "--checked",
}
INPUT_FLAGS = {
    "--input",
    "--trace",
    "--candidate",
    "--labeled",
    "--generic",
    "--oracle",
    "--llvm-current",
    "--llvm-tuning",
    "--checked",
}
COST_FIELDS = (
    "cpu_seconds",
    "wall_seconds",
    "peak_rss_bytes",
    "input_bytes",
    "output_bytes",
    "exit_code",
    "persisted_bytes",
    "timeout",
    "version_or_hash_drift",
)
ASSIGNMENT = Path(__file__).resolve().parent
RESOURCE_ROOT = ASSIGNMENT / "resources"


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest().upper()


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")


def is_absolute_literal(value: str) -> bool:
    return Path(value).is_absolute() or PureWindowsPath(value).is_absolute()


def has_placeholder(value: str) -> bool:
    upper = value.upper()
    return any(marker in value for marker in ("<", ">", "${", "$(", "...")) or any(
        marker in upper for marker in ("PLACEHOLDER", "TODO", "TBD", "SYMBOLIC")
    )


def under_resource_root(path: Path) -> bool:
    try:
        path.resolve(strict=False).relative_to(RESOURCE_ROOT.resolve(strict=False))
        return True
    except ValueError:
        return False


def validate_dag(dag: dict[str, Any]) -> None:
    rows = dag.get("rows")
    if not isinstance(rows, list) or len(rows) != 8:
        raise ValueError("DAG must contain exactly eight rows")
    if dag.get("row_count") != 8 or dag.get("commands_per_row") != 9 or dag.get("command_count") != 72:
        raise ValueError("DAG count fields are not 8/9/72")
    if dag.get("claim_ready") is not False or dag.get("execution_performed") is not False:
        raise ValueError("DAG execution or claim state is not frozen")
    seen_rows: set[str] = set()
    for row in rows:
        row_id = row.get("row_id")
        if not isinstance(row_id, str) or row_id in seen_rows:
            raise ValueError("row ids must be unique strings")
        seen_rows.add(row_id)
        commands = row.get("commands")
        if not isinstance(commands, list) or len(commands) != len(COMMAND_ORDER):
            raise ValueError(f"{row_id}: command order is not frozen")
        command_ids = [item.get("command_id") for item in commands if isinstance(item, dict)]
        if command_ids != list(COMMAND_ORDER):
            raise ValueError(f"{row_id}: command order is not frozen")
        for command_id, command in zip(COMMAND_ORDER, commands):
            argv = command.get("argv")
            if not isinstance(argv, list) or not argv or not all(isinstance(token, str) for token in argv):
                raise ValueError(f"{row_id}/{command_id}: literal argv missing")
            if not is_absolute_literal(argv[0]) or any(has_placeholder(token) for token in argv):
                raise ValueError(f"{row_id}/{command_id}: executable or placeholder invalid")
            for index, token in enumerate(argv[:-1]):
                if token in PATH_FLAGS and not is_absolute_literal(argv[index + 1]):
                    raise ValueError(f"{row_id}/{command_id}: {token} is not absolute")
            cwd = Path(command.get("cwd", ""))
            if not is_absolute_literal(str(cwd)) or not under_resource_root(cwd):
                raise ValueError(f"{row_id}/{command_id}: cwd is outside assignment resources")
            outputs = command.get("output_paths")
            if not isinstance(outputs, list) or not outputs:
                raise ValueError(f"{row_id}/{command_id}: output paths missing")
            for output in outputs:
                if not isinstance(output, str) or not is_absolute_literal(output) or has_placeholder(output):
                    raise ValueError(f"{row_id}/{command_id}: output path is not literal")
                if not under_resource_root(Path(output)):
                    raise ValueError(f"{row_id}/{command_id}: output path escapes resources")
            for stream_key in ("stdout", "stderr"):
                stream_path = command.get(stream_key)
                if not isinstance(stream_path, str) or not is_absolute_literal(stream_path) or not under_resource_root(Path(stream_path)):
                    raise ValueError(f"{row_id}/{command_id}: {stream_key} path invalid")


def windows_process_cpu_seconds(process: subprocess.Popen[bytes]) -> float | None:
    if os.name != "nt" or not getattr(process, "_handle", None):
        return None
    try:
        class FileTime(ctypes.Structure):
            _fields_ = [("low", ctypes.c_uint32), ("high", ctypes.c_uint32)]

        creation = FileTime()
        exit_time = FileTime()
        kernel = FileTime()
        user = FileTime()
        ok = ctypes.windll.kernel32.GetProcessTimes(
            ctypes.c_void_p(int(process._handle)),
            ctypes.byref(creation),
            ctypes.byref(exit_time),
            ctypes.byref(kernel),
            ctypes.byref(user),
        )
        if not ok:
            return None
        kernel_ticks = (int(kernel.high) << 32) | int(kernel.low)
        user_ticks = (int(user.high) << 32) | int(user.low)
        return (kernel_ticks + user_ticks) / 10_000_000.0
    except Exception:
        return None


def windows_peak_rss_bytes(process: subprocess.Popen[bytes]) -> int | None:
    if os.name != "nt" or not getattr(process, "_handle", None):
        return None
    try:
        class Counters(ctypes.Structure):
            _fields_ = [
                ("cb", ctypes.c_uint32),
                ("PageFaultCount", ctypes.c_uint32),
                ("PeakWorkingSetSize", ctypes.c_size_t),
                ("WorkingSetSize", ctypes.c_size_t),
                ("QuotaPeakPagedPoolUsage", ctypes.c_size_t),
                ("QuotaPagedPoolUsage", ctypes.c_size_t),
                ("QuotaPeakNonPagedPoolUsage", ctypes.c_size_t),
                ("QuotaNonPagedPoolUsage", ctypes.c_size_t),
                ("PagefileUsage", ctypes.c_size_t),
                ("PeakPagefileUsage", ctypes.c_size_t),
                ("PrivateUsage", ctypes.c_size_t),
            ]

        counters = Counters()
        counters.cb = ctypes.sizeof(counters)
        ok = ctypes.windll.psapi.GetProcessMemoryInfo(
            ctypes.c_void_p(int(process._handle)), ctypes.byref(counters), counters.cb
        )
        return int(counters.PeakWorkingSetSize) if ok else None
    except Exception:
        return None


def declared_input_bytes(argv: list[str]) -> tuple[int, list[dict[str, Any]]]:
    records: list[dict[str, Any]] = []
    candidates: list[str] = []
    if len(argv) > 2 and argv[2].lower().endswith((".py", ".pyw")):
        candidates.append(argv[2])
    for index, token in enumerate(argv[:-1]):
        if token in INPUT_FLAGS:
            candidates.append(argv[index + 1])
    total = 0
    for raw in dict.fromkeys(candidates):
        path = Path(raw)
        size = path.stat().st_size if path.is_file() else 0
        total += size
        records.append({"path": raw, "bytes": size, "present": path.is_file()})
    return total, records


def artifact_receipts(output_paths: list[str]) -> tuple[list[dict[str, Any]], str | None]:
    receipts: list[dict[str, Any]] = []
    error: str | None = None
    for raw in output_paths:
        path = Path(raw)
        record: dict[str, Any] = {"path": raw, "present": path.is_file()}
        if not path.is_file():
            record.update({"bytes": 0, "sha256": None, "schema_valid": False, "schema_error": "missing"})
            error = error or f"missing output: {raw}"
        else:
            data = path.read_bytes()
            record.update({"bytes": len(data), "sha256": sha256_bytes(data)})
            if path.suffix.lower() == ".json":
                try:
                    parsed = json.loads(data.decode("utf-8"))
                    if not isinstance(parsed, dict):
                        raise ValueError("JSON root must be an object")
                    schema_value = parsed.get("schema") or parsed.get("schema_version")
                    if not isinstance(schema_value, str) or not schema_value:
                        raise ValueError("JSON schema field is missing")
                    record.update({"schema_valid": True, "schema": schema_value})
                except Exception as exc:
                    record.update({"schema_valid": False, "schema_error": str(exc)})
                    error = error or f"invalid JSON output: {raw}"
            else:
                record.update({"schema_valid": True, "schema": "opaque-file"})
        receipts.append(record)
    return receipts, error


def run_command(row: dict[str, Any], command_id: str, command: dict[str, Any]) -> dict[str, Any]:
    argv = list(command["argv"])
    cwd = Path(command["cwd"])
    stdout_path = Path(command["stdout"])
    stderr_path = Path(command["stderr"])
    timeout_seconds = int(command["timeout_seconds"])
    input_bytes, input_receipts = declared_input_bytes(argv)
    stdout_path.parent.mkdir(parents=True, exist_ok=True)
    stderr_path.parent.mkdir(parents=True, exist_ok=True)
    cwd.mkdir(parents=True, exist_ok=True)
    started = time.perf_counter()
    timed_out = False
    launch_error: str | None = None
    out = b""
    err = b""
    exit_code: int | None = None
    process: subprocess.Popen[bytes] | None = None
    environment = os.environ.copy()
    environment.update({str(key): str(value) for key, value in command.get("env", {}).items()})
    try:
        process = subprocess.Popen(
            argv,
            cwd=str(cwd),
            env=environment,
            stdin=subprocess.DEVNULL,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            shell=False,
        )
        try:
            out, err = process.communicate(timeout=timeout_seconds)
        except subprocess.TimeoutExpired:
            timed_out = True
            process.kill()
            out, err = process.communicate()
        exit_code = process.returncode
    except OSError as exc:
        launch_error = str(exc)
    stdout_path.write_bytes(out)
    stderr_path.write_bytes(err)
    output_receipts, artifact_error = artifact_receipts(list(command["output_paths"]))
    output_bytes = sum(int(item.get("bytes", 0)) for item in output_receipts)
    wall_seconds = time.perf_counter() - started
    receipt: dict[str, Any] = {
        "schema": "apx-r9-command-receipt-v1",
        "row_id": row["row_id"],
        "command_id": command_id,
        "argv": argv,
        "cwd": str(cwd),
        "shell": False,
        "stdout_path": str(stdout_path),
        "stderr_path": str(stderr_path),
        "stdout_bytes": len(out),
        "stderr_bytes": len(err),
        "stdout_sha256": sha256_bytes(out),
        "stderr_sha256": sha256_bytes(err),
        "exit_code": exit_code,
        "timeout": timed_out,
        "cpu_seconds": windows_process_cpu_seconds(process) if process else None,
        "wall_seconds": wall_seconds,
        "peak_rss_bytes": windows_peak_rss_bytes(process) if process else None,
        "input_bytes": input_bytes,
        "input_receipts": input_receipts,
        "output_bytes": output_bytes,
        "persisted_bytes": output_bytes,
        "output_artifacts": output_receipts,
        "version_or_hash_drift": False,
        "launch_error": launch_error,
        "driver_report_values_ignored": True,
        "status": "PASS" if exit_code == 0 and not timed_out and launch_error is None and artifact_error is None else "FAIL",
    }
    if artifact_error:
        receipt["artifact_error"] = artifact_error
    return receipt


def producer_edges(receipts: list[dict[str, Any]]) -> list[dict[str, Any]]:
    edges: list[dict[str, Any]] = []
    for receipt in receipts:
        for artifact in receipt.get("output_artifacts", []):
            edges.append(
                {
                    "producer_row_id": receipt["row_id"],
                    "producer_command_id": receipt["command_id"],
                    "output_path": artifact["path"],
                    "output_sha256": artifact.get("sha256"),
                    "output_bytes": artifact.get("bytes", 0),
                    "edge_type": "typed_filesystem_artifact",
                }
            )
    return edges


def run_rows(dag: dict[str, Any], output_root: Path) -> int:
    all_receipts: list[dict[str, Any]] = []
    row_records: list[dict[str, Any]] = []
    first_failure: dict[str, Any] | None = None
    for row in dag["rows"]:
        row_receipts: list[dict[str, Any]] = []
        for command in row["commands"]:
            command_id = command["command_id"]
            receipt = run_command(row, command_id, command)
            row_receipts.append(receipt)
            all_receipts.append(receipt)
            if receipt["status"] != "PASS":
                first_failure = {
                    "row_id": row["row_id"],
                    "command_id": command_id,
                    "reason": receipt.get("artifact_error") or receipt.get("launch_error") or "nonzero_or_timeout",
                    "receipt_index": len(all_receipts) - 1,
                }
                break
        row_records.append(
            {
                "row_id": row["row_id"],
                "expected_receipts": 9,
                "observed_receipts": len(row_receipts),
                "receipts": row_receipts,
                "complete": len(row_receipts) == 9 and all(item["status"] == "PASS" for item in row_receipts),
            }
        )
        if first_failure is not None:
            break
    ledger = {
        "schema": "apx-r9-outer-full-cost-ledger-v1",
        "assignment_id": dag["assignment_id"],
        "execution_mode": "serial_rows_and_commands_first_failure_stop",
        "rows": row_records,
        "row_count_expected": 8,
        "commands_per_row_expected": 9,
        "receipt_count_observed": len(all_receipts),
        "measured_cost_fields": list(COST_FIELDS),
        "measurement_source": "controller_process_and_filesystem_receipts_only",
        "future_runner_values_ignored": True,
        "producer_edges": producer_edges(all_receipts),
        "first_failure": first_failure,
        "result_based_exclusion": False,
        "scientific_inference": "NONE",
    }
    write_json(output_root / "outer_full_cost_ledger.json", ledger)
    if first_failure is not None:
        write_json(output_root / "first_failure.json", first_failure)
    return 1 if first_failure is not None else 0


def main() -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--dag", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    dag_path = Path(args.dag)
    output_root = Path(args.output)
    dag = json.loads(dag_path.read_text(encoding="utf-8"))
    validate_dag(dag)
    output_root.mkdir(parents=True, exist_ok=True)
    return run_rows(dag, output_root)


if __name__ == "__main__":
    raise SystemExit(main())
