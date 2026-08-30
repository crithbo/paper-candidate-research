#!/usr/bin/env python3
"""Route 1: official NVD CVE API 2.0 parity and acquisition.

This is resource-only. It never invokes RocksDB, Zstd, a selector, a trainer,
or an SST writer. There are no automatic network retries.
"""

from __future__ import annotations

import collections
import datetime as dt
import gzip
import hashlib
import json
import os
import sys
import time
import urllib.parse
import urllib.request
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
TOPIC = ROOT.parent
RESUME2 = TOPIC / "resume2"
API_ROOT = "https://services.nvd.nist.gov/rest/json/cves/2.0/"
USER_AGENT = "ROCKSDB-DICT-COVER-StageA-Resume3/1.0"
RESULTS_PER_PAGE = 2000
SLEEP_SECONDS = 6.2
WINDOW_DAYS = 120
REFERENCE = {
    2019: (10171125, "7106AD65484B53C0E400F59DFF7A350CF7A63BBB11BD8FFD37EE3435D68953E6"),
    2020: (13960211, "645B6399945F08FEA8693456056BEA8F1837BC973D41176014FCF99F6283C047"),
    2021: (16852651, "E3600406245A4626E5BEFEDA3F6E7BFCB7806F1B8BE7BF62895D55B5395AC595"),
    2022: (18333784, "D9568EB4A189076CE06D020C27908EDD76E3C4A40F048297D8A175AB8E826AD6"),
}


def canonical(value: object) -> bytes:
    return json.dumps(value, sort_keys=True, separators=(",", ":"), ensure_ascii=False).encode("utf-8")


def sha256_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest().upper()


def sha256_file(path: Path) -> str:
    digest = hashlib.sha256()
    with path.open("rb") as handle:
        for chunk in iter(lambda: handle.read(1024 * 1024), b""):
            digest.update(chunk)
    return digest.hexdigest().upper()


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


def utc_now() -> str:
    return dt.datetime.now(dt.timezone.utc).isoformat().replace("+00:00", "Z")


class PublicRateLimiter:
    def __init__(self) -> None:
        self.starts: collections.deque[float] = collections.deque()
        self.last_start: float | None = None

    def wait(self) -> None:
        while True:
            now = time.monotonic()
            while self.starts and now - self.starts[0] >= 30.0:
                self.starts.popleft()
            delays = [0.0]
            if self.last_start is not None:
                delays.append(SLEEP_SECONDS - (now - self.last_start))
            if len(self.starts) >= 5:
                delays.append(30.05 - (now - self.starts[0]))
            delay = max(delays)
            if delay <= 0:
                break
            time.sleep(delay)
        started = time.monotonic()
        self.starts.append(started)
        self.last_start = started


RATE = PublicRateLimiter()
REQUEST_LOG = ROOT / "api_requests.jsonl"
NETWORK_BYTES = 0
REQUEST_COUNT = 0


def validate_cached(page: Path, sidecar: Path, url: str) -> dict[str, object] | None:
    if not page.exists() and not sidecar.exists():
        return None
    if not page.exists() or not sidecar.exists():
        raise RuntimeError(f"incomplete cached page pair: {page}")
    meta = json.loads(sidecar.read_text(encoding="utf-8"))
    if meta.get("url") != url:
        raise RuntimeError(f"cached page URL mismatch: {page}")
    if meta.get("sha256") != sha256_file(page) or meta.get("bytes") != page.stat().st_size:
        raise RuntimeError(f"cached page hash/size mismatch: {page}")
    payload = json.loads(page.read_text(encoding="utf-8"))
    validate_envelope(payload, int(meta["query_start_index"]))
    return payload


def validate_envelope(payload: object, query_start: int) -> None:
    if not isinstance(payload, dict):
        raise RuntimeError("NVD API response is not an object")
    for key in ("resultsPerPage", "startIndex", "totalResults", "vulnerabilities"):
        if key not in payload:
            raise RuntimeError(f"NVD API response missing {key}")
    if payload["startIndex"] != query_start:
        raise RuntimeError(f"NVD API startIndex mismatch {payload['startIndex']} != {query_start}")
    if not isinstance(payload["vulnerabilities"], list):
        raise RuntimeError("NVD API vulnerabilities is not an array")
    if int(payload["resultsPerPage"]) > RESULTS_PER_PAGE:
        raise RuntimeError("NVD API returned an oversized page")
    for item in payload["vulnerabilities"]:
        if not isinstance(item, dict) or not isinstance(item.get("cve"), dict) or not item["cve"].get("id"):
            raise RuntimeError("NVD API entry lacks cve.id")


def fetch_page(url: str, page: Path, sidecar: Path, query_start: int) -> dict[str, object]:
    global NETWORK_BYTES, REQUEST_COUNT
    cached = validate_cached(page, sidecar, url)
    if cached is not None:
        return cached
    if page.exists() or sidecar.exists() or page.with_suffix(page.suffix + ".partial").exists():
        raise RuntimeError(f"refusing implicit retry over incomplete page state: {page}")
    RATE.wait()
    requested_utc = utc_now()
    REQUEST_COUNT += 1
    request = urllib.request.Request(
        url,
        headers={"User-Agent": USER_AGENT, "Accept": "application/json", "Accept-Encoding": "identity"},
    )
    partial = page.with_suffix(page.suffix + ".partial")
    page.parent.mkdir(parents=True, exist_ok=True)
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
        NETWORK_BYTES += observed
        append_event(REQUEST_LOG, {
            "event": "REQUEST_FAIL", "requested_utc": requested_utc, "completed_utc": utc_now(),
            "url": url, "query_start_index": query_start, "actual_bytes": observed,
            "partial_sha256": sha256_file(partial) if partial.exists() else None, "error": repr(error),
        })
        raise
    NETWORK_BYTES += observed
    if status != 200:
        raise RuntimeError(f"NVD API HTTP status {status}")
    content_length = headers.get("content-length")
    if content_length is not None and int(content_length) != observed:
        raise RuntimeError(f"NVD API short body observed={observed} expected={content_length}")
    if headers.get("content-encoding") not in (None, "identity"):
        raise RuntimeError(f"unexpected content encoding: {headers.get('content-encoding')}")
    payload = json.loads(partial.read_text(encoding="utf-8"))
    validate_envelope(payload, query_start)
    digest = sha256_file(partial)
    os.replace(partial, page)
    meta = {
        "url": url, "query_start_index": query_start, "http_status": status,
        "bytes": observed, "sha256": digest, "requested_utc": requested_utc,
        "completed_utc": utc_now(), "headers": headers,
        "completion_proof": "CONTENT_LENGTH_MATCH" if content_length is not None else "HTTP_EOF_PLUS_VALID_JSON_ENVELOPE",
    }
    write_json_once(sidecar, meta)
    append_event(REQUEST_LOG, {"event": "REQUEST_PASS", **meta})
    print(f"request pass startIndex={query_start} bytes={observed}", flush=True)
    return payload


def iso_start(value: dt.datetime) -> str:
    return value.strftime("%Y-%m-%dT%H:%M:%S.000Z")


def iso_end(value: dt.datetime) -> str:
    return value.strftime("%Y-%m-%dT%H:%M:%S.999Z")


def fetch_year(year: int) -> tuple[dict[str, dict[str, object]], dict[str, object]]:
    records: dict[str, dict[str, object]] = {}
    pages: list[dict[str, object]] = []
    cursor = dt.datetime(year, 1, 1, tzinfo=dt.timezone.utc)
    stop = dt.datetime(year + 1, 1, 1, tzinfo=dt.timezone.utc)
    window_number = 0
    while cursor < stop:
        next_cursor = min(cursor + dt.timedelta(days=WINDOW_DAYS), stop)
        inclusive_end = next_cursor - dt.timedelta(milliseconds=1)
        window_number += 1
        start_index = 0
        expected_total: int | None = None
        while True:
            params = {
                "pubStartDate": iso_start(cursor),
                "pubEndDate": iso_end(inclusive_end),
                "resultsPerPage": str(RESULTS_PER_PAGE),
                "startIndex": str(start_index),
            }
            url = API_ROOT + "?" + urllib.parse.urlencode(params)
            window_id = f"w{window_number:02d}_{cursor:%Y%m%d}_{inclusive_end:%Y%m%d}"
            page = ROOT / "inputs" / "api" / "pages" / str(year) / window_id / f"start-{start_index:06d}.json"
            sidecar = page.with_suffix(".source.json")
            payload = fetch_page(url, page, sidecar, start_index)
            total = int(payload["totalResults"])
            if expected_total is None:
                expected_total = total
            elif total != expected_total:
                raise RuntimeError(f"NVD API totalResults changed within window {window_id}")
            items = payload["vulnerabilities"]
            for item in items:
                cve = item["cve"]
                cve_id = str(cve["id"])
                if cve_id in records:
                    raise RuntimeError(f"duplicate CVE across year windows/pages: {cve_id}")
                records[cve_id] = cve
            pages.append({
                "window": window_id, "start_index": start_index, "total_results": total,
                "returned": len(items), "file": page.relative_to(ROOT).as_posix(),
                "sha256": sha256_file(page), "bytes": page.stat().st_size,
            })
            start_index += len(items)
            if start_index >= total:
                break
            if not items:
                raise RuntimeError(f"empty nonterminal NVD API page in {window_id}")
        cursor = next_cursor
    summary = digest_summary(records)
    summary.update({"year": year, "pages": pages, "window_count": window_number})
    return records, summary


def digest_summary(records: dict[str, dict[str, object]]) -> dict[str, object]:
    ids = sorted(records)
    set_digest = sha256_bytes(("\n".join(ids) + "\n").encode("utf-8"))
    content_lines = []
    for cve_id in ids:
        content_lines.append(f"{cve_id}\t{sha256_bytes(canonical(records[cve_id]))}")
    content_digest = sha256_bytes(("\n".join(content_lines) + "\n").encode("utf-8"))
    return {"record_count": len(ids), "set_digest": set_digest, "content_digest": content_digest}


def read_reference(year: int) -> dict[str, dict[str, object]]:
    path = RESUME2 / "inputs" / "raw" / f"nvd-{year}.json.gz"
    expected_bytes, expected_hash = REFERENCE[year]
    if path.stat().st_size != expected_bytes or sha256_file(path) != expected_hash:
        raise RuntimeError(f"frozen annual reference mismatch: {path}")
    with gzip.open(path, "rt", encoding="utf-8") as handle:
        payload = json.load(handle)
    records: dict[str, dict[str, object]] = {}
    for item in payload.get("vulnerabilities", []):
        cve = item.get("cve")
        if not isinstance(cve, dict) or not cve.get("id"):
            raise RuntimeError(f"annual reference schema failure: {path}")
        if cve["id"] in records:
            raise RuntimeError(f"annual reference duplicate: {cve['id']}")
        records[cve["id"]] = cve
    return records


def compare_parity(year: int, api: dict[str, dict[str, object]]) -> dict[str, object]:
    annual = read_reference(year)
    api_ids = set(api)
    annual_ids = set(annual)
    common = sorted(api_ids & annual_ids)
    content_mismatches = [cve_id for cve_id in common if canonical(api[cve_id]) != canonical(annual[cve_id])]
    api_summary = digest_summary(api)
    annual_summary = digest_summary(annual)
    passed = api_ids == annual_ids and not content_mismatches
    return {
        "year": year, "status": "PASS" if passed else "FAIL",
        "api": api_summary, "annual": annual_summary,
        "api_only_count": len(api_ids - annual_ids), "annual_only_count": len(annual_ids - api_ids),
        "content_mismatch_count": len(content_mismatches),
        "api_only_sample": sorted(api_ids - annual_ids)[:20],
        "annual_only_sample": sorted(annual_ids - api_ids)[:20],
        "content_mismatch_sample": content_mismatches[:20],
    }


def write_derived_annual(year: int, records: dict[str, dict[str, object]], summary: dict[str, object]) -> dict[str, object]:
    out = ROOT / "inputs" / "derived" / f"nvd-{year}.api-normalized.json.gz"
    source = out.with_suffix(out.suffix + ".source.json")
    if out.exists() or source.exists():
        raise RuntimeError(f"refusing to overwrite derived API aggregate: {out}")
    payload = {
        "format": "NVD_CVE", "version": "2.0", "timestamp": utc_now(),
        "vulnerabilities": [{"cve": records[cve_id]} for cve_id in sorted(records)],
    }
    raw_json = canonical(payload)
    compressed = gzip.compress(raw_json, compresslevel=9, mtime=0)
    out.parent.mkdir(parents=True, exist_ok=True)
    with out.open("xb") as handle:
        handle.write(compressed)
    meta = {
        "year": year, "kind": "DETERMINISTIC_DERIVED_ANNUAL_ENVELOPE_FROM_EXACT_OFFICIAL_API_PAGES",
        "raw_official_page_count": len(summary["pages"]), "record_count": len(records),
        "record_set_digest": summary["set_digest"], "record_content_digest": summary["content_digest"],
        "derived_bytes": out.stat().st_size, "derived_sha256": sha256_file(out),
        "gzip_full_stream": "PASS", "json_full_parse": "PASS", "provenance": "RAW_PAGE_LIST_IN_API_YEAR_SUMMARY",
    }
    write_json_once(source, meta)
    return {"file": out.relative_to(ROOT).as_posix(), **meta}


def main() -> int:
    route_log = ROOT / "route_attempts.jsonl"
    route_result = ROOT / "ROUTE_1_NVD_API2_RESULT.json"
    if route_result.exists():
        raise RuntimeError("Route 1 already has a terminal result; refusing a new attempt")
    append_event(route_log, {
        "event": "ROUTE_START", "route_id": "ROUTE_1_NVD_API2", "started_utc": utc_now(),
        "claim_bearing": False, "automatic_retry": False,
    })
    started = time.monotonic()
    parity_rows: list[dict[str, object]] = []
    year_summaries: dict[str, object] = {}
    derived: list[dict[str, object]] = []
    try:
        for year in range(2019, 2023):
            records, summary = fetch_year(year)
            year_summaries[str(year)] = summary
            row = compare_parity(year, records)
            parity_rows.append(row)
            print(f"parity {year}: {row['status']} records={summary['record_count']}", flush=True)
            if row["status"] != "PASS":
                parity_result = {
                    "schema_version": "rocksdict-nvd-api-parity-v1", "status": "FAIL",
                    "rows": parity_rows, "resource_route_obstruction_only": True,
                    "scientific_inference": False,
                }
                write_json_once(ROOT / "NVD_API_PARITY_RESULT.json", parity_result)
                result = {
                    "route_id": "ROUTE_1_NVD_API2", "status": "PARITY_FAILED_RESOURCE_ROUTE_OBSTRUCTION",
                    "completed_utc": utc_now(), "wall_seconds": round(time.monotonic() - started, 3),
                    "request_count": REQUEST_COUNT, "network_body_bytes": NETWORK_BYTES,
                    "failed_year": year, "claim_bearing": False, "scientific_inference": False,
                }
                write_json_once(route_result, result)
                append_event(route_log, {"event": "ROUTE_END", **result})
                return 3
        parity_result = {
            "schema_version": "rocksdict-nvd-api-parity-v1", "status": "PASS",
            "rows": parity_rows, "resource_route_obstruction_only": False,
            "scientific_inference": False,
        }
        write_json_once(ROOT / "NVD_API_PARITY_RESULT.json", parity_result)
        for year in (2023, 2024):
            records, summary = fetch_year(year)
            year_summaries[str(year)] = summary
            derived.append(write_derived_annual(year, records, summary))
            print(f"acquired API year {year}: records={summary['record_count']}", flush=True)
        write_json_once(ROOT / "NVD_API_YEAR_SUMMARIES.json", {
            "schema_version": "rocksdict-nvd-api-year-summaries-v1", "years": year_summaries,
        })
        result = {
            "route_id": "ROUTE_1_NVD_API2", "status": "PASS",
            "completed_utc": utc_now(), "wall_seconds": round(time.monotonic() - started, 3),
            "request_count": REQUEST_COUNT, "network_body_bytes": NETWORK_BYTES,
            "parity": "PASS_2019_2022", "acquired": derived,
            "claim_bearing": False, "scientific_inference": False,
        }
        write_json_once(route_result, result)
        append_event(route_log, {"event": "ROUTE_END", **result})
        return 0
    except Exception as error:
        result = {
            "route_id": "ROUTE_1_NVD_API2", "status": "COMPLETE_TRANSFER_OR_SCHEMA_OBSTRUCTION",
            "completed_utc": utc_now(), "wall_seconds": round(time.monotonic() - started, 3),
            "request_count": REQUEST_COUNT, "network_body_bytes": NETWORK_BYTES,
            "error": repr(error), "claim_bearing": False, "scientific_inference": False,
        }
        write_json_once(route_result, result)
        append_event(route_log, {"event": "ROUTE_END", **result})
        print(f"RESOURCE_ROUTE_1_FAILURE: {error}", file=sys.stderr, flush=True)
        return 2


if __name__ == "__main__":
    raise SystemExit(main())
