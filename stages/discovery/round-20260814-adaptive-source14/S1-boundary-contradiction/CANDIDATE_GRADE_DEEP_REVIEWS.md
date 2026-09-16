# Candidate-grade deep reviews

## D1 — Clang Objective-C ARC return handoff

- Exact object/function: one Objective-C ARC call and returned object under a fixed ABI, ownership, lifetime and autorelease-pool contract.
- Current reality: Clang's [ARC specification](https://clang.llvm.org/docs/AutomaticReferenceCounting.html) describes `objc_retainAutoreleaseReturnValue` and `objc_retainAutoreleasedReturnValue`, and expressly characterizes the convention as a language-specific ABI supplement. The [current ARC code-generation source](https://clang.llvm.org/doxygen/CodeGen_2Targets_2ARC_8cpp_source.html) is the required producer pin; no source absence is asserted.
- Two-plan witness: a producer/consumer can use the designated retained or autoreleased return convention, but the caller's retain/release behavior is coupled to that choice.
- Strongest-union result: switching convention changes the ownership transfer contract; retaining it leaves only current ABI/lowering placement and local ARC optimization. A global selector would be a controller, not a target-specific algorithm.
- Finite killer had it survived: public Clang ARC codegen tests plus IR/assembly and reference-count trace oracle; full cost would include compile CPU/RSS, emitted bytes, runtime retain/release calls and peak object lifetime. Not run.
- Disposition: `DROP__OWNERSHIP_GUARANTEE_SPLIT_OR_CURRENT_ARC_LOWERING`.

## D2 — CUDA cluster DSM placement

- Exact object/function: a fixed CUDA cluster histogram with fixed output, cluster dimensions, DSM lifetime and `cluster.sync()` happens-before requirements.
- Current reality: the [CUDA Programming Guide](https://docs.nvidia.com/cuda/cuda-programming-guide/01-introduction/programming-model.html) states that clustered blocks are co-scheduled on one GPC and may access distributed shared memory; the [DSM section](https://docs.nvidia.com/cuda/archive/13.1.0/cuda-programming-guide/02-basics/writing-cuda-kernels.html) requires blocks to exist and remote DSM operations to complete before exit.
- Two-plan witness: a legal kernel may use per-block shared memory plus global atomics, or distributed shared memory plus cluster synchronization. The latter changes the fixed cluster/lifetime resource contract; reducing cluster to one or moving to global is not the same object.
- Strongest-union result: under the complete fixed cluster contract, the remaining choice is ordinary mapping/tiling/scheduling. No target-specific exact/FPT/Pareto guarantee outside current compiler/runtime composition was frozen.
- Finite killer had it survived: NVIDIA's public histogram example and compiler output/semantic oracle, with compile CPU/RSS, code bytes, occupancy, DSM allocation, synchronization, runtime and peak memory accounted. Not run.
- Disposition: `DROP__RESOURCE_CONTRACT_CHANGE_OR_GENERIC_MAPPING_SCHEDULING`.

Neither structural outcome is inferred from unavailable GPU hardware, a missing implementation, or missing performance data.
