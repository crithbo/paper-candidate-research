# SOURCE / COLLISION MATRIX — WAVE26

## v8.7 source-reality record

Audit date: `2026-08-09`.  No retained route relies on an implementation-absence claim.  Accordingly, no mutable-head SHA is fabricated.  Current official release/source/documentation loci and exposed options were checked to prevent treating an existing native action as a residual.  The workspace-local `git ls-remote` Schannel credential failure remains transport-only and supports no technical inference.

| Genealogy seed and frozen source | Current official source / option surface checked | Strongest same-object executable union | Collision and decision |
|---|---|---|---|
| ML-Triton, arXiv:2503.14985 (2025) | Triton current repository/backend source; current NVIDIA `CUDAOptions` includes `num_warps`, `num_ctas`, `num_stages`, `maxnreg`, PTX options and IR override; current release notes include generalized swizzling/layout conversion. | Native IR lowering, tile/layout conversion, pipeline stages, warp/CTA/register controls, target feature and code-generation settings. | Hierarchical schedule formulation is now an existing action/configuration space. Any extra optimizer only selects it: `DROP__SELECTOR_OR_UNION_ABSORPTION`. |
| Nautilus, arXiv:2604.14825 (2026) | Original paper describes automatic discovery of high-level optimization sequences jointly with tiled kernel optimization. | Same union as native compiler transforms plus official MLIR/Triton transform/configuration actions. | A generic search/solver is opaque controller/auto-tuner; no current union-external atomic action and no frozen official artifact path establishing a distinct same-object residual: `DROP__OPAQUE_SOLVER_CONTROLLER`. |
| NVIDIA CUDA Tile IR, official repo release `v13.2.0` (2026-03-24) and official 2026 technical post | Tile IR is MLIR-based; official material states compiler/runtime handle thread scheduling, hardware mapping, and resource allocation. | Native CUDA Tile IR semantics, lowering/backend action space, native tensor-core layouts/data movement, per-kernel backend selection. | External schedule representation either changes backend/semantic object or wraps native actions: `DROP__SAME_OBJECT_FAILURE_OR_WRAPPER`. |
| NVIDIA CUTLASS `4.5.2` (2026-05) and official 2025 technical material | CuTe/CUTLASS layout algebra; Collective arguments include layout, tile, architecture, cluster, pipeline stage and kernel schedule; Auto choices and current block-copy API. | Native layout composition, copy/MMA, stage/schedule construction and auto choices. | Claimed layout/shape residual is already in current union; a scoring policy is forbidden ordinary tuning: `DROP__CURRENT_UNION_ABSORPTION`. |

## Required action-gap elements

| Route | Exact object / same function | Complete proposed action | Direct subtractor | Natural carrier | Full-cost / finite Stage A killer | Outcome |
|---|---|---|---|---|---|---|
| Hierarchical Triton kernel schedule | Native Triton kernel output and backend semantics | None outside native layout/pipeline/warp/CTA/register action union | Triton compiler and current backend options | Public Triton kernels/IR reproducer files | Cannot be defined without testing a selector | Drop |
| Global transformation sequencing | Math/IR tensor kernel under native backend semantics | Opaque auto-scheduler only | Nautilus-style scheduler plus native transform/configuration union | Tensor-kernel programs | Cannot be a fair finite killer without an explicit atomic action | Drop |
| CUDA Tile / CuTe layout construction | Native Tile/CuTe kernel object and output | None outside native IR/layout/data-movement/schedule actions | CUDA Tile compiler; CUTLASS/CuTe Auto/Collective actions | Tile IR, CuTe layouts and official examples | Any external plan changes object or is wrapper | Drop |

## Primary sources

- ML-Triton original paper: https://arxiv.org/abs/2503.14985
- Nautilus original paper: https://arxiv.org/abs/2604.14825
- Triton current repository and NVIDIA backend source: https://github.com/triton-lang/triton and https://github.com/triton-lang/triton/blob/main/third_party/nvidia/backend/compiler.py
- Triton official releases: https://github.com/triton-lang/triton/releases
- CUDA Tile IR official repository: https://github.com/NVIDIA/cuda-tile
- NVIDIA CUDA Tile/Triton technical post: https://developer.nvidia.com/blog/advancing-gpu-programming-with-the-cuda-tile-ir-backend-for-openai-triton/
- CUTLASS current repository and official design post: https://github.com/NVIDIA/cutlass and https://developer.nvidia.com/blog/cutlass-3-x-orthogonal-reusable-and-composable-abstractions-for-gemm-kernel-design/
