# Official-source audit — S2-89-CQ01

| Sequence | Frozen official route | Pin / result | Permitted interpretation |
|---:|---|---|---|
| 1 | `api.github.com/repos/rust-lang/rust` | 200; default branch `main` | Version-rule input only. |
| 2 | `api.github.com/repos/rust-lang/rust/commits/main` | 200; `68c677ac3f013d2e587f47e198c92e551716191e` | Immutable pin for the remaining calls. |
| 3 | `compiler/rustc_mir_transform/src/coroutine.rs` | 404 | Frozen-path telemetry; not source absence. |
| 4 | `compiler/rustc_middle/src/mir/coroutine.rs` | 404 | Frozen-path telemetry; not source absence. |
| 5 | `compiler/rustc_mir_transform/src/coroutine/by_move_body.rs` | 200; SHA-256 `9f1fa5651e00f69df5cc89163d1ccb73d0066123d45106aec8df74cd37068477` | Current stock source; scoped subtractor only. |
| 6 | `tests/ui/coroutine/state.rs` | 404 | Frozen-path telemetry; not carrier absence. |

## Current-source observations

The retained source describes and implements a stock “by-move” body for async closures.  It detects closure captures, constructs field/projection remappings, creates a `SyntheticCoroutineBody`, changes the receiver type to the by-move coroutine type, and substitutes the transformed body for the original in the applicable `FnOnce`/`AsyncFnOnce` path.

This establishes that a future mechanism cannot claim novelty merely from making a second coroutine body, moving captures, remapping capture projections, or preserving such a transform beside the original body.  It does **not** establish the complete state-layout/liveness/borrow action union named in the assignment, because the three other fixed loci were unavailable and no substitution was authorized.

## Collision and generic-objection status

- Direct current collision: `SEARCH_BOUNDED_OPEN`.  The retrieved transform is a concrete subtractor but does not identify a complete same-object candidate action or guarantee.
- Generic layout/packing/register-allocation objection: unresolved.  The queue lacks a complete legal two-plan carrier and a frozen proposed action/guarantee to test against the objection.
- No paper search was authorized or performed; no absence conclusion is drawn.
