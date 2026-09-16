# Current reality

Official rustc documentation shows dataflow used for locals live across yields and borrowed places; coroutine/async representation carries borrow and capture semantics. The fair comparator includes all stock coroutine lowering, MIR liveness and borrow checking, layout transforms and backend code generation with the same crate/target facts. Ordinary async rewrites, flags, allocator choices and generic layout packing are excluded.

The current rust-lang/rust branch is not immutable-pinned here. No source-absence, direct-collision absence or residual claim is made. `PARTIALLY_FROZEN_UNION__SOURCE_CLOSURE_REQUIRED`.
