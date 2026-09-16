import argparse
import hashlib
import json
import os
import sys
import urllib.request
from pathlib import Path


URL = "https://github.com/mstorsjo/llvm-mingw/releases/download/20260616/llvm-mingw-20260616-ucrt-x86_64.zip"
NAME = "llvm-mingw-20260616-ucrt-x86_64.zip"
EXPECTED_BYTES = 187_504_083
EXPECTED_SHA256 = "b9b68a4d276e16fa25802aaba458e4638f64b3884c290aaccdc2d87083b6ca35"


def emit(**fields):
    print(json.dumps(fields, sort_keys=True))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", required=True)
    args = parser.parse_args()
    root = Path(args.root).resolve()
    downloads = root / "downloads"
    downloads.mkdir(parents=True, exist_ok=True)
    final_path = downloads / NAME
    part_path = downloads / (NAME + ".part")
    if final_path.exists() or part_path.exists():
        emit(status="REFUSED_NOT_CLEAN", final=str(final_path), partial=str(part_path))
        return 20

    sha = hashlib.sha256()
    received = 0
    response_length = None
    try:
        request = urllib.request.Request(URL, headers={"User-Agent": "Codex-S5-Resume1"})
        with urllib.request.urlopen(request, timeout=60) as response, part_path.open("xb") as output:
            header = response.headers.get("Content-Length")
            response_length = int(header) if header is not None else None
            while True:
                block = response.read(1024 * 1024)
                if not block:
                    break
                output.write(block)
                sha.update(block)
                received += len(block)
        actual_sha256 = sha.hexdigest()
        if response_length is not None and response_length != EXPECTED_BYTES:
            emit(status="FAILED_CONTENT_LENGTH", expected_bytes=EXPECTED_BYTES,
                 response_length=response_length, received_bytes=received,
                 sha256=actual_sha256, partial=str(part_path))
            return 2
        if received != EXPECTED_BYTES:
            emit(status="FAILED_BYTE_COUNT", expected_bytes=EXPECTED_BYTES,
                 response_length=response_length, received_bytes=received,
                 sha256=actual_sha256, partial=str(part_path))
            return 3
        if actual_sha256 != EXPECTED_SHA256:
            emit(status="FAILED_SHA256", expected_bytes=EXPECTED_BYTES,
                 received_bytes=received, expected_sha256=EXPECTED_SHA256,
                 sha256=actual_sha256, partial=str(part_path))
            return 4
        os.replace(part_path, final_path)
        emit(status="VERIFIED", expected_bytes=EXPECTED_BYTES,
             received_bytes=received, sha256=actual_sha256, path=str(final_path))
        return 0
    except Exception as exc:
        if part_path.exists():
            received = part_path.stat().st_size
            actual_sha256 = hashlib.sha256(part_path.read_bytes()).hexdigest()
        else:
            actual_sha256 = None
        emit(status="FAILED_NETWORK", exception_type=type(exc).__name__,
             exception=str(exc), expected_bytes=EXPECTED_BYTES,
             response_length=response_length, received_bytes=received,
             sha256=actual_sha256, partial=str(part_path))
        return 5


if __name__ == "__main__":
    sys.exit(main())

