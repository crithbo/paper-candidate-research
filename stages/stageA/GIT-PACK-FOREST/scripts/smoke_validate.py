from __future__ import annotations

import argparse
import json
from pathlib import Path

from run_pilot import validate_pack
from git_pack_lib import write_json


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
    commit = (repo / "refs" / "stagea" / "frozen").read_text(encoding="ascii").strip()
    result = validate_pack(
        git,
        repo,
        commit,
        root / "work" / "smoke" / "delta-smoke.pack",
        root / "work" / "smoke" / "delta-smoke.idx",
        rows,
        root / "work" / "smoke_validation",
    )
    write_json(root / "results" / "smoke_validation.json", result)
    print(json.dumps({
        "object_count": result["object_count"],
        "delta_edge_count": result["delta_edge_count"],
        "mismatch_count": result["canonical_equality_mismatch_count"],
        "fsck_exit": result["fsck_strict_exit"],
        "index_verify_exit": result["index_pack_verify_strict_exit"],
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
