# RQ candidate RQ01

- Exact anchor and date: WebAssembly Threads Draft 2023-10-10, observed 2026-08-15.
- Stable same-object guarantee: shared linear-memory wait/notify behavior including atomic compare-before-wait, timeout/wake result, and the specified per-location queue semantics.
- Primary RQ: For a fixed WebAssembly threads module and observable wait/notify result, can a Wasmtime-specific wait-queue representation/partitioning algorithm change queue placement while preserving the same queue and wake contract with a nontrivial full-cost guarantee?
- Candidate contribution type: SYSTEM_ARCHITECTURE / N2, conditional only.
- Co-defined bundle: native wait-queue action, exact runtime carrier, and cost estimand.
- FINER-lite: answerable conditionally by one exact source subtree; relevance conditional; novelty threat unknown; scope pass; no quality conclusion.
- Pre-RQ closure: ordinary only; no selective nomination.
- Disposition: `RQ_READY_FOR_ORDINARY_CLOSURE`.
