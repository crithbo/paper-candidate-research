#!/usr/bin/env python3
"""Fail closed when a Git snapshot contains local resources or large binaries."""

from __future__ import annotations

import os
from pathlib import Path
import subprocess
import sys


MAX_TRACKED_BYTES = 50 * 1024 * 1024
FORBIDDEN_SEGMENTS = {
    "resources",
    "cache",
    ".cache",
    "downloads",
    "archives",
    "build",
    "tmp",
    "env",
    "__pycache__",
}
FORBIDDEN_EXTENSIONS = {
    ".7z",
    ".a",
    ".bin",
    ".dll",
    ".dylib",
    ".exe",
    ".gz",
    ".lib",
    ".o",
    ".obj",
    ".pdb",
    ".pyd",
    ".pyc",
    ".rar",
    ".so",
    ".tar",
    ".tgz",
    ".whl",
    ".xz",
    ".zip",
}
SHARED_PATHS = {
    "AGENTS.md",
    "plan.md",
    "registry.yaml",
    "history.md",
}
SHARED_PREFIXES = ("rules/", "templates/", ".agents/skills/")


def git(*args: str) -> bytes:
    return subprocess.check_output(["git", *args])


def tracked_files() -> list[Path]:
    raw = git("ls-files", "-z")
    return [Path(item.decode("utf-8")) for item in raw.split(b"\0") if item]


def changed_from_main() -> list[str]:
    try:
        raw = git("diff", "--name-only", "-z", "origin/main...HEAD")
    except subprocess.CalledProcessError:
        return []
    return [item.decode("utf-8").replace("\\", "/") for item in raw.split(b"\0") if item]


def main() -> int:
    errors: list[str] = []
    for path in tracked_files():
        posix = path.as_posix()
        lowered_parts = {part.lower() for part in path.parts}
        if lowered_parts & FORBIDDEN_SEGMENTS:
            errors.append(f"forbidden resource path is tracked: {posix}")
        if path.suffix.lower() in FORBIDDEN_EXTENSIONS:
            errors.append(f"forbidden binary/archive is tracked: {posix}")
        if path.exists() and path.stat().st_size > MAX_TRACKED_BYTES:
            errors.append(f"tracked file exceeds 50 MiB: {posix}")

    branch = os.environ.get("GITHUB_HEAD_REF") or os.environ.get("GITHUB_REF_NAME", "")
    if branch.startswith("exec/"):
        for name in changed_from_main():
            if name in SHARED_PATHS or name.startswith(SHARED_PREFIXES):
                errors.append(f"execution branch modified shared control path: {name}")

    if errors:
        print("repository snapshot rejected:", file=sys.stderr)
        for error in errors:
            print(f"- {error}", file=sys.stderr)
        return 1

    print("repository snapshot safety checks passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

