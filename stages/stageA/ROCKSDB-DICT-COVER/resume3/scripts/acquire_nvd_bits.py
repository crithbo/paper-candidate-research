#!/usr/bin/env python3
"""Route 4: exact official annual-feed transfer with BITS and If-Match."""

from __future__ import annotations

import datetime as dt
import gzip
import hashlib
import json
import os
import subprocess
import sys
import time
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
HELPER = ROOT / "scripts" / "download_bits.ps1"
USER_AGENT = "ROCKSDB-DICT-COVER-StageA-Resume3/1.0"
URLS = {
    2023: "https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-2023.json.gz",
    2024: "https://nvd.nist.gov/feeds/json/cve/2.0/nvdcve-2.0-2024.json.gz",
}


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


def head(url: str) -> dict[str, object]:
    request = urllib.request.Request(url, method="HEAD", headers={"User-Agent": USER_AGENT, "Accept-Encoding": "identity"})
    requested = utc_now()
    with urllib.request.urlopen(request, timeout=120) as response:
        headers = {key.lower(): value for key, value in response.headers.items()}
        status = int(response.status)
    if status != 200:
        raise RuntimeError(f"official HEAD status {status}")
    if not headers.get("content-length") or not headers.get("etag"):
        raise RuntimeError("official HEAD lacks Content-Length or ETag")
    return {"url": url, "status": status, "requested_utc": requested, "completed_utc": utc_now(), "headers": headers}


def validate(path: Path) -> dict[str, object]:
    with gzip.open(path, "rt", encoding="utf-8") as handle:
        payload = json.load(handle)
    items = payload.get("vulnerabilities") if isinstance(payload, dict) else None
    if not isinstance(items, list) or not items:
        raise RuntimeError("annual feed lacks nonempty vulnerabilities")
    ids: list[str] = []
    for item in items:
        cve = item.get("cve") if isinstance(item, dict) else None
        cve_id = cve.get("id") if isinstance(cve, dict) else None
        if not cve_id:
            raise RuntimeError("annual feed entry lacks cve.id")
        ids.append(cve_id)
    if len(ids) != len(set(ids)):
        raise RuntimeError("annual feed contains duplicate cve.id")
    set_digest = hashlib.sha256(("\n".join(sorted(ids)) + "\n").encode()).hexdigest().upper()
    return {"cve_count": len(ids), "cve_set_digest": set_digest, "gzip_full_stream": "PASS", "json_schema": "PASS_ALL_CVE_IDS_UNIQUE"}


def acquire(year: int, request_log: Path) -> dict[str, object]:
    url = URLS[year]
    preflight = head(url)
    headers = preflight["headers"]
    expected = int(headers["content-length"])
    etag = headers["etag"]
    output = ROOT / "inputs" / "bits" / "route4" / "outputs" / f"nvd-{year}.json.gz"
    source = output.with_suffix(output.suffix + ".source.json")
    if output.exists() or source.exists():
        raise RuntimeError(f"refusing to overwrite Route 4 asset for {year}")
    append_event(request_log, {"event": "HEAD_PASS", "year": year, **preflight})
    command = [
        "powershell.exe", "-NoProfile", "-NonInteractive", "-ExecutionPolicy", "Bypass",
        "-File", str(HELPER), "-Source", url, "-Destination", str(output), "-Etag", etag,
    ]
    started = time.monotonic()
    completed = subprocess.run(command, check=False, capture_output=True, text=True, timeout=960)
    if completed.returncode != 0:
        raise RuntimeError(f"BITS exit={completed.returncode} stdout={completed.stdout[-1000:]!r} stderr={completed.stderr[-1000:]!r}")
    if not output.exists() or output.stat().st_size != expected:
        raise RuntimeError(f"BITS size mismatch for {year}: {output.stat().st_size if output.exists() else None} != {expected}")
    validation = validate(output)
    meta = {
        "year": year, "url": url, "route": "EXACT_OFFICIAL_BITS_WITH_IF_MATCH_STABLE_ETAG",
        "head": preflight, "etag": etag, "last_modified": headers.get("last-modified"),
        "bytes": output.stat().st_size, "sha256": sha256_file(output),
        "bits_wall_seconds": round(time.monotonic() - started, 3), **validation,
    }
    write_json_once(source, meta)
    append_event(request_log, {"event": "BITS_PASS", **meta, "completed_utc": utc_now()})
    print(f"BITS {year} pass bytes={meta['bytes']} sha256={meta['sha256']}", flush=True)
    return meta


def main() -> int:
    route_id = "ROUTE_4_NVD_ALTERNATE_OFFICIAL_TRANSFER"
    route1_path = ROOT / "ROUTE_1_NVD_API2_RESULT.json"
    route2_path = ROOT / "ROUTE_2_NVD_STABLE_ETAG_RANGE_RESULT.json"
    if not route1_path.exists() or not route2_path.exists():
        raise RuntimeError("Route 4 requires terminal Route 1 and Route 2 results")
    route2 = json.loads(route2_path.read_text(encoding="utf-8"))
    if route2.get("status") != "MECHANICAL_TRANSFER_FAILURE":
        raise RuntimeError("Route 4 is allowed only after Route 2 mechanical transfer failure")
    result_path = ROOT / f"{route_id}_RESULT.json"
    if result_path.exists():
        raise RuntimeError("Route 4 already has a terminal result")
    route_log = ROOT / "route_attempts.jsonl"
    request_log = ROOT / "route4_bits_requests.jsonl"
    append_event(route_log, {"event": "ROUTE_START", "route_id": route_id, "started_utc": utc_now(),
                             "claim_bearing": False, "automatic_retry": False})
    started = time.monotonic()
    outputs: list[dict[str, object]] = []
    try:
        for year in (2023, 2024):
            outputs.append(acquire(year, request_log))
        result = {"route_id": route_id, "status": "PASS", "completed_utc": utc_now(),
                  "wall_seconds": round(time.monotonic() - started, 3), "outputs": outputs,
                  "claim_bearing": False, "scientific_inference": False}
        write_json_once(result_path, result)
        append_event(route_log, {"event": "ROUTE_END", **result})
        return 0
    except Exception as error:
        result = {"route_id": route_id, "status": "MECHANICAL_TRANSFER_FAILURE", "completed_utc": utc_now(),
                  "wall_seconds": round(time.monotonic() - started, 3), "closed_outputs": outputs,
                  "error": repr(error), "claim_bearing": False, "scientific_inference": False}
        write_json_once(result_path, result)
        append_event(route_log, {"event": "ROUTE_END", **result})
        print(f"RESOURCE_ROUTE_4_FAILURE: {error}", file=sys.stderr, flush=True)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
