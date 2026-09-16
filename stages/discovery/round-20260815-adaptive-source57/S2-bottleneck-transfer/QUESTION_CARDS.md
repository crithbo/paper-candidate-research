# Source57 Question Cards

## QC-S57-01 — WebAssembly GC canonical recursive-type / RTT construction

- Exact public identity: one fixed WasmGC module, validation/type-equality/subtyping semantics, imports and stock Wasmtime instantiation/execution result.
- Current anchor: WebAssembly 3.0 draft fixes recursive/defined/composite type and validation semantics.
- Potential contribution: `COMPILER_TOOL/N2` only if a target-specific canonical-type/RTT construction with a non-generic guarantee survives a tagged current Wasmtime action catalogue.
- Counterfactual: if such an action existed, validate+instantiate CPU/RSS and type-table memory could change without changing any type relation or execution output.
- Initial full cost: parse/validate CPU/RSS, type interning/canonicalization state, instantiation CPU/RSS, compiled-code/module bytes and startup latency.
- Cheapest falsifier: a version-pinned source locus shows the complete legal action is an engine-owned table/configuration, or no target-specific guarantee can be stated without changing type semantics.
- Closure state: `SOURCE_CLOSURE_QUEUE`; raw is not admitted because one current action/estimand bundle is not yet frozen. This is not scientific failure.

## QC-S57-02 — SPIR-V type/ID/decoration construction

- Exact historical identity: Wave32/36 current `spirv-val`/optimizer/compact-ID construction with the same module and stock validator endpoint. `EXCLUDED_BEFORE_RAW`.

## QC-S57-03 — Vulkan pipeline cache image

- Exact historical identity: Source18 fixed driver-owned pipeline-cache compatibility boundary. `EXCLUDED_BEFORE_RAW`.

No missing implementation/result/resource/hardware/AI-readiness condition is used as a disposition.
