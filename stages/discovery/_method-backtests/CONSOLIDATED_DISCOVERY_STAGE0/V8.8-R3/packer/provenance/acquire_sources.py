"""Acquire byte-exact, public pre-cutoff sources for the sealed R3 packets.

This helper performs transport only.  It does not execute or score either the
candidate method or any historical candidate.  All destinations are below the
frozen PACKER write root.
"""

from __future__ import annotations

import hashlib
import json
import mimetypes
import pathlib
import urllib.request


ROOT = pathlib.Path(__file__).resolve().parents[1]
USER_AGENT = "Codex-Discovery-Backtest-Packer/1.0"

SOURCES = {
    "C01": [
        ("S01", "BVGraph.java", "https://raw.githubusercontent.com/vigna/webgraph/2ffd9d9a7144c7024974e92379a05978fb97a8b5/src/it/unimi/dsi/webgraph/BVGraph.java"),
        ("S02", "bvcompz.rs", "https://raw.githubusercontent.com/vigna/webgraph-rs/f8698a7bdda2c4e171017548307179cd5c7a3166/webgraph/src/graphs/bvgraph/comp/bvcompz.rs"),
        ("S03", "zuckerli.html", "https://research.google/pubs/zuckerli-a-new-compressed-representation-for-graphs/"),
    ],
    "C02": [
        ("S01", "hnswalg.h", "https://raw.githubusercontent.com/nmslib/hnswlib/d9b3608c83d83b46c96e25088cb1d729b29dcfe9/hnswlib/hnswalg.h"),
        ("S02", "HNSW.cpp", "https://raw.githubusercontent.com/facebookresearch/faiss/02dbb4e42f49aa2ce57cd78977b0e47a11f7cb91/faiss/impl/HNSW.cpp"),
        ("S03", "fastkcna.pdf", "https://www.vldb.org/pvldb/vol18/p1825-liu.pdf"),
    ],
    "C03": [
        ("S01", "splidt-paper.pdf", "https://www.usenix.org/system/files/nsdi26-parvez.pdf"),
        ("S02", "artifact-readme.md", "https://raw.githubusercontent.com/SpliDT-Decision-Trees/SpliDT-Artifact-NSDI26/1f8c8d11c042bb3c743683bedb4a8f6873c23941/README-ARTIFACT-NSDI26.md"),
        ("S03", "project.html", "https://splidt-decision-trees.github.io/"),
    ],
    "C04": [
        ("S01", "kafka-4.1-docs.html", "https://kafka.apache.org/41/documentation.html"),
        ("S02", "RemoteLogManager.java", "https://raw.githubusercontent.com/apache/kafka/2225a16c7e2658b4db207c89c477693373a52073/storage/src/main/java/org/apache/kafka/server/log/remote/storage/RemoteLogManager.java"),
        ("S03", "kip-405.html", "https://cwiki.apache.org/confluence/display/KAFKA/KIP-405%3A+Kafka+Tiered+Storage"),
    ],
    "C05": [
        ("S01", "checkpoint-backpressure.html", "https://nightlies.apache.org/flink/flink-docs-release-2.1/docs/ops/state/checkpointing_under_backpressure/"),
        ("S02", "CheckpointCoordinator.java", "https://raw.githubusercontent.com/apache/flink/13e17094a556d933520ac1febb464c993c1a81ef/flink-runtime/src/main/java/org/apache/flink/runtime/checkpoint/CheckpointCoordinator.java"),
        ("S03", "flip-76.html", "https://cwiki.apache.org/confluence/display/FLINK/FLIP-76%3A+Unaligned+Checkpoints"),
    ],
    "C06": [
        ("S01", "cuda-programming-guide.html", "https://docs.nvidia.com/cuda/archive/13.0.0/cuda-c-programming-guide/index.html"),
        ("S02", "ptx-isa.html", "https://docs.nvidia.com/cuda/archive/13.0.0/parallel-thread-execution/index.html"),
        ("S03", "cutlass-hopper-gemm.cu", "https://raw.githubusercontent.com/NVIDIA/cutlass/dcf215af68a2d08d305076c152a06f201728cd53/examples/48_hopper_warp_specialized_gemm/48_hopper_warp_specialized_gemm.cu"),
    ],
    "C07": [
        ("S01", "ocp-mx-v1.pdf", "https://www.opencompute.org/documents/ocp-microscaling-formats-mx-v1-0-spec-final-pdf"),
        ("S02", "ptx-isa.html", "https://docs.nvidia.com/cuda/archive/13.0.0/parallel-thread-execution/index.html"),
        ("S03", "transformer-engine-fp8.html", "https://docs.nvidia.com/deeplearning/transformer-engine/user-guide/examples/fp8_primer.html"),
    ],
    "C08": [
        ("S01", "gemmlowp-quantization.md", "https://raw.githubusercontent.com/google/gemmlowp/16e8662c34917be0065110bfcd9cc27d30f52fdf/doc/quantization.md"),
        ("S02", "litert-integer-quant.html", "https://ai.google.dev/edge/litert/models/post_training_integer_quant"),
        ("S03", "ort-quantization.html", "https://onnxruntime.ai/docs/performance/model-optimizations/quantization.html"),
    ],
    "C09": [
        ("S01", "dpomega.pdf", "https://link.springer.com/content/pdf/10.1007/s00778-025-00906-y.pdf"),
        ("S02", "heuristic-join-order.pdf", "https://dl.acm.org/doi/pdf/10.1145/3588927"),
        ("S03", "dpconv.pdf", "https://dl.acm.org/doi/pdf/10.1145/3698809"),
    ],
    "C10": [
        ("S01", "parquet.thrift", "https://raw.githubusercontent.com/apache/parquet-format/2076361bb64e2de9ca6a8d06eda025a6fa4e9df6/src/main/thrift/parquet.thrift"),
        ("S02", "arrow-writer-properties.rs", "https://raw.githubusercontent.com/apache/arrow-rs/eac5eed3dbd58162071058ed4ddcb282f63f078d/parquet/src/file/properties.rs"),
        ("S03", "datafusion-configs.html", "https://datafusion.apache.org/user-guide/configs.html"),
    ],
    "C11": [
        ("S01", "aiger-format.pdf", "https://fmv.jku.at/papers/Biere-FMV-TR-07-1.pdf"),
        ("S02", "aiger-home.html", "https://fmv.jku.at/aiger/"),
        ("S03", "yosys-aiger.cc", "https://raw.githubusercontent.com/YosysHQ/yosys/0f2bcb94b7dc8310a52abf6eef3a7e1a9f09b552/backends/aiger/aiger.cc"),
    ],
    "C12": [
        ("S01", "obase.html", "https://www.usenix.org/conference/osdi26/presentation/banakar"),
        ("S02", "mdk.html", "https://www.usenix.org/conference/osdi26/presentation/patel"),
        ("S03", "dimes.pdf", "https://research.cs.wisc.edu/adsl/Publications/dimes25-banakar.pdf"),
    ],
    "C13": [
        ("S01", "git-pack-objects-2.55.html", "https://git-scm.com/docs/git-pack-objects/2.55.0"),
        ("S02", "git-pack-objects.c", "https://raw.githubusercontent.com/git/git/v2.55.0/builtin/pack-objects.c"),
        ("S03", "git-pack-format-2.55.html", "https://git-scm.com/docs/pack-format/2.55.0"),
    ],
    "C14": [
        ("S01", "region-memory-paper.pdf", "https://arxiv.org/pdf/2407.07850"),
        ("S02", "cuda-programming-guide.html", "https://docs.nvidia.com/cuda/archive/13.0.0/cuda-c-programming-guide/index.html"),
        ("S03", "tpp-paper.pdf", "https://arxiv.org/pdf/2206.02878"),
    ],
    "C15": [
        ("S01", "cvc5-1.1.2-alethe.html", "https://cvc5.github.io/docs/cvc5-1.1.2/proofs/output_alethe.html"),
        ("S02", "alethe_printer.cpp", "https://raw.githubusercontent.com/cvc5/cvc5/e8c0387caeceaf631e0d3b114373b1bc7942334b/src/proof/alethe/alethe_printer.cpp"),
        ("S03", "alethe-spec.pdf", "https://verit.loria.fr/alethe.pdf"),
    ],
    "C16": [
        ("S01", "block_based_table_builder.cc", "https://raw.githubusercontent.com/facebook/rocksdb/1dfa7297933df05237ac11376d6cb69d32591b1d/table/block_based/block_based_table_builder.cc"),
        ("S02", "rocksdb-dictionary-compression.html", "https://rocksdb.org/blog/2021/05/31/dictionary-compression.html"),
        ("S03", "zdict.h", "https://raw.githubusercontent.com/facebook/zstd/82d322c4973d9e2968d94047a40892bc6d9a9bdf/lib/zdict.h"),
    ],
    "C17": [
        ("S01", "GCNSchedStrategy.cpp", "https://raw.githubusercontent.com/llvm/llvm-project/c4a3c977f1f9138fb69bf936e532c94f0bb8a3cd/llvm/lib/Target/AMDGPU/GCNSchedStrategy.cpp"),
        ("S02", "AMDGPUUsage.rst", "https://raw.githubusercontent.com/llvm/llvm-project/c4a3c977f1f9138fb69bf936e532c94f0bb8a3cd/llvm/docs/AMDGPUUsage.rst"),
        ("S03", "unison-paper.pdf", "https://arxiv.org/pdf/1804.02452"),
    ],
    "C18": [
        ("S01", "BitcodeWriter.cpp", "https://raw.githubusercontent.com/llvm/llvm-project/c4a3c977f1f9138fb69bf936e532c94f0bb8a3cd/llvm/lib/Bitcode/Writer/BitcodeWriter.cpp"),
        ("S02", "BitCodeFormat.rst", "https://raw.githubusercontent.com/llvm/llvm-project/c4a3c977f1f9138fb69bf936e532c94f0bb8a3cd/llvm/docs/BitCodeFormat.rst"),
        ("S03", "llvm-as.rst", "https://raw.githubusercontent.com/llvm/llvm-project/c4a3c977f1f9138fb69bf936e532c94f0bb8a3cd/llvm/docs/CommandGuide/llvm-as.rst"),
    ],
}


def main() -> int:
    results: list[dict[str, object]] = []
    failures = 0
    for case_id, records in SOURCES.items():
        out_dir = ROOT / "sealed_cases" / case_id / "sources"
        out_dir.mkdir(parents=True, exist_ok=True)
        for source_id, filename, url in records:
            destination = out_dir / f"{source_id}_{filename}"
            request = urllib.request.Request(url, headers={"User-Agent": USER_AGENT})
            try:
                with urllib.request.urlopen(request, timeout=120) as response:
                    payload = response.read()
                    final_url = response.geturl()
                    content_type = response.headers.get_content_type()
                    status = response.status
                destination.write_bytes(payload)
                results.append(
                    {
                        "case_id": case_id,
                        "source_id": source_id,
                        "path": destination.relative_to(ROOT).as_posix(),
                        "requested_url": url,
                        "resolved_url": final_url,
                        "http_status": status,
                        "content_type": content_type
                        or mimetypes.guess_type(filename)[0]
                        or "application/octet-stream",
                        "bytes": len(payload),
                        "sha256": hashlib.sha256(payload).hexdigest().upper(),
                        "status": "RETRIEVED_PRIMARY_BYTES",
                    }
                )
            except Exception as error:  # transport evidence only
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
