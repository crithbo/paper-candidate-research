#!/usr/bin/env python3
"""Range-fetch a bounded, hash-checked subset of the official MSE 2023 ZIP.

The 3.14 GB archive is too large for the frozen 4 GiB experiment ceiling.  This
script parses the already-fetched central directory, freezes the 50 smallest
non-directory WCNF/XZ members, fetches only their local headers and stored byte
ranges, checks CRC-32, and decompresses each XZ member.  Every HTTP response is
required to be an exact 206 response; reads are bounded by the central-directory
size plus one byte.
"""

from __future__ import annotations

import binascii
import hashlib
import json
import lzma
import pathlib
import struct
import urllib.request


ROOT = pathlib.Path(r"D:\project\writing\reserch\stages\stageA\PB-DELETE-SCHEDULE")
URL = (
    "https://drive.usercontent.google.com/download?"
    "id=1pKuQkuTZr7CO3GXmOGRvrMeLTOaw9Fl6&export=download&confirm=t"
)
ARCHIVE_NAME = "mse23-exact-weighted-benchmarks.zip"
ARCHIVE_BYTES = 3_140_560_006
TAIL_BASE = 3_140_428_934
TAIL_A = ROOT / "toolchain" / "mse23-exact-weighted.tail-3140428934-3140559999.bin"
TAIL_B = ROOT / "toolchain" / "mse23-exact-weighted.tail-last6.bin"
OUT = ROOT / "artifact" / "mse23-exact-weighted-range-subset"
MANIFEST = OUT / "REMOTE_ZIP_SUBSET_MANIFEST.json"
SELECTION_COUNT = 50
PER_MEMBER_CAP = 2 * 1024 * 1024
TOTAL_TRANSFER_CAP = 20 * 1024 * 1024


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def exact_range(start: int, end: int) -> bytes:
    if not (0 <= start <= end < ARCHIVE_BYTES):
        raise ValueError(f"unsafe range {start}-{end}")
    expected = end - start + 1
    if expected > PER_MEMBER_CAP:
        raise ValueError(f"range exceeds per-member cap: {expected}")
    req = urllib.request.Request(URL, headers={"Range": f"bytes={start}-{end}"})
    with urllib.request.urlopen(req, timeout=60) as response:
        status = getattr(response, "status", response.getcode())
        content_range = response.headers.get("Content-Range")
        required = f"bytes {start}-{end}/{ARCHIVE_BYTES}"
        if status != 206 or content_range != required:
            raise RuntimeError(
                f"range gate failed: status={status}, content-range={content_range!r}, "
                f"required={required!r}"
            )
        declared = int(response.headers.get("Content-Length", "-1"))
        if declared != expected:
            raise RuntimeError(f"length header mismatch: {declared} != {expected}")
        data = response.read(expected + 1)
    if len(data) != expected:
        raise RuntimeError(f"range byte mismatch: {len(data)} != {expected}")
    return data


def parse_central_directory() -> tuple[dict, list[dict]]:
    tail = TAIL_A.read_bytes() + TAIL_B.read_bytes()
    eocd_at = tail.rfind(b"PK\x05\x06")
    if eocd_at < 0:
        raise RuntimeError("EOCD not found")
    eocd = struct.unpack_from("<4s4H2LH", tail, eocd_at)
    if eocd[1:3] != (0, 0) or eocd[3] != eocd[4]:
        raise RuntimeError(f"unsupported multi-disk ZIP: {eocd}")
    entry_count, cd_size, cd_start, comment_len = eocd[4], eocd[5], eocd[6], eocd[7]
    if comment_len != 0 or cd_start + cd_size != TAIL_BASE + eocd_at:
        raise RuntimeError("central-directory geometry mismatch")
    pos = cd_start - TAIL_BASE
    entries: list[dict] = []
    for _ in range(entry_count):
        fields = struct.unpack_from("<4s6H3L5H2L", tail, pos)
        if fields[0] != b"PK\x01\x02":
            raise RuntimeError(f"bad central header at absolute offset {TAIL_BASE + pos}")
        name_len, extra_len, comment_len = fields[10], fields[11], fields[12]
        name_bytes = tail[pos + 46 : pos + 46 + name_len]
        name = name_bytes.decode("utf-8")
        entries.append(
            {
                "name": name,
                "flags": fields[3],
                "method": fields[4],
                "crc32": fields[7],
                "compressed_bytes": fields[8],
                "uncompressed_bytes": fields[9],
                "local_header_offset": fields[16],
            }
        )
        pos += 46 + name_len + extra_len + comment_len
    if pos != eocd_at:
        raise RuntimeError(f"central directory end mismatch: {pos} != {eocd_at}")
    meta = {
        "archive_name": ARCHIVE_NAME,
        "official_page": "https://maxsat-evaluations.github.io/2023/benchmarks.html",
        "official_drive_file_id": "1pKuQkuTZr7CO3GXmOGRvrMeLTOaw9Fl6",
        "archive_bytes": ARCHIVE_BYTES,
        "entry_count": entry_count,
        "central_directory_start": cd_start,
        "central_directory_bytes": cd_size,
        "tail_a_sha256": sha256(TAIL_A.read_bytes()),
        "tail_b_sha256": sha256(TAIL_B.read_bytes()),
    }
    return meta, entries


def main() -> None:
    meta, entries = parse_central_directory()
    pool = [
        entry
        for entry in entries
        if entry["name"].endswith(".wcnf.xz")
        and not entry["name"].endswith("/")
        and entry["method"] == 0
        and 0 < entry["compressed_bytes"] <= PER_MEMBER_CAP
    ]
    selected = sorted(pool, key=lambda e: (e["compressed_bytes"], e["name"]))[
        :SELECTION_COUNT
    ]
    if len(selected) != SELECTION_COUNT:
        raise RuntimeError(f"only {len(selected)} bounded members available")
    planned = sum(30 + e["compressed_bytes"] for e in selected)
    if planned > TOTAL_TRANSFER_CAP:
        raise RuntimeError(f"planned transfer {planned} exceeds cap {TOTAL_TRANSFER_CAP}")

    xz_dir = OUT / "xz"
    wcnf_dir = OUT / "wcnf"
    xz_dir.mkdir(parents=True, exist_ok=True)
    wcnf_dir.mkdir(parents=True, exist_ok=True)
    records = []
    transferred = 0
    for rank, entry in enumerate(selected, start=1):
        offset = entry["local_header_offset"]
        header = exact_range(offset, offset + 29)
        transferred += len(header)
        local = struct.unpack("<4s5H3L2H", header)
        if local[0] != b"PK\x03\x04" or local[3] != entry["method"]:
            raise RuntimeError(f"local header mismatch for {entry['name']}")
        name_len, extra_len = local[9], local[10]
        data_start = offset + 30 + name_len + extra_len
        data_end = data_start + entry["compressed_bytes"] - 1
        blob = exact_range(data_start, data_end)
        transferred += len(blob)
        if transferred > TOTAL_TRANSFER_CAP:
            raise RuntimeError("runtime transfer cap exceeded")
        if (binascii.crc32(blob) & 0xFFFFFFFF) != entry["crc32"]:
            raise RuntimeError(f"CRC-32 mismatch for {entry['name']}")
        basename = pathlib.PurePosixPath(entry["name"]).name
        xz_path = xz_dir / basename
        wcnf_path = wcnf_dir / basename.removesuffix(".xz")
        xz_path.write_bytes(blob)
        wcnf = lzma.decompress(blob)
        if not wcnf or b"\x00" in wcnf:
            raise RuntimeError(f"invalid decompressed WCNF payload for {entry['name']}")
        wcnf_path.write_bytes(wcnf)
        records.append(
            {
                "acquisition_rank": rank,
                **entry,
                "data_start": data_start,
                "data_end": data_end,
                "xz_path": xz_path.relative_to(ROOT).as_posix(),
                "xz_sha256": sha256(blob),
                "wcnf_path": wcnf_path.relative_to(ROOT).as_posix(),
                "wcnf_bytes": len(wcnf),
                "wcnf_sha256": sha256(wcnf),
            }
        )

    manifest = {
        "schema_version": "mse23-range-subset-v1",
        "source": meta,
        "selection": {
            "rule": "50 smallest stored .wcnf.xz members by (compressed_bytes, canonical member name)",
            "selection_count": SELECTION_COUNT,
            "per_member_cap": PER_MEMBER_CAP,
            "total_transfer_cap": TOTAL_TRANSFER_CAP,
            "actual_transfer_bytes": transferred,
        },
        "records": records,
    }
    MANIFEST.write_text(json.dumps(manifest, indent=2) + "\n", encoding="utf-8")
    print(f"records={len(records)}")
    print(f"actual_transfer_bytes={transferred}")
    print(f"manifest_sha256={sha256(MANIFEST.read_bytes())}")


if __name__ == "__main__":
    main()
