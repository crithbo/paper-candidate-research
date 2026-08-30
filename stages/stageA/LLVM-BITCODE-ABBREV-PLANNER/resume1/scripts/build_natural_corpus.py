#!/usr/bin/env python3
"""Freeze 100 deterministic public natural LLVM modules before arm execution."""

from __future__ import annotations

import argparse
import hashlib
import importlib.util
import json
import pathlib
import statistics
import subprocess
import sys
import time
from typing import Any


def load(name: str, path: pathlib.Path) -> Any:
    spec = importlib.util.spec_from_file_location(name, path)
    if spec is None or spec.loader is None:
        raise RuntimeError(path)
    module = importlib.util.module_from_spec(spec)
    sys.modules[name] = module
    spec.loader.exec_module(module)
    return module


def sha_bytes(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def sha(path: pathlib.Path) -> str:
    return sha_bytes(path.read_bytes())


def write_json(path: pathlib.Path, value: Any) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, indent=2, sort_keys=True) + "\n", encoding="utf-8")


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--codec", required=True, type=pathlib.Path)
    ap.add_argument("--measure", required=True, type=pathlib.Path)
    ap.add_argument("--source-root", required=True, type=pathlib.Path)
    ap.add_argument("--clang", required=True, type=pathlib.Path)
    ap.add_argument("--llvm-bin", required=True, type=pathlib.Path)
    ap.add_argument("--output-root", required=True, type=pathlib.Path)
    ap.add_argument("--target", type=int, default=100)
    ap.add_argument("--max-attempts", type=int, default=1600)
    ap.add_argument("--archive-freeze", required=True, type=pathlib.Path)
    args = ap.parse_args()
    codec = load("corpus_codec", args.codec.resolve())
    measure = load("corpus_measure", args.measure.resolve())
    args.output_root.mkdir(parents=True, exist_ok=True)
    modules_dir = args.output_root / "modules"
    traces_dir = args.output_root / "traces"
    modules_dir.mkdir(parents=True, exist_ok=True)
    traces_dir.mkdir(parents=True, exist_ok=True)

    extensions = {".c": "c", ".cc": "c++", ".cpp": "c++"}
    candidates = []
    for path in args.source_root.rglob("*"):
        if not path.is_file() or path.suffix.lower() not in extensions:
            continue
        rel = path.relative_to(args.source_root).as_posix()
        path_key = sha_bytes(rel.encode("utf-8"))
        source_hash = sha(path)
        candidates.append({
            "path": rel, "path_sha256": path_key,
            "source_sha256": source_hash, "source_bytes": path.stat().st_size,
            "language": extensions[path.suffix.lower()],
        })
    candidates.sort(key=lambda row: (row["path_sha256"], row["path"]))
    prereg = {
        "schema": "llvm-natural-corpus-preregistration-v1",
        "created_before_any_corpus_compile": True,
        "source_archive_freeze_sha256": sha(args.archive_freeze),
        "selection": (
            "path SHA256 ascending; accept first 100 distinct successfully compiled, "
            "native-verified, trace-parsed module hashes; failures stay in denominator log"
        ),
        "target_modules": args.target,
        "max_compile_attempts": args.max_attempts,
        "candidate_count": len(candidates),
        "stratum_assignment": (
            "path_sha256 first byte mod 4: O0/g0, O0/gline-tables-only, "
            "O2/g0, O2/gline-tables-only"
        ),
        "common_flags": [
            "--target=x86_64-unknown-linux-gnu", "-emit-llvm", "-c",
            "-ffreestanding", "-fno-discard-value-names",
            "-Wno-implicit-function-declaration", "-Wno-int-conversion",
        ],
        "include_policy": "source parent and frozen SingleSource root only",
        "compiler": str(args.clang.resolve()),
        "compiler_sha256": sha(args.clang),
        "candidates": candidates,
        "claim_role": "CORPUS_CONSTRUCTION_ONLY__NO_ARM_RESULT",
    }
    prereg_path = args.output_root / "CORPUS_SELECTION_PREREGISTRATION.json"
    if prereg_path.exists():
        old = json.loads(prereg_path.read_text(encoding="utf-8"))
        if old != prereg:
            raise RuntimeError("existing corpus preregistration differs")
    else:
        write_json(prereg_path, prereg)

    progress_path = args.output_root / "CORPUS_BUILD_PROGRESS.json"
    if progress_path.exists():
        progress = json.loads(progress_path.read_text(encoding="utf-8"))
        successes = progress["successes"]
        failures = progress["failures"]
        attempted_paths = {row["path"] for row in successes + failures}
        module_hashes = {row["module_sha256"] for row in successes}
    else:
        successes = []
        failures = []
        attempted_paths = set()
        module_hashes = set()

    started = time.perf_counter()
    for candidate in candidates:
        if len(successes) >= args.target or len(successes) + len(failures) >= args.max_attempts:
            break
        if candidate["path"] in attempted_paths:
            continue
        source = args.source_root / pathlib.PurePosixPath(candidate["path"])
        key = candidate["path_sha256"][:16]
        module = modules_dir / f"{key}.bc"
        trace_path = traces_dir / f"{key}.trace.json"
        stratum_id = int(candidate["path_sha256"][:2], 16) % 4
        optimization = "-O0" if stratum_id < 2 else "-O2"
        debug = "-g0" if stratum_id % 2 == 0 else "-gline-tables-only"
        language_flags = ["-x", "c", "-std=gnu11"] if candidate["language"] == "c" else [
            "-x", "c++", "-std=gnu++17", "-fno-exceptions", "-fno-rtti"
        ]
        command = [
            str(args.clang), "--target=x86_64-unknown-linux-gnu",
            optimization, debug, "-emit-llvm", "-c", "-ffreestanding",
            "-fno-discard-value-names", "-Wno-implicit-function-declaration",
            "-Wno-int-conversion", *language_flags,
            "-I", str(source.parent), "-I", str(args.source_root),
            str(source), "-o", str(module),
        ]
        compile_result = measure.run_measured(command, timeout=90)
        failure_reason = None
        checks: dict[str, Any] = {}
        trace_hash = None
        module_hash = None
        if compile_result["returncode"] != 0 or not module.exists():
            failure_reason = "COMPILE_FAILED"
        else:
            module_hash = sha(module)
            if module_hash in module_hashes:
                failure_reason = "DUPLICATE_MODULE_HASH"
            else:
                try:
                    parser = codec.Parser(module.read_bytes())
                    blocks = parser.parse()
                    document = codec.semantic_document(blocks)
                    trace_hash = document["canonical_sha256"]
                    write_json(trace_path, document)
                except Exception as exc:
                    failure_reason = f"TRACE_PARSE_FAILED: {type(exc).__name__}: {exc}"
                if failure_reason is None:
                    checks = {
                        "bcanalyzer": measure.run_measured([
                            str(args.llvm_bin / "llvm-bcanalyzer.exe"),
                            "-disable-histogram", str(module),
                        ]),
                        "opt_verify": measure.run_measured([
                            str(args.llvm_bin / "opt.exe"), "-passes=verify",
                            "-disable-output", str(module),
                        ]),
                    }
                    if not all(row["returncode"] == 0 for row in checks.values()):
                        failure_reason = "NATIVE_VERIFY_FAILED"
        common = {
            **candidate,
            "stratum_id": stratum_id,
            "optimization": optimization,
            "debug": debug,
            "compile_command": command,
            "compile_measurement": compile_result,
        }
        if failure_reason is None:
            row = {
                **common, "module_path": str(module.resolve()),
                "module_bytes": module.stat().st_size,
                "module_sha256": module_hash,
                "trace_path": str(trace_path.resolve()),
                "trace_sha256": trace_hash,
                "native_checks": checks,
            }
            successes.append(row)
            module_hashes.add(module_hash)
        else:
            if module.exists():
                module.unlink()
            if trace_path.exists():
                trace_path.unlink()
            failures.append({
                **common, "failure_reason": failure_reason,
                "stderr_tail": compile_result["stderr"][-2000:],
                "native_checks": checks,
            })
        attempted_paths.add(candidate["path"])
        write_json(progress_path, {
            "schema": "llvm-natural-corpus-build-progress-v1",
            "successes": successes, "failures": failures,
            "target": args.target,
        })

    if len(successes) < args.target:
        print(json.dumps({
            "complete": False, "successes": len(successes),
            "failures": len(failures), "target": args.target,
            "progress": str(progress_path),
        }, sort_keys=True))
        return 3

    successes = successes[:args.target]
    source_sizes = sorted(row["source_bytes"] for row in successes)
    q1 = source_sizes[len(source_sizes) // 4]
    q2 = source_sizes[len(source_sizes) // 2]
    q3 = source_sizes[(3 * len(source_sizes)) // 4]
    for row in successes:
        size = row["source_bytes"]
        row["source_size_quartile"] = (
            "Q1" if size <= q1 else "Q2" if size <= q2 else "Q3" if size <= q3 else "Q4"
        )
    corpus = {
        "schema": "llvm-natural-corpus-freeze-v1",
        "claim_bearing_arms_started_before_this_freeze": False,
        "target_modules": args.target,
        "retained_modules": len(successes),
        "compile_attempts": len(successes) + len(failures),
        "compile_failures": len(failures),
        "duplicate_modules_rejected": sum(
            row["failure_reason"] == "DUPLICATE_MODULE_HASH" for row in failures
        ),
        "source_size_quartile_cutoffs_bytes": [q1, q2, q3],
        "language_counts": dict(sorted(__import__("collections").Counter(
            row["language"] for row in successes
        ).items())),
        "stratum_counts": dict(sorted(__import__("collections").Counter(
            f"{row['optimization']}/{row['debug']}" for row in successes
        ).items())),
        "total_module_bytes": sum(row["module_bytes"] for row in successes),
        "build_wall_seconds_this_invocation": time.perf_counter() - started,
        "preregistration_sha256": sha(prereg_path),
        "archive_freeze_sha256": sha(args.archive_freeze),
        "modules": successes,
        "failures": failures,
        "license": "Apache-2.0 WITH LLVM-exception",
    }
    freeze_path = args.output_root / "NATURAL_CORPUS_FREEZE.json"
    write_json(freeze_path, corpus)
    print(json.dumps({
        "complete": True, "modules": len(successes), "failures": len(failures),
        "total_module_bytes": corpus["total_module_bytes"],
        "language_counts": corpus["language_counts"],
        "stratum_counts": corpus["stratum_counts"],
        "freeze": str(freeze_path),
        "freeze_sha256": sha(freeze_path),
    }, sort_keys=True))
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
