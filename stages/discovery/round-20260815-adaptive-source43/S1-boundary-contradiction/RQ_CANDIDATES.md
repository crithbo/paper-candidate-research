# Source43 RQ candidates

## RQ01 — Swift async context forwarding

1. With fixed Swift async result/error/task-local behavior, can callee/caller async-context forwarding be constructed interprocedurally with a nontrivial ABI-specific guarantee?
2. Can the compiler eliminate context transfers without a scheduler or ordinary tail-call-choice formulation?

Selected: 1. Primary route: official Swift ABI/SIL and current compiler source. Fallback: official Swift evolution/proposal only for transport failure. Earliest falsifier: the current compiler/runtime already gives the same context transition or semantics require changing task-local/error behavior.

## RQ02 — Wasmtime component memory64 canonical ABI

1. For a fixed Wasmtime component and component-model canonical ABI result/trap semantics, can memory64 lift/lower representation be constructed to preserve the same boundary while changing materialization cost?
2. Is there a non-adapter compiler/runtime representation that joins pointer-width and canonical ABI ownership constraints?

Selected: 1. Exact deterministic project selection: `bytecodealliance/wasmtime`, upstream `main` at retrieval date, component-model memory64 lowering. Primary route: current Wasmtime official docs/source; fallback: official Component Model specification only. Earliest falsifier: current Wasmtime already represents the same action or a legal change needs altered canonical ABI/trap semantics.

## RQ03 — LLVM byref/invoke lifetime

1. With fixed LLVM `byref`/call ABI and unwind endpoint, can a byref ownership/lifetime construction through `invoke` give a target-specific legality/cost guarantee?
2. Can that construction differ from current bundle/attribute semantics and ordinary frame lowering?

Selected: 1. Primary route: current LLVM LangRef and current source; fallback: LLVM tests/docs only for transport failure. Earliest falsifier: the documented semantics already allow/forbid the action fully, leaving only ABI flag/frame lowering.

## RQ04 — MLIR transform-handle payload validity

1. Under fixed transform-dialect handle validity and payload semantics, is there a complete non-generic verifier representation for handles surviving payload replacement?
2. Can an invariant change a compiler maintainer decision without becoming a pass-manager wrapper?

Selected: 1. Primary route: current MLIR transform dialect docs/source; fallback: official transform interpreter tests. Earliest falsifier: current dialect already provides the same verifier/invariant or the contribution is only a test/checker wrapper.
