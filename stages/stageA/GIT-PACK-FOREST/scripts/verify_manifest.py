from __future__ import annotations

import argparse
import hashlib
import json
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
    manifest = root / args.manifest
    expected: dict[str, str] = {}
    parse_errors = []
    for number, line in enumerate(manifest.read_text(encoding="utf-8").splitlines(), start=1):
        if len(line) < 67 or line[64:66] != "  ":
            parse_errors.append({"line": number, "reason": "FORMAT"})
            continue
        digest, relative = line[:64], line[66:]
        if relative in expected:
            parse_errors.append({"line": number, "reason": "DUPLICATE", "path": relative})
            continue
        expected[relative] = digest.upper()
    actual_paths = sorted(
        path.relative_to(root).as_posix()
        for path in root.rglob("*")
        if path.is_file() and path.relative_to(root).as_posix() not in EXCLUDED
    )
    missing = sorted(set(expected) - set(actual_paths))
    unlisted = sorted(set(actual_paths) - set(expected))
    mismatches = []
    total_bytes = 0
    for relative in sorted(set(expected) & set(actual_paths)):
        path = root / Path(relative)
        total_bytes += path.stat().st_size
        actual = sha256_file(path)
        if actual != expected[relative]:
            mismatches.append({"path": relative, "expected": expected[relative], "actual": actual})
    passed = not parse_errors and not missing and not unlisted and not mismatches
    record = {
        "schema_version": "git-pack-forest-manifest-verification-v1",
        "status": "PASS" if passed else "FAIL",
        "manifest": args.manifest,
        "manifest_sha256": sha256_file(manifest),
        "listed_file_count": len(expected),
        "verified_file_count": len(set(expected) & set(actual_paths)),
        "verified_scope_bytes": total_bytes,
        "excluded_from_manifest_to_avoid_circularity": sorted(EXCLUDED),
        "parse_errors": parse_errors,
        "missing": missing,
        "unlisted": unlisted,
        "mismatches": mismatches,
    }
    temporary = root / "MANIFEST_VERIFICATION.json.tmp"
    temporary.write_text(json.dumps(record, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    temporary.replace(root / "MANIFEST_VERIFICATION.json")
    print(json.dumps(record, sort_keys=True))
    return 0 if passed else 2


if __name__ == "__main__":
    raise SystemExit(main())
