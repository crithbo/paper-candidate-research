"""Diagnose the already-observed frozen window-11 RP/product mismatch only."""

from __future__ import annotations

import argparse
import json
from pathlib import Path

from natural_stagea import EXPECTED_HASHES, all_final_labels, choose, label_plan, load_nyc, window_offsets
from preclaim import comparable, explicit_product, materialize_components, rp_fdp, sha256


def costs_only(projection: dict[str, list[tuple[tuple[int, ...], str]]]) -> dict[str, list[list[int]]]:
    return {state: sorted([list(cost) for cost, _signature in labels]) for state, labels in projection.items()}


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", required=True, type=Path)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    source = root / "assets" / "natural" / "yellow_tripdata_2025-01.parquet"
    if sha256(source) != EXPECTED_HASHES[source.name]:
        raise RuntimeError("frozen input hash mismatch")
    first, second, metadata = load_nyc(source)
    offset = window_offsets(len(first), 16)[11]
    rows = [first[offset : offset + 16], second[offset : offset + 16]]
    product, product_counts = explicit_product(rows, False)
    rp, rp_counts = rp_fdp(rows, False)
    differences = []
    for boundary in range(17):
        expected = comparable(product[boundary])
        actual = comparable(materialize_components(rp[boundary]))
        if expected != actual:
            states = sorted(set(expected) | set(actual))
            differences.append({
                "boundary": boundary,
                "cost_frontier_equal": costs_only(expected) == costs_only(actual),
                "state_differences": [
                    {"state": state, "product": expected.get(state), "rp_fdp": actual.get(state)}
                    for state in states
                    if expected.get(state) != actual.get(state)
                ],
            })
    p_labels = all_final_labels(product[-1])
    r_labels = all_final_labels(materialize_components(rp[-1]))
    result = {
        "carrier": "NYC_TLC_YELLOW_2025_01",
        "window_index": 11,
        "offset": offset,
        "rows": rows,
        "metadata": metadata,
        "emit_dictionary_deltas": False,
        "first_mismatch_boundary": differences[0]["boundary"] if differences else None,
        "all_cost_frontiers_equal": all(item["cost_frontier_equal"] for item in differences),
        "differences": differences,
        "product_counts": product_counts,
        "rp_counts": rp_counts,
        "final_product_plan": label_plan(choose(p_labels)),
        "final_rp_plan": label_plan(choose(r_labels)),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps({
        "first_mismatch_boundary": result["first_mismatch_boundary"],
        "all_cost_frontiers_equal": result["all_cost_frontiers_equal"],
        "difference_boundaries": [item["boundary"] for item in differences],
        "final_static_cost_equal": result["final_product_plan"]["static_cost"] == result["final_rp_plan"]["static_cost"],
        "final_signature_equal": result["final_product_plan"]["signature"] == result["final_rp_plan"]["signature"],
    }, indent=2))


if __name__ == "__main__":
    main()
