# Current upstream audit — rustc coroutine layout retry1

## Frozen boundary

- Project and immutable source pin: `rust-lang/rust@68c677ac3f013d2e587f47e198c92e551716191e`.
- Object: one fixed async Rust crate and target, preserving stock poll, output, drop, borrow, ownership, representation legality and target ABI.
- This is a source-closure audit only. No compiler was built, no test was run, and no performance or correctness claim was observed.

## Positive current-union findings

1. `compiler/rustc_mir_transform/src/coroutine/mod.rs` explicitly identifies `StateTransform` as the pass that turns a coroutine MIR body into state machines. Its file-level contract says it computes a structure with state and MIR locals live across suspension, moves those locals to the coroutine structure, updates references, and emits poll/resume plus drop-shim control paths. It imports `compute_layout` and `locals_live_across_suspend_points` from its internal `layout` module; its own `TransformInfo` carries per-suspension storage liveness and a local-to-(type,variant,field) remap.
2. The same source binds layout to state, suspension, storage-liveness and drop semantics: states include unresumed, returned and poisoned; the drop shim dispatches by state. `drop.rs` additionally constructs clean/async drop paths and follows `Yield` drop targets.
3. `by_move_body.rs` constructs an additional body for coroutine-closures and changes capture mode/body mapping where appropriate. It is a current same-family action but not evidence of a selectable saved-local placement algorithm for an ordinary fixed async crate.
4. The official MIR dataflow guide says rustc uses dataflow to identify variables live across generator yield statements and Places borrowed at CFG points. The official coroutine-closure guide describes the ownership/capture distinctions that constrain closure-coroutine representations.

## Bounded negative/unknown findings

- The frozen deterministic selection permits three coroutine blobs in priority order. It exposed `mod.rs`, `by_move_body.rs` and `drop.rs`; `lower.rs` and `state.rs` were absent from the listed directory. The imported `layout.rs` exists but is not one of the contract-authorized three downloads. This is a bounded acquisition boundary, not evidence that any action is absent.
- The permitted `rustc_middle/src/mir` listing contained no direct entry whose name included `coroutine` or `generator`; the contract forbids recursive expansion or a substitute route. This is path-drift telemetry only.
- The selected in-tree UI test is a regression test for unsupported `async { yield ... }`. It is not a fixed natural carrier exposing two complete stock-legal state-layout plans.
- The acquired material therefore does not expose a complete configuration/action catalog for `compute_layout`, a carrier with two stock-legal layouts, or a finite proof that a proposed placement/variant action is outside the current transform. It also does not settle whether the candidate reduces to generic interference-graph coloring/packing.

## Full-cost and falsifier boundary

Any later deep review must retain compiler CPU/RSS/temp, future and binary bytes, allocation, transition/poll cost, transform overhead, and unchanged poll/output/drop behavior. A smallest valid falsifier is a fixed coroutine MIR carrier on which two complete stock-legal layouts have identical semantics and a declared full-cost comparison. If the full current `layout` action catalog already expresses the proposed joint construction, the route closes as current-union absorption.

## Audit outcome

`CURRENT_UNION_PARTIALLY_POSITIVE__ACTION_AND_TWO_PLAN_CLOSURE_INCOMPLETE`. The upstream evidence establishes a real current coroutine state/layout transform and its semantic coupling; it does not authorize an absence claim or a candidate-grade conclusion.
