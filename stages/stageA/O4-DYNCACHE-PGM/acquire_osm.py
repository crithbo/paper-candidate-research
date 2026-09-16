#!/usr/bin/env python3
"""Acquire one contract-locked OpenStreetMap replication diff."""

from __future__ import annotations

import argparse
import gzip
import hashlib
import json
import urllib.request
import xml.etree.ElementTree as ET
from pathlib import Path


EXPECTED_URL = "https://planet.openstreetmap.org/replication/minute/007/235/045.osc.gz"
EXPECTED_LENGTH = 38_400


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--url", required=True)
    parser.add_argument("--output", required=True, type=Path)
    args = parser.parse_args()

    if args.url != EXPECTED_URL:
        raise SystemExit(f"refusing non-contract URL: {args.url}")

    request = urllib.request.Request(args.url, headers={"User-Agent": "O4-PDEC-StageA/1.0"})
    with urllib.request.urlopen(request, timeout=30) as response:
        payload = response.read()
        status = response.status
        reported_length = response.headers.get("Content-Length")

    if status != 200:
        raise SystemExit(f"HTTP status {status}")
    if len(payload) != EXPECTED_LENGTH:
        raise SystemExit(f"content length {len(payload)} != frozen {EXPECTED_LENGTH}")
    if reported_length is not None and int(reported_length) != EXPECTED_LENGTH:
        raise SystemExit(f"reported content length {reported_length} != frozen {EXPECTED_LENGTH}")

    with gzip.GzipFile(fileobj=__import__("io").BytesIO(payload)) as stream:
        root = ET.parse(stream).getroot()
    if root.tag != "osmChange":
        raise SystemExit(f"unexpected XML root: {root.tag}")

    args.output.parent.mkdir(parents=True, exist_ok=True)
    args.output.write_bytes(payload)
    record = {
        "bytes": len(payload),
        "sha256": hashlib.sha256(payload).hexdigest(),
        "url": args.url,
        "xml_root": root.tag,
    }
    print(json.dumps(record, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
