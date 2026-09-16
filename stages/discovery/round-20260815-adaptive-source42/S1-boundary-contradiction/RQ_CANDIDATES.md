# Source42 RQ candidates

## RQ01 — MLIR async token lifetime

1. Under fixed MLIR async token/value completion semantics, can a join-aware ownership construction minimize runtime retain/release state transitions with an explicit validity guarantee?
2. Can token dependency and runtime reference ownership be jointly constructed without changing observable completion or becoming a generic ownership pass?

Selected: 1. Immutable contract: same async dialect result/completion semantics and runtime interface; excludes scheduler, wrapper, and changed token API. Primary evidence: current MLIR async dialect/runtime documentation and source; fallback: official LLVM source docs. Earliest falsifier: current native lowering already makes the same lifetime decision or it requires a changed runtime interface.

## RQ02 — Wasm EH/tail-call representation

1. Under fixed Wasm tail-call and exception behavior, can the producer/runtime represent a tail-call that traverses an exception-cleanup boundary without changing component/trap semantics?
2. Does the exact typed-control boundary admit a target-specific formal representation/guarantee beyond engine-specific lowering?

Selected: 2. Immutable contract: same Wasm typed control, exceptions, tail-call and trap endpoint; excludes engine wrapper or exception-model change. Primary evidence: official WebAssembly proposals/spec; fallback: a current open-source engine source locus. Earliest falsifier: the spec forbids the composition or it is already exactly represented.

## RQ03 — LLVM preallocated callframe/unwind lifetime

1. With a fixed LLVM call ABI and unwinding endpoint, can preallocated call-frame ownership be constructed across an `invoke` exceptional edge with a validity/cost guarantee?
2. Is an `invoke`-aware frame-lifetime construction distinct from selecting existing preallocated operand bundles/calling conventions?

Selected: 1. Immutable contract: same LLVM IR calling and exception semantics; excludes ABI switching, flag selection, and generic frame allocation. Primary evidence: current LLVM LangRef/source; fallback: current documentation tests. Earliest falsifier: `preallocated` is forbidden/fully handled on `invoke`, or the action is only current frame lowering.

## RQ04 — CUDA async-copy barrier grouping

1. With fixed CUDA tile output and pipeline completion semantics, is there a native action over async-copy/barrier arrival grouping with a target-specific guarantee?
2. Can the grouping preserve producer/consumer observability without merely choosing pipeline depth or host scheduling?

Selected: 1. Immutable contract: same CUDA barrier and copy completion semantics; excludes host controller, parameter tuning, and changed memory consistency. Primary evidence: NVIDIA CUDA C++ Programming Guide and libcu++ source; fallback: official samples. Earliest falsifier: all legal choices are configuration/controller actions.
