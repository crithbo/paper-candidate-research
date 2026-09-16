# Pre-evidence RQ Candidates

## RQ-S01 — RISC-V Zcmp frame transition

Exact object held across variants: a fixed RISC-V program/call graph, psABI-visible unwinding and exception behavior, and Zcmp-enabled target.

1. Can a target-specific whole-function construction choose compressed prologue/epilogue transitions while preserving unwind semantics?
2. Can a joint call-graph frame/save/restore construction reduce text, stack, and execution cost against stock code generation?
3. Is there a no-gain condition for canonical call graphs where compressed and ordinary frame transitions are Pareto-equivalent?

Pre-evidence selection: variant 2, conditional on a non-generic mechanism beyond frame lowering or cost tuning.

## RQ-S02 — WebAssembly exception tag boundary

Exact object held across variants: a fixed Wasm exception-handling module, tag/catch semantics, host-observable result, and a nominated engine ABI.

1. Can an engine-specific representation construction preserve tag/catch semantics while reducing boundary costs?
2. Can a whole-module tag/materialization construction preserve exceptions and host-visible completion while reducing full cost?
3. Is there a canonical module condition under which tag placement/marshaling has no full-cost residual?

Pre-evidence selection: variant 2, conditional on a pinned public engine source/configuration and a non-generic action. Binding adapter changes, generic exception optimization, or changing the embedding ABI are excluded.
