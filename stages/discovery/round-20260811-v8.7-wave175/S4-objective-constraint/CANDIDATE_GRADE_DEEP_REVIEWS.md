# Candidate-grade deep review

## R01 — `UNFROZEN__CURRENT_SOURCE_UNION_NOT_FULLY_CLOSED`

### Current source reality check

At commit `1069de7c5ab71508bd99620337af261684d87020`, official NVGPU documentation supplies device async tokens, async copy group/wait, TMA, mbarriers, shared-memory address spaces and descriptor attributes. GPU/pass documentation supplies allocation, barriers, `gpu-async-region`, bufferization/deallocation/hoisting, NVGPU shared-memory access optimization and lowering hooks.

Pinned source file `mlir/lib/Dialect/NVGPU/Transforms/OptimizeSharedMemory.cpp` was read from the official LLVM repository. It implements access-index permutation for shared-memory read/write operations. It rejects subviews and states it does not perform alias analysis. That positive source fact rules out treating this one pass as a complete lifetime allocator; it does **not** prove no such action exists elsewhere in the source tree.

### Required closure before any proposal

1. Enumerate every relevant pinned source pass and its registration/pipeline reachability, including GPU/NVGPU/bufferization allocation/deallocation lowering paths.
2. Freeze an actual matching NVIDIA backend and a corpus of MLIR async/TMA/mbarrier kernels; do not transfer the action to AMD or an abstract target.
3. Produce a minimal legal SSA/token witness with two reusable buffer intervals, prove no use/token/mbarrier phase crosses the reuse point, and demonstrate that existing passes cannot replay the construction.
4. Use MLIR verifier, NVVM/backend acceptance, and original output/bounds oracle; charge compile, allocation, copy/TMA, barriers, peak shared memory, register/occupancy and run/launch cost.

### Finite ≤72h killer (not executed)

On 20 official/regression-corpus kernels selected under the frozen target, stop this prospective mechanism if: (a) no legal two-interval reuse witness is found; (b) verifier, NVVM lowering, backend acceptance, or output/bounds equivalence fails; (c) an existing source pass pipeline produces the same allocation/reuse; or (d) peak shared-memory reduction vanishes after full-cost charging. This is a future fidelity-closure plan only, not experimental evidence.

### Disposition

`UNFROZEN__NO_PROPOSE_STAGE0`: source-union incompleteness is neither evidence of novelty nor a scientific DROP. No implementation, result, resource, or AI-readiness condition entered the decision.
