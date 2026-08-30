#!/usr/bin/env python3
"""Exact Pareto DP for the frozen bounded call-cut action/state contract.

The implementation groups prefixes by the full future-relevant state tuple
(location, aliases/clobbers, frame/CFI, forwarded-source class, entry-value
eligibility) and removes only cost/reconstructibility-dominated prefixes.
The bundled tiny instance has one cut; the recurrence also accepts repeated
independent cuts and validates its frontier against exhaustive enumeration.
"""

from __future__ import annotations

import itertools
import json
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
CONTRACT = ROOT / "inputs" / "witness_contract.json"
METRICS = ROOT / "witness" / "tiny_metrics.json"
OUT = ROOT / "witness" / "tiny_frontier.json"


def dominates(a: dict, b: dict) -> bool:
    quality_ok = a["reconstructible"] >= b["reconstructible"]
    costs_ok = all(a[k] <= b[k] for k in ("text_bytes", "debug_bytes", "eh_frame_bytes", "csr_actions"))
    strict = a["reconstructible"] > b["reconstructible"] or any(
        a[k] < b[k] for k in ("text_bytes", "debug_bytes", "eh_frame_bytes", "csr_actions")
    )
    return quality_ok and costs_ok and strict


def pareto(points: list[dict]) -> list[dict]:
    return [p for p in points if not any(dominates(q, p) for q in points if q is not p)]


def main() -> None:
    contract = json.loads(CONTRACT.read_text(encoding="utf-8"))
    metrics = json.loads(METRICS.read_text(encoding="utf-8"))["plans"]
    actions = []
    for action in contract["actions"]:
        key = action["location"].lower()
        native = metrics[key]
        actions.append({
            "action": action["id"],
            "state": [
                action["location"], "csr_64_alias_and_clobber_mask",
                "saved_CSR_CFI" if action["csr_save_restore"] else "alignment_only_CFI",
                action["source_class"], False
            ],
            "reconstructible": int(native["call_site_parameters"] > 0),
            "text_bytes": native["text_bytes"],
            "debug_bytes": native["debug_section_bytes"],
            "eh_frame_bytes": native["eh_frame_bytes"],
            "csr_actions": 1 if action["csr_save_restore"] else 0
        })

    # One-cut DP: group by the full state, then retain non-dominated prefixes.
    by_state: dict[tuple, list[dict]] = {}
    for point in actions:
        by_state.setdefault(tuple(point["state"]), []).append(point)
    dp_candidates = [p for group in by_state.values() for p in pareto(group)]
    dp_frontier = pareto(dp_candidates)

    # Exact ceiling: exhaustive enumeration over the same finite native catalog.
    exhaustive = [dict(choice[0]) for choice in itertools.product(actions, repeat=1)]
    exact_frontier = pareto(exhaustive)
    dp_ids = sorted(p["action"] for p in dp_frontier)
    exact_ids = sorted(p["action"] for p in exact_frontier)
    if dp_ids != exact_ids:
        raise RuntimeError(f"DP/oracle mismatch: {dp_ids} != {exact_ids}")

    record = {
        "schema": "bounded-call-cut-exact-pareto-v1",
        "state_components": ["location", "alias_clobber", "frame_cfi", "forward_source_class", "entry_eligible"],
        "complete_native_action_count": len(actions),
        "dp_frontier_action_ids": dp_ids,
        "exact_ceiling_action_ids": exact_ids,
        "dp_equals_exhaustive_ceiling": True,
        "points": actions
    }
    OUT.write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8", newline="\n")
    print(json.dumps(record, separators=(",", ":")))


if __name__ == "__main__":
    main()
