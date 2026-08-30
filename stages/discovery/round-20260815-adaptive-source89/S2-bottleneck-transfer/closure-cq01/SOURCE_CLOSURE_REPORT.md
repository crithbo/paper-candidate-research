# Source-closure report — S2-89-CQ01

## Scope and disposition

- Assignment: `SOURCE-CLOSURE-SOURCE89-S2-CQ01-RUSTC-COROUTINE-LIVE-SET-STATE-LAYOUT-V1`
- Frozen object: one fixed async Rust crate and target compiled by stock rustc, preserving poll, output, drop, borrow-check, ownership, language semantics, profile, and full-cost endpoint.
- Disposition: `UNRESOLVED_BACKLOG__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`.
- Authority boundary: this is a Discovery prebrief source closure only.  It does not decide a candidate, clean brief, Q2 shape, PASS, STOP, or any stage state.

## Immutable pin and bounded acquisition

The first two official calls resolved `rust-lang/rust` default branch `main` to commit `68c677ac3f013d2e587f47e198c92e551716191e` (committer date 2026-08-14T22:53:58Z).  All four remaining calls used that exact SHA.

Six precommitted calls were consumed.  Repository metadata, commit metadata, and `compiler/rustc_mir_transform/src/coroutine/by_move_body.rs` were retrieved (108,802 response bytes in total).  The frozen paths for the coroutine transform, MIR coroutine representation, and state test each returned HTTP 404 at that SHA.  Those are path-drift telemetry only: no alternate route or search was used, and none is evidence of absence.

## What the retained source establishes

`by_move_body.rs` is a current stock transform for async coroutine closures.  It constructs a second coroutine body for `FnOnce`/`AsyncFnOnce` use, maps parent/child captures, can change field indices and capture form, preserves a source/body relationship, and remaps MIR places.  This is a material current-subtractor for any proposal that merely re-encodes closure capture remapping or emits a detached alternate coroutine body.

It does not, by itself, expose the required complete stock union for saved-local liveness, borrow interaction, state-layout selection, relevant options, or a stock-legal in-tree carrier with two complete state-layout plans.  The missing frozen loci prevent a bounded finding on whether a joint union-external rustc action and a finite exact/FPT/approximation/certified guarantee can be stated on the frozen object.

## Closure debt for a later authorized route

1. Re-freeze direct, official source loci that expose coroutine transform, MIR layout, and a carrier test at one immutable rustc commit; record any path migration explicitly.
2. On one fixed async crate and target, enumerate stock actions affecting saved locals, borrow/liveness and state layout, including their available option surface.
3. Produce two complete stock-legal plans with identical poll/output/drop/borrow/ownership semantics, then determine whether any action remains outside that union.
4. State a finite cost ledger (compile time/RSS, generated state bytes, transition/poll cost, and all transformation overhead) and a falsifier that rejects a proposed guarantee if the stock union expresses the action or either plan changes the frozen semantics.

No claim is made that the debt is impossible to close; the bounded route simply did not expose enough of it.
