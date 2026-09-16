"""Mechanical validator for the sealed PACKER deliverable.

The validator reads files and recomputes metadata only. It never runs or scores
the proposed method or a historical candidate.
"""

from __future__ import annotations

import hashlib
import pathlib
import re
import sys

import yaml


ROOT = pathlib.Path(__file__).resolve().parents[1]
HIDDEN_IDS = [
    "WEBGRAPH-REFERENCE-FOREST",
    "HNSW-LAYER-BMATCH",
    "GPU-TMAPHASE",
    "GPU-MX-VIEWLATTICE",
    "QINT-REQUANT-COMPOSE",
    "S6-JS-PREFIXBOUND",
    "PARQUET-PAGE-COSEGMENT",
    "AIGER-DELTA-SCHEDULE",
    "S4-SLO-PAGEPACK",
    "GIT-PACK-FOREST",
    "COH-REGION-LIFECYCLE",
    "CVC5-ALETHE-SHAREMAP",
    "ROCKSDB-DICT-COVER",
    "S5-OCCUPANCY-CLIFF-JOINTCODEGEN",
    "LLVM-BITCODE-ABBREV-PLANNER",
    "CONFIRM_STOP",
    "PASS_RECOMMENDED",
]


def sha256(path: pathlib.Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest().upper()


def fail(message: str) -> None:
    raise AssertionError(message)


def main() -> int:
    yaml_paths = sorted(ROOT.rglob("*.yaml"))
    for path in yaml_paths:
        with path.open("r", encoding="utf-8") as stream:
            yaml.safe_load(stream)

    manifest_path = ROOT / "sealed_input_manifest.yaml"
    manifest = yaml.safe_load(manifest_path.read_text(encoding="utf-8"))
    entries = manifest["files"]
    if len(entries) != manifest["executor_readable_file_count"]:
        fail("executor file count mismatch")
    if manifest_path.name in {entry["path"] for entry in entries}:
        fail("sealed_input_manifest hashes itself")

    listed_paths: set[str] = set()
    listed_bytes = 0
    for entry in entries:
        rel = entry["path"]
        if "\\" in rel or rel.startswith("/") or ".." in pathlib.PurePosixPath(rel).parts:
            fail(f"noncanonical path: {rel}")
        path = (ROOT / pathlib.PurePosixPath(rel)).resolve()
        try:
            path.relative_to(ROOT.resolve())
        except ValueError:
            fail(f"path escapes PACKER root: {rel}")
        if not path.is_file():
            fail(f"missing manifest file: {rel}")
        if rel in listed_paths:
            fail(f"duplicate manifest path: {rel}")
        listed_paths.add(rel)
        if path.stat().st_size != entry["bytes"]:
            fail(f"byte mismatch: {rel}")
        if sha256(path) != entry["sha256"]:
            fail(f"sha mismatch: {rel}")
        listed_bytes += path.stat().st_size
    if listed_bytes != manifest["executor_readable_bytes"]:
        fail("executor byte total mismatch")

    expected_paths = {"sealed_method_contract.yaml"}
    source_count = 0
    case_ids = []
    authored_executor_yaml = [ROOT / "sealed_method_contract.yaml"]
    for case_dir in sorted((ROOT / "sealed_cases").iterdir()):
        if not case_dir.is_dir():
            continue
        case_ids.append(case_dir.name)
        case_yaml = case_dir / "case.yaml"
        authored_executor_yaml.append(case_yaml)
        expected_paths.add(case_yaml.relative_to(ROOT).as_posix())
        case = yaml.safe_load(case_yaml.read_text(encoding="utf-8"))
        sources = case["sources"]
        expected_count = 4 if case_dir.name == "C02" else 3
        if len(sources) != expected_count:
            fail(f"source count mismatch: {case_dir.name}")
        for source in sources:
            rel = source["path"]
            path = ROOT / pathlib.PurePosixPath(rel)
            expected_paths.add(rel)
            source_count += 1
            if not path.is_file():
                fail(f"missing embedded source: {rel}")
            if path.stat().st_size != source["bytes"] or sha256(path) != source["sha256"]:
                fail(f"embedded source metadata mismatch: {rel}")
            if path.suffix.lower() == ".pdf" and not path.read_bytes().startswith(b"%PDF-"):
                fail(f"invalid PDF magic: {rel}")
    if case_ids != [f"C{index:02d}" for index in range(1, 19)]:
        fail("case ID sequence mismatch")
    if source_count != 55 or manifest["source_artifact_count"] != 55:
        fail("source total mismatch")
    if expected_paths != listed_paths:
        fail(
            "manifest/executor file-set mismatch: missing="
            f"{sorted(expected_paths - listed_paths)} extra={sorted(listed_paths - expected_paths)}"
        )

    authored = "\n".join(
        path.read_text(encoding="utf-8") for path in authored_executor_yaml
    )
    for hidden in HIDDEN_IDS:
        if hidden in authored:
            fail(f"hidden target/status leaked into authored executor YAML: {hidden}")

    print(f"YAML_PARSED={len(yaml_paths)}")
    print(f"CASES={len(case_ids)}")
    print(f"SOURCES={source_count}")
    print(f"EXECUTOR_FILES={len(entries)}")
    print(f"EXECUTOR_BYTES={listed_bytes}")
    print("MANIFEST_HASHES=PASS")
    print("PATH_BOUNDARY=PASS")
    print("PDF_MAGIC=PASS")
    print("HIDDEN_ID_SCAN=PASS")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
