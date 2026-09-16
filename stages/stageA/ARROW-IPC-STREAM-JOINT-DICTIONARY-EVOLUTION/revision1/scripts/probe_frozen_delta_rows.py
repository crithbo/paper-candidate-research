"""Probe the frozen window-11 rows under the native delta-enabled arm.

This is deliberately a single uncorrected-solver diagnostic.  It runs before
the scientific revision is consumed and writes a freeze artifact only when the
gate's equal-cost signature mismatch and three live event branches coexist.
"""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from freeze_delta_adversary import cost_projection, evaluate, live_branches
from preclaim import comparable, explicit_product, materialize_components, rp_fdp


ROWS = [
    ["N"] * 10,
    ["1", "1", "1", "2", "1", "1", "1", "1", "1", "4"],
    ["A", "A", "A", "A", "A", "B", "A", "A", "A", "A"],
]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    result = evaluate(ROWS)
    if result is None:
        product, _ = explicit_product(ROWS, True)
        rp, _ = rp_fdp(ROWS, True)
        mismatch_boundaries = []
        equal_cost_mismatch_boundaries = []
        for boundary in range(len(product)):
            expected = comparable(product[boundary])
            actual = comparable(materialize_components(rp[boundary]))
            if expected != actual:
                mismatch_boundaries.append(boundary)
                if cost_projection(expected) == cost_projection(actual):
                    equal_cost_mismatch_boundaries.append(boundary)
        print(json.dumps({
            "live_branches": live_branches(product),
            "mismatch_boundaries": mismatch_boundaries,
            "equal_cost_mismatch_boundaries": equal_cost_mismatch_boundaries,
        }, indent=2))
        raise SystemExit("frozen rows do not satisfy the delta-enabled tie gate")
    result.update({
        "search_trials": 1,
        "source": "INITIAL_DIAGNOSTIC_WINDOW_11_FIRST_MISMATCH_PREFIX__MINIMAL_DELTA_LIVENESS_FIELD",
        "solver_state": "UNCORRECTED_COST_ONLY_COMPONENT_PRUNING",
        "frozen_before_corrected_solver_execution": True,
    })
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(
        json.dumps(result, indent=2, sort_keys=True) + "\n",
        encoding="utf-8",
        newline="\n",
    )
    print(json.dumps({
        "rows_sha256": result["rows_sha256"],
        "live_branches": result["live_branches"],
        "first_mismatch_boundary": result["first_mismatch_boundary"],
        "difference_boundaries": [item["boundary"] for item in result["differences"]],
    }, indent=2))


if __name__ == "__main__":
    main()
