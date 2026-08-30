"""Safely extract the three verified archives without global installation."""

from __future__ import annotations

import shutil
import zipfile
from pathlib import Path, PurePosixPath


ROOT = Path(__file__).resolve().parents[1]
ARCHIVES = [
    (
        ROOT / "sources" / "flatbuffers-7e163021e59cca4f8e1e35a7c828b5c6b7915953.zip",
        ROOT / "sources",
    ),
    (ROOT / "toolchain" / "Windows.flatc.binary-v25.12.19.zip", ROOT / "toolchain" / "flatc-v25.12.19"),
    (
        ROOT / "toolchain" / "llvm-mingw-20260616-ucrt-x86_64.zip",
        ROOT / "toolchain",
    ),
]


def validate_members(archive: zipfile.ZipFile) -> None:
    for member in archive.infolist():
        path = PurePosixPath(member.filename.replace("\\", "/"))
        if path.is_absolute() or ".." in path.parts:
            raise SystemExit(f"unsafe zip member: {member.filename}")


for archive_path, destination in ARCHIVES:
    marker = destination / f".{archive_path.name}.extracted"
    if marker.exists():
        print(f"EXISTING_OK {marker}")
        continue
    destination.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(archive_path) as archive:
        validate_members(archive)
        archive.extractall(destination)
        member_count = len(archive.infolist())
    marker.write_text(f"archive={archive_path.name}\nmembers={member_count}\n", encoding="utf-8")
    print(f"EXTRACTED {member_count} {archive_path} -> {destination}")

# Normalize the single-file flatc archive into one stable executable path.
flatc_root = ROOT / "toolchain" / "flatc-v25.12.19"
flatc_candidates = list(flatc_root.rglob("flatc.exe"))
if len(flatc_candidates) != 1:
    raise SystemExit(f"expected one flatc.exe, found {len(flatc_candidates)}")
stable_flatc = flatc_root / "flatc.exe"
if flatc_candidates[0] != stable_flatc:
    shutil.copy2(flatc_candidates[0], stable_flatc)
print(f"FLATC {stable_flatc}")
