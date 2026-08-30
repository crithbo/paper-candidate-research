#!/usr/bin/env python3
"""One-shot verified downloader for the frozen Stage A bootstrap dependencies."""

from __future__ import annotations

import argparse
import hashlib
import json
import os
import urllib.request
from pathlib import Path


ASSETS = {
    "cmake": {
        "url": "https://files.pythonhosted.org/packages/7c/d0/73cae88d8c25973f2465d5a4457264f95617c16ad321824ed4c243734511/cmake-4.1.0-py3-none-win_amd64.whl",
        "name": "cmake-4.1.0-py3-none-win_amd64.whl",
        "bytes": 37_551_115,
        "sha256": "76e8e7d80a1a9bb5c7ec13ec8da961a8c5a997247f86a08b29f0c2946290c461",
    },
    "ninja": {
        "url": "https://files.pythonhosted.org/packages/5b/10/9b8fe9ac004847490cc7b54896124c01ce2d87d95dc60aabd0b8591addff/ninja-1.11.1.4-py3-none-win_amd64.whl",
        "name": "ninja-1.11.1.4-py3-none-win_amd64.whl",
        "bytes": 296_461,
        "sha256": "4617b3c12ff64b611a7d93fd9e378275512bb36eff8babff7c83f5116b4f8d66",
    },
}


def digest(path: Path) -> str:
    h = hashlib.sha256()
    with path.open("rb") as stream:
        for block in iter(lambda: stream.read(1024 * 1024), b""):
            h.update(block)
    return h.hexdigest()


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("asset", choices=sorted(ASSETS))
    parser.add_argument("destination", type=Path)
    args = parser.parse_args()
    spec = ASSETS[args.asset]
    args.destination.mkdir(parents=True, exist_ok=True)
    final = args.destination / spec["name"]
    partial = final.with_suffix(final.suffix + ".part")
    if final.exists() or partial.exists():
        print(json.dumps({"status": "REFUSED_NON_CLEAN", "path": str(final), "partial": str(partial)}))
        return 20
    received = 0
    h = hashlib.sha256()
    try:
        request = urllib.request.Request(spec["url"], headers={"User-Agent": "Codex-S5-R2A"})
        with urllib.request.urlopen(request, timeout=60) as response, partial.open("xb") as output:
            response_length = response.headers.get("Content-Length")
            for block in iter(lambda: response.read(1024 * 1024), b""):
                output.write(block)
                h.update(block)
                received += len(block)
        actual = h.hexdigest()
        if received != spec["bytes"] or actual != spec["sha256"]:
            print(json.dumps({"status": "FAILED_GATE", "asset": args.asset, "received": received,
                              "expected_bytes": spec["bytes"], "sha256": actual,
                              "expected_sha256": spec["sha256"], "response_length": response_length}, sort_keys=True))
            return 3
        os.replace(partial, final)
        print(json.dumps({"status": "VERIFIED", "asset": args.asset, "bytes": received,
                          "sha256": digest(final), "path": str(final)}, sort_keys=True))
        return 0
    except Exception as exc:
        actual = digest(partial) if partial.exists() else None
        print(json.dumps({"status": "FAILED_NETWORK", "asset": args.asset,
                          "exception_type": type(exc).__name__, "exception": str(exc),
                          "received": partial.stat().st_size if partial.exists() else received,
                          "sha256": actual}, sort_keys=True))
        return 5


if __name__ == "__main__":
    raise SystemExit(main())
