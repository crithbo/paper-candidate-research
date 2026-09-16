#!/usr/bin/env python3
"""Create or verify the canonical SHA-256 manifest for the resume package."""

from __future__ import annotations

import argparse
import hashlib
import pathlib
import sys


MANIFEST = "HASH_MANIFEST.sha256"


def sha(path: pathlib.Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def files(root: pathlib.Path) -> list[pathlib.Path]:
    return sorted(
        (p for p in root.rglob("*") if p.is_file() and p.name != MANIFEST),
        key=lambda p: p.relative_to(root).as_posix(),
    )


def write(root: pathlib.Path) -> int:
    rows = [
        f"{sha(path)}  *{path.relative_to(root).as_posix()}"
        for path in files(root)
    ]
    (root / MANIFEST).write_text("\n".join(rows) + "\n", encoding="utf-8")
    print(f"written_entries={len(rows)}")
    return 0


def verify(root: pathlib.Path) -> int:
    manifest = root / MANIFEST
    expected: dict[str, str] = {}
    for line in manifest.read_text(encoding="utf-8").splitlines():
        digest, rel = line.split(None, 1)
        expected[rel.lstrip("*")] = digest.lower()
    actual_paths = {path.relative_to(root).as_posix(): path for path in files(root)}
    missing = sorted(set(expected) - set(actual_paths))
    extra = sorted(set(actual_paths) - set(expected))
    mismatches = sorted(
        rel for rel in set(expected) & set(actual_paths)
        if sha(actual_paths[rel]) != expected[rel]
    )
    total_bytes = sum(path.stat().st_size for path in actual_paths.values())
    manifest_sha = sha(manifest)
    ok = not missing and not extra and not mismatches
    print(
        f"verified={ok} entries={len(expected)} bytes={total_bytes} "
        f"missing={len(missing)} extra={len(extra)} mismatches={len(mismatches)} "
        f"manifest_sha256={manifest_sha}"
    )
    for label, rows in (("MISSING", missing), ("EXTRA", extra), ("MISMATCH", mismatches)):
        for rel in rows:
            print(f"{label}\t{rel}")
    return 0 if ok else 2


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("mode", choices=("write", "verify"))
    ap.add_argument("root", type=pathlib.Path)
    args = ap.parse_args()
    return write(args.root.resolve()) if args.mode == "write" else verify(args.root.resolve())


if __name__ == "__main__":
    sys.exit(main())
