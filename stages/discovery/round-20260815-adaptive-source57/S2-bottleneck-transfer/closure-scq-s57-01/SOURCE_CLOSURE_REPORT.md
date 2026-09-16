# SCQ-S57-01 Wasmtime GC v45.0.0 source closure

## Disposition

`STRUCTURAL_FATAL__DIRECT_CURRENT_UNION_OR_GENERIC_TABLE_POLICY__RETURN_TO_MAINLINE`

This is a Discovery prebrief source-closure disposition only. It does not decide raw admission, a brief, tier, paper potential, Stage 0, or any later state.

## Frozen boundary

- Exact project/version/pin: official `bytecodealliance/wasmtime` `v45.0.0` resolves to `377cd917af258d932d55b201a646917ecf193639`.
- Preserved object: fixed WebAssembly GC module validation, recursive-type semantics, and stock Wasmtime v45.0.0 translation/instantiation behaviour.
- Acquisition: parent queue attempt 1 plus five localised official resource requests numbered 2–6; 2,162,253 persisted response-body bytes, below 16 MiB. No build, test execution, candidate implementation, or claim-bearing observation occurred.

## Pinned current union and stock oracle

1. The stock `ModuleEnvironment` passes each type section to `wasmparser` validation, then iterates by recursion group—not individual type. It explicitly states that rec groups are the canonicalization unit and calls `intern_rec_group` for every group.
2. `ModuleTypes` stores interned types and recursion-group ranges; it maps each group to its ordered type-index range.
3. The runtime `TypeRegistry` states that all defined types from all Wasm modules are interned into the engine registry. For GC, whole recursion groups are the canonicalization and lifetime unit; the registry uses a hash-consing key for canonicalized rec groups, maps them to shared type indices, and handles cross-group references/refcounts.
4. `Engine::register_and_canonicalize_types` registers module types in that registry, then rewrites module types and module entities for runtime usage using `VMSharedTypeIndex`. Together, validator acceptance, module interning, registry registration, and shared-index canonicalization are the stock validate/instantiate oracle for the frozen type semantics.

## Structural closure

The proposed atomic action—canonical recursive-type/RTT construction at the validate-to-runtime transition—is already expressed by the tagged stock union at the required recursion-group granularity. Rearranging the engine table, interning map, hash policy, registration order, or other registry configuration is a generic interning/table-policy variation; it does not supply an action external to the current union. Conversely, changing group boundaries, type relations, or shared-index semantics changes the frozen WebAssembly GC type contract.

Accordingly, no stable same-semantics union-external atomic action can be frozen in the requested object. The generic-table objection is source-supported rather than inferred from missing results, a transport error, or a zero match.

## Carrier, oracle, cost, and falsifier

| Required output | Closure result |
|---|---|
| Fixed carrier | Stock `Payload::TypeSection` translation is a version-pinned canonical implementation carrier. |
| Stock oracle | `validator.type_section`, per-rec-group `intern_rec_group`, and `register_and_canonicalize_types` define the same validation/translation/instantiation route. |
| Union-external action | None under the frozen same-semantics contract; current engine registry already hash-conses whole rec groups and assigns shared runtime indices. |
| Cost estimand | Parse/validate CPU/RSS, type interning state, instantiation CPU/RSS, module/code bytes, and startup latency remain the declared boundary, but do not turn generic table tuning into a target-specific action. |
| Earliest falsifier | Any proposal that only alters registry map/order/configuration is generic policy; any proposal that changes rec-group/type/shared-index semantics fails the frozen same-object contract. |

No Source58 or Source59 material was read. No transport, 404, zero match, or missing tool is used as evidence.
