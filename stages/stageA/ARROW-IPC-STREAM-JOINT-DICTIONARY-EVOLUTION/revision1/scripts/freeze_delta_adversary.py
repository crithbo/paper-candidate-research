"""Freeze a minimal delta-enabled tie using only the uncorrected solver.

This script must be run before signature-aware pruning is installed.  It searches
deterministically for a reachable equal-cost/full-signature mismatch while the
native delta arm contains live NO_EVENT, DELTA, and REPLACEMENT histories.
"""

from __future__ import annotations

import argparse
import itertools
import json
from pathlib import Path
from typing import Any

from preclaim import comparable, explicit_product, materialize_components, rp_fdp, sha256_bytes


def cost_projection(projection: dict[str, list[tuple[tuple[int, ...], str]]]) -> dict[str, list[tuple[int, ...]]]:
    return {state: sorted(cost for cost, _signature in labels) for state, labels in projection.items()}


def live_branches(product: list[dict[Any, Any]]) -> list[str]:
    branches: set[str] = set()
    for table in product:
        for labels in table.values():
            for label in labels:
                for history in label.histories:
                    branches.update(entry[2] for entry in history)
    return sorted(branches)


def evaluate(rows: list[list[str]]) -> dict[str, Any] | None:
    product, product_counts = explicit_product(rows, True)
    rp, rp_counts = rp_fdp(rows, True)
    differences = []
    for boundary in range(len(product)):
        expected = comparable(product[boundary])
        actual = comparable(materialize_components(rp[boundary]))
        if expected != actual and cost_projection(expected) == cost_projection(actual):
            states = sorted(set(expected) | set(actual))
            differences.append({
                "boundary": boundary,
                "state_differences": [
                    {"state": state, "product": expected.get(state), "uncorrected_rp_fdp": actual.get(state)}
                    for state in states
                    if expected.get(state) != actual.get(state)
                ],
            })
    branches = live_branches(product)
    if not differences or not {"NO_EVENT", "DELTA", "REPLACEMENT"}.issubset(branches):
        return None
    return {
        "rows": rows,
        "rows_sha256": sha256_bytes(json.dumps(rows, separators=(",", ":")).encode("utf-8")),
        "emit_dictionary_deltas": True,
        "live_branches": branches,
        "first_mismatch_boundary": differences[0]["boundary"],
        "differences": differences,
        "product_counts": product_counts,
        "uncorrected_rp_counts": rp_counts,
    }


def candidates() -> Any:
    # Short binary histories first; then ternary histories.  Field 0 stays
    # constant while field 1 supplies native equality/prefix/reset choices via
    # the complete ordered-dictionary catalog.
    for length in range(4, 11):
        for tail in itertools.product(("1", "2"), repeat=length - 1):
            sequence = ("1",) + tail
            if len(set(sequence)) == 2:
                yield [["N"] * length, list(sequence)]
    for length in range(5, 10):
        for tail in itertools.product(("1", "2", "4"), repeat=length - 1):
            sequence = ("1",) + tail
            if len(set(sequence)) == 3:
                yield [["N"] * length, list(sequence)]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    trials = 0
    result = None
    for rows in candidates():
        trials += 1
        result = evaluate(rows)
        if result is not None:
            break
    if result is None:
        raise SystemExit(f"no adversary found after {trials} deterministic trials")
    result["search_trials"] = trials
    result["solver_state"] = "UNCORRECTED_COST_ONLY_COMPONENT_PRUNING"
    result["frozen_before_corrected_solver_execution"] = True
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps({
        "rows": result["rows"],
        "rows_sha256": result["rows_sha256"],
        "live_branches": result["live_branches"],
        "first_mismatch_boundary": result["first_mismatch_boundary"],
        "search_trials": trials,
    }, indent=2))


if __name__ == "__main__":
    main()
