#!/usr/bin/env python3
"""Fetch exact official llvm-test-suite archive and safely extract SingleSource."""

from __future__ import annotations

import argparse
import hashlib
import http.client
import json
import pathlib
import shutil
import tarfile
import urllib.request
import time


def sha(path: pathlib.Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            h.update(chunk)
    return h.hexdigest()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--commit", required=True)
    ap.add_argument("--tag", required=True)
    ap.add_argument("--tag-object", required=True)
    ap.add_argument("--output-dir", required=True, type=pathlib.Path)
    ap.add_argument("--max-bytes", type=int, default=1073741824)
    args = ap.parse_args()
    args.output_dir.mkdir(parents=True, exist_ok=True)
    url = f"https://codeload.github.com/llvm/llvm-test-suite/tar.gz/{args.commit}"
    archive = args.output_dir / f"llvm-test-suite-{args.commit}.tar.gz"
    # Codeload can occasionally close a chunked transfer.  Retry the anonymous
    # exact-commit route safely; use Range if honored, otherwise restart the
    # partial file.  A tar integrity check is the completion criterion.
    complete = False
    attempts: list[dict[str, object]] = []
    for attempt in range(1, 7):
        existing = archive.stat().st_size if archive.exists() else 0
        headers = {"User-Agent": "llvm-stagea-corpus-freeze"}
        if existing:
            headers["Range"] = f"bytes={existing}-"
        request = urllib.request.Request(url, headers=headers)
        status = None
        caught = None
        try:
            with urllib.request.urlopen(request, timeout=120) as response:
                status = getattr(response, "status", response.getcode())
                append = existing > 0 and status == 206
                mode = "ab" if append else "wb"
                total = existing if append else 0
                with archive.open(mode) as out:
                    while True:
                        try:
                            chunk = response.read(1024 * 1024)
                        except http.client.IncompleteRead as exc:
                            if exc.partial:
                                out.write(exc.partial)
                                total += len(exc.partial)
                            raise
                        if not chunk:
                            break
                        total += len(chunk)
                        if total > args.max_bytes:
                            raise RuntimeError(f"archive exceeds {args.max_bytes} bytes")
                        out.write(chunk)
        except Exception as exc:  # logged; integrity check below decides retry
            caught = f"{type(exc).__name__}: {exc}"
        integrity = False
        if archive.exists():
            try:
                with tarfile.open(archive, "r:gz") as probe:
                    probe.getmembers()
                integrity = True
            except (tarfile.TarError, EOFError):
                integrity = False
        attempts.append({
            "attempt": attempt, "range_start": existing,
            "http_status": status, "bytes_after": archive.stat().st_size if archive.exists() else 0,
            "exception": caught, "tar_integrity": integrity,
        })
        if integrity:
            complete = True
            break
        time.sleep(min(attempt, 3))
    if not complete:
        raise RuntimeError(f"archive incomplete after retries: {attempts}")

    extract_root = args.output_dir / "llvm-test-suite-selected"
    extract_root.mkdir(parents=True, exist_ok=True)
    extracted: list[dict[str, object]] = []
    with tarfile.open(archive, "r:gz") as bundle:
        members = bundle.getmembers()
        roots = {m.name.split("/", 1)[0] for m in members if "/" in m.name}
        if len(roots) != 1:
            raise RuntimeError(f"ambiguous archive roots: {roots}")
        root = next(iter(roots))
        prefixes = (f"{root}/SingleSource/",)
        exact = {f"{root}/LICENSE.TXT", f"{root}/CMakeLists.txt"}
        for member in members:
            if not member.isfile():
                continue
            if member.name not in exact and not member.name.startswith(prefixes):
                continue
            relative = pathlib.PurePosixPath(member.name).relative_to(root)
            if relative.is_absolute() or ".." in relative.parts:
                raise RuntimeError(f"unsafe archive path {member.name}")
            target = extract_root.joinpath(*relative.parts)
            target.parent.mkdir(parents=True, exist_ok=True)
            source = bundle.extractfile(member)
            if source is None:
                raise RuntimeError(member.name)
            with source, target.open("wb") as out:
                shutil.copyfileobj(source, out)
            extracted.append({
                "path": relative.as_posix(), "bytes": target.stat().st_size,
                "sha256": sha(target),
            })
    license_path = extract_root / "LICENSE.TXT"
    result = {
        "schema": "llvm-test-suite-archive-freeze-v1",
        "repository": "https://github.com/llvm/llvm-test-suite",
        "tag": args.tag,
        "annotated_tag_object": args.tag_object,
        "commit": args.commit,
        "archive_url": url,
        "archive_path": str(archive.resolve()),
        "archive_bytes": archive.stat().st_size,
        "archive_sha256": sha(archive),
        "download_attempts": attempts,
        "license_path": str(license_path.resolve()),
        "license_sha256": sha(license_path),
        "license_spdx": "Apache-2.0 WITH LLVM-exception",
        "extraction_scope": "LICENSE.TXT, root CMakeLists.txt, SingleSource/** regular files only",
        "extracted_files": len(extracted),
        "extracted_bytes": sum(int(row["bytes"]) for row in extracted),
        "extracted_manifest": extracted,
    }
    manifest = args.output_dir / "CORPUS_ARCHIVE_FREEZE.json"
    manifest.write_text(json.dumps(result, indent=2, sort_keys=True) + "\n", encoding="utf-8")
    print(json.dumps({
        "archive_bytes": result["archive_bytes"],
        "archive_sha256": result["archive_sha256"],
        "extracted_files": result["extracted_files"],
        "extracted_bytes": result["extracted_bytes"],
        "manifest": str(manifest),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
