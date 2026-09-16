# Anchor

| Field | Value |
|---|---|
| Signature | `RUSTC__FIXED_ASYNC_CRATE__COROUTINE_LIVE_SET_STATE_LAYOUT_JOINT_CONSTRUCTOR__FUTURE_POLL_FULL_COST` |
| Official source | https://rustc-dev-guide.rust-lang.org/mir/dataflow.html |
| Same object/oracle | Fixed crate/target, stock Rust poll/output/drop and borrow-check acceptance |
| Stock union | Coroutine lowering, MIR dataflow/borrow checking, coroutine layout transformation, backend layout/codegen and relevant flags |
| Carrier | One version-pinned official rustc async/coroutine test selected after resolving one rust-lang/rust commit |
| Full cost | Compile CPU/RSS/temp, future/state bytes, allocation, poll latency/cache behavior and binary bytes |

Current material establishes liveness analysis, not absence of a joint constructor.
