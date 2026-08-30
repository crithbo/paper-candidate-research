#!/usr/bin/env python3
from __future__ import annotations

import hashlib
import re
import sys
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "HASH_MANIFEST.sha256"
ROW = re.compile(r"^([0-9A-F]{64})  (.+)$")


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


def main() -> int:
    passed = 0
    for number, line in enumerate(MANIFEST.read_text(encoding="utf-8").splitlines(), 1):
        match = ROW.fullmatch(line)
        if not match:
            print(f"malformed row {number}", file=sys.stderr)
            return 2
        expected, relative = match.groups()
        path = ROOT / Path(relative)
        if not path.is_file() or sha256_file(path) != expected:
            print(f"mismatch {relative}", file=sys.stderr)
            return 3
        passed += 1
    print(f"PASS {passed}/{passed} manifest_sha256={sha256_file(MANIFEST)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
