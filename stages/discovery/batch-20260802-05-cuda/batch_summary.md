# CUDA/GPU Discovery batch 20260802-05

Date: 2026-08-02  
Scope: CUDA/GPU algorithm, compiler, runtime, and GPU-system mechanisms. This batch does not modify the registry or create Stage 0 directories.

## Result

Four non-synonymous candidates are recommended for mainline Stage 0 triage:

| ID | Paper kernel | Strongest baseline | AI route |
|---|---|---|---|
| GPU-MOETAILSCHED | MoE grouped-GEMM scheduler that charges dispatcher visibility and end-to-end tail | CUTLASS grouped scheduler (`kDeviceOnly` / `kHostPrecompute`) plus sorted problems | AI_CORE_EXECUTABLE |
| GPU-PDLFRONTIER | compiler-selected readiness frontier for programmatic dependent launches | serialized launch, hand-written PDL, and legal fusion | AI_CORE_CONDITIONAL |
| GPU-CLUSTERSTEAL | cancellation-budgeted load balancing for Blackwell irregular tiles | fixed-work grid, persistent kernel, and unmodified Cluster Launch Control | AI_CORE_CONDITIONAL |
| GPU-GREENBUDGET | request-class-aware SM/workqueue partitioning within one CUDA application | no split, static green-context split, and MPS cap | AI_CORE_CONDITIONAL |

Shared collision note: none is a renaming of the stopped `GPU-NCCLGROUPCUT`, `GPU-L2LEASE`, `GPU-CONDGRAPH`, `GPU-GRAPHCAPTURE`, or `THEORY-MXIO` kernels. `GPU-MOETAILSCHED` must nevertheless be checked against `CGPU-DECSLICE` during Stage 0 because both touch GPU code-generation/runtime decisions; their objects and claims currently differ.

All claims are `SEARCH_BOUNDED_OPEN`. No performance result has been run in this Discovery batch.

