"""Fail closed unless every resume2 file is covered and hash-equal."""

from __future__ import annotations

import hashlib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "HASH_MANIFEST.sha256"
expected = {}
for number, line in enumerate(MANIFEST.read_text(encoding="utf-8").splitlines(), 1):
    digest, separator, relative = line.partition("  ")
    if separator != "  " or len(digest) != 64 or not relative or relative in expected:
        raise RuntimeError(f"invalid manifest line {number}")
    expected[relative] = digest.upper()
observed = {
    path.relative_to(ROOT).as_posix()
    for path in ROOT.rglob("*")
    if path.is_file() and path.resolve() != MANIFEST.resolve()
}
if observed != set(expected):
    raise RuntimeError(f"coverage mismatch missing={sorted(observed-set(expected))} extra={sorted(set(expected)-observed)}")
for relative, digest in expected.items():
    actual = hashlib.sha256((ROOT / relative).read_bytes()).hexdigest().upper()
    if actual != digest:
        raise RuntimeError(f"hash mismatch {relative}: {actual} != {digest}")
self_hash = hashlib.sha256(MANIFEST.read_bytes()).hexdigest().upper()
print(f"manifest_verify=PASS entries={len(expected)} manifest_sha256={self_hash}")
