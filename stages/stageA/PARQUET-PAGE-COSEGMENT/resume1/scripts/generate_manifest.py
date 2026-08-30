"""Generate and verify the canonical assignment-wide SHA-256 manifest."""

from __future__ import annotations

import argparse
import hashlib
from pathlib import Path


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1 << 20), b""):
            digest.update(block)
    return digest.hexdigest().upper()


def entries(root: Path, manifest: Path) -> list[tuple[str, str]]:
    rows = []
    for path in root.rglob("*"):
        if not path.is_file() or path.resolve() == manifest.resolve():
            continue
        relative = path.relative_to(root).as_posix()
        rows.append((relative, sha256(path)))
    return sorted(rows, key=lambda row: row[0])


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", type=Path, required=True)
    parser.add_argument("--manifest", type=Path, required=True)
    parser.add_argument("--verify", action="store_true")
    args = parser.parse_args()
    root = args.root.resolve()
    manifest = args.manifest.resolve()
    rows = entries(root, manifest)
    rendered = "".join(f"{digest}  {relative}\n" for relative, digest in rows)
    if args.verify:
        if manifest.read_text(encoding="utf-8") != rendered:
            raise SystemExit("manifest verification failed")
        print(f"PASS entries={len(rows)} bytes={sum((root / relative).stat().st_size for relative, _ in rows)}")
    else:
        manifest.write_text(rendered, encoding="utf-8", newline="\n")
        print(f"WROTE entries={len(rows)}")


if __name__ == "__main__":
    main()
