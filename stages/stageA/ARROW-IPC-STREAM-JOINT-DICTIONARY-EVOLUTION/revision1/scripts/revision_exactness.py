"""Direct statewise exactness tests for the single allowed Stage A revision."""

from __future__ import annotations

import argparse
import json
from pathlib import Path
from typing import Any

from freeze_delta_adversary import live_branches
from preclaim import comparable, explicit_product, materialize_components, rp_fdp, sha256_bytes


def load_json(path: Path) -> Any:
    return json.loads(path.read_text(encoding="utf-8"))


def check_case(name: str, rows: list[list[str | None]], deltas: bool) -> dict[str, Any]:
    product, product_counts = explicit_product(rows, deltas)
    rp, rp_counts = rp_fdp(rows, deltas)
    boundaries = []
    exact = True
    for boundary in range(len(product)):
        expected = comparable(product[boundary])
        actual = comparable(materialize_components(rp[boundary]))
        match = expected == actual
        exact = exact and match
        boundaries.append({
            "boundary": boundary,
            "exact_cost_and_signature": match,
            "product_states": len(expected),
            "rp_states": len(actual),
            "product_labels": sum(len(labels) for labels in expected.values()),
            "rp_labels": sum(len(labels) for labels in actual.values()),
            "product_projection_sha256": sha256_bytes(json.dumps(expected, separators=(",", ":"), sort_keys=True).encode("utf-8")),
            "rp_projection_sha256": sha256_bytes(json.dumps(actual, separators=(",", ":"), sort_keys=True).encode("utf-8")),
        })
    return {
        "name": name,
        "emit_dictionary_deltas": deltas,
        "rows": rows,
        "rows_sha256": sha256_bytes(json.dumps(rows, separators=(",", ":")).encode("utf-8")),
        "live_branches": live_branches(product),
        "all_relevant_boundaries_statewise_exact": exact,
        "boundaries": boundaries,
        "product_counts": product_counts,
        "rp_counts": rp_counts,
    }


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--initial-diagnostic", required=True, type=Path)
    parser.add_argument("--delta-freeze", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    observed = load_json(args.initial_diagnostic)
    frozen_delta = load_json(args.delta_freeze)
    if observed["emit_dictionary_deltas"] is not False or observed["all_cost_frontiers_equal"] is not True:
        raise AssertionError("initial observed tie provenance is not the frozen delta-disabled diagnostic")
    if frozen_delta["emit_dictionary_deltas"] is not True:
        raise AssertionError("delta adversary arm is not enabled")
    if not {"NO_EVENT", "DELTA", "REPLACEMENT"}.issubset(frozen_delta["live_branches"]):
        raise AssertionError("delta adversary freeze lacks required live branches")
    if not frozen_delta["differences"]:
        raise AssertionError("delta adversary did not expose the old signature defect")

    cases = [
        check_case("OBSERVED_WINDOW_11_DELTA_DISABLED", observed["rows"], False),
        check_case("FROZEN_MINIMAL_DELTA_ENABLED_TIE", frozen_delta["rows"], True),
    ]
    passed = all(case["all_relevant_boundaries_statewise_exact"] for case in cases)
    result = {
        "gate": "STATEWISE_SIGNATURE_AWARE_COMPONENT_DOMINANCE_AND_DEDUP_EXACTNESS_GATE",
        "comparison": "all relevant boundary/state Pareto labels as (cost, deterministic full plan signature)",
        "initial_diagnostic_sha256": sha256_bytes(args.initial_diagnostic.read_bytes()),
        "delta_freeze_sha256": sha256_bytes(args.delta_freeze.read_bytes()),
        "cases": cases,
        "pass": passed,
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps({
        "pass": passed,
        "cases": [
            {
                "name": case["name"],
                "boundaries": len(case["boundaries"]),
                "max_r": case["rp_counts"]["max_r"],
                "live_branches": case["live_branches"],
            }
            for case in cases
        ],
    }, indent=2))
    if not passed:
        raise SystemExit(1)


if __name__ == "__main__":
    main()
