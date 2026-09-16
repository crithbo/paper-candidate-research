# Question cards

## QC-S74-01 — libstdc++ barrier

| Required field | Frozen value / disposition |
|---|---|
| Exact identity | C++20 libstdc++ `std::barrier`, current `__tree_barrier` source |
| Carrier | implementation carrier; public C++ barrier workloads only after mechanism survival |
| Same-object problem | phase completion with dynamic expected-count decrement from `arrive_and_drop` |
| Endpoint | same completion/happens-before/membership semantics with non-worse CPU/RSS/latency/cache/wake cost |
| Current locus | `_M_arrive`, tree rounds/cache-line ticket layout, completion/reset and expected adjustment |
| Minimum falsifier | candidate is fanout, tree layout, arrival numbering, pool/scheduler control, or alters completion/drop semantics |
| Full cost | arrival CPU, cache traffic, phase latency, wake work, memory; not measured |

**Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_BARRIER_ALGORITHM_OR_CHANGED_GUARANTEE`.** Current libstdc++ already implements a cache-aware classic tree barrier and explicitly integrates phase adjustment/completion. Under the C++20 phase endpoint, alternatives reduce to generic tree/fanout/layout/scheduling choices. Altering the phase completion or drop timing changes the fixed guarantee. No target-specific N1/N2 action remains.
