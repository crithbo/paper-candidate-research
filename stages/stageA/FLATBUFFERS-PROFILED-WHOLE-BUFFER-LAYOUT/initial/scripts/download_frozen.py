"""Download frozen public artifacts into the assignment directory and verify them."""

from __future__ import annotations

import hashlib
import os
from pathlib import Path
from urllib.request import Request, urlopen


ROOT = Path(__file__).resolve().parents[1]
ARTIFACTS = [
    {
        "url": "https://github.com/google/flatbuffers/archive/7e163021e59cca4f8e1e35a7c828b5c6b7915953.zip",
        "path": ROOT / "sources" / "flatbuffers-7e163021e59cca4f8e1e35a7c828b5c6b7915953.zip",
        "size": None,
        "sha256": None,
    },
    {
        "url": "https://github.com/google/flatbuffers/releases/download/v25.12.19/Windows.flatc.binary.zip",
        "path": ROOT / "toolchain" / "Windows.flatc.binary-v25.12.19.zip",
        "size": 1_412_094,
        "sha256": "fff9445c9db907227bc64b54cc98743084c4949282aa4e576cff6a955724ddc8",
    },
    {
        "url": "https://github.com/mstorsjo/llvm-mingw/releases/download/20260616/llvm-mingw-20260616-ucrt-x86_64.zip",
        "path": ROOT / "toolchain" / "llvm-mingw-20260616-ucrt-x86_64.zip",
        "size": 187_504_083,
        "sha256": "b9b68a4d276e16fa25802aaba458e4638f64b3884c290aaccdc2d87083b6ca35",
    },
    {
        "url": "https://raw.githubusercontent.com/tensorflow/tflite-micro/18b9e6f2a8c5a9518e588f59c2ba16ef7ef9d551/LICENSE",
        "path": ROOT
        / "sources"
        / "tflite-micro-18b9e6f2a8c5a9518e588f59c2ba16ef7ef9d551"
        / "LICENSE",
        "size": 11_358,
        "sha256": None,
    },
    {
        "url": "https://raw.githubusercontent.com/tensorflow/tflite-micro/18b9e6f2a8c5a9518e588f59c2ba16ef7ef9d551/tensorflow/compiler/mlir/lite/schema/schema.fbs",
        "path": ROOT
        / "sources"
        / "tflite-micro-18b9e6f2a8c5a9518e588f59c2ba16ef7ef9d551"
        / "schema.fbs",
        "size": 45_203,
        "sha256": None,
    },
]


def hash_file(path: Path) -> tuple[int, str]:
    digest = hashlib.sha256()
    size = 0
    with path.open("rb") as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b""):
            size += len(chunk)
            digest.update(chunk)
    return size, digest.hexdigest()


for artifact in ARTIFACTS:
    destination = artifact["path"]
    expected_size = artifact["size"]
    expected_hash = artifact["sha256"]
    destination.parent.mkdir(parents=True, exist_ok=True)

    if destination.exists():
        size, digest = hash_file(destination)
        if (expected_size is None or size == expected_size) and (
            expected_hash is None or digest == expected_hash
        ):
            print(f"EXISTING_OK {size} {digest} {destination}", flush=True)
            continue
        raise SystemExit(f"existing artifact mismatch: {destination}")

    temporary = destination.with_suffix(destination.suffix + ".part")
    if temporary.exists():
        temporary.unlink()
    request = Request(
        artifact["url"], headers={"User-Agent": "stagea-fidelity-preflight"}
    )
    digest_state = hashlib.sha256()
    size = 0
    with urlopen(request, timeout=60) as response, temporary.open("wb") as output:
        while True:
            chunk = response.read(1024 * 1024)
            if not chunk:
                break
            output.write(chunk)
            digest_state.update(chunk)
            size += len(chunk)
            if size % (16 * 1024 * 1024) < len(chunk):
                print(f"PROGRESS {size} {destination.name}", flush=True)
    digest = digest_state.hexdigest()
    if expected_size is not None and size != expected_size:
        raise SystemExit(
            f"size mismatch for {destination}: expected {expected_size}, got {size}"
        )
    if expected_hash is not None and digest != expected_hash:
        raise SystemExit(
            f"hash mismatch for {destination}: expected {expected_hash}, got {digest}"
        )
    os.replace(temporary, destination)
    print(f"DOWNLOADED_OK {size} {digest} {destination}", flush=True)
