# Source-closure report — S2-92-CQ01

## Scope and disposition

- Assignment: `SOURCE-CLOSURE-SOURCE92-S2-CQ01-RUBY-YJIT-CODE-BLOCK-SIDE-EXIT-V1`
- Frozen object: one fixed Ruby program and input executed by stock YJIT with unchanged Ruby, exception, code-cache, side-exit, deoptimization and output semantics, and the same full-cost endpoint.
- Disposition: `UNRESOLVED_BACKLOG__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`.
- Authority boundary: this is a Discovery prebrief source closure only. It does not decide a candidate, clean brief, Q2 shape, PASS, STOP, or stage state.

## Immutable pin and bounded acquisition

Official `ruby/ruby` default branch `master` was pinned to `d17a0d008310e36d1e16f9614c7ca01fe38cf3d6` (committer date 2026-08-15T02:48:52Z). All four source and carrier calls used that exact SHA. Six precommitted official calls completed successfully; their persisted response total is 675,663 bytes, below the 16 MiB cap.

## Bounded current-union findings

The retained source exposes a concrete stock YJIT action surface.

- `codegen.rs` distinguishes inline and outlined code blocks, generates deferred-compilation stubs, creates outlined exits, queues outgoing branches and records codegen failure/invalidation paths.
- `core.rs` provides typed JIT context and enumerated branch shapes/generators, including context-sensitive target and branch actions.
- `asm/mod.rs` defines the code-block page model, inline/outlined placement, writable ranges, capacity checks, page movement and code-GC reuse of non-on-stack pages.
- `test_yjit.rb` is an in-tree carrier for YJIT enablement, compilation and side-exit assertions.

This establishes strong stock subtractors for local code-block placement, side-exit/stub emission, branch-shape choices, page movement and code-GC reuse. The queue does not, however, freeze two complete same-program legal code-block-plus-side-exit plans with a candidate-specific action difference, nor a union-external YJIT action and finite guarantee. Those items cannot be inferred merely from the rich stock action surface.

## Bounded collision and generic objection

Any route that only retunes code-block page placement, outlined stubs, branch shapes, capacity checks, code-GC reuse, or existing side-exit metadata is inside the visible subtractor boundary. Whether a joint action outside that union exists remains unresolved because the candidate action, information boundary, two-plan witness and guarantee are not frozen. This is neither an absence claim nor a structural-fatal conclusion.

## Closure debt for a later authorized route

1. Freeze a single YJIT-specific joint action over one fixed Ruby program and input, retaining exact exception, side-exit/deoptimization and output semantics.
2. Provide two complete code-block and side-exit plans and show their action divergence cannot be expressed through current page/stub/branch/code-GC actions.
3. State a finite exact/FPT/approximation/certified guarantee and full cost ledger: code bytes, code-GC/recovery overhead, metadata, compile time/RSS, side-exit/deopt cost and runtime.
4. Use the retained test carrier as one possible semantic oracle, with a falsifier rejecting the route when the action is current-union expressible or either plan changes frozen Ruby semantics.
