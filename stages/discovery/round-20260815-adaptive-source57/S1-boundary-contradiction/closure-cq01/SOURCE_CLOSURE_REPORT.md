# CQ01 Wasmtime Threads source closure

## Disposition

`STRUCTURAL_FATAL__DIRECT_CURRENT_UNION_OR_GENERIC_POLICY__RETURN_TO_MAINLINE`

This is a Discovery prebrief source-closure disposition only. It does not decide raw admission, a brief, tier, paper potential, Stage 0, or any later state.

## Frozen boundary

- Exact project/pin: official `bytecodealliance/wasmtime` `main` resolved before source inspection to `bc2f967927f9f0e839095a752bf554c4a09fdd13`.
- Preserved object: fixed WebAssembly Threads atomic wait/notify contract, Wasmtime's immediate native wait implementation, and existing return/status, atomic, timeout/wake, and queue-order semantics.
- Acquisition: six bounded, localised official requests; 2,528,578 persisted response-body bytes, below 16 MiB. No build, test execution, candidate implementation, or claim-bearing observation occurred.

## Pinned current union

1. `Config::wasm_threads(bool)` is available only with the `threads` crate feature; its source states that the feature defaults enabled. It gates shared memories and atomic instructions.
2. Under that feature, runtime libcalls dispatch `memory.atomic.notify`, `memory.atomic.wait32`, and `memory.atomic.wait64` to a defined memory using `memory_index`, `addr_index`, expected value, count, and timeout.
3. `shared_memory.rs` validates the atomic address/alignment, uses a thread-local `Waiter`, and forwards the same pointer/address to a `ParkingSpot` for notify or wait.
4. `parking_spot.rs` implements the sole reached native representation: a mutex-protected map keyed by the native address to a FIFO doubly linked `Spot`; wait checks mismatch, enqueues then `std::thread::park[_timeout]`, and notify pops FIFO heads and calls `unpark` up to the requested count.

## Structural closure

The implementation calls this parking mechanism a simplified `parking_lot_core` design. Within the frozen Wasm contract, the decisive representation choices visible here—address-keyed lookup, ordinary FIFO waiter list, parking/unparking, and generic map/list contention behavior—are generic scheduler/parking-policy actions. No source-defined second native layout is reachable for the same Wasm wait/notify semantics, nor does the frozen path expose a Wasm-location-specific representation action beyond the required address key and FIFO wake contract.

Therefore, a purported change in queue bucket/map/list layout would be a generic state-management or scheduler-policy variation rather than the required Wasm-specific action. It cannot satisfy the Question Card's non-generic discriminator without changing the frozen semantics, runtime object, or guarantee. This is the assignment's generic-policy structural branch, not an inference from a failed search or absent tool.

## Carrier, witness, and cost/oracle assessment

| Required output | Closure result |
|---|---|
| Fixed carrier | The pinned `parking_spot.rs` unit module contains `atomic_wait_notify` and timeout/parking tests; this is a canonical implementation carrier. |
| Native legal two-layout witness | Not available under the current source action catalog: only one address-keyed FIFO representation is reached. A synthetic alternate layout would be outside current native actions and would amount to generic policy. |
| Cost estimand | The frozen full-cost dimensions remain runtime CPU/RSS, wake latency, queue metadata, host parking/syscalls, and tail behavior. They cannot restore a target-specific action after generic-policy collapse. |
| Finite semantic oracle | `wait32/wait64` mismatch/ok/timed-out results, address validation, FIFO pop order, and bounded notify count are source-defined semantic checks; a layout that changes them fails the same-contract predicate. |

No Source58 material was read. No transport, 404, zero match, or missing tool is used as evidence.
