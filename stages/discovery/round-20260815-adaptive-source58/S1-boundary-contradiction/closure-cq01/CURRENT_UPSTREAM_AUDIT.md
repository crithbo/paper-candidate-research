# Current upstream audit — Wasmtime Component post-return CQ01

## Pinned identity and scope

- Project: `bytecodealliance/wasmtime`, official default branch resolved to `bc2f967927f9f0e839095a752bf554c4a09fdd13`.
- Tree: the official recursive-tree response was complete (`truncated: false`).
- Inspected source stays within the frozen component-runtime scope: `crates/wasmtime/src/runtime/component/func/options.rs`, `func/typed.rs`, and `func/host.rs`.
- The Component Model Canonical ABI document remains the frozen semantic anchor. It was not re-fetched because this closure's question is the current Wasmtime union, not a new external semantic claim.

## Current native union

| Locus | Pinned observation | Consequence for the frozen object |
|---|---|---|
| `func/options.rs` | `LiftContext::options()` and `LowerContext::options()` read the component's selected `CanonicalOptions` by `OptionsIndex`. | The action is rooted in native component options rather than an external cleanup wrapper. |
| `func/typed.rs:103-114` | The current typed component call documents that a function can have Canonical-ABI post-return cleanup and that, if present, this call invokes it automatically. | The native call contract includes post-return execution. |
| `func/typed.rs:231-265` | The call path produces `(result, post_return_arg)` and then immediately calls `self.func.post_return_impl(store, post_return_arg)` before returning `Ok(result)`. | The current union is a complete native call → result/argument → post-return chain, not a missing dispatch hook. |
| `func/typed.rs:358-372` | Public `post_return` / `post_return_async` methods are deprecated and no-op. | There is no second caller-controlled native cleanup endpoint within the frozen typed-call contract. |

## Two-schedule test and carrier

The in-tree carrier is a typed component invocation under `TypedFunc<Params, Return>::call`, with the stock oracle being that method's current native return and its immediate `post_return_impl` invocation. One complete schedule is therefore fixed: lower/call/lift, derive `post_return_arg`, invoke native post-return, then return the lifted result.

No distinct second complete same-component/same-semantics native cleanup schedule was frozen. The exposed legacy post-return method is explicitly a no-op, while the current call path owns and automatically performs the actual action. Moving, coalescing, skipping, or independently scheduling cleanup would therefore either duplicate/elide the current native action or turn the fixed call-chain ownership endpoint into a different contract. This is a changed-object/independent-call legality objection, not an inference from missing source.

## Bounded conclusion

The pinned current union directly contains the required post-return dispatch. Under the frozen Canonical ABI call-chain object, no union-external pair of complete native cleanup schedules remains to support the specified action family. The appropriate source-closure disposition is consequently structural and is limited to returning this result to mainline; it has no brief, quality-tier, candidate, or stage-state authority.

## Cost estimand, falsifier, and debt

- Fixed full-cost dimensions for any later work remain component lowering/lifting CPU and RSS, component bytes, cleanup call count/allocation/runtime cycles, and peak memory.
- A finite falsifier would be a pinned in-tree component whose stock typed call accepts two legal same-semantics native schedules with different post-return action order while preserving the exact Canonical ABI endpoint. The observed current typed-call chain supplies no such second schedule.
- The bounded fetch route did not retrieve the inaccessible raw `func.rs` route (HTTP 404); this is logged without absence inference. It does not weaken the affirmative typed-call evidence above, but it remains a source-path debt if mainline ever changes the frozen object.
