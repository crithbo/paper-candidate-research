# Source / action / collision matrix

Frozen cutoff: 2026-08-11. All sources are official LLVM/MLIR documentation or the official LLVM GitHub source at the pinned commit.

| source | frozen operations / flags / source fact | implication |
|---|---|---|
| [NVGPU dialect](https://mlir.llvm.org/docs/Dialects/NVGPU/) | `device_async_copy`, group/wait token, TMA async load/store, descriptors, mbarriers, shared-memory types | explicit native async legality universe for matching NVIDIA target |
| [GPU dialect](https://mlir.llvm.org/docs/Dialects/GPU/) | `gpu.alloc`, `gpu.barrier`, kernel launch/layering | generic GPU allocation and barrier contract |
| [MLIR passes](https://mlir.llvm.org/docs/Passes/) | `gpu-async-region`, buffer hoisting/loop hoisting/deallocation simplification, `nvgpu-optimize-shared-memory`, `gpu-to-llvm` options | current transform/pipeline union, but no proof of full token-aware allocation constructor |
| [Async dialect](https://mlir.llvm.org/docs/Dialects/AsyncDialect/) | explicit dependencies, legal sequential lowering caveat | async token semantics must not create implicit dependencies |
| official source, commit `1069de7…` | `mlir/lib/Dialect/NVGPU/Transforms/OptimizeSharedMemory.cpp`: access-index transformation; no alias analysis; aborts on subviews | positive contrary evidence against claiming that this pass is a complete reuse allocator |

Latest-collision result: no direct collision is established and no union-external action is established. The only honest status is `UNFROZEN`.
