"""Frozen r12 full-cost ledger producer; execution is not part of this assignment."""
from __future__ import annotations

import argparse
import json
from pathlib import Path


METRIC_FIELDS = (
    "argv", "cwd", "timeout_seconds", "status", "exit_code", "timed_out",
    "cpu_seconds", "wall_seconds", "peak_rss_bytes", "input_bytes", "outputs",
)
BUNDLE_FIELDS = ("bundle_id", "object", "link", "readobj", "objdump", "cost_payload")
COST_FIELDS = ("object_bytes", "link_bytes", "linked_text_bytes", "typed_relocations", "static_uops")


def load(path: Path) -> object:
    return json.loads(path.read_text(encoding="utf-8"))


def require_metric_rows(rows: object, expected: int, prefix: str) -> list[dict[str, object]]:
    if not isinstance(rows, list) or len(rows) != expected:
        raise ValueError(f"{prefix}: expected {expected} metric rows")
    typed = [row for row in rows if isinstance(row, dict)]
    if len(typed) != expected:
        raise ValueError(f"{prefix}: non-object metric row")
    ids = [str(row.get("command_id", "")) for row in typed]
    if any(not value for value in ids) or len(set(ids)) != expected:
        raise ValueError(f"{prefix}: duplicate or missing command_id")
    for row in typed:
        missing = [field for field in METRIC_FIELDS if field not in row]
        if missing:
            raise ValueError(f"{prefix}: missing metric fields {missing}")
    return typed


def require_bundles(graph: object) -> list[dict[str, object]]:
    if not isinstance(graph, dict) or graph.get("audit", {}).get("all_pass") is not True:
        raise ValueError("baseline graph audit is not all_pass")
    bundles = graph.get("bundles")
    if not isinstance(bundles, list) or len(bundles) != 16:
        raise ValueError("expected exactly 16 baseline bundles")
    typed = [row for row in bundles if isinstance(row, dict)]
    ids = [str(row.get("bundle_id", "")) for row in typed]
    if len(typed) != 16 or any(not value for value in ids) or len(set(ids)) != 16:
        raise ValueError("baseline bundle identity failure")
    for row in typed:
        missing = [field for field in BUNDLE_FIELDS if field not in row]
        if missing:
            raise ValueError(f"baseline bundle fields missing {missing}")
        payload = row["cost_payload"]
        if not isinstance(payload, dict) or any(field not in payload for field in COST_FIELDS):
            raise ValueError("baseline bundle cost payload incomplete")
    return typed


def main() -> None:
    parser = argparse.ArgumentParser(allow_abbrev=False)
    parser.add_argument("--candidate-metrics", required=True)
    parser.add_argument("--baseline-metrics", required=True)
    parser.add_argument("--baseline-ledger", required=True)
    parser.add_argument("--baseline-graph", required=True)
    parser.add_argument("--input", required=True)
    parser.add_argument("--row-id", required=True)
    parser.add_argument("--output", required=True)
    args = parser.parse_args()
    candidate = require_metric_rows(load(Path(args.candidate_metrics)), 15, "candidate")
    baseline = require_metric_rows(load(Path(args.baseline_metrics)), 56, "baseline")
    ledger = load(Path(args.baseline_ledger))
    graph = load(Path(args.baseline_graph))
    bundles = require_bundles(graph)
    ledger_metrics = ledger.get("metrics") if isinstance(ledger, dict) else None
    if ledger_metrics != baseline:
        raise ValueError("baseline ledger metrics do not exactly equal baseline command metrics")
    candidate_ids = {str(row["command_id"]) for row in candidate}
    baseline_ids = {str(row["command_id"]) for row in baseline}
    if candidate_ids & baseline_ids or len(candidate_ids | baseline_ids) != 71:
        raise ValueError("candidate/baseline metric union is not exactly 71 unique IDs")
    result = {
        "schema": "ppc-r12-full-cost-ledger-v1",
        "row_id": args.row_id,
        "input": str(Path(args.input).resolve()),
        "candidate_metric_count": len(candidate),
        "baseline_metric_count": len(baseline),
        "unique_metric_count": 71,
        "bundle_count": len(bundles),
        "units": {"cpu_seconds": "seconds", "wall_seconds": "seconds", "peak_rss_bytes": "bytes", "input_bytes": "bytes", "artifact_bytes": "logical_file_bytes", "typed_relocations": "count", "static_uops": "count"},
        "metric_rows": candidate + baseline,
        "baseline_bundles": bundles,
        "dependency_edges": {"candidate_metrics": "candidate-metrics", "baseline_metrics": "baseline-ledger", "baseline_graph": "baseline-graph", "bundle_artifacts": "baseline-graph.bundles"},
        "automatic_retry": False,
        "scientific_inference": "NONE",
    }
    output = Path(args.output)
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")


if __name__ == "__main__":
    main()
