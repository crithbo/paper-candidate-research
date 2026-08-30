# Current upstream audit — Wasmtime threads

| Surface | Pinned evidence | Effect on frozen closure |
|---|---|---|
| Default/nondefault configuration | `crates/wasmtime/src/config.rs:984-1006`: `wasm_threads(bool)` is gated by the crate `threads` feature, whose source documentation says it is enabled by default. | Threads can be enabled/disabled; this is feature exposure, not an alternate waiter layout. |
| Wasm dispatch | `crates/wasmtime/src/runtime/vm/libcalls.rs:624-673` | Atomic wait32/wait64/notify are feature-gated runtime libcalls to the defined-memory object. |
| Address/timeout waiter contract | `crates/wasmtime/src/runtime/vm/memory/shared_memory.rs:125-210` | Address and alignment are validated; TLS waiter metadata then enters the parking spot. |
| Native representation | `crates/wasmtime/src/runtime/vm/parking_spot.rs:1-300` | Address-keyed `HashMap`, FIFO linked waiter list, mutex, and standard park/unpark. |
| Canonical carrier | `parking_spot.rs:313+` | In-tree `atomic_wait_notify`, timeout, and parking tests exercise the same implementation carrier. |
| Contrary/generic objection | `parking_spot.rs:1-3` | The source identifies itself as a simplified `parking_lot_core` implementation; the proposed layout change is a generic parking/scheduler-policy kernel. |

The tree response was complete (`truncated=false`) and used only to locate paths in the frozen project/scope. No repository-wide absence claim is made.
