from __future__ import annotations

import argparse
import json
from pathlib import Path

from git_pack_lib import custom_pack_bytes, git_run, read_batch_objects, sha256_file, write_json


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--git", required=True, type=Path)
    parser.add_argument("--root", required=True, type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    git = args.git.resolve()
    repo_id = "hellogitworld"
    repo = root / "work" / "repos" / f"{repo_id}.git"
    manifest = root / "inputs" / "manifests" / f"{repo_id}.jsonl"
    rows = [json.loads(line) for line in manifest.read_text(encoding="utf-8").splitlines() if line]
    oids = [row["oid"] for row in rows]
    objects = read_batch_objects(git, repo, oids)
    blobs = [oid for oid in oids if objects[oid]["type"] == "blob"]
    if len(blobs) < 2:
        raise RuntimeError("smoke repository has fewer than two blobs")
    base, target = blobs[0], blobs[1]
    order = [base] + [oid for oid in oids if oid not in {base, target}] + [target]
    parents = {oid: None for oid in oids}
    parents[target] = base
    pack_data, entries = custom_pack_bytes(order, objects, parents)
    smoke = root / "work" / "smoke"
    smoke.mkdir(parents=True, exist_ok=False)
    pack = smoke / "delta-smoke.pack"
    pack.write_bytes(pack_data)
    indexed = git_run(git, repo, ["index-pack", "--strict", str(pack)])
    index = smoke / "delta-smoke.idx"
    verify = git_run(git, repo, ["index-pack", "--verify", "--strict", str(pack)])
    record = {
        "repo_id": repo_id,
        "object_count": len(oids),
        "delta_base": base,
        "delta_target": target,
        "pack_sha256": sha256_file(pack),
        "index_sha256": sha256_file(index),
        "index_exit": indexed["exit_code"],
        "verify_exit": verify["exit_code"],
        "pack_bytes": pack.stat().st_size,
        "index_bytes": index.stat().st_size,
    }
    write_json(root / "results" / "smoke_test.json", record)
    print(json.dumps(record, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
