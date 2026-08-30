# Source104 S5 Research Question Candidates

All cards below were selected before public evidence lookup. They are not locators, raw candidates or novelty claims.

## `S5-104-RQ01`

- Seed / object: `S5-104-01` / llama.cpp current CPU-GPU backend schedule.
- Primary RQ: For a version-frozen llama.cpp CPU/GPU plan, does a source-defined local plan-repair action maintain the same executable semantics after one capacity event with lower full recourse cost than rebuilding the plan?
- Immutable boundary: same loaded model, quantization, token output and backend legality; no private hardware.
- Anchor question: does the runtime expose a deployment-time mutable plan action rather than only load-time offload configuration?
- Route: current llama.cpp source/docs, then public release/tag only if transport fails.
- Null: offload configuration is load-time-only; any repair changes the runtime object.
- Nomination: `PRE_RQ_CLOSURE_NOMINATED`; stop at no mutable action, direct current coverage, or a fixed action/oracle.

## `S5-104-RQ02`

- Seed / object: `S5-104-02` / llama.cpp native multi-sequence KV state.
- Primary RQ: Can a same-runtime bounded-recourse algorithm choose legal sequence-state copy/removal/recompute actions under slot pressure with lower copy-plus-defragmentation cost than the current state-maintenance action?
- Immutable boundary: native sequence/token ownership and exact prefix semantics.
- Anchor question: which sequence-state mutations and legality constraints are native and publicly checkable?
- Route: current llama.cpp `llama_memory`/server source and documentation; official tag fallback only.
- Null: action is an excluded generic prefix/session cache lifecycle policy.
- Nomination: `PRE_RQ_CLOSURE_NOMINATED`; stop at generic lifecycle identity, no native action or direct coverage.

## `S5-104-RQ03`

- Seed / object: `S5-104-03` / llama.cpp KV cache allocator and defragmentation action.
- Primary RQ: Can an incremental relocation schedule for source-defined llama.cpp KV blocks bound pause/copy cost under allocator pressure while preserving token ownership and cache legality better than native defragmentation?
- Immutable boundary: same allocator/block ownership and output semantics.
- Anchor question: what current relocation, defragmentation trigger and ownership invariants exist?
- Route: current llama.cpp allocator source/docs; official tag fallback only.
- Null: native defragmenter already expresses the action or residual is generic memory compaction.
- Nomination: `PRE_RQ_CLOSURE_NOMINATED`; stop at direct action absorption, no finite witness, or generic kernel only.

## `S5-104-RQ04`

- Seed / object: `S5-104-04` / MLC LLM current runtime memory/KV reservation carrier.
- Primary RQ: Can a public MLC LLM runtime maintain a source-defined online memory-reservation frontier under one capacity change while preserving the same request semantics and a complete memory/transfer cost boundary?
- Immutable boundary: one public engine configuration and fixed request/quality semantics.
- Anchor question: does the current runtime own a memory reservation update action distinct from generic prefix-cache scheduling?
- Route: current official MLC LLM repository/docs; tag fallback only.
- Null: no public action or only generic cache admission exists.
- Nomination: `PRE_RQ_CLOSURE_NOMINATED`; stop at absent action, direct coverage or no finite estimator.

## `S5-104-RQ05`

- Seed / object: `S5-104-05` / llama.cpp current speculative draft/verify execution.
- Primary RQ: For a fixed target-output contract, can a source-defined online adjustment of the llama.cpp draft/verify boundary reduce complete verification, transfer and KV cost versus the current speculative path?
- Immutable boundary: target output/token guarantee, current model pair and source-defined draft/verify semantics.
- Anchor question: which configurable runtime granularity actions exist, including default/non-default flags?
- Route: current llama.cpp speculative source/docs and direct current comparator work; tag fallback only.
- Null: configuration is static or current engine already adaptively owns the boundary.
- Nomination: `PRE_RQ_CLOSURE_NOMINATED`; stop at no mutable action, current absorption or no same-output witness.

## `S5-104-RQ06`

- Seed / object: `S5-104-06` / llama.cpp public benchmark and offload configuration surface.
- Primary RQ: On a version-frozen public llama.cpp carrier, can a pre-registered breakpoint estimand identify when an identical model’s CPU/GPU split reverses a deployment choice after charging load, transfer and KV memory costs?
- Immutable boundary: one model/configuration class, benchmark metric and full-cost denominator.
- Anchor question: which public metrics and lifecycle events make the breakpoint reproducible and decision-relevant?
- Route: current llama.cpp benchmark/server source, documented offload settings and one public workload route.
- Null: only a dashboard/plot can be produced rather than a measurement conclusion with a held-out falsifier.
- Nomination: `PRE_RQ_CLOSURE_NOMINATED`; stop at no fixed estimand/event or no public carrier.

## `S5-104-RQ08`

- Seed / object: `S5-104-08` / public CPU-GPU unified-memory or zero-copy carrier.
- Primary RQ: For one version-frozen public CPU/single-GPU backend, can an online action choose among zero-copy, transfer and recompute under a documented capacity event while preserving a fixed numeric contract and charging full transfer/synchronization cost?
- Immutable boundary: documented public backend and same numerical contract.
- Anchor question: does an eligible public carrier expose all three source-defined actions with a finite oracle?
- Route: first-party carrier documentation/source only; no private/unlisted NPU input.
- Null: action is generic placement, resource-only or unavailable.
- Nomination: `PRE_RQ_CLOSURE_NOMINATED`; stop at missing public carrier/action or direct generic-kernel absorption.
