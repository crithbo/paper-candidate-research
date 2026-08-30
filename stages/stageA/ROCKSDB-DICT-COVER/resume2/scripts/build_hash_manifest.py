"""Build a complete SHA-256 manifest excluding only the manifest itself."""

from __future__ import annotations

import hashlib
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
MANIFEST = ROOT / "HASH_MANIFEST.sha256"
paths = sorted(
    path for path in ROOT.rglob("*")
    if path.is_file() and path.resolve() != MANIFEST.resolve()
)
lines = []
for path in paths:
    digest = hashlib.sha256(path.read_bytes()).hexdigest().upper()
    lines.append(f"{digest}  {path.relative_to(ROOT).as_posix()}")
MANIFEST.write_text("\n".join(lines) + "\n", encoding="utf-8", newline="\n")
print(f"manifest_entries={len(lines)}")
