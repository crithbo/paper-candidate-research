#!/usr/bin/env python3
"""Fetch only allowlisted LLVM headers from exact official GitHub commits.

The GitHub Contents API returns both bytes and the authoritative Git blob SHA.
No system installation, credential helper, or global environment mutation is
performed. Outputs are confined to this resume1 tree.
"""

from __future__ import annotations

import base64
import hashlib
import json
import pathlib
import urllib.parse
import urllib.request
import urllib.error


ROOT = pathlib.Path(__file__).resolve().parents[1]
DEST = ROOT / "inputs" / "upstream_sources"
MANIFEST = ROOT / "inputs" / "PINNED_HEADER_MANIFEST.tsv"

VERSIONS = {
    "release": "ca7933e47d3a3451d81e72ac174dcb5aa28b59d1",
    "cutoff-main": "a1194be1baefa99d20a09bd04b16056be0ab7225",
}
PATHS = [
    "LICENSE.TXT",
    "llvm/include/llvm/Bitstream/BitCodes.h",
    "llvm/include/llvm/Bitcode/BitcodeWriter.h",
    "llvm/include/llvm/Bitcode/BitcodeReader.h",
]


def git_blob_sha1(data: bytes) -> str:
    prefix = f"blob {len(data)}\0".encode("ascii")
    return hashlib.sha1(prefix + data).hexdigest()


def fetch(version: str, commit: str, path: str) -> dict[str, str | int]:
    quoted_path = urllib.parse.quote(path, safe="/")
    url = (
        "https://api.github.com/repos/llvm/llvm-project/contents/"
        f"{quoted_path}?ref={commit}"
    )
    request = urllib.request.Request(
        url,
        headers={
            "Accept": "application/vnd.github+json",
            "User-Agent": "LLVM-BITCODE-ABBREV-PLANNER-StageA",
            "X-GitHub-Api-Version": "2022-11-28",
        },
    )
    route = "GITHUB_CONTENTS_API_WITH_GIT_BLOB_VERIFICATION"
    accepted_url = url
    try:
        with urllib.request.urlopen(request, timeout=60) as response:
            payload = json.load(response)
        if payload.get("type") != "file" or payload.get("encoding") != "base64":
            raise RuntimeError(f"unexpected GitHub payload for {version}:{path}")
        data = base64.b64decode(payload["content"], validate=False)
        if len(data) != int(payload["size"]):
            raise RuntimeError(f"size mismatch for {version}:{path}")
        blob = git_blob_sha1(data)
        if blob != payload["sha"]:
            raise RuntimeError(f"Git blob mismatch for {version}:{path}")
    except urllib.error.HTTPError as error:
        if error.code not in (403, 429):
            raise
        raw_url = (
            "https://raw.githubusercontent.com/llvm/llvm-project/"
            f"{commit}/{quoted_path}"
        )
        gitiles_url = (
            "https://llvm.googlesource.com/llvm-project/+/"
            f"{commit}/{quoted_path}?format=TEXT"
        )
        raw_request = urllib.request.Request(
            raw_url, headers={"User-Agent": "LLVM-BITCODE-ABBREV-PLANNER-StageA"}
        )
        mirror_request = urllib.request.Request(
            gitiles_url, headers={"User-Agent": "LLVM-BITCODE-ABBREV-PLANNER-StageA"}
        )
        with urllib.request.urlopen(raw_request, timeout=60) as response:
            data = response.read()
        with urllib.request.urlopen(mirror_request, timeout=60) as response:
            mirror_data = base64.b64decode(response.read(), validate=False)
        if data != mirror_data:
            raise RuntimeError(f"official exact-commit route mismatch for {version}:{path}")
        blob = git_blob_sha1(data)
        route = "GITHUB_RAW_PLUS_LLVM_GITILES_BYTE_EQUAL"
        accepted_url = raw_url + " | " + gitiles_url
    target = DEST / version / pathlib.PurePosixPath(path)
    target.parent.mkdir(parents=True, exist_ok=True)
    target.write_bytes(data)
    return {
        "version": version,
        "commit": commit,
        "path": path,
        "bytes": len(data),
        "sha256": hashlib.sha256(data).hexdigest(),
        "git_blob_sha1": blob,
        "license": "Apache-2.0 WITH LLVM-exception",
        "route": route,
        "url": accepted_url,
    }


def main() -> int:
    rows = [
        fetch(version, commit, path)
        for version, commit in VERSIONS.items()
        for path in PATHS
    ]
    fields = [
        "version", "commit", "path", "bytes", "sha256", "git_blob_sha1",
        "license", "route", "url",
    ]
    lines = ["\t".join(fields)]
    lines.extend("\t".join(str(row[field]) for field in fields) for row in rows)
    MANIFEST.parent.mkdir(parents=True, exist_ok=True)
    MANIFEST.write_text("\n".join(lines) + "\n", encoding="utf-8")
    print(json.dumps({"files": len(rows), "bytes": sum(int(r["bytes"]) for r in rows)}))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
