# S64-QC01 — gfortran asynchronous-I/O completion seam

- Identity: GNU Fortran current async-I/O documentation; Fortran `ASYNCHRONOUS='YES'` I/O and `WAIT` on a POSIX-thread-capable target.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`. A natural scientific/HPC Fortran I/O workload would be required only if the raw gate survived.
- Network-security: `PASS`.
- Identity preflight: all five fields `NONE` against current plan/registry; `NO_MATCH__NO_NOVELTY_INFERENCE`.

## Contract

- Same-object guarantee: identical records/results/error outcomes, `WAIT` completion point and data-access restrictions; no altered storage, API or guarantee.
- Claimed endpoint considered: a gfortran-specific whole-operation cost/correctness guarantee under the same semantics.
- Initial full-cost boundary: runtime CPU/RSS, worker/queue overhead, I/O latency and throughput, `WAIT` latency, bytes copied and OS I/O cost.
- Current source locus: GNU Fortran documents async availability through POSIX threads and explicit synchronous fallback; the GCC source-history record names `libgfortran/io/async.c`, `async_wait` and per-unit state.

## Cheapest decisive test and result

Fix two legal operations with the same unit/record/`WAIT` semantics. Any proposed difference that only changes which ready operation a worker executes, or when the waiting thread is released, leaves the same action vocabulary and is a generic asynchronous-I/O queue/worker policy. Neither source fixes a gfortran-specific residual state, information restriction or new guarantee that could distinguish a complete N2 construction.

- Minimum falsifier: a two-request trace whose construction changes only queue order or worker timing while preserving the same `WAIT` outputs.
- Structural result: `EARLY_FATAL__GENERIC_ASYNC_IO_SCHEDULING_SHELL`.
- Not a resource/result inference: no implementation, hardware, workload or positive result was required to observe this collapse.
- Closure debt: none transferred; raw admission fails before further union/collision/corpus closure becomes decision-relevant.
- Disposition: `EXCLUDED_BEFORE_RAW`; eligible for C0 `NO`.
