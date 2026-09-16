from __future__ import annotations

import argparse
import hashlib
import json
import tarfile
from pathlib import Path


DECISIVE = [
    "LICENSE.TXT",
    "llvm/CMakeLists.txt",
    "clang/CMakeLists.txt",
    "llvm/lib/CodeGen/AsmPrinter/DwarfDebug.cpp",
    "llvm/lib/CodeGen/LiveDebugValues/LiveDebugValues.cpp",
    "llvm/lib/Target/X86/X86RegisterInfo.cpp",
    "llvm/lib/Target/X86/X86FrameLowering.cpp",
]


def digest_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def digest_path(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest().upper()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("archive", type=Path)
    parser.add_argument("root", type=Path)
    parser.add_argument("--prefix", required=True)
    args = parser.parse_args()

    rows = []
    with tarfile.open(args.archive, "r:gz") as bundle:
        for rel in DECISIVE:
            member_name = f"{args.prefix}/{rel}"
            member = bundle.getmember(member_name)
            source = bundle.extractfile(member)
            if source is None:
                raise RuntimeError(f"archive member is not a regular file: {member_name}")
            archive_sha = digest_bytes(source.read())
            extracted = args.root / Path(rel)
            extracted_sha = digest_path(extracted) if extracted.is_file() else None
            rows.append(
                {
                    "path": rel,
                    "bytes": member.size,
                    "archive_sha256": archive_sha,
                    "extracted_sha256": extracted_sha,
                    "match": archive_sha == extracted_sha,
                }
            )
    print(json.dumps({"decisive_files": rows, "all_match": all(r["match"] for r in rows)}, indent=2))
    return 0 if all(r["match"] for r in rows) else 2


if __name__ == "__main__":
    raise SystemExit(main())
