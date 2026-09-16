#!/usr/bin/env python3
"""Independent tiny exhaustive ceiling for WL-SLDP native bit accounting."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import itertools
import json
import pathlib
import sys
from typing import Any, Optional


def load(name: str, path: pathlib.Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def key(abbrev: Any) -> str:
    return json.dumps(abbrev.as_json(), sort_keys=True, separators=(",", ":"))


def brute_cost(codec: Any, planner: Any, records: list[Any],
               ordered: tuple[Any, ...]) -> Optional[tuple[int, list[int]]]:
    width = planner.app_code_width(len(ordered))
    choices: list[list[tuple[int, Any]]] = []
    for record in records:
        row: list[tuple[int, Any]] = []
        if record.blob is None:
            row.append((codec.UNABBREV_RECORD, None))
        for index, abbrev in enumerate(ordered):
            if planner.abbrev_matches(codec, abbrev, record):
                row.append((codec.FIRST_APPLICATION_ABBREV + index, abbrev))
        if not row:
            return None
        choices.append(row)
    best: Optional[tuple[int, list[int]]] = None
    for assignment in itertools.product(*choices):
        writer = codec.BitWriter()
        for abbrev in ordered:
            codec.emit_abbrev(writer, width, abbrev)
        for record, (abbrev_id, abbrev) in zip(records, assignment):
            codec.emit_record(writer, width, record, abbrev_id, abbrev)
        writer.emit(codec.END_BLOCK, width)
        bits = len(writer.bytes()) * 8
        candidate = (bits, [x[0] for x in assignment])
        if best is None or candidate < best:
            best = candidate
    return best


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--codec", required=True, type=pathlib.Path)
    ap.add_argument("--planner", required=True, type=pathlib.Path)
    ap.add_argument("--output", required=True, type=pathlib.Path)
    args = ap.parse_args()
    codec = load("ceiling_codec", args.codec.resolve())
    planner = load("ceiling_planner", args.planner.resolve())

    records = [
        codec.Record(1, [0, 0], None, 3, 0, 0),
        codec.Record(1, [0, 1], None, 3, 0, 0),
        codec.Record(1, [0, 0], None, 3, 0, 0),
        codec.Record(1, [0, 1], None, 3, 0, 0),
        codec.Record(2, [97, 98, 99], None, 3, 0, 0),
        codec.Record(2, [97, 98, 100], None, 3, 0, 0),
    ]
    universe = [
        codec.Abbrev([codec.AbbrevOp(literal=1), codec.AbbrevOp(literal=0),
                      codec.AbbrevOp(encoding=codec.FIXED, data=1)]),
        codec.Abbrev([codec.AbbrevOp(literal=1), codec.AbbrevOp(encoding=codec.ARRAY),
                      codec.AbbrevOp(encoding=codec.FIXED, data=1)]),
        codec.Abbrev([codec.AbbrevOp(literal=2), codec.AbbrevOp(encoding=codec.ARRAY),
                      codec.AbbrevOp(encoding=codec.CHAR6)]),
        codec.Abbrev([codec.AbbrevOp(literal=2), codec.AbbrevOp(encoding=codec.ARRAY),
                      codec.AbbrevOp(encoding=codec.FIXED, data=8)]),
        codec.Abbrev([codec.AbbrevOp(encoding=codec.VBR, data=6),
                      codec.AbbrevOp(encoding=codec.ARRAY),
                      codec.AbbrevOp(encoding=codec.VBR, data=6)]),
    ]
    block = codec.Block(
        65534, 3, records, [], 0, 0, 0, 0,
    )
    frontier = planner.exact_frontier(
        codec, (0,), block, universe, [], set(), 4, "WL_SLDP_TINY"
    )
    wl_best = min(
        ((plan.body_bits, plan.selected_keys, plan.assignments) for plan in frontier.values()),
        key=lambda row: (row[0], row[1], row[2]),
    )

    b3_best: Optional[tuple[int, list[str], list[int]]] = None
    evaluated_orders = 0
    for count in range(0, 5):
        for subset in itertools.combinations(universe, count):
            for order in itertools.permutations(subset):
                evaluated_orders += 1
                cost = brute_cost(codec, planner, records, order)
                if cost is None:
                    continue
                candidate = (cost[0], [key(a) for a in order], cost[1])
                if b3_best is None or candidate < b3_best:
                    b3_best = candidate
    if b3_best is None:
        raise RuntimeError("tiny ceiling found no feasible encoding")
    equal_cost = wl_best[0] == b3_best[0]
    result = {
        "schema": "llvm-tiny-exact-ceiling-v1",
        "role": "B3_TINY_EXACT_CEILING_ONLY__NON_NATURAL_NON_CLAIM_BEARING",
        "records": [r.semantic_json() for r in records],
        "universe": [json.loads(key(a)) for a in universe],
        "max_definitions": 4,
        "evaluated_subset_orders": evaluated_orders,
        "wl_sldp_best_bits": wl_best[0],
        "wl_sldp_selected": wl_best[1],
        "wl_sldp_assignments": wl_best[2],
        "b3_best_bits": b3_best[0],
        "b3_selected_order": b3_best[1],
        "b3_assignments": b3_best[2],
        "exact_cost_equal": equal_cost,
        "id_widths_covered": sorted({planner.app_code_width(i) for i in range(0, 5)}),
        "input_sha256": hashlib.sha256(json.dumps(
            [r.semantic_json() for r in records], sort_keys=True,
            separators=(",", ":"),
        ).encode()).hexdigest(),
    }
    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "exact_cost_equal": equal_cost,
        "wl_bits": wl_best[0], "b3_bits": b3_best[0],
        "evaluated_subset_orders": evaluated_orders,
    }, sort_keys=True))
    return 0 if equal_cost else 2


if __name__ == "__main__":
    raise SystemExit(main())
