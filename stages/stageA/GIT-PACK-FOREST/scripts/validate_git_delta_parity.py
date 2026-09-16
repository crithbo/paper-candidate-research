from __future__ import annotations

import argparse
import json
from pathlib import Path
import struct
import zlib

from git_pack_lib import (
    ProcessFailure,
    git_text,
    git_native_zlib_compress,
    git_native_zlib_version,
    make_git_2_55_delta,
    read_batch_objects,
    sha256_bytes,
    sha256_file,
    write_json,
)


def parse_entry(pack: bytes, offset: int) -> dict:
    cursor = offset
    first = pack[cursor]
    cursor += 1
    type_code = (first >> 4) & 7
    size = first & 0x0F
    shift = 4
    byte = first
    while byte & 0x80:
        byte = pack[cursor]
        cursor += 1
        size |= (byte & 0x7F) << shift
        shift += 7
    base_header = b""
    if type_code == 6:
        start = cursor
        byte = pack[cursor]
        cursor += 1
        while byte & 0x80:
            byte = pack[cursor]
            cursor += 1
        base_header = pack[start:cursor]
    elif type_code == 7:
        base_header = pack[cursor : cursor + 20]
        cursor += 20
    inflater = zlib.decompressobj()
    raw = inflater.decompress(pack[cursor:])
    if not inflater.eof:
        raise ProcessFailure(f"zlib stream at pack offset {offset} did not terminate")
    compressed_bytes = len(pack[cursor:]) - len(inflater.unused_data)
    if len(raw) != size:
        raise ProcessFailure(f"representation size mismatch at {offset}: {len(raw)} != {size}")
    return {
        "offset": offset,
        "type_code": type_code,
        "representation_size": size,
        "base_header_hex": base_header.hex(),
        "compressed_bytes": compressed_bytes,
        "compressed": pack[cursor : cursor + compressed_bytes],
        "raw": raw,
    }


def verify_offsets(git: Path, repo: Path, index: Path) -> dict[str, dict]:
    rows: dict[str, dict] = {}
    for line in git_text(git, repo, ["verify-pack", "-v", str(index)]).splitlines():
        parts = line.split()
        if len(parts) < 5 or len(parts[0]) != 40:
            continue
        rows[parts[0]] = {
            "offset": int(parts[4]),
            "parent": parts[6] if len(parts) >= 7 else None,
        }
    return rows


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--root", required=True, type=Path)
    parser.add_argument("--git", required=True, type=Path)
    parser.add_argument("--limit", type=int, default=40)
    args = parser.parse_args()
    root = args.root.resolve()
    git = args.git.resolve()
    records = []
    for result_file in sorted((root / "results" / "initial").glob("*.json")):
        if result_file.name == "SUMMARY.json":
            continue
        result = json.loads(result_file.read_text(encoding="utf-8"))
        repo_id = result["repo_id"]
        repo = root / "work" / "repos" / f"{repo_id}.git"
        wanted: list[tuple[str, str, dict]] = []
        for method in result["methods"]:
            if method.get("kind") != "CURRENT_GIT_UNION" or method.get("status"):
                continue
            for base, target in method["validation"]["observed_edges"]:
                wanted.append((base, target, method))
                if len(wanted) >= 2:
                    break
            if len(wanted) >= 2:
                break
        if not wanted:
            continue
        object_ids = sorted({oid for base, target, _ in wanted for oid in (base, target)})
        objects = read_batch_objects(git, repo, object_ids)
        for base, target, method in wanted:
            method_dir = root / "work" / "runs" / repo_id / method["method"]
            packs = list(method_dir.glob("*.pack"))
            indexes = list(method_dir.glob("*.idx"))
            if len(packs) != 1 or len(indexes) != 1:
                raise ProcessFailure(f"expected one Git pack/index in {method_dir}")
            offsets = verify_offsets(git, repo, indexes[0])
            if offsets[target]["parent"] != base:
                raise ProcessFailure(f"verify-pack parent drift for {base}->{target}")
            entry = parse_entry(packs[0].read_bytes(), offsets[target]["offset"])
            expected = entry.pop("raw")
            expected_compressed = entry.pop("compressed")
            actual = make_git_2_55_delta(objects[base]["content"], objects[target]["content"])
            actual_compressed = git_native_zlib_compress(actual, 6)
            records.append(
                {
                    "repo_id": repo_id,
                    "method": method["method"],
                    "base": base,
                    "target": target,
                    "base_bytes": len(objects[base]["content"]),
                    "target_bytes": len(objects[target]["content"]),
                    "git_delta_bytes": len(expected),
                    "port_delta_bytes": len(actual),
                    "git_delta_sha256": sha256_bytes(expected),
                    "port_delta_sha256": sha256_bytes(actual),
                    "byte_exact": actual == expected,
                    "zlib_byte_exact": actual_compressed == expected_compressed,
                    "git_compressed_sha256": sha256_bytes(expected_compressed),
                    "port_compressed_sha256": sha256_bytes(actual_compressed),
                    **entry,
                }
            )
            if len(records) >= args.limit:
                break
        if len(records) >= args.limit:
            break
    result = {
        "schema_version": "git-2.55-diff-delta-parity-v1",
        "git_version": git_text(git, root, ["--version"]).strip(),
        "source_commit": "e9019fcafe0040228b8631c30f97ae1adb61bcdc",
        "source_diff_delta_sha256": sha256_file(root / "tools" / "git-source-v2.55.0" / "diff-delta.c"),
        "comparison_count": len(records),
        "byte_exact_count": sum(record["byte_exact"] for record in records),
        "all_byte_exact": bool(records) and all(record["byte_exact"] for record in records),
        "zlib_version": git_native_zlib_version(),
        "zlib_byte_exact_count": sum(record["zlib_byte_exact"] for record in records),
        "all_zlib_byte_exact": bool(records) and all(record["zlib_byte_exact"] for record in records),
        "records": records,
    }
    write_json(root / "results" / "GIT_NATIVE_CODEC_PARITY.json", result)
    print(json.dumps(result, indent=2, sort_keys=True))
    return 0 if result["all_byte_exact"] and result["all_zlib_byte_exact"] else 2


if __name__ == "__main__":
    raise SystemExit(main())
