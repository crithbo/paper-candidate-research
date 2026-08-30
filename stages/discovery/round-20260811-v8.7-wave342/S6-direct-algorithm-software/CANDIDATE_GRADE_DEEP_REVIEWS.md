# Depth closure

## Tantivy

Fixed semantics are document/schema/analyzer/query answers under the stock reader. Official source: https://github.com/quickwit-oss/tantivy. Candidate actions (segment writer, postings/fast-field/store construction and merge) are presently indistinguishable from existing index/merge policy and generic layout/scheduling. Full union, a native two-output witness, and a target-specific guarantee were not frozen. Natural route if later closed: public text corpora; full cost: indexing/merge CPU-RSS-temp/bytes plus query CPU/RSS/latency; killer: beat stock bulk-plus-merge union at fixed query result. `NOT_ADMITTED_UNFROZEN`.

## Wasmtime/Cranelift

Fixed semantics are Wasm validation, target/ABI and runtime behavior under stock Wasmtime. Official source: https://github.com/bytecodealliance/wasmtime. Compilation, lowering, code generation and cache artifact paths may compose, but a candidate remains cache policy, generic code layout or compiler scheduling until a current source union and same-object union-external atomic action are pinned. Natural route: WasmBench/public Wasm modules; full cost: compile/load/run CPU-RSS-temp/artifact bytes; killer: outperform full current compile/cache union at identical module/runtime semantics. `NOT_ADMITTED_UNFROZEN`.

No primary direct-collision claim is made because action closure is incomplete.
