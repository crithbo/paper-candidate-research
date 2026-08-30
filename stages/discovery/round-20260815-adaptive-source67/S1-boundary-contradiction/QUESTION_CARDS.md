# S67-QC01 — Zicboz store-semantics seam

- Exact identity: ratified RISC-V CMO/Zicboz spec plus current compiler support/lowering records.
- Carrier: `IMPLEMENTATION_CARRIER_ONLY`; natural CPU initialization workloads would matter only after raw admission.
- Identity: `NO_MATCH__NO_NOVELTY_INFERENCE`; network-security exclusion PASS.

## Contract and decisive result

`CBO.ZERO` writes a cache block but the ISA does not constrain byte-write order, granularity or atomicity; access/translation failures follow a store-like contract. Thus its same-object use is restricted to source/IR operations whose observable store, fault, ordering and atomicity contract permits that form. GCC already has a dedicated `memset`-zero expansion. With the source contract fixed, full blocks use the native lowering and the prefix/suffix are ordinary residual stores; choosing their threshold/layout is tuning/standard block lowering. Extending the form to operations with incompatible observation changes the semantic guarantee.

- Full-cost boundary considered: code bytes, compile CPU/RSS, CBO/store count, static uops, memory traffic, latency and fault/ordering correctness.
- Minimum falsifier: two equal-semantic zero spans differing only in full-block cut point and scalar prefix/suffix selection.
- Result: `EARLY_FATAL__CURRENT_LOWERING_OR_CHANGED_STORE_SEMANTICS`.
- No implementation/resource/result negative inference. Front-end disposition `EXCLUDED_BEFORE_RAW`; C0 NO.
