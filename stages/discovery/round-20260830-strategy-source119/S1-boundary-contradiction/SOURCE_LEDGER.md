# Source119 S1 Official-Source Ledger

- Calls used: `22 / 24`
- Sources: official IREE, MLIR/LLVM, PyTorch ExecuTorch documentation and first-party repositories only.
- No download, build, experiment, or persisted external resource.

| Role | Official locus | Decision use |
|---|---|---|
| CURRENT | https://iree.dev/reference/mlir-dialects/HALInline/ | HAL buffer allocation, alignment, views and assertions |
| CURRENT | https://iree.dev/reference/mlir-dialects/Stream/ | target affinity, dispatch partitioning, encoding and scheduling |
| ANCHOR | https://github.com/iree-org/iree/blob/main/docs/website/docs/guides/parameters.md | aligned IRPA, opaque byte ranges, providers and format penalties |
| CURRENT | https://mlir.llvm.org/docs/Dialects/QuantDialect/ | quantized type invariants; rounding left to transform pipeline |
| CURRENT | https://mlir.llvm.org/docs/DataLayout/ | target size/alignment queries and heterogeneous target specs |
| CURRENT | https://mlir.llvm.org/docs/TargetLLVMIR/ | memref descriptors, aligned pointers, ABI and layout conversion |
| CURRENT | https://mlir.llvm.org/docs/Dialects/SparseTensorOps/ | encoding-driven sparsification and storage metadata |
| CURRENT | https://docs.pytorch.org/executorch/stable/compiler-memory-planning.html | greedy/custom/per-device planning and documented collision limitation |
| CURRENT | https://docs.pytorch.org/executorch/stable/backends/xnnpack/xnnpack-partitioner.html | maximal partition, precision filters and per-op mode |
| CURRENT | https://docs.pytorch.org/executorch/stable/backends-overview.html | partial delegation and CPU fallback semantics |
| CONTRARY | https://github.com/pytorch/executorch/blob/main/backends/qualcomm/partition/qnn_partitioner.py | mutable-buffer same-address option and accuracy fallback |

Absence/newness was not inferred from any source boundary.
