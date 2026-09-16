#!/usr/bin/env python3
"""Routes 2/4: reconstruct exact official NVD annual feeds under stable ETag.

The route uses curl with explicit HTTP Range and If-Match. It is resource-only,
has no internal retry, and retains mechanical failure evidence.
"""

from __future__ import annotations

import argparse
import datetime as dt
import gzip
import hashlib
import json
import os
import re
import subprocess
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
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


def parse_last_headers(path: Path) -> tuple[int, dict[str, str]]:
    text = path.read_text(encoding="iso-8859-1")
    blocks = re.split(r"\r?\n\r?\n", text)
    candidates = [block for block in blocks if block.lstrip().startswith("HTTP/")]
    if not candidates:
        raise RuntimeError(f"curl response headers missing HTTP status: {path}")
    lines = candidates[-1].splitlines()
    match = re.match(r"HTTP/\S+\s+(\d+)", lines[0].strip())
    if not match:
        raise RuntimeError(f"cannot parse status line: {lines[0]}")
    headers: dict[str, str] = {}
    for line in lines[1:]:
        if ":" in line:
            key, value = line.split(":", 1)
            headers[key.strip().lower()] = value.strip()
    return int(match.group(1)), headers


def curl_range(url: str, start: int, end: int, body: Path, headers_path: Path, etag: str | None) -> tuple[int, dict[str, str]]:
    if body.exists() or headers_path.exists():
        raise RuntimeError(f"refusing to overwrite curl evidence: {body}")
    body.parent.mkdir(parents=True, exist_ok=True)
    command = [
        "curl.exe", "--silent", "--show-error", "--fail", "--location", "--retry", "0",
        "--connect-timeout", "30", "--max-time", "300", "--http1.1",
        "--user-agent", USER_AGENT, "--header", "Accept-Encoding: identity",
        "--range", f"{start}-{end}", "--dump-header", str(headers_path), "--output", str(body),
    ]
    if etag is not None:
        command.extend(["--header", f"If-Match: {etag}"])
    command.append(url)
    completed = subprocess.run(command, check=False, capture_output=True, text=True)
    if completed.returncode != 0:
        raise RuntimeError(f"curl exit={completed.returncode} stderr={completed.stderr[-1000:]!r}")
    return parse_last_headers(headers_path)


def validate_feed(path: Path) -> tuple[int, str]:
    with gzip.open(path, "rt", encoding="utf-8") as handle:
        payload = json.load(handle)
    items = payload.get("vulnerabilities") if isinstance(payload, dict) else None
    if not isinstance(items, list) or not items:
        raise RuntimeError("annual feed lacks nonempty vulnerabilities array")
    seen: set[str] = set()
    for item in items:
        cve = item.get("cve") if isinstance(item, dict) else None
        cve_id = cve.get("id") if isinstance(cve, dict) else None
        if not cve_id or cve_id in seen:
            raise RuntimeError(f"annual feed invalid or duplicate cve.id: {cve_id!r}")
        seen.add(cve_id)
    return len(items), hashlib.sha256(("\n".join(sorted(seen)) + "\n").encode()).hexdigest().upper()


def reconstruct(year: int, route_dir: Path, chunk_bytes: int, request_log: Path) -> dict[str, object]:
    url = URLS[year]
    year_dir = route_dir / str(year)
    probe_body = year_dir / "chunk-000000000000-000000000000.bin"
    probe_headers = year_dir / "chunk-000000000000-000000000000.headers"
    started = utc_now()
    status, headers = curl_range(url, 0, 0, probe_body, probe_headers, None)
    append_event(request_log, {"event": "RANGE_RESPONSE", "year": year, "start": 0, "end": 0,
                               "status": status, "headers": headers, "bytes": probe_body.stat().st_size,
                               "sha256": sha256_file(probe_body), "completed_utc": utc_now()})
    output = route_dir / "outputs" / f"nvd-{year}.json.gz"
    output.parent.mkdir(parents=True, exist_ok=True)
    if output.exists():
        raise RuntimeError(f"refusing to overwrite reconstructed asset: {output}")
    if status == 200:
        declared = headers.get("content-length")
        if declared is None or int(declared) != probe_body.stat().st_size:
            raise RuntimeError("range probe returned HTTP 200 without a complete length-matched body")
        os.replace(probe_body, output)
        total = int(declared)
        etag = headers.get("etag")
        if not etag:
            raise RuntimeError("complete fallback response lacks ETag")
        request_count = 1
    elif status == 206:
        content_range = headers.get("content-range")
        match = re.fullmatch(r"bytes 0-0/(\d+)", content_range or "")
        etag = headers.get("etag")
        if not match or not etag or probe_body.stat().st_size != 1:
            raise RuntimeError("range probe lacks exact Content-Range, stable ETag, or one-byte body")
        total = int(match.group(1))
        request_count = 1
        with output.open("xb") as target:
            target.write(probe_body.read_bytes())
            offset = 1
            while offset < total:
                end = min(offset + chunk_bytes - 1, total - 1)
                body = year_dir / f"chunk-{offset:012d}-{end:012d}.bin"
                header_file = year_dir / f"chunk-{offset:012d}-{end:012d}.headers"
                part_status, part_headers = curl_range(url, offset, end, body, header_file, etag)
                request_count += 1
                expected_range = f"bytes {offset}-{end}/{total}"
                if part_status != 206 or part_headers.get("content-range") != expected_range:
                    raise RuntimeError(f"invalid range response at {offset}: {part_status} {part_headers.get('content-range')!r}")
                if part_headers.get("etag") != etag:
                    raise RuntimeError(f"ETag changed during reconstruction at {offset}")
                expected_bytes = end - offset + 1
                if body.stat().st_size != expected_bytes:
                    raise RuntimeError(f"short range at {offset}: {body.stat().st_size} != {expected_bytes}")
                target.write(body.read_bytes())
                target.flush()
                os.fsync(target.fileno())
                append_event(request_log, {"event": "RANGE_RESPONSE", "year": year, "start": offset,
                                           "end": end, "status": part_status, "headers": part_headers,
                                           "bytes": body.stat().st_size, "sha256": sha256_file(body),
                                           "completed_utc": utc_now()})
                print(f"range {year} {offset}-{end} pass", flush=True)
                offset = end + 1
    else:
        raise RuntimeError(f"unexpected range probe HTTP status {status}")
    if output.stat().st_size != total:
        raise RuntimeError(f"reconstructed size mismatch: {output.stat().st_size} != {total}")
    count, set_digest = validate_feed(output)
    source = {
        "year": year, "url": url, "route": "EXACT_OFFICIAL_STABLE_ETAG_HTTP_RANGE",
        "started_utc": started, "completed_utc": utc_now(), "etag": etag,
        "bytes": total, "sha256": sha256_file(output), "request_count": request_count,
        "gzip_full_stream": "PASS", "json_schema": "PASS_ALL_CVE_IDS_UNIQUE",
        "cve_count": count, "cve_set_digest": set_digest,
    }
    write_json_once(output.with_suffix(output.suffix + ".source.json"), source)
    return source


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--route-id", choices=("ROUTE_2_NVD_STABLE_ETAG_RANGE", "ROUTE_4_NVD_ALTERNATE_OFFICIAL_TRANSFER"), required=True)
    parser.add_argument("--chunk-bytes", type=int, required=True)
    args = parser.parse_args()
    if args.chunk_bytes < 262144 or args.chunk_bytes > 8388608:
        raise RuntimeError("chunk size outside frozen safe range")
    suffix = "route2" if args.route_id.startswith("ROUTE_2") else "route4"
    route1_path = ROOT / "ROUTE_1_NVD_API2_RESULT.json"
    if not route1_path.exists():
        raise RuntimeError("range fallback is locked until Route 1 has a terminal obstruction")
    route1 = json.loads(route1_path.read_text(encoding="utf-8"))
    if route1.get("status") == "PASS":
        raise RuntimeError("range fallback is forbidden because Route 1 passed")
    if args.route_id.startswith("ROUTE_4"):
        route2_path = ROOT / "ROUTE_2_NVD_STABLE_ETAG_RANGE_RESULT.json"
        if not route2_path.exists():
            raise RuntimeError("Route 4 is locked until Route 2 has a terminal result")
        route2 = json.loads(route2_path.read_text(encoding="utf-8"))
        if route2.get("status") != "MECHANICAL_TRANSFER_FAILURE":
            raise RuntimeError("Route 4 is allowed only after Route 2 mechanical transfer failure")
    route_dir = ROOT / "inputs" / "range" / suffix
    result_path = ROOT / f"{args.route_id}_RESULT.json"
    if result_path.exists():
        raise RuntimeError(f"route already has terminal result: {args.route_id}")
    route_log = ROOT / "route_attempts.jsonl"
    request_log = ROOT / f"{suffix}_range_requests.jsonl"
    append_event(route_log, {"event": "ROUTE_START", "route_id": args.route_id,
                             "started_utc": utc_now(), "claim_bearing": False, "automatic_retry": False})
    started = time.monotonic()
    outputs: list[dict[str, object]] = []
    try:
        for year in (2023, 2024):
            outputs.append(reconstruct(year, route_dir, args.chunk_bytes, request_log))
        result = {"route_id": args.route_id, "status": "PASS", "completed_utc": utc_now(),
                  "wall_seconds": round(time.monotonic() - started, 3), "outputs": outputs,
                  "claim_bearing": False, "scientific_inference": False}
        write_json_once(result_path, result)
        append_event(route_log, {"event": "ROUTE_END", **result})
        return 0
    except Exception as error:
        result = {"route_id": args.route_id, "status": "MECHANICAL_TRANSFER_FAILURE",
                  "completed_utc": utc_now(), "wall_seconds": round(time.monotonic() - started, 3),
                  "closed_outputs": outputs, "error": repr(error), "claim_bearing": False,
                  "scientific_inference": False}
        write_json_once(result_path, result)
        append_event(route_log, {"event": "ROUTE_END", **result})
        print(f"RESOURCE_{args.route_id}_FAILURE: {error}", file=sys.stderr, flush=True)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
