# Source closure report — Source85 S2 CQ01

## Assignment boundary

`SOURCE-CLOSURE-SOURCE85-S2-CQ01-TVM-RELAX-FUSION-LIFETIME-V1` is a Discovery prebrief source closure. It has no authority to decide a clean brief, paper quality, candidate status, or a project stage.

## Disposition

`UNRESOLVED_BACKLOG__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`

## Closed source facts

At pinned TVM commit `27c2e019d0ce6182158020c7534dda4a3ce981ae`, Relax has an explicit graph-partition fusion algorithm; `StaticPlanBlockMemory` has scoped, typed storage-token reuse with lifecycle rewriting; and VM code generation preserves explicit allocation and object-kill operations. The official test contains a static-memory/lifecycle IRModule and stock expected output.

These findings exclude claims that either fusion or memory reuse is missing from the stock pipeline. They do not resolve whether a same-information, joint fusion/lifetime optimization is already expressed by the stock composition or whether a proposed coupling is TVM-specific rather than generic graph partitioning plus memory packing.

## Unclosed requirement

No retained path exposes two complete, same-IR, same-target, same-VMExecutable-semantics plans that differ jointly in fusion boundaries and static block-memory lifetime decisions. The test's input and expected output are a pass transformation, not two alternate complete legal plans. Without that action-divergence witness and a target-specific guarantee skeleton, the raw input cannot be promoted or structurally rejected by this closure.

## Bounded continuation

Any later authorized source closure must keep the same commit/object/full-cost boundary and freeze one small Relax/TensorIR IRModule with two complete legal plans plus the precise guarantee/falsifier. This packet ran no build, installation, experiment, or claim-bearing observation.
