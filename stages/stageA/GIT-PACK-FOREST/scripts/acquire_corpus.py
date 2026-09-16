from __future__ import annotations

import argparse
import hashlib
import json
from pathlib import Path
import sys
import time

from git_pack_lib import (
    ProcessFailure,
    directory_bytes,
    git_run,
    git_text,
    read_batch_objects,
    sha256_bytes,
    sha256_file,
    write_json,
)


MAX_OBJECTS = 1200
MAX_CANONICAL_BYTES = 32 * 1024 * 1024
MAX_WORKSPACE_BYTES = 4 * 1024 * 1024 * 1024


def object_ids(git: Path, repo: Path, commit: str) -> list[str]:
    text = git_text(git, repo, ["rev-list", "--objects", "--no-object-names", commit])
    return sorted(set(line.strip() for line in text.splitlines() if line.strip()))


def object_sizes(git: Path, repo: Path, oids: list[str]) -> tuple[int, int]:
    data = ("\n".join(oids) + "\n").encode("ascii")
    result = git_run(
        git,
        repo,
        ["cat-file", "--batch-check=%(objectname) %(objecttype) %(objectsize)"],
        input_bytes=data,
    )
    total = 0
    count = 0
    for line in result["stdout"].decode("ascii").splitlines():
        parts = line.split()
        if len(parts) != 3:
            raise ProcessFailure(f"bad batch-check row: {line}")
        count += 1
        total += int(parts[2])
    return count, total


def choose_commit(git: Path, repo: Path) -> tuple[str, list[str], int, str]:
    history = [line for line in git_text(git, repo, ["rev-list", "--first-parent", "--reverse", "HEAD"]).splitlines() if line]
    if not history:
        raise ProcessFailure("empty first-parent history")
    candidates: list[tuple[str, str]] = [("HEAD", history[-1])]
    for rank in [64, 32, 16, 8, 1]:
        index = min(rank, len(history)) - 1
        item = (f"FIRST_PARENT_RANK_{index + 1}", history[index])
        if item[1] not in {commit for _, commit in candidates}:
            candidates.append(item)
    for policy_label, commit in candidates:
        oids = object_ids(git, repo, commit)
        count, total = object_sizes(git, repo, oids)
        if count <= MAX_OBJECTS and total <= MAX_CANONICAL_BYTES:
            return commit, oids, total, policy_label
    raise ProcessFailure("no commit selection milestone satisfies the preregistered cap")


def path_map(git: Path, repo: Path, commit: str) -> dict[str, str]:
    result: dict[str, str] = {}
    for line in git_text(git, repo, ["rev-list", "--objects", commit]).splitlines():
        oid, _, path = line.partition(" ")
        if oid and path and oid not in result:
            result[oid] = path
    return result


def classify_license(data: bytes | None) -> str:
    if data is None:
        return "NO_ROOT_LICENSE_FILE_DETECTED"
    text = data.decode("utf-8", "replace").lower()
    if "permission is hereby granted, free of charge" in text:
        return "MIT"
    if "apache license" in text and "version 2.0" in text:
        return "Apache-2.0"
    if "redistribution and use in source and binary forms" in text:
        return "BSD_OR_ZLIB_FAMILY"
    if "isc license" in text:
        return "ISC"
    if "creative commons zero" in text or "cc0" in text:
        return "CC0"
    if "unlicense" in text:
        return "Unlicense"
    if "creative commons attribution-sharealike" in text:
        return "CC-BY-SA"
    return "UNCLASSIFIED__CONTENT_HASH_FROZEN"


def freeze_license(git: Path, repo: Path, commit: str) -> dict:
    names = git_text(git, repo, ["ls-tree", "-r", "--name-only", commit]).splitlines()
    candidates = [
        name
        for name in names
        if len(Path(name).parts) == 1
        and Path(name).name.lower().startswith(("license", "copying", "copyright", "unlicense"))
    ]
    if not candidates:
        return {"path": None, "sha256": None, "classifier": classify_license(None)}
    name = sorted(candidates, key=lambda value: (len(value), value.lower()))[0]
    data = git_run(git, repo, ["show", f"{commit}:{name}"])["stdout"]
    return {"path": name, "sha256": sha256_bytes(data), "classifier": classify_license(data)}


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("--git", required=True, type=Path)
    parser.add_argument("--root", required=True, type=Path)
    args = parser.parse_args()
    root = args.root.resolve()
    git = args.git.resolve()
    if root.drive.upper() != "D:":
        raise SystemExit(f"write root must be on D:, got {root}")
    version = git_text(git, root, ["--version"]).strip()
    if version != "git version 2.55.0.windows.1":
        raise SystemExit(f"frozen Git mismatch: {version}")

    repositories = json.loads((root / "inputs" / "repositories.json").read_text(encoding="utf-8"))
    locks = []
    acquisition_log = []
    for index, spec in enumerate(repositories, start=1):
        repo = root / "work" / "repos" / f"{spec['id']}.git"
        repo.parent.mkdir(parents=True, exist_ok=True)
        started = time.perf_counter()
        if not repo.exists():
            clone = git_run(
                git,
                root,
                [
                    "-c",
                    "http.sslBackend=openssl",
                    "-c",
                    "http.version=HTTP/1.1",
                    "clone",
                    "--bare",
                    "--single-branch",
                    "--no-tags",
                    "--quiet",
                    spec["url"],
                    str(repo),
                ],
                timeout=900,
            )
            acquisition_log.append(
                {
                    "id": spec["id"],
                    "command": clone["command"],
                    "wall_seconds": clone["wall_seconds"],
                    "child_cpu_seconds": clone["child_cpu_seconds"],
                    "peak_rss_bytes": clone["peak_rss_bytes"],
                    "status": "CLONED",
                }
            )
        else:
            acquisition_log.append({"id": spec["id"], "status": "EXISTING_IMMUTABLE_CHECKPOINT"})

        branch = git_text(git, repo, ["symbolic-ref", "HEAD"]).strip()
        remote_url = git_text(git, repo, ["remote", "get-url", "origin"]).strip()
        if remote_url.rstrip("/") != spec["url"].rstrip("/"):
            raise ProcessFailure(f"remote mismatch for {spec['id']}: {remote_url}")
        commit, oids, canonical_bytes, policy_label = choose_commit(git, repo)
        git_run(git, repo, ["update-ref", "refs/stagea/frozen", commit])
        paths = path_map(git, repo, commit)
        objects = read_batch_objects(git, repo, oids)
        manifest_path = root / "inputs" / "manifests" / f"{spec['id']}.jsonl"
        manifest_path.parent.mkdir(parents=True, exist_ok=True)
        with manifest_path.open("w", encoding="utf-8", newline="\n") as handle:
            for oid in oids:
                obj = objects[oid]
                canonical = f"{obj['type']} {obj['size']}\0".encode("ascii") + obj["content"]
                row = {
                    "oid": oid,
                    "type": obj["type"],
                    "size": obj["size"],
                    "canonical_sha256": hashlib.sha256(canonical).hexdigest().upper(),
                    "path": paths.get(oid),
                }
                handle.write(json.dumps(row, sort_keys=True) + "\n")
        license_record = freeze_license(git, repo, commit)
        lock = {
            **spec,
            "resolved_default_ref": branch,
            "commit": commit,
            "commit_selection_policy_result": policy_label,
            "reachable_object_count": len(oids),
            "canonical_bytes": canonical_bytes,
            "manifest_path": str(manifest_path.relative_to(root)).replace("\\", "/"),
            "manifest_sha256": sha256_file(manifest_path),
            "license": license_record,
            "clone_bytes": directory_bytes(repo),
            "freeze_wall_seconds": time.perf_counter() - started,
        }
        locks.append(lock)
        print(
            f"[{index:02d}/20] {spec['id']} commit={commit[:12]} objects={len(oids)} bytes={canonical_bytes}",
            flush=True,
        )
        if directory_bytes(root) > MAX_WORKSPACE_BYTES:
            raise ProcessFailure("4 GiB workspace budget exceeded during acquisition")

    lock_file = root / "inputs" / "corpus.lock.json"
    write_json(
        lock_file,
        {
            "schema_version": "git-pack-forest-corpus-lock-v1",
            "git_version": version,
            "selection_rule": "LATEST_OF_HEAD_64_32_16_8_1_UNDER_COMPLETE_REACHABLE_1200_OBJECT_32MIB_CAP",
            "repositories": locks,
        },
    )
    write_json(root / "logs" / "acquisition_metrics.json", acquisition_log)
    summary = {
        "repository_count": len(locks),
        "category_counts": {
            category: sum(item["category"] == category for item in locks)
            for category in sorted({item["category"] for item in locks})
        },
        "object_count": sum(item["reachable_object_count"] for item in locks),
        "canonical_bytes": sum(item["canonical_bytes"] for item in locks),
        "clone_bytes": sum(item["clone_bytes"] for item in locks),
        "workspace_bytes": directory_bytes(root),
        "lock_sha256": sha256_file(lock_file),
    }
    write_json(root / "results" / "corpus_summary.json", summary)
    print(json.dumps(summary, sort_keys=True), flush=True)
    return 0


if __name__ == "__main__":
    try:
        raise SystemExit(main())
    except Exception as error:
        print(f"ACQUISITION_FAILED: {error}", file=sys.stderr)
        raise
