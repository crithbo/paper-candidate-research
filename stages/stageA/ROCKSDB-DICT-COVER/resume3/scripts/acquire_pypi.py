#!/usr/bin/env python3
"""Route 3: freeze ten exact official PyPI project-level JSON responses."""

from __future__ import annotations

import datetime as dt
import hashlib
import json
import os
import sys
import time
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
USER_AGENT = "ROCKSDB-DICT-COVER-StageA-Resume3/1.0"
PACKAGES = ["boto3", "botocore", "django", "pandas", "numpy", "scipy", "tensorflow", "torch", "matplotlib", "scikit-learn"]


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode("utf-8")


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


def utc_now() -> str:
    return dt.datetime.now(dt.timezone.utc).isoformat().replace("+00:00", "Z")


def write_json_once(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("xb") as handle:
        handle.write(canonical(value) + b"\n")


def append_event(path: Path, value: object) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    with path.open("ab") as handle:
        handle.write(canonical(value) + b"\n")
        handle.flush()
        os.fsync(handle.fileno())


def acquire(package: str, request_log: Path) -> dict[str, object]:
    url = f"https://pypi.org/pypi/{package}/json"
    output = ROOT / "inputs" / "pypi" / f"pypi-{package}.json"
    source = output.with_suffix(".source.json")
    partial = output.with_suffix(".json.partial")
    if output.exists() or source.exists() or partial.exists():
        raise RuntimeError(f"refusing implicit retry/overwrite for {package}")
    output.parent.mkdir(parents=True, exist_ok=True)
    requested = utc_now()
    request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT, "Accept": "application/json", "Accept-Encoding": "identity"})
    observed = 0
    try:
        with urllib.request.urlopen(request, timeout=180) as response, partial.open("xb") as handle:
            status = int(response.status)
            headers = {key.lower(): value for key, value in response.headers.items()}
            while True:
                chunk = response.read(1024 * 1024)
                if not chunk:
                    break
                handle.write(chunk)
                observed += len(chunk)
            handle.flush()
            os.fsync(handle.fileno())
    except Exception as error:
        append_event(request_log, {"event": "PYPI_REQUEST_FAIL", "package": package, "url": url,
                                   "requested_utc": requested, "completed_utc": utc_now(),
                                   "actual_bytes": observed, "partial_sha256": sha256_file(partial) if partial.exists() else None,
                                   "error": repr(error)})
        raise
    if status != 200:
        raise RuntimeError(f"PyPI HTTP status {status} for {package}")
    declared = headers.get("content-length")
    if declared is not None and int(declared) != observed:
        raise RuntimeError(f"PyPI short body for {package}: {observed} != {declared}")
    if headers.get("content-encoding") not in (None, "identity"):
        raise RuntimeError(f"unexpected PyPI content encoding for {package}")
    payload = json.loads(partial.read_text(encoding="utf-8"))
    if not isinstance(payload, dict) or not isinstance(payload.get("info"), dict):
        raise RuntimeError(f"PyPI {package} lacks info object")
    if not isinstance(payload.get("releases"), dict) or not isinstance(payload.get("urls"), list):
        raise RuntimeError(f"PyPI {package} lacks releases object or urls array")
    info = payload["info"]
    if str(info.get("name", "")).lower().replace("_", "-") != package.lower().replace("_", "-"):
        raise RuntimeError(f"PyPI project identity mismatch for {package}: {info.get('name')!r}")
    if not info.get("version"):
        raise RuntimeError(f"PyPI {package} has empty current version")
    digest = sha256_file(partial)
    os.replace(partial, output)
    license_classifiers = [x for x in info.get("classifiers", []) if isinstance(x, str) and x.startswith("License ::")]
    meta = {
        "package": package, "url": url, "http_status": status, "requested_utc": requested,
        "completed_utc": utc_now(), "headers": headers, "bytes": observed, "sha256": digest,
        "completion_proof": "CONTENT_LENGTH_MATCH" if declared is not None else "HTTP_EOF_PLUS_VALID_JSON_SCHEMA",
        "info_version": info.get("version"), "info_license": info.get("license"),
        "info_license_expression": info.get("license_expression"), "license_classifiers": license_classifiers,
        "release_count": len(payload["releases"]), "urls_count": len(payload["urls"]),
        "schema": "PASS_INFO_RELEASES_URLS_IDENTITY_VERSION",
        "license_disposition": "PACKAGE_DECLARED_LICENSE_METADATA_RETAINED__REGISTRY_METADATA_ONLY",
    }
    write_json_once(source, meta)
    append_event(request_log, {"event": "PYPI_REQUEST_PASS", **meta})
    print(f"PyPI {package} pass bytes={observed} version={info.get('version')}", flush=True)
    return meta


def main() -> int:
    route_id = "ROUTE_3_PYPI_PROJECT_JSON"
    result_path = ROOT / f"{route_id}_RESULT.json"
    if result_path.exists():
        raise RuntimeError("PyPI route already has a terminal result")
    nvd_closed = False
    route1_path = ROOT / "ROUTE_1_NVD_API2_RESULT.json"
    if route1_path.exists() and json.loads(route1_path.read_text(encoding="utf-8")).get("status") == "PASS":
        nvd_closed = True
    for fallback in ("ROUTE_2_NVD_STABLE_ETAG_RANGE_RESULT.json", "ROUTE_4_NVD_ALTERNATE_OFFICIAL_TRANSFER_RESULT.json"):
        path = ROOT / fallback
        if path.exists() and json.loads(path.read_text(encoding="utf-8")).get("status") == "PASS":
            nvd_closed = True
    if not nvd_closed:
        raise RuntimeError("PyPI route is locked until NVD 2023-2024 resources are closed")
    route_log = ROOT / "route_attempts.jsonl"
    request_log = ROOT / "pypi_requests.jsonl"
    append_event(route_log, {"event": "ROUTE_START", "route_id": route_id, "started_utc": utc_now(),
                             "claim_bearing": False, "automatic_retry": False})
    started = time.monotonic()
    outputs: list[dict[str, object]] = []
    try:
        for index, package in enumerate(PACKAGES):
            if index:
                time.sleep(1.0)
            outputs.append(acquire(package, request_log))
        result = {"route_id": route_id, "status": "PASS", "completed_utc": utc_now(),
                  "wall_seconds": round(time.monotonic() - started, 3), "outputs": outputs,
                  "network_body_bytes": sum(int(item["bytes"]) for item in outputs),
                  "claim_bearing": False, "scientific_inference": False}
        write_json_once(result_path, result)
        append_event(route_log, {"event": "ROUTE_END", **result})
        return 0
    except Exception as error:
        result = {"route_id": route_id, "status": "OFFICIAL_PYPI_ROUTE_FAILURE", "completed_utc": utc_now(),
                  "wall_seconds": round(time.monotonic() - started, 3), "closed_outputs": outputs,
                  "error": repr(error), "claim_bearing": False, "scientific_inference": False}
        write_json_once(result_path, result)
        append_event(route_log, {"event": "ROUTE_END", **result})
        print(f"RESOURCE_ROUTE_3_FAILURE: {error}", file=sys.stderr, flush=True)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
