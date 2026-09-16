from __future__ import annotations

import argparse
import hashlib
import json
import random
from pathlib import Path


SEED = 260809


def node(node_id, children, cost, size, op=None):
    return {"id": node_id, "children": children, "cost": cost, "size": size, "op": op or node_id}


def generated_instance(trial: int, rng: random.Random) -> dict:
    nclasses = rng.randint(5, 8)
    classes = {"0": [node(f"t{trial}_c0_input", [], 0, 0, "input")]}
    for c in range(1, nclasses):
        alt_count = rng.choices([1, 2, 3], weights=[4, 4, 1])[0]
        alts = []
        for a in range(alt_count):
            arity = 1 if c == 1 else rng.choice([1, 2])
            pool = list(range(c))
            children = sorted(rng.sample(pool, k=min(arity, len(pool))))
            alts.append(
                node(
                    f"t{trial}_c{c}_a{a}",
                    children,
                    rng.randint(1, 9),
                    rng.randint(1, 8),
                    f"op_{c}_{a}",
                )
            )
        classes[str(c)] = alts
    roots = [nclasses - 1]
    if nclasses >= 7 and rng.random() < 0.35:
        roots = [nclasses - 2, nclasses - 1]
        # Ensure the second-highest root is not a child of the highest root.
        for alt in classes[str(nclasses - 1)]:
            alt["children"] = [x for x in alt["children"] if x != nclasses - 2] or [0]
    return {
        "id": f"controlled_{trial:03d}",
        "source_kind": "CONTROLLED_GENERATOR",
        "semantics_basis": "equivalence_declared_by_locked_micro_instance",
        "roots": roots,
        "classes": classes,
    }


def _public_projection(repo: Path) -> tuple[dict | None, dict]:
    families = ["eggcc-bril", "egg", "rover"]
    inspected = 0
    for family in families:
        for path in sorted((repo / "data" / family).glob("*.json")):
            inspected += 1
            try:
                raw = json.loads(path.read_text(encoding="utf-8"))
                nodes = raw.get("nodes", {})
                roots = list(raw.get("root_eclasses", []))
                by_class = {}
                for nid, rec in nodes.items():
                    by_class.setdefault(str(rec["eclass"]), []).append((str(nid), rec))
                root_order = list(dict.fromkeys(sorted(map(str, roots)) + sorted(by_class)))
                for root in root_order:
                    chosen = {}
                    visiting = set()

                    def choose(c):
                        if c in chosen:
                            return True
                        if c in visiting or c not in by_class:
                            return False
                        visiting.add(c)
                        ranked_nodes = sorted(by_class[c], key=lambda item: (-len(item[1].get("children", [])), item[0]))
                        for nid, rec in ranked_nodes:
                            child_classes = []
                            ok = True
                            for child_nid in rec.get("children", []):
                                child_key = str(child_nid)
                                if child_key not in nodes:
                                    ok = False
                                    break
                                child_classes.append(str(nodes[child_key]["eclass"]))
                            if ok and all(choose(x) for x in child_classes):
                                chosen[c] = (nid, rec, child_classes)
                                visiting.remove(c)
                                return True
                        visiting.remove(c)
                        return False

                    if not choose(root) or not (5 <= len(chosen) <= 8):
                        continue
                    # Build a rank-respecting projection from the chosen acyclic tree/DAG.
                    order = []
                    seen = set()

                    def topo(c):
                        if c in seen:
                            return
                        for x in chosen[c][2]:
                            topo(x)
                        seen.add(c)
                        order.append(c)

                    topo(root)
                    rank = {c: i for i, c in enumerate(order)}
                    classes = {}
                    for c in order:
                        candidates = []
                        for nid, rec in sorted(by_class[c]):
                            child_classes = []
                            valid = True
                            for child_nid in rec.get("children", []):
                                child_key = str(child_nid)
                                if child_key not in nodes:
                                    valid = False
                                    break
                                child_class = str(nodes[child_key]["eclass"])
                                if child_class not in rank or rank[child_class] >= rank[c]:
                                    valid = False
                                    break
                                child_classes.append(child_class)
                            if not valid:
                                continue
                            children = [rank[x] for x in child_classes]
                            if not children:
                                cost, size = 0, 0
                            else:
                                source_cost = rec.get("cost", 1)
                                if isinstance(source_cost, dict):
                                    source_cost = source_cost.get("value", 1)
                                cost = max(1, int(round(float(source_cost))))
                                size = 1
                            candidates.append(node(f"public::{nid}", children, cost, size, str(rec.get("op", nid))))
                            if len(candidates) == 3:
                                break
                        if not candidates:
                            break
                        classes[str(rank[c])] = candidates
                    if len(classes) != len(order):
                        continue
                    projected = {
                        "id": f"public_{family}_{path.stem}",
                        "source_kind": "PUBLIC_ARTIFACT_PROJECTION",
                        "source_path": str(path.relative_to(repo)).replace("\\", "/"),
                        "source_commit": "903ba0f818b50608fe20ae9e0f03c35cb27bc50a",
                        "semantics_basis": "source e-class equivalence; unit-size projection",
                        "roots": [rank[root]],
                        "classes": classes,
                    }
                    return projected, {"status": "SELECTED", "files_inspected": inspected, "path": projected["source_path"]}
            except (KeyError, TypeError, ValueError, json.JSONDecodeError):
                continue
    return None, {"status": "UNAVAILABLE_NO_ELIGIBLE_PROJECTION", "files_inspected": inspected}


def main() -> None:
    p = argparse.ArgumentParser()
    p.add_argument("--contract", required=True)
    p.add_argument("--output", required=True)
    args = p.parse_args()
    contract = Path(args.contract)
    output = Path(args.output)
    rng = random.Random(SEED)
    instances = []
    public, public_status = _public_projection(Path("vendor/extraction-gym"))
    if public:
        instances.append(public)
    instances.extend(generated_instance(i, rng) for i in range(400))
    payload = {
        "schema_version": "liveextract-locked-suite-v1",
        "seed": SEED,
        "contract_sha256": hashlib.sha256(contract.read_bytes()).hexdigest(),
        "public_projection": public_status,
        "instance_count": len(instances),
        "instances": instances,
    }
    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text(json.dumps(payload, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({"output": str(output), "instances": len(instances), "public": public_status}, sort_keys=True))


if __name__ == "__main__":
    main()
