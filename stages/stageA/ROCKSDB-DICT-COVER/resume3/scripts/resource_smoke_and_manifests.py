#!/usr/bin/env python3
"""Unmodified frozen-converter read smoke and deterministic 20-manifest build.

This script is resource-only. It imports the exact frozen converter and invokes
its record readers and manifest writer without modifying their implementation.
"""

from __future__ import annotations

import datetime as dt
import hashlib
import importlib.util
import json
import sys
import time
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
TOPIC = ROOT.parent
RESUME1 = TOPIC / "resume1"
RESUME2 = TOPIC / "resume2"
CONVERTER = TOPIC / "scripts" / "prepare_manifests.py"
CONVERTER_SHA256 = "E93D8D7A7AB47B2A65751064F5114FCD9E919813F2A7F810123FDCAF7FD7E244"
NVD_OLD = {
    2015: (RESUME1 / "inputs/raw/nvd-2015.json.gz", 4190045, "36D62C93A5F15ACDCBA69513F3CA86D44A35E10ACD44258E5A49AFE1EB24B0C0"),
    2016: (RESUME1 / "inputs/raw/nvd-2016.json.gz", 5159096, "E3A4B0B68C30065FB24417DDF1240E8149B3F99F433F4A262B776090A24E930F"),
    2017: (RESUME1 / "inputs/raw/nvd-2017.json.gz", 7706425, "F3569A60D9AD55B6F076ADF6DF74F67BBAE93A88AFD97D31C5A8BC1E4B4FB894"),
    2018: (RESUME1 / "inputs/raw/nvd-2018.json.gz", 8264377, "6508FA9EB5E45767E3120B5D4A135799C593281D717491BBB94E715F9CF89B31"),
    2019: (RESUME2 / "inputs/raw/nvd-2019.json.gz", 10171125, "7106AD65484B53C0E400F59DFF7A350CF7A63BBB11BD8FFD37EE3435D68953E6"),
    2020: (RESUME2 / "inputs/raw/nvd-2020.json.gz", 13960211, "645B6399945F08FEA8693456056BEA8F1837BC973D41176014FCF99F6283C047"),
    2021: (RESUME2 / "inputs/raw/nvd-2021.json.gz", 16852651, "E3600406245A4626E5BEFEDA3F6E7BFCB7806F1B8BE7BF62895D55B5395AC595"),
    2022: (RESUME2 / "inputs/raw/nvd-2022.json.gz", 18333784, "D9568EB4A189076CE06D020C27908EDD76E3C4A40F048297D8A175AB8E826AD6"),
}
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


def read_terminal(path: Path) -> dict[str, object]:
    if not path.exists():
        raise RuntimeError(f"required route result missing: {path}")
    return json.loads(path.read_text(encoding="utf-8"))


def choose_new_nvd(year: int) -> tuple[Path, str]:
    api_result = ROOT / "ROUTE_1_NVD_API2_RESULT.json"
    if api_result.exists() and read_terminal(api_result).get("status") == "PASS":
        return ROOT / "inputs" / "derived" / f"nvd-{year}.api-normalized.json.gz", "OFFICIAL_API_PAGES_WITH_DETERMINISTIC_AGGREGATE"
    for route_id, suffix in (("ROUTE_2_NVD_STABLE_ETAG_RANGE", "route2"), ("ROUTE_4_NVD_ALTERNATE_OFFICIAL_TRANSFER", "route4")):
        result = ROOT / f"{route_id}_RESULT.json"
        if result.exists() and read_terminal(result).get("status") == "PASS":
            return ROOT / "inputs" / "range" / suffix / "outputs" / f"nvd-{year}.json.gz", "EXACT_OFFICIAL_ANNUAL_FEED_STABLE_ETAG_RANGE"
    raise RuntimeError(f"no admissible closed NVD source for {year}")


def load_converter():
    if sha256_file(CONVERTER) != CONVERTER_SHA256:
        raise RuntimeError("frozen converter hash mismatch")
    spec = importlib.util.spec_from_file_location("frozen_prepare_manifests", CONVERTER)
    if spec is None or spec.loader is None:
        raise RuntimeError("cannot load frozen converter")
    module = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(module)
    return module


def main() -> int:
    result_path = ROOT / "RESOURCE_SMOKE_RESULT.json"
    inventory_path = ROOT / "NATURAL_MANIFEST_INVENTORY.json"
    manifest_dir = ROOT / "inputs" / "manifests"
    if result_path.exists() or inventory_path.exists() or manifest_dir.exists():
        raise RuntimeError("refusing to overwrite prior smoke/manifest state")
    pypi_result = read_terminal(ROOT / "ROUTE_3_PYPI_PROJECT_JSON_RESULT.json")
    if pypi_result.get("status") != "PASS":
        raise RuntimeError("PyPI resource route is not PASS")
    converter = load_converter()
    started = time.monotonic()
    rows: list[dict[str, object]] = []
    for year in range(2015, 2025):
        if year in NVD_OLD:
            source, expected_bytes, expected_hash = NVD_OLD[year]
            if source.stat().st_size != expected_bytes or sha256_file(source) != expected_hash:
                raise RuntimeError(f"immutable upstream NVD mismatch for {year}")
            provenance = "VERIFIED_IMMUTABLE_UPSTREAM_OFFICIAL_ANNUAL_FEED"
        else:
            source, provenance = choose_new_nvd(year)
        records = converter.nvd_records(source, year)
        if not records:
            raise RuntimeError(f"unmodified converter returned no records for NVD {year}")
        built = converter.write_manifest(manifest_dir / f"nvd-{year}.kvman", records)
        rows.append({
            "id": f"nvd-{year}", "family": "NVD_JSON_2_0", "source_file": str(source),
            "source_bytes": source.stat().st_size, "source_sha256": sha256_file(source),
            "provenance": provenance, "license": "NIST_PUBLIC_DOMAIN_DATA_WITH_ATTRIBUTION_RETAINED",
            "unmodified_converter_read_smoke": "PASS", **built,
        })
        print(f"smoke/manifest nvd-{year} pass records={len(records)}", flush=True)
    for package in PACKAGES:
        source = ROOT / "inputs" / "pypi" / f"pypi-{package}.json"
        sidecar = source.with_suffix(".source.json")
        if not source.exists() or not sidecar.exists():
            raise RuntimeError(f"PyPI asset/sidecar missing for {package}")
        meta = json.loads(sidecar.read_text(encoding="utf-8"))
        if meta.get("sha256") != sha256_file(source) or meta.get("bytes") != source.stat().st_size:
            raise RuntimeError(f"PyPI asset hash/size mismatch for {package}")
        records = converter.pypi_records(source, package)
        if not records:
            raise RuntimeError(f"unmodified converter returned no records for PyPI {package}")
        built = converter.write_manifest(manifest_dir / f"pypi-{package}.kvman", records)
        rows.append({
            "id": f"pypi-{package}", "family": "PYPI_JSON_API", "source_file": str(source),
            "source_bytes": source.stat().st_size, "source_sha256": sha256_file(source),
            "provenance": "DIRECT_EXACT_OFFICIAL_PYPI_PROJECT_JSON",
            "license": "PACKAGE_DECLARED_LICENSE_METADATA_RETAINED__REGISTRY_METADATA_ONLY",
            "declared_license": meta.get("info_license"), "license_expression": meta.get("info_license_expression"),
            "license_classifiers": meta.get("license_classifiers"),
            "unmodified_converter_read_smoke": "PASS", **built,
        })
        print(f"smoke/manifest pypi-{package} pass records={len(records)}", flush=True)
    if len(rows) != 20 or {row["family"] for row in rows} != {"NVD_JSON_2_0", "PYPI_JSON_API"}:
        raise RuntimeError("natural resource population closure failure")
    inventory = {
        "schema_version": "rocksdict-natural-manifest-inventory-resume3-v1",
        "assignment_id": "RESOURCE-STAGEA-L3-20260811-ROCKSDB-DICT-COVER-RESUME3-R3B",
        "frozen_converter": str(CONVERTER), "frozen_converter_sha256": CONVERTER_SHA256,
        "construction": "UNMODIFIED_FROZEN_CONVERTER_NVD_RECORDS_PYPI_RECORDS_AND_WRITE_MANIFEST",
        "manifest_count": len(rows), "families": sorted({row["family"] for row in rows}),
        "claim_bearing": False, "manifests": rows,
    }
    write_json_once(inventory_path, inventory)
    result = {
        "schema_version": "rocksdict-resource-smoke-resume3-v1", "status": "PASS",
        "completed_utc": utc_now(), "wall_seconds": round(time.monotonic() - started, 3),
        "assets": 20, "manifests": 20, "families": 2,
        "unmodified_converter_sha256": CONVERTER_SHA256,
        "inventory_sha256": sha256_file(inventory_path),
        "claim_bearing": False, "scientific_inference": False,
    }
    write_json_once(result_path, result)
    print("RESOURCE_SMOKE_PASS assets=20 manifests=20", flush=True)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as error:
        print(f"RESOURCE_SMOKE_FAILURE: {error}", file=sys.stderr, flush=True)
        raise
