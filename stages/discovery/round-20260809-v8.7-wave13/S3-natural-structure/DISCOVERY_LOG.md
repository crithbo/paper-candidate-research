# DISCOVERY LOG — DISCOVERY-S3-20260809-V8.7-WAVE13

## Closure

- Frozen cutoff: `2026-08-09`.
- Lens: S3 natural structure; GPU / accelerator / compiler entrance.
- Method: accepted discovery v2/v8.1, calibrated v8.6 fidelity-plan admission, v8.7 `CURRENT_UPSTREAM_REALITY_CHECK`, and baseline-residual-first.
- Result: `COMPLETE_ZERO_PROPOSALS`.
- No Stage 0/A/B directory was created and no experiment, compilation, or benchmark was run.

## Scope and exclusions

The scan intentionally excludes terminal and active objects registered before this assignment: CVC5, Git, RocksDB, S1, S4, S5, JS, and the terminal GPU objects.  It also does not relabel NVIDIA TMA work as AMD work, nor equate `gfx1250` with CDNA5.

## Natural carriers considered

1. Public Triton AMD/HIP kernel examples and release-tested matrix/attention workloads: repeated WMMA chains, tiled LDS transfers, pipeline stages, and multi-CTA layouts.
2. LLVM/ROCm AMDGPU IR/code-object inputs: target IDs, optional target features, launch bounds, wavefront mode, CU/WGP mode, and the resulting instruction/data-movement choices.

These are genuine upstream-facing carriers, but a carrier alone is not a proposal.  Each route below was subjected to same-object subtraction against the deployable action union.

## Three-pass convergence

| Route | Structural regularity and proposed complete action | Current same-object union / contrary evidence | Decision |
|---|---|---|---|
| A: descriptor-aware TDM + WMMA joint construction | Repeated descriptor shapes and chained WMMA tiles might suggest a globally coordinated descriptor, LDS layout, transfer, wait, and MMA schedule. | Triton `v3.7.0` release commit `5f3f125` / patch `v3.7.1` commit `f797708` explicitly enumerate gfx1250 RDNA4 TDM load/store, async copy/wait, WMMA, LDS-layout selection, chained WMMA schedules, warp pipeline/specialization, and multi-CTA. Current AMD driver source exposes `create_tdm_descriptor`. | `DROP__DIRECT_ACTION_UNION_ABSORPTION`; no named complete action remains outside the union. |
| B: WMMA reuse/co-execution/register/occupancy scheduling | Natural GEMM/attention kernels expose reuse distance and register-pressure structure; hypothetical action is a globally chosen WMMA/reuse/warp/register schedule under occupancy constraints. | Triton’s current configuration surface includes `num_warps`, `num_stages`, `num_ctas`, and `maxnreg`; current releases include AMD warp-pipeline, AMD warp specialization, 4/8-warp schedules, persistent variants, waitcnt handling, and multi-CTA WMMA layouts. Treating the residual as merely a selector/autotuner is prohibited; claiming its absence would be false. | `DROP__ACTION_GAP_NOT_ATOMIC_OR_OUTSIDE_UNION`. |
| C: target-ID / descriptor legality representation | Natural LLVM AMDGPU IR has structured target IDs and feature-qualified code objects; possible construction is a portable cross-backend descriptor abstraction. | LLVM/ROCm already represents processor plus optional feature settings through target IDs, `-mcpu`/`--offload-arch`, `-mattr`, and linker propagation; Triton has AMD-specific TDM descriptor creation. A cross-backend wrapper would change object/semantics or become a prohibited wrapper. | `DROP__SAME_OBJECT_OR_N1_FAILURE`. |

## Source-reality outcome

The precondition "current upstream lacks descriptor/TDM/WMMA/pipeline action X" is contradicted for routes A and B.  Route C has no same-object N1 residual after preserving native AMD and NVIDIA semantics.  No route has a complete union-external atomic action, so no action-gap certificate, finite Stage A killer, or fidelity closure plan can honestly be frozen.

## Evidence boundary

The zero result is an action-space conclusion, not a performance claim and not a claim that these stacks are fully optimized.  No absent implementation, unavailable hardware, or unrun experiment was used as negative scientific evidence.

## Primary sources

- Triton official releases: https://github.com/triton-lang/triton/releases (checked 2026-08-09; `v3.7.0` `5f3f125`, `v3.7.1` `f797708`).
- Triton current AMD driver: https://github.com/triton-lang/triton/blob/main/third_party/amd/backend/driver.py (checked 2026-08-09; exposes `create_tdm_descriptor`).
- Triton current API: https://triton-lang.org/main/python-api/generated/triton.Config.html and https://triton-lang.org/main/gluon/api/language.html.
- LLVM/ROCm AMDGPU user guide: https://rocm.docs.amd.com/projects/llvm-project/en/latest/LLVM/llvm/html/AMDGPUUsage.html.
- ROCm compiler reference: https://rocm.docs.amd.com/projects/llvm-project/en/latest/reference/rocmcc.html.
- AMD HIP compiler/hardware documentation: https://rocm.docs.amd.com/projects/HIP/en/latest/understand/compilers.html and https://rocm.docs.amd.com/projects/HIP/en/latest/understand/hardware_implementation.html.
