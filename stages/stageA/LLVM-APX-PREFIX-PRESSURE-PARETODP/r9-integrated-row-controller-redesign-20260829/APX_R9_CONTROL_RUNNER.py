"""APX r9 E2 control runner: one frozen row, no retries or result filtering."""
from __future__ import annotations

import argparse
import importlib.util
import json
from pathlib import Path
from typing import Any


ASSIGNMENT = Path(__file__).resolve().parent
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


def load_controller() -> Any:
    spec = importlib.util.spec_from_file_location("apx_r9_frozen_controller", ASSIGNMENT / "APX_R9_CONTROLLER.py")
    if spec is None or spec.loader is None:
        raise RuntimeError("controller import specification unavailable")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")


def main() -> int:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--dag", required=True)
    parser.add_argument("--output", required=True)
    parser.add_argument("--row-index", type=int, default=0)
    args = parser.parse_args()
    if args.row_index != 0:
        raise SystemExit("E2 control freezes row index 0 only")
    controller = load_controller()
    dag = json.loads(Path(args.dag).read_text(encoding="utf-8"))
    controller.validate_dag(dag)
    row = dag["rows"][0]
    output_root = Path(args.output)
    output_root.mkdir(parents=True, exist_ok=True)
    receipts: list[dict[str, Any]] = []
    first_failure: dict[str, Any] | None = None
    for command_index, command_id in enumerate(COMMAND_ORDER):
        command = row["commands"][command_index]
        if command["command_id"] != command_id:
            raise RuntimeError("DAG command order changed")
        receipt = controller.run_command(row, command_id, command)
        receipts.append(receipt)
        write_json(output_root / "receipts" / f"{command_index:02d}-{command_id}.json", receipt)
        if receipt["status"] != "PASS":
            first_failure = {
                "schema": "apx-r9-e2-control-first-failure-v1",
                "row_index": 0,
                "row_id": row["row_id"],
                "command_index": command_index,
                "command_id": command_id,
                "reason": receipt.get("artifact_error") or receipt.get("launch_error") or "nonzero_or_timeout",
                "scientific_inference": "NONE",
            }
            write_json(output_root / "first_failure.json", first_failure)
            break
    ledger = {
        "schema": "apx-r9-e2-control-outer-cost-v1",
        "assignment_id": dag["assignment_id"],
        "row_index": 0,
        "row_id": row["row_id"],
        "expected_command_count": 9,
        "observed_receipt_count": len(receipts),
        "receipts": receipts,
        "measured_cost_fields": list(controller.COST_FIELDS),
        "measurement_source": "controller_process_and_filesystem_receipts_only",
        "future_runner_values_ignored": True,
        "producer_edges": controller.producer_edges(receipts),
        "first_failure": first_failure,
        "result_based_exclusion": False,
        "scientific_inference": "NONE",
    }
    write_json(output_root / "outer_full_cost_ledger.json", ledger)
    status = {
        "schema": "apx-r9-e2-control-status-v1",
        "assignment_id": dag["assignment_id"],
        "row_index": 0,
        "row_id": row["row_id"],
        "expected_command_count": 9,
        "completed_command_count": len(receipts),
        "required_outputs_present": all(
            all(item.get("present") and item.get("schema_valid") for item in receipt.get("output_artifacts", []))
            for receipt in receipts
        ),
        "schema_valid": all(
            all(item.get("schema_valid") for item in receipt.get("output_artifacts", []))
            for receipt in receipts
        ),
        "missing_paths": [
            item["path"]
            for receipt in receipts
            for item in receipt.get("output_artifacts", [])
            if not item.get("present")
        ],
        "cpu_seconds": [receipt.get("cpu_seconds") for receipt in receipts],
        "wall_seconds": [receipt.get("wall_seconds") for receipt in receipts],
        "peak_rss_bytes": [receipt.get("peak_rss_bytes") for receipt in receipts],
        "input_bytes": [receipt.get("input_bytes") for receipt in receipts],
        "output_bytes": [receipt.get("output_bytes") for receipt in receipts],
        "persisted_bytes": [receipt.get("persisted_bytes") for receipt in receipts],
        "first_failure": first_failure,
        "claim_bearing_observations": 0,
        "scientific_inference": "NONE",
    }
    write_json(output_root / "CONTROL_STATUS.json", status)
    return 1 if first_failure is not None else 0


if __name__ == "__main__":
    raise SystemExit(main())
