#!/usr/bin/env python3
"""Create canonical SHA-256 closures for the executed source trees."""

from __future__ import annotations

import hashlib
import json
import pathlib


ROOT = pathlib.Path(r"D:\project\writing\reserch\stages\stageA\PB-DELETE-SCHEDULE")
ART = ROOT / "artifact" / "certified_maxpre_experimental_data" / "source_code"
TREES = {
    "ijcar_artifact_maxpre": ART / "maxpre",
    "ijcar_artifact_veripb2": ART / "VeriPB",
    "ijcar_artifact_cakepb": ART / "cakepb",
    "veripb_3_0_2_official": ROOT / "toolchain" / "VeriPB-3.0.2",
    "cakepb_commit_6edb2f35_official": ROOT
    / "toolchain"
    / "cakepb-6edb2f3585f1c3e1b925964c4f33e133f7279d02",
    "maxpre_windows_derived": ROOT / "build" / "maxpre-windows",
    "veripb_3_0_2_system_allocator_derived": ROOT
    / "build"
    / "VeriPB-3.0.2-windows-system-allocator",
}
OUT = ROOT / "SOURCE_TREE_HASHES.json"


def digest_file(path: pathlib.Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as handle:
        for block in iter(lambda: handle.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest().upper()


def digest_tree(path: pathlib.Path) -> dict:
    entries = []
    h = hashlib.sha256()
    for file in sorted((p for p in path.rglob("*") if p.is_file()), key=lambda p: p.as_posix()):
        rel = file.relative_to(path).as_posix()
        size = file.stat().st_size
        digest = digest_file(file)
        record = f"{rel}\0{size}\0{digest}\n".encode("utf-8")
        h.update(record)
        entries.append({"path": rel, "bytes": size, "sha256": digest})
    return {
        "root": path.relative_to(ROOT).as_posix(),
        "file_count": len(entries),
        "total_bytes": sum(item["bytes"] for item in entries),
        "canonical_tree_sha256": h.hexdigest().upper(),
        "entries": entries,
    }


def main() -> None:
    payload = {
        "schema_version": "canonical-source-tree-hash-v1",
        "canonical_record": "relative_posix_path NUL decimal_bytes NUL uppercase_sha256 LF",
        "trees": {name: digest_tree(path) for name, path in TREES.items()},
    }
    OUT.write_text(json.dumps(payload, indent=2) + "\n", encoding="utf-8")
    print(f"manifest_sha256={digest_file(OUT)}")
    for name, tree in payload["trees"].items():
        print(f"{name}={tree['canonical_tree_sha256']} files={tree['file_count']}")


if __name__ == "__main__":
    main()
