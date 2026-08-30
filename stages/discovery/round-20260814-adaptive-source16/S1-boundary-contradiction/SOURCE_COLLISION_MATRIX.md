# R21 source/collision matrix

| Family | Current primary source | One permitted source-only closure | Result |
|---|---|---|---|
| LLVM stackmap | [StackMaps](https://llvm.org/docs/StackMaps.html), [Statepoints](https://llvm.org/docs/Statepoints.html) | complete enough for deep | absorbed by lowering/runtime union. |
| Clang modules | [Standard C++ Modules](https://clang.llvm.org/docs/StandardCPlusPlusModules.html) | none needed | build orchestration, no D1 residual. |
| CUDA stream memory ops | [CUDA stream-ordered allocation](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/stream-ordered-memory-allocation.html) | complete enough for deep | controller/current runtime union. |
| HIP stream memory ops | [HIP stream allocator](https://rocm.docs.amd.com/projects/HIP/en/docs-7.0.0/how-to/hip_runtime_api/memory_management/stream_ordered_allocator.html) | one source-only closure consumed | `SOURCE_ONLY_UNFROZEN`; do not re-close the same facet next cycle. |
| XLA Async HLO | [OpenXLA async HLO](https://openxla.org/xla/async_ops) | one source-only closure consumed | `SOURCE_ONLY_UNFROZEN`. |
| CUDA device graph launch | [CUDA graph guide](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/cuda-graphs.html) | raw/source bounded | host/device interface boundary not a same-interface residual. |

No direct absence claim uses issue/future-work material. Search bounded as of 2026-08-14.
