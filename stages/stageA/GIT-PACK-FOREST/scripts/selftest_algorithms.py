from __future__ import annotations

import itertools
import random

from run_pilot import ROOT_NODE, _find_cycle, edmonds_max_branching


def brute(nodes: list[str], edges: list[dict]) -> int:
    incoming = {node: [edge for edge in edges if edge["target"] == node] for node in nodes}
    best = -1
    for choices in itertools.product(*(incoming[node] for node in nodes)):
        parents = {edge["target"]: edge["base"] for edge in choices}
        if _find_cycle(parents, set(nodes) | {ROOT_NODE}, ROOT_NODE):
            continue
        best = max(best, sum(edge["weight"] for edge in choices))
    return best


def main() -> int:
    randomizer = random.Random(20260809)
    for trial in range(50):
        nodes = ["a", "b", "c", "d"]
        edges = [
            {"base": ROOT_NODE, "target": node, "weight": 0, "saving": 0}
            for node in nodes
        ]
        for base in nodes:
            for target in nodes:
                if base != target:
                    weight = randomizer.randrange(0, 20)
                    edges.append({"base": base, "target": target, "weight": weight, "saving": weight})
        selected = edmonds_max_branching(set(nodes) | {ROOT_NODE}, edges, ROOT_NODE)
        actual = sum(edge["weight"] for edge in selected)
        expected = brute(nodes, edges)
        if actual != expected:
            raise AssertionError(f"trial={trial} actual={actual} expected={expected}")
    print("EDMONDS_SELFTEST_PASS trials=50 nodes=4")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
