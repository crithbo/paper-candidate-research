# Source42 question cards

## QC01 — MLIR async token lifetime

- Global identity result: `RELATED_ONLY_DO_NOT_EXCLUDE` versus Source30 GPU async token family; all five fields are related only, not an identity decision.
- Current identity / locus: current MLIR async dialect (`SRC01`), current `AsyncRuntime.h` (`SRC02`), current async pass union (`SRC03`). Same object would be a fixed generic MLIR async token/value/group completion contract with unchanged runtime API.
- Strongest skeptic / direct evidence: `SRC03` documents both `-async-runtime-ref-counting` (automatic) and `-async-runtime-policy-based-ref-counting`; the latter explicitly lowers to runtime operations, while `SRC02` defines reference-counted lifetime through `AddRef`/`DropRef`.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_UNION_ABSORBS_OR_GENERIC_REFERENCE_COUNTING`. The supposed intervention is either the existing automatic/policy pass or a generic ownership optimizer. No absence claim is made.

## QC02 — Wasm EH/tail-call representation

- Global identity result: `RELATED_ONLY_DO_NOT_EXCLUDE` versus Wave250 Wasm tail-call stackification. Typed exception/trap endpoint prevents five-field identity containment.
- RQ is complete but the unique public current pieces are not yet fetched: a versioned official tail-call/EH semantic source and a current open engine lowering locus.
- Minimum falsifier after closure: either the official semantics forbids the composition under fixed endpoint, or current engine source already represents it exactly.
- Source recovery: `SOURCE_CLOSURE_QUEUE`, 0 attempted routes, executable primary route `official WebAssembly spec/proposal`, fallback `current Wasmtime or V8 source locus`; status `PENDING_UNEXECUTED`, not exhausted. No scientific inference.

## QC03 — LLVM preallocated invoke/unwind

- Global identity result: `NO_MATCH`; this is not a novelty assertion.
- Current identity / locus: LLVM LangRef `SRC04`, which states operand bundles are associated with `call` and `invoke`; a preallocated operand bundle is a documented call-site mechanism and the text gives the exact `preallocated`/`musttail` constraints.
- Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_NATIVE_SEMANTICS_DIRECTLY_EXPRESSES_INVOKE_ACTION`. The premise that an `invoke` exceptional edge lacks the preallocated interface is false in the current official specification; remaining work is ordinary current frame lowering/ABI configuration.

## QC04 — CUDA async-copy barrier grouping

- Global identity result: `EXCLUDE_EXACT_OR_TERMINAL` because Source22’s fixed mbarrier/async-copy/phase-semantics family terminally contains its action and full-cost endpoint.
- Disposition: `EXCLUDED_BEFORE_RAW__TERMINAL_IDENTITY`.
