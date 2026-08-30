# Candidate-grade deep reviews

## D01 — LLVM C++20 coroutine frame/layout/cleanup joint construction

- Exact object: a fixed C++20 coroutine program and suspend/resume/destroy/exception semantics lowered through LLVM's switched-resume ABI; normal completion and exceptional cleanup must remain observationally identical.
- Proposed complete action (hypothesis only): construct one cross-function frame layout and field-lifetime/cleanup schedule jointly from the suspend graph, including ramp initialization, resume reloads, destroy cleanup and exceptional completion. It must not alter source promise semantics, allocation/deallocation contract, ABI offsets, or legal suspension states.
- Current fair union: Clang current coroutine emission plus LLVM `CoroEarly`, `CoroSplit`, `CoroAnnotationElide`, `CoroElide`, and `CoroCleanup`; all documented intrinsic/attribute paths are part of the comparator.
- Native action-divergence witness required at Stage0: a coroutine with (i) a value live across one suspend, (ii) a nontrivial destructor reached on destroy and exception paths, and (iii) an elidable/non-elidable allocation branch, for which stock staged field placement and a proposed joint construction choose different legal frame/lifetime layouts while emitting identical resume/destroy observations.
- Natural route/oracle: public LLVM coroutine tests and a small public C++ coroutine corpus; Clang IR/assembly plus runtime completion/exception behavior are the legality/equivalence oracle.
- Full cost: compile CPU/RSS, coroutine frame bytes/alignment, initialization and destroy code bytes, spill/reload count, cleanup calls, normal resume latency and exceptional-destroy latency.
- Strong direct subtractors: the current LLVM coroutine specification and pipeline; the bounded official search did not establish a current joint target-specific algorithm or formal guarantee. This is `SEARCH_BOUNDED_OPEN`, not a novelty claim.
- Finite 72-hour killer: pin one LLVM revision; enumerate CoroSplit/Elide's field placement and cleanup decisions for the witness; DROP if that current composition already realizes the proposed joint optimum or if any smaller frame changes ABI/exception semantics. A direct current-source/paper absorber also kills the residual.
- Fidelity closure: `FINITE_FIDELITY_GAP`. The route is finite, but current documentation does not yet freeze a non-generic algorithm/guarantee versus the complete implementation union. No brief is issued.

## D02 — WebAssembly exception-tag/runtime representation

- Exact object: a valid Wasm exception-handling module under the official tag/throw/catch semantics, with the same exported values and trap/exception behavior.
- Candidate action: jointly choose a tag/handler representation shared by validator and runtime while preserving binary/text validity and runtime behavior.
- Strong union: official specification + reference interpreter/test suite, then each specific current engine/compiler would need pinning. The WABT project documents `--enable-exceptions` as a feature gate and validator/interpreter support, demonstrating that default/non-default implementation configurations matter.
- Natural carrier/oracle: official spec tests and WABT validation/interpreter are finite candidates; full cost would include validation/compile CPU-RSS, binary bytes, handler metadata, and throw/unwind latency.
- 72-hour killer: select a named current engine and pin validator/compiler/runtime source plus its exception feature gates; DROP if it already expresses the representation action, or if a cross-engine proposal changes the exact engine/runtime object.
- Fidelity closure: `FINITE_FIDELITY_GAP`. With no pinned engine/source union and no target-specific non-generic mechanism, it cannot honestly enter Stage0.
