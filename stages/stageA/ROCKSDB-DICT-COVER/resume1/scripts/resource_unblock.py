#!/usr/bin/env python3
"""Resource-only acquisition and readability validation for ROCKSDB-DICT-COVER.

This program is scoped to RESOURCE-UNBLOCK-L2-20260810-ROCKSDB-R1.  It does
not invoke RocksDB, Zstd training, SST construction, a candidate, or a baseline.
Every network attempt begins at byte zero and is capped by the authorization.
"""

from __future__ import annotations

import gzip
import hashlib
import importlib.util
import json
import os
import shutil
import sys
import time
import urllib.request
from datetime import datetime, timezone
from pathlib import Path
from typing import Any


RESUME = Path(__file__).resolve().parents[1]
TOPIC = RESUME.parent
RAW = RESUME / "inputs" / "raw"
MANIFESTS = RESUME / "inputs" / "manifests"
ATTEMPTS = RESUME / "acquisition_attempts.jsonl"
BUDGET = RESUME / "network_budget.json"
RECORD = RESUME / "RESOURCE_ACQUISITION_RECORD.json"
INVENTORY = RESUME / "inputs" / "NATURAL_MANIFEST_INVENTORY.json"
CONVERTER = TOPIC / "scripts" / "prepare_manifests.py"
CONVERTER_SHA = "E93D8D7A7AB47B2A65751064F5114FCD9E919813F2A7F810123FDCAF7FD7E244"
NETWORK_LIMIT = 1_073_741_824
MAX_ATTEMPTS = 3
USER_AGENT = "ROCKSDB-DICT-COVER-ResourceUnblock/1.0"

REUSED = {
    "nvd-2015": {
        "source": TOPIC / "inputs" / "raw" / "nvd-2015.json.gz",
        "url": "https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-2015.json.gz",
        "bytes": 4_190_045,
        "sha256": "36D62C93A5F15ACDCBA69513F3CA86D44A35E10ACD44258E5A49AFE1EB24B0C0",
    },
    "nvd-2016": {
        "source": TOPIC / "inputs" / "raw" / "nvd-2016.json.gz",
        "url": "https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-2016.json.gz",
        "bytes": 5_159_096,
        "sha256": "E3A4B0B68C30065FB24417DDF1240E8149B3F99F433F4A262B776090A24E930F",
    },
}

NVD = [
    {
        "id": f"nvd-{year}",
        "family": "NVD_JSON_2_0",
        "year": year,
        "url": f"https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-{year}.json.gz",
        "filename": f"nvd-{year}.json.gz",
        "hard_expected_bytes": 7_706_425 if year == 2017 else None,
    }
    for year in range(2017, 2025)
]

PACKAGES = [
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

PYPI = [
    {
        "id": f"pypi-{package}",
        "family": "PYPI_JSON_API",
        "package": package,
        "url": f"https://pypi.org/pypi/{package}/json",
        "filename": f"pypi-{package}.json",
        "hard_expected_bytes": None,
    }
    for package in PACKAGES
]


def utc_now() -> str:
    return datetime.now(timezone.utc).isoformat(timespec="seconds").replace("+00:00", "Z")


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


def write_json(path: Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    temp = path.with_suffix(path.suffix + ".tmp")
    temp.write_text(
        json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=False) + "\n",
        encoding="utf-8",
    )
    os.replace(temp, path)


def append_attempt(value: dict[str, Any]) -> None:
    ATTEMPTS.parent.mkdir(parents=True, exist_ok=True)
    with ATTEMPTS.open("a", encoding="utf-8", newline="\n") as handle:
        handle.write(json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n")


def read_budget() -> dict[str, Any]:
    if BUDGET.exists():
        return json.loads(BUDGET.read_text(encoding="utf-8"))
    return {"network_limit_bytes": NETWORK_LIMIT, "network_bytes_observed": 0, "attempts": 0}


def validate_nvd(path: Path, year: int) -> dict[str, Any]:
    with gzip.open(path, "rt", encoding="utf-8") as handle:
        payload = json.load(handle)
    vulnerabilities = payload.get("vulnerabilities")
    if not isinstance(vulnerabilities, list) or not vulnerabilities:
        raise RuntimeError(f"NVD schema failure {year}: vulnerabilities array absent or empty")
    bad = 0
    first_id = None
    last_id = None
    for item in vulnerabilities:
        cve = item.get("cve") if isinstance(item, dict) else None
        cve_id = cve.get("id") if isinstance(cve, dict) else None
        if not isinstance(cve_id, str) or not cve_id.startswith("CVE-"):
            bad += 1
        if first_id is None:
            first_id = cve_id
        last_id = cve_id
    if bad:
        raise RuntimeError(f"NVD schema failure {year}: {bad} entries lack cve.id")
    return {
        "gzip_integrity": "PASS_FULL_STREAM",
        "json_schema": "PASS_NVD_CVE_JSON_2_0_REQUIRED_FIELDS",
        "vulnerability_count": len(vulnerabilities),
        "first_cve_id": first_id,
        "last_cve_id": last_id,
        "format": payload.get("format"),
        "version": payload.get("version"),
        "timestamp": payload.get("timestamp"),
        "license_status": "NIST_NVD_US_GOVERNMENT_DATA__ATTRIBUTION_RETAINED",
        "license_url": "https://nvd.nist.gov/general/FAQ-Sections/General-FAQs",
    }


def validate_pypi(path: Path, package: str) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as handle:
        payload = json.load(handle)
    info = payload.get("info")
    releases = payload.get("releases")
    urls = payload.get("urls")
    if not isinstance(info, dict) or not isinstance(releases, dict) or not isinstance(urls, list):
        raise RuntimeError(f"PyPI schema failure {package}: info/releases/urls types")
    observed_name = str(info.get("name", ""))
    if observed_name.casefold().replace("_", "-") != package.casefold().replace("_", "-"):
        raise RuntimeError(f"PyPI name mismatch {package}: observed {observed_name!r}")
    classifiers = info.get("classifiers") if isinstance(info.get("classifiers"), list) else []
    osi = [item for item in classifiers if isinstance(item, str) and "License :: OSI Approved" in item]
    license_value = info.get("license")
    if not license_value and not osi:
        raise RuntimeError(f"PyPI license metadata absent for {package}")
    artifact_count = sum(len(files) for files in releases.values() if isinstance(files, list))
    return {
        "gzip_integrity": "NOT_APPLICABLE",
        "json_schema": "PASS_PYPI_OFFICIAL_JSON_REQUIRED_FIELDS",
        "info_name": observed_name,
        "info_version": info.get("version"),
        "release_count": len(releases),
        "artifact_record_count": artifact_count,
        "license_value": license_value,
        "osi_license_classifiers": osi,
        "license_status": "PASS_DECLARED_LICENSE_METADATA_PRESENT",
        "api_documentation": "https://docs.pypi.org/api/json/",
    }


def validate_asset(path: Path, entry: dict[str, Any]) -> dict[str, Any]:
    if entry["family"] == "NVD_JSON_2_0":
        return validate_nvd(path, int(entry["year"]))
    return validate_pypi(path, str(entry["package"]))


def clean_download(entry: dict[str, Any]) -> dict[str, Any]:
    destination = RAW / str(entry["filename"])
    metadata_path = destination.with_suffix(destination.suffix + ".source.json")
    if destination.exists() and metadata_path.exists():
        metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
        if metadata.get("url") != entry["url"]:
            raise RuntimeError(f"existing asset URL mismatch: {entry['id']}")
        observed = destination.stat().st_size
        if observed != metadata.get("actual_bytes") or sha256_file(destination) != metadata.get("raw_sha256"):
            raise RuntimeError(f"existing validated asset changed: {entry['id']}")
        metadata["readability"] = validate_asset(destination, entry)
        return metadata
    if destination.exists() or metadata_path.exists():
        raise RuntimeError(f"orphaned unvalidated asset state: {entry['id']}")

    prior_attempts = 0
    if ATTEMPTS.exists():
        for line in ATTEMPTS.read_text(encoding="utf-8").splitlines():
            if not line.strip():
                continue
            prior = json.loads(line)
            if prior.get("id") == entry["id"]:
                prior_attempts = max(prior_attempts, int(prior.get("attempt", 0)))
    if prior_attempts >= MAX_ATTEMPTS:
        raise RuntimeError(f"asset clean-attempt ceiling already exhausted: {entry['id']}")

    last_error: Exception | None = None
    for attempt in range(prior_attempts + 1, MAX_ATTEMPTS + 1):
        budget = read_budget()
        if int(budget["network_bytes_observed"]) >= NETWORK_LIMIT:
            raise RuntimeError("network byte ceiling already exhausted")
        part = destination.with_name(destination.name + f".attempt{attempt}.part")
        if part.exists():
            raise RuntimeError(f"unclean prior attempt file exists: {part}")
        observed = 0
        started = utc_now()
        headers: dict[str, Any] = {}
        status = None
        expected = None
        try:
            request = urllib.request.Request(
                str(entry["url"]),
                headers={"User-Agent": USER_AGENT, "Accept-Encoding": "identity"},
            )
            with urllib.request.urlopen(request, timeout=180) as response:
                status = getattr(response, "status", None)
                if status != 200:
                    raise RuntimeError(f"HTTP status {status}")
                content_length = response.headers.get("Content-Length")
                if content_length is None:
                    raise RuntimeError("official response omitted Content-Length")
                expected = int(content_length)
                hard_expected = entry.get("hard_expected_bytes")
                if hard_expected is not None and expected != int(hard_expected):
                    raise RuntimeError(
                        f"frozen expected length mismatch header={expected} frozen={hard_expected}"
                    )
                if int(budget["network_bytes_observed"]) + expected > NETWORK_LIMIT:
                    raise RuntimeError("declared asset length would exceed network ceiling")
                headers = {
                    "content_length": expected,
                    "content_type": response.headers.get("Content-Type"),
                    "content_encoding": response.headers.get("Content-Encoding"),
                    "last_modified": response.headers.get("Last-Modified"),
                    "etag": response.headers.get("ETag"),
                    "date": response.headers.get("Date"),
                    "via": response.headers.get("Via"),
                }
                destination.parent.mkdir(parents=True, exist_ok=True)
                with part.open("xb") as handle:
                    while True:
                        chunk = response.read(1024 * 1024)
                        if not chunk:
                            break
                        if int(budget["network_bytes_observed"]) + observed + len(chunk) > NETWORK_LIMIT:
                            raise RuntimeError("network byte ceiling reached during response")
                        handle.write(chunk)
                        observed += len(chunk)
            if observed != expected:
                raise RuntimeError(f"short download observed={observed} expected={expected}")
            raw_sha = sha256_file(part)
            os.replace(part, destination)
            readability = validate_asset(destination, entry)
            metadata = {
                "id": entry["id"],
                "family": entry["family"],
                "url": entry["url"],
                "retrieval_started_utc": started,
                "retrieval_completed_utc": utc_now(),
                "attempt": attempt,
                "http_status": status,
                "content_length_header": expected,
                "actual_bytes": observed,
                "length_match": True,
                "raw_sha256": raw_sha,
                "headers": headers,
                "readability": readability,
                "provenance": "DIRECT_OFFICIAL_HTTPS",
            }
            write_json(metadata_path, metadata)
            append_attempt({
                "id": entry["id"], "attempt": attempt, "status": "PASS", "url": entry["url"],
                "actual_bytes": observed, "content_length": expected, "raw_sha256": raw_sha,
                "started_utc": started, "completed_utc": utc_now(),
            })
            budget["network_bytes_observed"] = int(budget["network_bytes_observed"]) + observed
            budget["attempts"] = int(budget["attempts"]) + 1
            write_json(BUDGET, budget)
            return metadata
        except Exception as error:
            last_error = error
            part_sha = sha256_file(part) if part.exists() else None
            append_attempt({
                "id": entry["id"], "attempt": attempt, "status": "FAIL", "url": entry["url"],
                "actual_bytes": observed, "content_length": expected, "partial_sha256": part_sha,
                "http_status": status, "headers": headers, "error": repr(error),
                "started_utc": started, "completed_utc": utc_now(), "partial_admissible": False,
                "partial_deleted_after_record": bool(part.exists()),
            })
            budget["network_bytes_observed"] = int(budget["network_bytes_observed"]) + observed
            budget["attempts"] = int(budget["attempts"]) + 1
            write_json(BUDGET, budget)
            if part.exists():
                part.unlink()
            if attempt < MAX_ATTEMPTS:
                time.sleep(2 * attempt)
    raise RuntimeError(f"asset failed after {MAX_ATTEMPTS} clean attempts: {entry['id']}: {last_error}")


def copy_reused() -> list[dict[str, Any]]:
    results: list[dict[str, Any]] = []
    RAW.mkdir(parents=True, exist_ok=True)
    for asset_id, spec in REUSED.items():
        source = Path(spec["source"])
        destination = RAW / f"{asset_id}.json.gz"
        if source.stat().st_size != int(spec["bytes"]) or sha256_file(source) != spec["sha256"]:
            raise RuntimeError(f"accepted initial asset changed: {asset_id}")
        if not destination.exists():
            shutil.copyfile(source, destination)
        if destination.stat().st_size != int(spec["bytes"]) or sha256_file(destination) != spec["sha256"]:
            raise RuntimeError(f"copied accepted asset mismatch: {asset_id}")
        year = int(asset_id.split("-")[1])
        readability = validate_nvd(destination, year)
        metadata = {
            "id": asset_id,
            "family": "NVD_JSON_2_0",
            "url": spec["url"],
            "retrieval_started_utc": None,
            "retrieval_completed_utc": None,
            "attempt": 0,
            "http_status": "INITIAL_ACCEPTED_PACKAGE",
            "content_length_header": spec["bytes"],
            "actual_bytes": spec["bytes"],
            "length_match": True,
            "raw_sha256": spec["sha256"],
            "headers": {},
            "readability": readability,
            "provenance": "INITIAL_PACKAGE_25_OF_25_VERIFIED__COMPLETE_ASSET_COPY",
        }
        write_json(destination.with_suffix(destination.suffix + ".source.json"), metadata)
        results.append(metadata)
    return results


def load_converter():
    if sha256_file(CONVERTER) != CONVERTER_SHA:
        raise RuntimeError("frozen converter hash mismatch")
    spec = importlib.util.spec_from_file_location("frozen_prepare_manifests", CONVERTER)
    if spec is None or spec.loader is None:
        raise RuntimeError("unable to load frozen converter")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def build_manifests(asset_records: list[dict[str, Any]]) -> dict[str, Any]:
    converter = load_converter()
    MANIFESTS.mkdir(parents=True, exist_ok=True)
    by_id = {entry["id"]: entry for entry in asset_records}
    manifest_entries: list[dict[str, Any]] = []
    expected_old = {
        "nvd-2015": "2D3CC2D0F4024C78C033C5427AD85F056FC5850E95B1AE45F07B3A545F28FE76",
        "nvd-2016": "5D0D1C16FDE026E8FA96F739F5C2A0E91A72F5CF05003F6A9722E7033C73A80D",
    }
    for year in range(2015, 2025):
        asset_id = f"nvd-{year}"
        raw = RAW / f"{asset_id}.json.gz"
        output = MANIFESTS / f"{asset_id}.kvman"
        if output.exists():
            raise RuntimeError(f"refusing to overwrite existing manifest: {output}")
        built = converter.write_manifest(output, converter.nvd_records(raw, year))
        if asset_id in expected_old and built["manifest_sha256"] != expected_old[asset_id]:
            raise RuntimeError(f"canonical converter replay mismatch: {asset_id}")
        manifest_entries.append({"id": asset_id, "family": "NVD_JSON_2_0", "source": by_id[asset_id], **built})
        print(f"manifest {asset_id} {built['manifest_sha256']}", flush=True)
    for package in PACKAGES:
        asset_id = f"pypi-{package}"
        raw = RAW / f"{asset_id}.json"
        output = MANIFESTS / f"{asset_id}.kvman"
        if output.exists():
            raise RuntimeError(f"refusing to overwrite existing manifest: {output}")
        built = converter.write_manifest(output, converter.pypi_records(raw, package))
        manifest_entries.append({"id": asset_id, "family": "PYPI_JSON_API", "source": by_id[asset_id], **built})
        print(f"manifest {asset_id} {built['manifest_sha256']}", flush=True)
    inventory = {
        "schema_version": "rocksdict-resource-unblock-inventory-v1",
        "assignment_id": "RESOURCE-UNBLOCK-L2-20260810-ROCKSDB-R1",
        "authorization_id": "UNBLOCK-AUTH-20260810-R1",
        "claim_bearing": False,
        "scientific_revision": False,
        "stageb": False,
        "converter_sha256": CONVERTER_SHA,
        "construction": {
            "format": "KVMAN1 little-endian length-prefixed sorted unique KV",
            "selection": "frozen converter hash-ranked natural records to 4 MiB logical payload, then key sort",
            "outcome_observed_before_freeze": False,
        },
        "manifests": manifest_entries,
    }
    write_json(INVENTORY, inventory)
    return inventory


def main() -> int:
    started = utc_now()
    if not (RESUME / "RESOURCE_AUTHORIZATION_FREEZE.yaml").exists():
        raise RuntimeError("authorization freeze absent")
    if sha256_file(CONVERTER) != CONVERTER_SHA:
        raise RuntimeError("converter input hash mismatch before acquisition")
    assets = copy_reused()
    for entry in NVD + PYPI:
        print(f"acquire {entry['id']}", flush=True)
        assets.append(clean_download(entry))
    if len(assets) != 20 or len({entry["id"] for entry in assets}) != 20:
        raise RuntimeError("asset population did not close at 20 unique entries")
    inventory = build_manifests(assets)
    result = {
        "schema_version": "resource-unblock-record-v1",
        "assignment_id": "RESOURCE-UNBLOCK-L2-20260810-ROCKSDB-R1",
        "authorization_id": "UNBLOCK-AUTH-20260810-R1",
        "started_utc": started,
        "completed_utc": utc_now(),
        "asset_count": len(assets),
        "manifest_count": len(inventory["manifests"]),
        "resource_ready": True,
        "claim_bearing": False,
        "scientific_revision": False,
        "stageb": False,
        "network_budget": read_budget(),
        "inventory_sha256": sha256_file(INVENTORY),
    }
    write_json(RECORD, result)
    print(json.dumps(result, sort_keys=True), flush=True)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as error:
        failure = {
            "schema_version": "resource-unblock-record-v1",
            "assignment_id": "RESOURCE-UNBLOCK-L2-20260810-ROCKSDB-R1",
            "authorization_id": "UNBLOCK-AUTH-20260810-R1",
            "completed_utc": utc_now(),
            "resource_ready": False,
            "claim_bearing": False,
            "scientific_revision": False,
            "stageb": False,
            "error": repr(error),
            "network_budget": read_budget(),
        }
        write_json(RECORD, failure)
        print(f"RESOURCE_UNBLOCK_FAILURE: {error}", file=sys.stderr, flush=True)
        raise
