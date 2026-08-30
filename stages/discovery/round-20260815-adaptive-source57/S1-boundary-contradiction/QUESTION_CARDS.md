# Question card QC01

| Field | Current value |
|---|---|
| exact identity | WebAssembly Threads Draft 2023-10-10 wait/notify semantics + Wasmtime current runtime |
| same-object problem | preserve return/status, atomic behavior, timeout/wake behavior, and specified queue semantics while changing native wait-queue representation |
| carrier kind | implementation carrier; a concrete public thread workload has not been frozen |
| claim endpoint | target-runtime queue action/full-cost result |
| counterfactual | a representation can only matter if at least two legal queue layouts yield different cost while preserving the specified observable behavior |
| non-generic discriminator | must be defined by Wasm location/notify semantics, not host scheduler policy or generic lock tuning |
| current-source locus | unpinned within current Wasmtime; only repository identity is frozen |
| minimum falsifier | current source maps all legal semantics to a fixed queue key/layout, or a proposed layout changes wake/timeout behavior |
| full-cost initial boundary | runtime CPU/RSS, wake latency, queue metadata, host syscalls/parking, and tail behavior under a public concurrent carrier |
| finite route | inspect exact current Wasmtime source path for atomic wait/notify dispatch and its immediate native waiter implementation, then freeze one thread-spec test carrier and a two-layout legality witness |

RAW_REQUIRED audit: **INCOMPLETE**. The missing bundle is named and bounded; it is not evidence that an opportunity exists or fails.
Disposition: `SOURCE_CLOSURE_QUEUE`.
