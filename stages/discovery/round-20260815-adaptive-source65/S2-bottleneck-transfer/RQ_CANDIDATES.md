# Pre-evidence RQ candidates

## RQ-S65-01 — Cranelift allocation/spill construction

For a fixed CLIF function set, target ISA, ABI, and native executable behavior, can a target-specific joint register/spill-state construction improve compile plus emitted-code full cost beyond Cranelift's current code-generation union without becoming generic register allocation?

## RQ-S65-02 — rustc incremental dependency construction

For a fixed Rust crate graph, compiler version/target, diagnostics, and artifact behavior, can a non-cache-policy dependency/work-product constructor improve full incremental compilation cost while preserving rustc semantics?

## RQ-S65-03 — WebGPU binding-layout construction

For a fixed WebGPU application, shader/resource semantics, and GPU output, can a target-specific resource-binding/pipeline-layout constructor reduce encode/validation/submit full cost without changing the WebGPU observable contract?

Each is `RQ_READY_FOR_ORDINARY_CLOSURE`; no alternative RQ is needed because object and guarantee are fixed.
