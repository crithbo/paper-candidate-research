#!/usr/bin/env python3
"""Acquire and validate the 16 missing official assets for resume2 only.

No RocksDB, Zstd trainer, candidate, baseline, SST, or scientific observation
is invoked here. Each official route receives at most two byte-zero attempts.
"""

from __future__ import annotations

import csv
import gzip
import hashlib
import importlib.util
import json
import os
import sys
import time
import urllib.request
from datetime import datetime, timezone
from pathlib import Path
from typing import Any


RESUME = Path(__file__).resolve().parents[1]
TOPIC = RESUME.parent
RAW = RESUME / "inputs" / "raw"
ATTEMPTS = RESUME / "resource_attempts.jsonl"
BUDGET = RESUME / "RESOURCE_BUDGET.json"
RECORD = RESUME / "RESOURCE_ACQUISITION_RECORD.json"
SMOKE = RESUME / "RESOURCE_SMOKE.json"
SOURCE_MANIFEST = RESUME / "SOURCE_ASSET_MANIFEST.tsv"
CONTRACT = RESUME / "RESOURCE_CONTRACT.yaml"
CODE_FREEZE = RESUME / "RESOURCE_CODE_FREEZE.json"
CONVERTER = TOPIC / "scripts" / "prepare_manifests.py"
CONVERTER_SHA = "E93D8D7A7AB47B2A65751064F5114FCD9E919813F2A7F810123FDCAF7FD7E244"
MAX_ATTEMPTS = 2
NETWORK_LIMIT = 1_073_741_824
USER_AGENT = "ROCKSDB-DICT-COVER-Resume2-R2BC/1.0"


ASSETS: list[dict[str, Any]] = [
    *[
        {
            "id": f"nvd-{year}",
            "family": "NVD_JSON_2_0",
            "year": year,
            "url": f"https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-{year}.json.gz",
            "filename": f"nvd-{year}.json.gz",
        }
        for year in range(2019, 2025)
    ],
    *[
        {
            "id": f"pypi-{package}",
            "family": "PYPI_JSON_API",
            "package": package,
            "url": f"https://pypi.org/pypi/{package}/json",
            "filename": f"pypi-{package}.json",
        }
        for package in [
            "boto3", "botocore", "django", "pandas", "numpy", "scipy",
            "tensorflow", "torch", "matplotlib", "scikit-learn",
        ]
    ],
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
        newline="\n",
    )
    os.replace(temp, path)


def append_event(value: dict[str, Any]) -> None:
    ATTEMPTS.parent.mkdir(parents=True, exist_ok=True)
    with ATTEMPTS.open("a", encoding="utf-8", newline="\n") as handle:
        handle.write(json.dumps(value, sort_keys=True, separators=(",", ":")) + "\n")


def read_budget() -> dict[str, int]:
    if BUDGET.exists():
        return json.loads(BUDGET.read_text(encoding="utf-8"))
    return {"network_limit_bytes": NETWORK_LIMIT, "network_body_bytes": 0, "attempt_starts": 0}


def validate_code_freeze() -> None:
    freeze = json.loads(CODE_FREEZE.read_text(encoding="utf-8"))
    checks = {
        "resource_contract_sha256": sha256_file(CONTRACT),
        "acquisition_script_sha256": sha256_file(Path(__file__)),
        "frozen_converter_sha256": sha256_file(CONVERTER),
    }
    for key, observed in checks.items():
        if freeze.get(key) != observed:
            raise RuntimeError(f"code freeze mismatch {key}: {observed}")
    if observed != CONVERTER_SHA:
        raise RuntimeError("frozen converter constant mismatch")


def validate_nvd(path: Path, year: int) -> dict[str, Any]:
    with gzip.open(path, "rt", encoding="utf-8") as handle:
        payload = json.load(handle)
    vulnerabilities = payload.get("vulnerabilities")
    if not isinstance(vulnerabilities, list) or not vulnerabilities:
        raise RuntimeError(f"NVD {year} vulnerabilities array absent or empty")
    ids: list[str] = []
    for item in vulnerabilities:
        cve = item.get("cve") if isinstance(item, dict) else None
        cve_id = cve.get("id") if isinstance(cve, dict) else None
        if not isinstance(cve_id, str) or not cve_id.startswith("CVE-"):
            raise RuntimeError(f"NVD {year} entry lacks valid cve.id")
        ids.append(cve_id)
    return {
        "gzip_integrity": "PASS_FULL_STREAM",
        "json_parse": "PASS",
        "schema": "PASS_NVD_CVE_JSON_2_0_ALL_ENTRIES",
        "vulnerability_count": len(ids),
        "first_cve_id": ids[0],
        "last_cve_id": ids[-1],
        "feed_timestamp": payload.get("timestamp"),
        "license_status": "NIST_NVD_US_GOVERNMENT_DATA_WITH_ATTRIBUTION_RETAINED",
        "license_url": "https://nvd.nist.gov/general/FAQ-Sections/General-FAQs",
    }


def normalized_package(value: str) -> str:
    return value.casefold().replace("_", "-").replace(".", "-")


def validate_pypi(path: Path, package: str) -> dict[str, Any]:
    with path.open("r", encoding="utf-8") as handle:
        payload = json.load(handle)
    info, releases, urls = payload.get("info"), payload.get("releases"), payload.get("urls")
    if not isinstance(info, dict) or not isinstance(releases, dict) or not isinstance(urls, list):
        raise RuntimeError(f"PyPI {package} info/releases/urls schema failure")
    observed_name = str(info.get("name", ""))
    if normalized_package(observed_name) != normalized_package(package):
        raise RuntimeError(f"PyPI name mismatch {package}: {observed_name!r}")
    classifiers = info.get("classifiers") if isinstance(info.get("classifiers"), list) else []
    license_classifiers = [
        value for value in classifiers
        if isinstance(value, str) and value.startswith("License ::")
    ]
    declared = info.get("license_expression") or info.get("license")
    if not declared and not license_classifiers:
        raise RuntimeError(f"PyPI license metadata absent: {package}")
    artifact_records = sum(len(value) for value in releases.values() if isinstance(value, list))
    return {
        "gzip_integrity": "NOT_APPLICABLE",
        "json_parse": "PASS",
        "schema": "PASS_PYPI_OFFICIAL_JSON_REQUIRED_FIELDS",
        "info_name": observed_name,
        "info_version": info.get("version"),
        "release_count": len(releases),
        "artifact_record_count": artifact_records,
        "license_declared": declared,
        "license_classifiers": license_classifiers,
        "license_status": "PASS_PACKAGE_DECLARED_LICENSE_METADATA_RETAINED",
        "api_documentation": "https://docs.pypi.org/api/json/",
    }


def validate_asset(path: Path, entry: dict[str, Any]) -> dict[str, Any]:
    if entry["family"] == "NVD_JSON_2_0":
        return validate_nvd(path, int(entry["year"]))
    return validate_pypi(path, str(entry["package"]))


def attempt_count(asset_id: str) -> int:
    if not ATTEMPTS.exists():
        return 0
    starts = set()
    for line in ATTEMPTS.read_text(encoding="utf-8").splitlines():
        if not line.strip():
            continue
        event = json.loads(line)
        if event.get("id") == asset_id and event.get("event") == "START":
            starts.add(int(event["attempt"]))
    return len(starts)


def validate_closed(entry: dict[str, Any]) -> dict[str, Any] | None:
    destination = RAW / str(entry["filename"])
    metadata_path = destination.with_suffix(destination.suffix + ".source.json")
    if not destination.exists() and not metadata_path.exists():
        return None
    if not destination.is_file() or not metadata_path.is_file():
        raise RuntimeError(f"orphaned asset state: {entry['id']}")
    metadata = json.loads(metadata_path.read_text(encoding="utf-8"))
    if metadata.get("url") != entry["url"] or metadata.get("actual_bytes") != destination.stat().st_size:
        raise RuntimeError(f"closed metadata mismatch: {entry['id']}")
    if metadata.get("raw_sha256") != sha256_file(destination):
        raise RuntimeError(f"closed hash mismatch: {entry['id']}")
    metadata["readability"] = validate_asset(destination, entry)
    return metadata


def acquire(entry: dict[str, Any]) -> dict[str, Any]:
    closed = validate_closed(entry)
    if closed is not None:
        return closed
    destination = RAW / str(entry["filename"])
    used = attempt_count(str(entry["id"]))
    if used >= MAX_ATTEMPTS:
        raise RuntimeError(f"clean-attempt ceiling exhausted: {entry['id']}")
    last_error: Exception | None = None
    for attempt in range(used + 1, MAX_ATTEMPTS + 1):
        part = destination.with_name(destination.name + f".attempt{attempt}.part")
        if part.exists():
            if part.parent.resolve() != RAW.resolve():
                raise RuntimeError("partial path escaped raw directory")
            append_event({
                "event": "RECOVERED_PARTIAL_DELETED", "id": entry["id"], "attempt": attempt,
                "bytes": part.stat().st_size, "partial_sha256": sha256_file(part),
                "time_utc": utc_now(), "partial_admissible": False,
            })
            part.unlink()
        started = utc_now()
        append_event({"event": "START", "id": entry["id"], "attempt": attempt, "url": entry["url"], "time_utc": started})
        budget = read_budget()
        budget["attempt_starts"] += 1
        write_json(BUDGET, budget)
        observed = 0
        status = None
        expected = None
        headers: dict[str, Any] = {}
        try:
            request = urllib.request.Request(
                str(entry["url"]),
                headers={"User-Agent": USER_AGENT, "Accept-Encoding": "identity"},
            )
            with urllib.request.urlopen(request, timeout=240) as response:
                status = getattr(response, "status", None)
                if status != 200:
                    raise RuntimeError(f"HTTP status {status}")
                raw_length = response.headers.get("Content-Length")
                if raw_length is None:
                    raise RuntimeError("official response omitted Content-Length")
                expected = int(raw_length)
                if budget["network_body_bytes"] + expected > NETWORK_LIMIT:
                    raise RuntimeError("declared response exceeds network budget")
                content_encoding = response.headers.get("Content-Encoding")
                if content_encoding not in (None, "identity"):
                    raise RuntimeError(f"unexpected Content-Encoding {content_encoding!r}")
                headers = {
                    "content_length": expected,
                    "content_type": response.headers.get("Content-Type"),
                    "content_encoding": content_encoding,
                    "last_modified": response.headers.get("Last-Modified"),
                    "etag": response.headers.get("ETag"),
                    "date": response.headers.get("Date"),
                    "cache_control": response.headers.get("Cache-Control"),
                }
                destination.parent.mkdir(parents=True, exist_ok=True)
                with part.open("xb") as handle:
                    while True:
                        chunk = response.read(1024 * 1024)
                        if not chunk:
                            break
                        if budget["network_body_bytes"] + observed + len(chunk) > NETWORK_LIMIT:
                            raise RuntimeError("network byte ceiling reached")
                        handle.write(chunk)
                        observed += len(chunk)
            budget["network_body_bytes"] += observed
            write_json(BUDGET, budget)
            if observed != expected:
                raise RuntimeError(f"short response observed={observed} expected={expected}")
            raw_sha = sha256_file(part)
            readability = validate_asset(part, entry)
            os.replace(part, destination)
            metadata = {
                "id": entry["id"], "family": entry["family"], "url": entry["url"],
                "attempt": attempt, "retrieval_started_utc": started,
                "retrieval_completed_utc": utc_now(), "http_status": status,
                "content_length_header": expected, "actual_bytes": observed,
                "length_match": True, "raw_sha256": raw_sha, "headers": headers,
                "readability": readability, "provenance": "DIRECT_EXACT_OFFICIAL_HTTPS_ROUTE",
            }
            write_json(destination.with_suffix(destination.suffix + ".source.json"), metadata)
            append_event({
                "event": "PASS", "id": entry["id"], "attempt": attempt,
                "actual_bytes": observed, "content_length": expected, "raw_sha256": raw_sha,
                "time_utc": utc_now(),
            })
            return metadata
        except Exception as error:
            last_error = error
            if budget["network_body_bytes"] < read_budget()["network_body_bytes"]:
                budget = read_budget()
            elif observed:
                budget["network_body_bytes"] += observed
                write_json(BUDGET, budget)
            append_event({
                "event": "FAIL", "id": entry["id"], "attempt": attempt,
                "url": entry["url"], "http_status": status,
                "content_length": expected, "actual_bytes": observed,
                "partial_sha256": sha256_file(part) if part.exists() else None,
                "partial_admissible": False, "error": repr(error), "headers": headers,
                "time_utc": utc_now(),
            })
            if part.exists():
                if part.parent.resolve() != RAW.resolve():
                    raise RuntimeError("partial deletion target escaped raw directory") from error
                part.unlink()
            if attempt < MAX_ATTEMPTS:
                time.sleep(1)
    raise RuntimeError(f"asset failed after {MAX_ATTEMPTS} clean attempts: {entry['id']}: {last_error}")


def load_converter():
    if sha256_file(CONVERTER) != CONVERTER_SHA:
        raise RuntimeError("frozen converter changed")
    sys.dont_write_bytecode = True
    spec = importlib.util.spec_from_file_location("frozen_prepare_manifests", CONVERTER)
    if spec is None or spec.loader is None:
        raise RuntimeError("unable to load frozen converter")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def converter_smoke(records: list[dict[str, Any]]) -> dict[str, Any]:
    converter = load_converter()
    results = []
    by_id = {value["id"]: value for value in records}
    for entry in ASSETS:
        path = RAW / str(entry["filename"])
        if entry["family"] == "NVD_JSON_2_0":
            selected = converter.nvd_records(path, int(entry["year"]))
        else:
            selected = converter.pypi_records(path, str(entry["package"]))
        keys = [key for key, _ in selected]
        if not selected or keys != sorted(keys) or len(keys) != len(set(keys)):
            raise RuntimeError(f"unmodified converter smoke failed: {entry['id']}")
        logical_bytes = sum(len(key) + len(value) for key, value in selected)
        results.append({
            "id": entry["id"], "record_count": len(selected),
            "logical_key_value_bytes": logical_bytes,
            "first_key_sha256": hashlib.sha256(selected[0][0]).hexdigest().upper(),
            "last_key_sha256": hashlib.sha256(selected[-1][0]).hexdigest().upper(),
            "raw_sha256": by_id[entry["id"]]["raw_sha256"], "status": "PASS",
        })
    smoke = {
        "schema_version": "rocksdb-resource-smoke-v1",
        "assignment_id": "RESOURCE-STAGEA-L3-20260811-ROCKSDB-DICT-COVER-RESUME2-R2BC",
        "converter_path": str(CONVERTER), "converter_sha256": CONVERTER_SHA,
        "mode": "UNMODIFIED_READ_ONLY_RECORD_CONVERSION_NO_MANIFEST_WRITE",
        "assets": results, "status": "PASS", "completed_utc": utc_now(),
    }
    write_json(SMOKE, smoke)
    return smoke


def write_source_manifest() -> None:
    SOURCE_MANIFEST.parent.mkdir(parents=True, exist_ok=True)
    fields = [
        "id", "family", "official_url", "attempts_started", "http_status",
        "content_length", "actual_bytes", "raw_sha256", "retrieved_utc",
        "gzip", "json_schema", "license", "provenance", "smoke", "status", "last_error",
    ]
    events = []
    if ATTEMPTS.exists():
        events = [json.loads(line) for line in ATTEMPTS.read_text(encoding="utf-8").splitlines() if line.strip()]
    smoke_by_id = {}
    if SMOKE.exists():
        smoke_by_id = {value["id"]: value["status"] for value in json.loads(SMOKE.read_text(encoding="utf-8"))["assets"]}
    with SOURCE_MANIFEST.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, delimiter="\t", lineterminator="\n")
        writer.writeheader()
        for entry in ASSETS:
            destination = RAW / str(entry["filename"])
            metadata_path = destination.with_suffix(destination.suffix + ".source.json")
            metadata = json.loads(metadata_path.read_text(encoding="utf-8")) if metadata_path.exists() else {}
            relevant = [event for event in events if event.get("id") == entry["id"]]
            failed = [event for event in relevant if event.get("event") == "FAIL"]
            readability = metadata.get("readability", {})
            writer.writerow({
                "id": entry["id"], "family": entry["family"], "official_url": entry["url"],
                "attempts_started": len({event.get("attempt") for event in relevant if event.get("event") == "START"}),
                "http_status": metadata.get("http_status", ""),
                "content_length": metadata.get("content_length_header", ""),
                "actual_bytes": metadata.get("actual_bytes", ""), "raw_sha256": metadata.get("raw_sha256", ""),
                "retrieved_utc": metadata.get("retrieval_completed_utc", ""),
                "gzip": readability.get("gzip_integrity", ""), "json_schema": readability.get("schema", ""),
                "license": readability.get("license_status", ""), "provenance": metadata.get("provenance", ""),
                "smoke": smoke_by_id.get(entry["id"], ""),
                "status": "PASS" if metadata and smoke_by_id.get(entry["id"]) == "PASS" else ("ASSET_VALIDATED_SMOKE_PENDING" if metadata else "NOT_CLOSED"),
                "last_error": failed[-1].get("error", "") if failed else "",
            })


def main() -> int:
    started = utc_now()
    validate_code_freeze()
    records: list[dict[str, Any]] = []
    try:
        for entry in ASSETS:
            print(f"acquire {entry['id']}", flush=True)
            records.append(acquire(entry))
        if len(records) != 16 or len({record["id"] for record in records}) != 16:
            raise RuntimeError("resource population did not close at 16 unique assets")
        smoke = converter_smoke(records)
        write_source_manifest()
        result = {
            "schema_version": "rocksdb-resource-resume2-record-v1",
            "assignment_id": "RESOURCE-STAGEA-L3-20260811-ROCKSDB-DICT-COVER-RESUME2-R2BC",
            "status": "RESOURCE_PASS", "resource_ready": True,
            "assets_closed": 16, "smoke_passed": len(smoke["assets"]),
            "started_utc": started, "completed_utc": utc_now(),
            "network_budget": read_budget(),
            "source_manifest_sha256": sha256_file(SOURCE_MANIFEST),
            "smoke_sha256": sha256_file(SMOKE), "claim_bearing": False,
            "scientific_revision_consumed": False, "stageb": False,
        }
        write_json(RECORD, result)
        print(json.dumps(result, sort_keys=True), flush=True)
        return 0
    except Exception as error:
        write_source_manifest()
        failure = {
            "schema_version": "rocksdb-resource-resume2-record-v1",
            "assignment_id": "RESOURCE-STAGEA-L3-20260811-ROCKSDB-DICT-COVER-RESUME2-R2BC",
            "status": "BLOCKED_USER_ACTION_REQUIRED", "resource_ready": False,
            "error": repr(error), "started_utc": started, "completed_utc": utc_now(),
            "network_budget": read_budget(), "claim_bearing": False,
            "evidence_ceiling": "RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE",
            "scientific_revision_consumed": False, "stageb": False,
        }
        write_json(RECORD, failure)
        print(f"RESOURCE_FAILURE: {error}", file=sys.stderr, flush=True)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
