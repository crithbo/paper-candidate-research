# Cross-lane deduplication

The six objects are target-specific compiler/library objects, distinct from prior S4 objects and from the blocked AMDGPU occupancy codegen topic. No LLVM bitcode, CVC5, HNSW, format, or S4-SLO object is reopened.

| id | exact target/object boundary |
|---|---|
| R01 | CUDA compute capability 9.0 bulk tensor asynchronous copies for one fixed tensor kernel |
| R02 | CUTLASS SM90 GEMM CollectiveMma with Hopper TMA/GMMA warp specialization |
| R03 | CUTLASS Blackwell SM100 TCGen05/TMEM collective GEMM, distinct from SM90 |
| R04 | Triton Gluon warp specialization on a fixed Hopper-or-newer kernel |
| R05 | LLVM AMDGPU kernel for one frozen `amdgpu-amd-amdhsa -mcpu=gfx90a` target |
| R06 | ROCm Composable Kernel HIP tile kernel for a fixed AMD target and tensor operation |

No NVIDIA primitive is attributed to an AMD object, and no GFX12 target is treated as CDNA5.
