from __future__ import annotations

import argparse
import hashlib
from pathlib import Path


EXCLUDED = {"HASH_MANIFEST.sha256", "MANIFEST_VERIFICATION.json"}


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(4 * 1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", required=True, type=Path)
    parser.add_argument("--manifest", default="HASH_MANIFEST.sha256")
    args = parser.parse_args()
    root = args.root.resolve()
    if root.drive.upper() != "D:":
        raise SystemExit(f"manifest root must be D:, got {root}")
    files = sorted(
        path for path in root.rglob("*")
        if path.is_file() and path.relative_to(root).as_posix() not in EXCLUDED
    )
    output = root / args.manifest
    temporary = output.with_suffix(output.suffix + ".tmp")
    with temporary.open("w", encoding="utf-8", newline="\n") as handle:
        for path in files:
            relative = path.relative_to(root).as_posix()
            handle.write(f"{sha256_file(path)}  {relative}\n")
    temporary.replace(output)
    print(f"manifest_files={len(files)} manifest_sha256={sha256_file(output)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
