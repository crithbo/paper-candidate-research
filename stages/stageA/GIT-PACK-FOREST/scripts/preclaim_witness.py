from __future__ import annotations

import argparse
import json
from pathlib import Path
import time

from git_pack_lib import (
    custom_pack_bytes,
    git_run,
    make_git_2_55_delta,
    read_batch_objects,
    sha256_bytes,
    sha256_file,
    write_json,
)
from run_pilot import validate_pack


BASE = "0069fbfda31ae1b94473a695fa1d635651695835"
TARGET = "6336e96ae49b39c7ac35230b3a6bc7e78f82c933"


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--git", required=True, type=Path)
    parser.add_argument("--root", required=True, type=Path)
    parser.add_argument("--label", default="preclaim-witness")
    parser.add_argument("--result-name", default="PRECLAIM_WITNESS")
    args = parser.parse_args()
    root = args.root.resolve()
    git = args.git.resolve()
    repo_id = "hellogitworld"
    repo = root / "work" / "repos" / f"{repo_id}.git"
    rows = [
        json.loads(line)
        for line in (root / "inputs" / "manifests" / f"{repo_id}.jsonl").read_text(encoding="utf-8").splitlines()
        if line
    ]
    oids = [row["oid"] for row in rows]
    objects = read_batch_objects(git, repo, oids)
    if BASE not in objects or TARGET not in objects:
        raise RuntimeError("frozen natural witness edge is absent")
    order = [BASE] + [oid for oid in oids if oid not in {BASE, TARGET}] + [TARGET]
    parents = {oid: None for oid in oids}
    parents[TARGET] = BASE
    if not all(character.isalnum() or character in "-_" for character in args.label):
        raise RuntimeError("invalid immutable witness label")
    if not all(character.isalnum() or character in "-_" for character in args.result_name):
        raise RuntimeError("invalid witness result name")
    witness_root = root / "work" / args.label
    witness_root.mkdir(parents=True, exist_ok=False)
    started = time.perf_counter()
    pack_bytes, entries = custom_pack_bytes(order, objects, parents)
    construction_wall = time.perf_counter() - started
    pack = witness_root / "native-witness.pack"
    pack.write_bytes(pack_bytes)
    index_run = git_run(git, repo, ["index-pack", "--strict", str(pack)])
    index = pack.with_suffix(".idx")
    commit = (repo / "refs" / "stagea" / "frozen").read_text(encoding="ascii").strip()
    validation = validate_pack(
        git,
        repo,
        commit,
        pack,
        index,
        rows,
        witness_root / "validation",
    )
    parity = json.loads((root / "results" / "GIT_NATIVE_CODEC_PARITY.json").read_text(encoding="utf-8"))
    parity_row = next(row for row in parity["records"] if row["base"] == BASE and row["target"] == TARGET)
    delta = make_git_2_55_delta(objects[BASE]["content"], objects[TARGET]["content"])
    base_position = order.index(BASE)
    target_position = order.index(TARGET)
    record = {
        "schema_version": "git-pack-forest-preclaim-witness-v1",
        "repo_id": repo_id,
        "natural_commit": commit,
        "reachable_object_count": len(oids),
        "atomic_action": {"base": BASE, "target": TARGET, "maximum_depth": 8},
        "legality": {
            "base_before_target": base_position < target_position,
            "base_position": base_position,
            "target_position": target_position,
            "witness_depth": 1,
            "self_contained_ref_delta": True,
        },
        "native_delta": {
            "bytes": len(delta),
            "sha256": sha256_bytes(delta),
            "matches_native_git_byte_exact": parity_row["byte_exact"],
            "matches_native_git_zlib_byte_exact": parity_row["zlib_byte_exact"],
            "native_git_sha256": parity_row["git_delta_sha256"],
        },
        "object_identity": {
            "manifest_objects": len(rows),
            "verified_pack_objects": validation["object_count"],
            "canonical_mismatch_count": validation["canonical_equality_mismatch_count"],
            "index_pack_verify_strict_exit": validation["index_pack_verify_strict_exit"],
            "fsck_strict_exit": validation["fsck_strict_exit"],
        },
        "denominator": {
            "name": "CANDIDATE_SELECTED_USEFUL_DELTA_EDGES",
            "selected_useful_edges": 1,
            "union_observed_covered_edges": 1,
            "outside_edges": 0,
        },
        "full_cost": {
            "pack_bytes": pack.stat().st_size,
            "index_bytes": index.stat().st_size,
            "pack_plus_index_bytes": pack.stat().st_size + index.stat().st_size,
            "construction_wall_seconds": construction_wall,
            "index_construction_wall_seconds": index_run["wall_seconds"],
            "strict_verification_wall_seconds": validation["strict_verification_wall_seconds"],
            "random_access": validation["access"],
            "reconstruction_span": validation["reconstruction_span"],
        },
        "pack_sha256": sha256_file(pack),
        "index_sha256": sha256_file(index),
        "gate_witness_pass": (
            parity_row["byte_exact"]
            and parity_row["zlib_byte_exact"]
            and base_position < target_position
            and validation["canonical_equality_mismatch_count"] == 0
            and validation["index_pack_verify_strict_exit"] == 0
            and validation["fsck_strict_exit"] == 0
        ),
    }
    write_json(root / "results" / f"{args.result_name}.json", record)
    print(json.dumps(record, indent=2, sort_keys=True))
    return 0 if record["gate_witness_pass"] else 2


if __name__ == "__main__":
    raise SystemExit(main())
