"""Retry or replace transport failures from acquire_sources.py.

Replacements remain first-party or author-hosted, pre-cutoff artifacts.  The
script writes raw retrieved bytes only beneath the frozen PACKER root.
"""

from __future__ import annotations

import hashlib
import http.client
import json
import pathlib
import sys
import time
import urllib.request


ROOT = pathlib.Path(__file__).resolve().parents[1]
USER_AGENT = "Mozilla/5.0 Codex-Discovery-Backtest-Packer/1.0"

REPLACEMENTS = [
    ("C02", "S03", "fastkcna.pdf", "https://www.vldb.org/pvldb/vol18/p1825-liu.pdf"),
    ("C02", "S04", "generic-bmatching.pdf", "https://nicsefc.ee.tsinghua.edu.cn/nics_file/pdf/ffb3b2b1-990d-487b-b979-7c4fe6cd536f.pdf"),
    ("C04", "S02", "RemoteLogManager.java", "https://raw.githubusercontent.com/apache/kafka/2225a16c7e2658b4db207c89c477693373a52073/storage/src/main/java/org/apache/kafka/server/log/remote/storage/RemoteLogManager.java"),
    ("C06", "S02", "copy_sm90_tma.hpp", "https://raw.githubusercontent.com/NVIDIA/cutlass/dcf215af68a2d08d305076c152a06f201728cd53/include/cute/arch/copy_sm90_tma.hpp"),
    ("C07", "S01", "ocp-mx-v1.pdf", "https://www.opencompute.org/documents/ocp-microscaling-formats-mx-v1-0-spec-final-pdf"),
    ("C07", "S03", "transformer-engine-fp8.ipynb", "https://raw.githubusercontent.com/NVIDIA/TransformerEngine/bffde8f4a0a4eea9036dc753e28269247e5de69d/docs/examples/fp8_primer.ipynb"),
    ("C08", "S02", "tflite-quantization-spec.md", "https://raw.githubusercontent.com/tensorflow/tensorflow/8c2da370ce932fbd31fbf25c42795e49fe3aeeed/tensorflow/lite/g3doc/performance/quantization_spec.md"),
    ("C08", "S03", "ort-quantize.py", "https://raw.githubusercontent.com/microsoft/onnxruntime/2e76898a35eb76b7dedc0354ee58095317b64d9f/onnxruntime/python/tools/quantization/quantize.py"),
    ("C09", "S02", "heuristic-join-order.pdf", "https://bigdata.uni-saarland.de/publications/Haffner%2C%20Dittrich%20-%20Efficiently%20Computing%20Join%20Orders%20with%20Heuristic%20Search%20%40SIGMOD2023.pdf"),
    ("C09", "S03", "dpconv.pdf", "https://arxiv.org/pdf/2409.08013"),
    ("C10", "S02", "arrow-writer-properties.rs", "https://raw.githubusercontent.com/apache/arrow-rs/f2476ab9409368afb660b789ea84436abc396eb7/parquet/src/file/properties.rs"),
    ("C10", "S03", "datafusion-parquet-config.rs", "https://raw.githubusercontent.com/apache/datafusion/eec8b947c71a916385a28a3723753f4ffc7cd8d0/datafusion/common/src/parquet_config.rs"),
    ("C12", "S01", "obase.pdf", "https://www.usenix.org/system/files/osdi26-banakar.pdf"),
    ("C12", "S02", "mdk.pdf", "https://www.usenix.org/system/files/osdi26-patel.pdf"),
    ("C13", "S01", "git-pack-objects-2.55.adoc", "https://raw.githubusercontent.com/git/git/v2.55.0/Documentation/git-pack-objects.adoc"),
    ("C13", "S03", "git-pack-format-2.55.adoc", "https://raw.githubusercontent.com/git/git/v2.55.0/Documentation/gitformat-pack.adoc"),
    ("C14", "S02", "cuda-programming-guide.html", "https://docs.nvidia.com/cuda/archive/13.0.0/cuda-c-programming-guide/index.html"),
    ("C14", "S03", "tpp-paper.pdf", "https://arxiv.org/pdf/2206.02878"),
    ("C16", "S01", "block_based_table_builder.cc", "https://raw.githubusercontent.com/facebook/rocksdb/1dfa7297933df05237ac11376d6cb69d32591b1d/table/block_based/block_based_table_builder.cc"),
    ("C18", "S02", "BitCodeFormat.md", "https://raw.githubusercontent.com/llvm/llvm-project/c4a3c977f1f9138fb69bf936e532c94f0bb8a3cd/llvm/docs/BitCodeFormat.md"),
]


def fetch(url: str) -> tuple[bytes, str, str, int]:
    last_error: Exception | None = None
    for attempt in range(1, 7):
        try:
            request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
            with urllib.request.urlopen(request, timeout=180) as response:
                chunks: list[bytes] = []
                while True:
                    chunk = response.read(1024 * 1024)
                    if not chunk:
                        break
                    chunks.append(chunk)
                payload = b"".join(chunks)
                declared = response.headers.get("Content-Length")
                if declared is not None and len(payload) != int(declared):
                    raise IOError(
                        f"content-length mismatch {len(payload)} != {declared}"
                    )
                return (
                    payload,
                    response.geturl(),
                    response.headers.get_content_type(),
                    response.status,
                )
        except (Exception, http.client.IncompleteRead) as error:
            last_error = error
            time.sleep(min(attempt, 3))
    assert last_error is not None
    raise last_error


def main() -> int:
    results: list[dict[str, object]] = []
    failures = 0
    selected = set(sys.argv[1:])
    for case_id, source_id, filename, url in REPLACEMENTS:
        if selected and case_id not in selected and f"{case_id}:{source_id}" not in selected:
            continue
        destination = ROOT / "sealed_cases" / case_id / "sources" / f"{source_id}_{filename}"
        try:
            payload, final_url, content_type, status = fetch(url)
            destination.write_bytes(payload)
            results.append(
                {
                    "case_id": case_id,
                    "source_id": source_id,
                    "path": destination.relative_to(ROOT).as_posix(),
                    "requested_url": url,
                    "resolved_url": final_url,
                    "http_status": status,
                    "content_type": content_type,
                    "bytes": len(payload),
                    "sha256": hashlib.sha256(payload).hexdigest().upper(),
                    "status": "RETRIEVED_PRIMARY_BYTES",
                }
            )
        except Exception as error:
            failures += 1
            results.append(
                {
                    "case_id": case_id,
                    "source_id": source_id,
                    "path": destination.relative_to(ROOT).as_posix(),
                    "requested_url": url,
                    "status": "FAILED_NO_BYTES",
                    "error_type": type(error).__name__,
                    "error": str(error),
                }
            )
    print(json.dumps({"failures": failures, "records": results}, indent=2))
    return 1 if failures else 0


if __name__ == "__main__":
    raise SystemExit(main())
