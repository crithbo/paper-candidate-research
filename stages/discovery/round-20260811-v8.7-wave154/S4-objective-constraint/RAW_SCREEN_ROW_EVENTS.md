# Guarantee-first / witness-first raw screen

| id | same-kernel output contract | official current target/config union | smallest alleged legal divergence | disposition |
|---|---|---|---|---|
| R01 CUDA TMA | identical tensor output and bounds semantics on SM90 | TMA tensor map, bulk async global-to-shared copies, barriers/pipeline | a copy/compute schedule outside TMA pipeline without changing layout/bounds | `DEEP_DIVE_REQUIRED` |
| R02 CUTLASS SM90 | identical GEMM result/dtype/layout on SM90 | `CollectiveMma`, TMA/GMMA, stages, cluster shape, three warp-specialized schedules | a static producer/consumer/reuse construction not expressible by current collective/schedules | `DEEP_DIVE_REQUIRED` |
| R03 CUTLASS SM100 | identical Blackwell GEMM result/dtype/layout on SM100 | TCGen05, TMEM accumulators/double buffering, CLC and exposed schedules | a target-local TMEM/reuse construction outside current Blackwell union | `DEEP_DIVE_REQUIRED` |
| R04 Triton | fixed source kernel and output semantics on Hopper-or-newer | Gluon producer/consumer warp groups, Hopper TMA/mbarrier; target-gated specialization | a complete static partition not reducible to the existing warp-specialization IR | `DEEP_DIVE_REQUIRED` |
| R05 LLVM AMDGPU | identical ISA/output/OOB and XNACK semantics on gfx90a | `-mcpu=gfx90a`, workgroup/waves attributes, VGPR/SGPR/LDS occupancy model, strict/relaxed OOB flags | a legal register/occupancy construction outside backend allocation under unchanged flags | `NOT_ADMITTED_UNFROZEN__NO_COMPLETE_UNION_EXTERNAL_ACTION` |
| R06 ROCm CK | identical HIP tensor operation/layout for one fixed AMD target | tile operators, coordinate transforms, kernel/invoker and client layers | a whole static mapping beyond documented tile/scheduling composition | `NOT_ADMITTED_UNFROZEN__NO_ATOMIC_ACTION_WITNESS` |

Tuning flags are part of the current union, never residual evidence. No autotuning-only, controller, generic ILP, weak comparator, altered kernel, or altered numerical quality is admitted.
