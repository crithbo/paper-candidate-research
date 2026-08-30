"""Resumable HTTPS download with strict byte-count and optional SHA-256 checks.

The destination is replaced only after validation. A server that ignores a Range
request causes a clean restart, never concatenation of two complete responses.
"""

from __future__ import annotations

import argparse
import hashlib
import os
from pathlib import Path
import re
import time
import urllib.request


def sha256(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            digest.update(block)
    return digest.hexdigest().upper()


def download(url: str, destination: Path, expected_size: int | None, expected_sha: str | None) -> None:
    part = destination.with_suffix(destination.suffix + ".part")
    destination.parent.mkdir(parents=True, exist_ok=True)
    if destination.exists():
        size = destination.stat().st_size
        digest = sha256(destination)
        if (expected_size is None or size == expected_size) and (expected_sha is None or digest == expected_sha):
            print(f"VERIFIED_EXISTING bytes={size} sha256={digest} path={destination}")
            return

    total = expected_size
    for attempt in range(1, 9):
        offset = part.stat().st_size if part.exists() else 0
        headers = {"User-Agent": "Codex-StageA-Parquet/1.0", "Accept-Encoding": "identity"}
        if offset:
            headers["Range"] = f"bytes={offset}-"
        request = urllib.request.Request(url, headers=headers)
        try:
            with urllib.request.urlopen(request, timeout=60) as response:
                status = getattr(response, "status", 200)
                content_range = response.headers.get("Content-Range")
                content_length = response.headers.get("Content-Length")
                if offset and status != 206:
                    part.unlink(missing_ok=True)
                    offset = 0
                elif offset:
                    match = re.fullmatch(r"bytes (\d+)-(\d+)/(\d+)", content_range or "")
                    if not match or int(match.group(1)) != offset:
                        raise RuntimeError(f"invalid Content-Range for resume: {content_range!r}")
                    total = total or int(match.group(3))
                elif content_length:
                    total = total or int(content_length)

                mode = "ab" if offset and status == 206 else "wb"
                with part.open(mode) as stream:
                    while True:
                        block = response.read(1024 * 1024)
                        if not block:
                            break
                        stream.write(block)
                    stream.flush()
                    os.fsync(stream.fileno())
        except Exception as error:
            print(f"RETRY attempt={attempt} offset={offset} error={type(error).__name__}:{error}")
            time.sleep(min(attempt, 3))
            continue

        actual_size = part.stat().st_size
        if total is not None and actual_size < total:
            print(f"RETRY attempt={attempt} incomplete={actual_size}/{total}")
            time.sleep(min(attempt, 3))
            continue
        if total is not None and actual_size > total:
            raise RuntimeError(f"byte count exceeded expected total: {actual_size}>{total}")
        if expected_size is not None and actual_size != expected_size:
            raise RuntimeError(f"byte count mismatch: actual={actual_size} expected={expected_size}")
        digest = sha256(part)
        if expected_sha is not None and digest != expected_sha:
            raise RuntimeError(f"SHA-256 mismatch: actual={digest} expected={expected_sha}")
        os.replace(part, destination)
        print(f"DOWNLOADED bytes={actual_size} sha256={digest} path={destination}")
        return
    raise RuntimeError(f"download did not close after 8 bounded attempts: {url}")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("url")
    parser.add_argument("destination", type=Path)
    parser.add_argument("--size", type=int)
    parser.add_argument("--sha256", type=str)
    args = parser.parse_args()
    expected_sha = args.sha256.upper() if args.sha256 else None
    download(args.url, args.destination, args.size, expected_sha)


if __name__ == "__main__":
    main()

