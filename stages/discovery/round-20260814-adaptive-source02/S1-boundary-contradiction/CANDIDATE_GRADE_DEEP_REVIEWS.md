# Source-only closure and candidate-grade reviews

## C01 — LLVM C++20 coroutine frame/layout/exception-cleanup closure

- Pinned current union: LLVM's current Coroutines documentation identifies `CoroEarly`, `CoroSplit`, `CoroAnnotationElide`, `CoroElide`, and `CoroCleanup`. Current `CoroSplit` invokes `buildCoroutineFrame(OptimizeFrame)`; current `CoroFrame.cpp` constructs the frame from resume/destroy pointers, promise, suspend/resume index, spilled values and allocas, using suspend-crossing analysis, spill insertion, rematerialization and frame-layout machinery.
- Current-source evidence: `CoroFrame.cpp` official source/doxygen documents the frame layout and `buildFrameLayout(... OptimizeFrame)`; current `CoroSplit` exposes the `OptimizeFrame` path. LLVM docs also specify normal and unwind `coro.end`, allocation elision, direct resume/destroy calls, and the no-allocation ramp variant.
- Forced witness reassessment: the earlier witness requires different but semantically equivalent field/lifetime layouts. That choice is already within the current coroutine frame builder/optimization action space. Any stronger proposed global field packing is generic layout/coloring or a cost-model refinement, not a target-specific new algorithm/guarantee.
- Fair union: Clang coroutine emission + all named LLVM coroutine passes/options and the same switched-resume ABI; it absorbs the proposed action at the required abstraction.
- Disposition: `STRUCTURAL_DROP` by current-union absorption/generic-kernel reduction. This is a source-based result, not a result/implementation/resource inference and does not revive or alter the old family.

## D01 — WebAssembly component async ABI / stack-switching continuation seam

- Exact object: one named component implementation with a fixed async export ABI, continuation table semantics, component lifetime and observable result/trap behavior.
- Official anchor: the WebAssembly component-model concurrency design describes stackful async behavior in terms of suspension and a continuation stored in a component instance's table of threads, while intentionally not depending on the core stack-switching proposal.
- Required current-union closure: pin a specific current engine's component compiler, adapter/runtime and all enabled/experimental feature gates; enumerate continuation allocation, table ownership, cancellation/finalization and host re-entry paths.
- Natural/formal route: official component-model/spec tests and the selected engine's existing tests; validator/interpreter/runtime behavior would be the oracle. Full cost: compile CPU/RSS, component bytes, continuation/table storage, suspend/resume latency and cancellation/finalization work.
- 72-hour killer: if the selected engine's native async ABI already offers the complete ownership-preserving continuation layout, DROP as absorbed; if no engine can be pinned without changing the object, retain only `NOT_ADMITTED_UNFROZEN`.
- Status: `FINITE_FIDELITY_GAP`; no brief because neither action divergence nor a non-generic contribution is yet frozen.

## D02 — LLVM GC statepoint exceptional-edge relocation

- Exact object: a fixed LLVM managed-language program and runtime collector semantics, including base/derived pointer relocation and exceptional continuation behavior.
- Current union: `gc.statepoint`, relocations, stack-map encoding and rewrite/lowering machinery. The official Statepoints document makes live-pointer discovery and correct intrinsic insertion a client responsibility and describes locations/relocations; current StackMaps source serializes statepoint records.
- Candidate action: a joint, exceptional-edge-aware base/derived relocation construction. It remains only a mechanism sketch; without a named runtime and source-pinned insertion/lowering union, a proposal would either be generic pointer/dataflow analysis or switch objects.
- Natural route/oracle: a public managed-language LLVM client and official statepoint/stackmap tests; runtime relocation correctness plus stack-map parsing. Full cost includes compile CPU/RSS, stackmap bytes, live locations, safepoint/deopt latency and runtime relocation work.
- 72-hour killer: pin one client/runtime and demonstrate a legal base/derived graph whose stock insertion and proposed construction differ; DROP if it is expressed by current insertion/lowering or reduces to generic graph analysis.
- Status: `FINITE_FIDELITY_GAP`, not a negative conclusion.
