# Same-object RQ variants, frozen before targeted evidence

## `AARCH64_FPMR__FIXED_FP8_CALL_SEMANTICS__CALL_BOUNDARY_STATE_PRESERVATION`

1. Under fixed AArch64 ABI and FP8 observable values/exceptions, can FPMR call-boundary preservation be solved by a target-specific interprocedural state construction with a formal cost guarantee?
2. Can FPMR liveness, FP8 conversion regions, and call state be jointly constructed without changing ABI/FP8 mode semantics or devolving into generic register allocation?
3. Is there a finite static legality/full-cost falsifier against stock compiler behavior for this exact ABI-state object?

## `CUDA_THREAD_BLOCK_CLUSTER__FIXED_KERNEL_RESULT__CLUSTER_BARRIER_COMMITMENT`

1. With fixed CUDA kernel output and cluster synchronization semantics, can barrier/cluster commitment form a non-controller construction with a stated guarantee?
2. Does cluster membership plus distributed shared-memory visibility retain a same-object action beyond launch configuration and scheduling?

The RQs deliberately do not assume exact version, current source, full cost, witness, complete union, result, or Q2 outcome.
