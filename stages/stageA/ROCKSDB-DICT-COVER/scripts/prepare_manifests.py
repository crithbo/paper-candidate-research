#!/usr/bin/env python3
"""Acquire and freeze the 20 preregistered natural KV manifests.

This script is preparation-only. It does not run RocksDB, a selector, a trainer,
or any claim-bearing measurement. Downloads are attempted once and never retried
inside the script.
"""

from __future__ import annotations

import gzip
import hashlib
import json
import os
import struct
import sys
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
RAW_DIR = ROOT / "inputs" / "raw"
MANIFEST_DIR = ROOT / "inputs" / "manifests"
TARGET_PAYLOAD_BYTES = 4 * 1024 * 1024
USER_AGENT = "ROCKSDB-DICT-COVER-StageA/1.0"

NVD_YEARS = list(range(2015, 2025))
PYPI_PACKAGES = [
    "boto3",
    "botocore",
    "django",
    "pandas",
    "numpy",
    "scipy",
    "tensorflow",
    "torch",
    "matplotlib",
    "scikit-learn",
]


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


def canonical_json(value: object) -> bytes:
    return json.dumps(
        value, sort_keys=True, separators=(",", ":"), ensure_ascii=False
    ).encode("utf-8")


def download_once(url: str, destination: Path) -> dict[str, object]:
    if destination.exists():
        raise RuntimeError(f"refusing to overwrite existing raw asset: {destination}")
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
    with urllib.request.urlopen(request, timeout=120) as response:
        expected = response.headers.get("Content-Length")
        expected_size = int(expected) if expected is not None else None
        destination.parent.mkdir(parents=True, exist_ok=True)
        observed = 0
        with destination.open("xb") as handle:
            while True:
                chunk = response.read(1024 * 1024)
                if not chunk:
                    break
                handle.write(chunk)
                observed += len(chunk)
        if expected_size is not None and observed != expected_size:
            raise RuntimeError(
                f"short download for {url}: observed={observed} expected={expected_size}"
            )
        return {
            "url": url,
            "http_status": response.status,
            "content_length_header": expected_size,
            "observed_bytes": observed,
            "last_modified": response.headers.get("Last-Modified"),
            "etag": response.headers.get("ETag"),
            "raw_sha256": sha256_file(destination),
        }


def bounded_hash_sample(records: list[tuple[bytes, bytes]]) -> list[tuple[bytes, bytes]]:
    ranked = sorted(records, key=lambda item: hashlib.sha256(item[0]).digest())
    selected: list[tuple[bytes, bytes]] = []
    payload = 0
    for key, value in ranked:
        record_bytes = len(key) + len(value)
        if selected and payload + record_bytes > TARGET_PAYLOAD_BYTES:
            break
        selected.append((key, value))
        payload += record_bytes
    return sorted(selected, key=lambda item: item[0])


def write_manifest(path: Path, records: list[tuple[bytes, bytes]]) -> dict[str, object]:
    if not records:
        raise RuntimeError(f"empty record set for {path.name}")
    keys = [key for key, _ in records]
    if keys != sorted(keys) or len(keys) != len(set(keys)):
        raise RuntimeError(f"manifest key order/uniqueness failure for {path.name}")
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("xb") as handle:
        handle.write(b"KVMAN1\0")
        handle.write(struct.pack("<Q", len(records)))
        for key, value in records:
            handle.write(struct.pack("<II", len(key), len(value)))
            handle.write(key)
            handle.write(value)
    return {
        "manifest_file": path.relative_to(ROOT).as_posix(),
        "manifest_sha256": sha256_file(path),
        "record_count": len(records),
        "logical_key_bytes": sum(len(key) for key, _ in records),
        "logical_value_bytes": sum(len(value) for _, value in records),
        "manifest_file_bytes": path.stat().st_size,
        "first_key_sha256": sha256_bytes(records[0][0]),
        "last_key_sha256": sha256_bytes(records[-1][0]),
    }


def nvd_records(path: Path, year: int) -> list[tuple[bytes, bytes]]:
    with gzip.open(path, "rt", encoding="utf-8") as handle:
        payload = json.load(handle)
    records: list[tuple[bytes, bytes]] = []
    for item in payload["vulnerabilities"]:
        cve = item["cve"]
        key = f"nvd/{year}/{cve['id']}".encode("utf-8")
        records.append((key, canonical_json(cve)))
    return bounded_hash_sample(records)


def pypi_records(path: Path, package: str) -> list[tuple[bytes, bytes]]:
    with path.open("r", encoding="utf-8") as handle:
        payload = json.load(handle)
    info_fields = {
        key: payload["info"].get(key)
        for key in (
            "name",
            "version",
            "summary",
            "license",
            "classifiers",
            "requires_python",
            "project_urls",
        )
    }
    records: list[tuple[bytes, bytes]] = [
        (f"pypi/{package}/@info".encode("utf-8"), canonical_json(info_fields))
    ]
    for version, files in payload["releases"].items():
        for index, artifact in enumerate(files):
            digest = artifact.get("digests", {}).get("sha256", "missing")
            filename = artifact.get("filename", f"record-{index}")
            key = f"pypi/{package}/{version}/{filename}/{digest}".encode("utf-8")
            value = {
                field: artifact.get(field)
                for field in (
                    "comment_text",
                    "digests",
                    "has_sig",
                    "md5_digest",
                    "packagetype",
                    "python_version",
                    "requires_python",
                    "size",
                    "upload_time_iso_8601",
                    "url",
                    "yanked",
                    "yanked_reason",
                )
            }
            records.append((key, canonical_json(value)))
    return bounded_hash_sample(records)


def main() -> int:
    if RAW_DIR.exists() or MANIFEST_DIR.exists():
        raise RuntimeError("input directories already exist; refusing implicit retry/overwrite")

    inventory: dict[str, object] = {
        "schema_version": "rocksdict-natural-manifest-inventory-v1",
        "construction": {
            "format": "KVMAN1 little-endian length-prefixed sorted unique KV",
            "selection": "smallest SHA256(key) records until next record would exceed 4 MiB logical key+value payload; then sort by key",
            "target_payload_bytes": TARGET_PAYLOAD_BYTES,
            "duplicate_policy": "reject",
            "outcome_observed_before_freeze": False,
        },
        "families": {
            "NVD_JSON_2_0": {
                "authority": "NIST National Vulnerability Database official data feeds",
                "license": "NVD data is not subject to copyright in the United States; source attribution retained",
                "license_url": "https://nvd.nist.gov/general/FAQ-Sections/General-FAQs",
            },
            "PYPI_JSON_API": {
                "authority": "Python Package Index official JSON API",
                "license": "package-declared open-source license metadata retained per manifest; this pilot stores registry metadata, not distributions",
                "api_doc_url": "https://docs.pypi.org/api/json/",
            },
        },
        "manifests": [],
    }

    for year in NVD_YEARS:
        name = f"nvd-{year}"
        raw = RAW_DIR / f"{name}.json.gz"
        url = f"https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-{year}.json.gz"
        source = download_once(url, raw)
        built = write_manifest(MANIFEST_DIR / f"{name}.kvman", nvd_records(raw, year))
        inventory["manifests"].append(
            {
                "id": name,
                "family": "NVD_JSON_2_0",
                "source": source,
                "raw_file": raw.relative_to(ROOT).as_posix(),
                "key_schema": "nvd/{year}/{CVE-ID}",
                **built,
            }
        )
        print(f"prepared {name}", flush=True)

    for package in PYPI_PACKAGES:
        name = f"pypi-{package}"
        raw = RAW_DIR / f"{name}.json"
        url = f"https://pypi.org/pypi/{package}/json"
        source = download_once(url, raw)
        built = write_manifest(
            MANIFEST_DIR / f"{name}.kvman", pypi_records(raw, package)
        )
        inventory["manifests"].append(
            {
                "id": name,
                "family": "PYPI_JSON_API",
                "source": source,
                "raw_file": raw.relative_to(ROOT).as_posix(),
                "key_schema": "pypi/{package}/{version}/{filename}/{artifact-sha256}",
                **built,
            }
        )
        print(f"prepared {name}", flush=True)

    inventory_path = ROOT / "inputs" / "NATURAL_MANIFEST_INVENTORY.json"
    inventory_path.write_bytes(canonical_json(inventory) + b"\n")
    print(f"inventory_sha256={sha256_file(inventory_path)}")
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as error:
        print(f"PRECLAIM_PREPARATION_FAILURE: {error}", file=sys.stderr)
        raise
