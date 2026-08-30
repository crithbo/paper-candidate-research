# Resource-lifetime raw screen

| id | fixed semantic/legal contract | current allocation/lifetime action union | minimum legal action-divergence witness | disposition |
|---|---|---|---|---|
| R01 | same SM90a tensor output/layout/bounds semantics | CUDA async-copy pipeline, producer/consumer barriers, staged shared-memory buffer reuse | a static lifetime interval and release action unavailable to current pipeline primitives | `DEEP_DIVE_REQUIRED` |
| R02 | same SM90a GEMM output/dtype/layout | CUTLASS shared-memory/register double buffers, stages, TMA/GMMA, producer/consumer roles | a complete reuse allocation not representable by stages/buffers/collective | `DEEP_DIVE_REQUIRED` |
| R03 | same SM100a GEMM output/dtype/layout | TMEM allocator, column constraints, TMA-to-SMEM stages, TMEM/RMEM copy atoms, barriers/deallocation | a legal TMEM lifetime/packing action not in allocator/pipeline union | `DEEP_DIVE_REQUIRED` |
| R04 | same fixed Triton kernel output on its documented target | software pipeline stages, accumulator multi-buffer flag, warp specialization groups/commit | a static resource partition beyond current IR/lowering | `DEEP_DIVE_REQUIRED` |
| R05 | same HIP operation/layout on one fixed AMD target | CK static distributed tensors, LDS/register buffer views, tile/invoker composition | no whole allocation-and-release action beyond existing composition frozen | `NOT_ADMITTED_UNFROZEN__NO_ATOMIC_WITNESS` |
| R06 | same MLIR GPU kernel semantics and target | allocation/lowering interface only; no frozen complete native target union | no native legality/union contract frozen | `NOT_ADMITTED_UNFROZEN__CONTRACT_INCOMPLETE` |

Stage counts, scheduling hints, and compiler options remain inside the current union; none is treated as N2.
