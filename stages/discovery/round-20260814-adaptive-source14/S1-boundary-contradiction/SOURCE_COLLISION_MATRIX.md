# Source and collision matrix

| Family | Official/primary source | Current-union and collision finding |
|---|---|---|
| Objective-C ARC | [Clang ARC specification](https://clang.llvm.org/docs/AutomaticReferenceCounting.html); [ARC CodeGen](https://clang.llvm.org/doxygen/CodeGen_2Targets_2ARC_8cpp_source.html) | Return convention carries ownership guarantee; same-contract residual not found. |
| XLA async custom call | [OpenXLA async HLO](https://openxla.org/xla/async_ops); [XLA custom calls](https://openxla.org/xla/custom_call) | Distinct from PJRT donation, but all current entry/config paths not frozen: `NOT_ADMITTED_UNFROZEN`. |
| IREE VM ref | [IREE HAL reference](https://iree.dev/reference/mlir-dialects/HAL/) | Producer/consumer ownership action not fully source-pinned: raw only. |
| CUDA DSM cluster | [CUDA cluster/DSM docs](https://docs.nvidia.com/cuda/archive/13.1.0/cuda-programming-guide/02-basics/writing-cuda-kernels.html) | Candidate alternatives alter resource/lifetime contract or reduce to mapping; no residual. |
| CUDA pipeline | [CUDA Programming Guide](https://docs.nvidia.com/cuda/cuda-programming-guide/01-introduction/programming-model.html) | Staging/commit/wait is a source-bounded current semantic object; raw only. |
| cuDNN graph | [cuDNN graph API](https://docs.nvidia.com/deeplearning/cudnn/v1.23.0/developer/graph-api.html) | Existing engine-plan selection is a controller/tuner, so no deep promotion. |

Search was bounded to official/current sources as of 2026-08-14. No issue, future-work statement or security source supports an absence claim.
