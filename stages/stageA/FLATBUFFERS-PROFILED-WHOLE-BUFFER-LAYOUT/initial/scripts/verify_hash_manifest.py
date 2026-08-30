"""Fail closed unless the manifest exactly covers and matches every assignment file."""

from __future__ import annotations

import hashlib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "HASH_MANIFEST.sha256"
expected: dict[str, str] = {}
for number, line in enumerate(MANIFEST.read_text(encoding="utf-8").splitlines(), 1):
    if not line:
        continue
    digest, separator, relative = line.partition("  ")
    if separator != "  " or len(digest) != 64 or relative in expected:
        raise RuntimeError(f"invalid manifest line {number}")
    expected[relative] = digest.upper()

observed_paths = {
    path.relative_to(ROOT).as_posix()
    for path in ROOT.rglob("*")
    if path.is_file() and path.resolve() != MANIFEST.resolve()
}
if observed_paths != set(expected):
    missing = sorted(observed_paths - set(expected))
    extra = sorted(set(expected) - observed_paths)
    raise RuntimeError(f"coverage mismatch missing={missing} extra={extra}")

failures = []
for relative in sorted(expected):
    observed = hashlib.sha256((ROOT / relative).read_bytes()).hexdigest().upper()
    if observed != expected[relative]:
        failures.append((relative, expected[relative], observed))
if failures:
    raise RuntimeError(f"hash failures={failures[:5]} count={len(failures)}")

self_hash = hashlib.sha256(MANIFEST.read_bytes()).hexdigest().upper()
print(f"manifest_verify=PASS entries={len(expected)} manifest_sha256={self_hash}")
