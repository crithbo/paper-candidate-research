#!/usr/bin/env python3
from __future__ import annotations

import hashlib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "HASH_MANIFEST.sha256"


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


def main() -> int:
    rows = []
    for path in sorted((p for p in ROOT.rglob("*") if p.is_file() and p != OUTPUT), key=lambda p: p.relative_to(ROOT).as_posix()):
        rows.append(f"{sha256_file(path)}  {path.relative_to(ROOT).as_posix()}\n")
    OUTPUT.write_text("".join(rows), encoding="utf-8", newline="\n")
    print(f"manifest_entries={len(rows)} manifest_sha256={sha256_file(OUTPUT)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
