# Pinned Apache TVM Relax fusion/lifetime audit

## Pin and bounded scope

- Project/commit: `apache/tvm` at current `main` commit `27c2e019d0ce6182158020c7534dda4a3ce981ae`.
- Official recursive tree was complete (`truncated: false`).
- The retained source set is limited to direct Relax fusion, static block-memory planning, VM code generation, and one official static-plan test.

## Current stock union

| Axis | Pinned stock action | Contract boundary |
|---|---|---|
| Fusion | `FuseOps` builds a dataflow graph, traverses toward immediate post-dominators, checks paths, and uses union-find to commit legal binding groups. It has a maximum fused-op pass configuration. | Fusion changes Relax function grouping before later lowering. |
| Static memory | `StaticPlanBlockMemory` creates storage tokens, tracks reference counts, selects reusable storage from a scoped/dtyped pool, rewrites `alloc_storage`/`alloc_tensor`, and delegates kill insertion to the later `KillAfterLastUse` lowering. | Reuse applies only under the stated block/use/shape/scope restrictions. |
| VMExecutable | `CodeGenVM` generates a VM executable from Relax functions, emits function/register code, and handles `alloc_storage`, `alloc_tensor`, and `kill_object` builtins. | The stock VM executable owns the final allocation and object-kill instruction contract. |

## Carrier and two-plan limitation

The retained test carries a concrete fixed Relax IRModule containing a chain of `builtin.alloc_tensor` operations and asserts the static planner's resulting `memory.alloc_storage`/`memory.alloc_tensor` reuse; after lowering it asserts the VM alloc/kill sequence. This is a strong stock-oracle carrier for the static-lifetime axis.

It does not expose two complete plans for the same IRModule that differ jointly in fusion boundaries and lifetime layout while preserving the same VMExecutable contract. The unplanned input versus the stock expected rewrite is not a pair of alternative complete stock-legal plans, and the source set does not bind a fusion alternative to the test's storage allocation decisions.

## Direct collision and generic objection

Current TVM already expresses both ingredients, so no claim may describe fusion or static reuse as absent. The retained source paths do not demonstrate the same-information joint objective as a current composition, but neither do they identify a TVM-specific non-product action or exact/FPT/approximation/certified guarantee outside standard graph partitioning plus storage-pool allocation. A generic packing/pass-selection explanation remains live.

## Full-cost/falsifier boundary

Full cost remains compiler CPU/RSS/temp/cache, peak allocation, executable and constant-pool bytes, VM bytecode/dispatch CPU, end-to-end runtime, and device bytes. A finite falsifier is a pinned same-IR two-plan construction showing that fusion-boundary changes can only be explained by existing `FuseOps` configuration and `StaticPlanBlockMemory` reuse, or a source-level current composition that already selects the asserted joint action. No execution claim was made.
