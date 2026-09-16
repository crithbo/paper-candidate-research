# Exact public anchors and primary RQs

| Seed | Exact public anchor | Same-object guarantee | Primary RQ | Source route / stop |
|---|---|---|---|---|
| S57-01 | WebAssembly GC proposal/spec and current Wasmtime/engine type documentation, accessed 2026-08-15 | fixed Wasm module validation, type equality/subtyping and execution result | Is a target-specific canonical-type/RTT constructor able to reduce validate+instantiate full cost while preserving stock WasmGC type semantics? | ANCHOR/CURRENT: WasmGC spec + engine docs/source. Stop if type construction is a current engine table/implementation or any change alters type semantics. |
| S57-02 | SPIR-V specification plus SPIRV-Tools current validator/optimizer documentation/source, accessed 2026-08-15 | fixed SPIR-V module meaning and stock validation result | Can a target-specific ID/type/decoration construction reduce generation+validation full cost while retaining identical SPIR-V semantics and validator outcome? | ANCHOR/CURRENT: SPIR-V spec + SPIRV-Tools. Stop if only instruction ordering/optimizer pass/generic packing remains. |
| S57-03 | Vulkan pipeline cache specification/current loader documentation, accessed 2026-08-15 | fixed shader inputs, pipeline state, driver-visible pipeline behavior and stock API result | Is a target-specific cache-image construction able to reduce create/load full cost while preserving pipeline semantics and stock cache acceptance? | ANCHOR/CURRENT: Vulkan spec/docs. Stop if remaining action is cache selection/configuration or driver-private format. |

No alternatives: each primary RQ has a single exact semantic envelope.
