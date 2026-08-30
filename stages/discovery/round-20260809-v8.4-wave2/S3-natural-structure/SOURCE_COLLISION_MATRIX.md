# S3 wave2 source/collision matrix

> Screening records, not candidate briefs.  `DIRECT_FATAL` is used only where a current source covers the frozen natural carrier, essential decision variable, same-function outcome, and relevant cost boundary.

| Scout (not a candidate) | Natural workload structure | Nontrivial action considered | First-party/current source | Same-object and full-cost comparison | Disposition / finite Stage A killer |
|---|---|---|---|---|---|
| Topology-correlated disk-page reuse in graph traversals | Real graph queries expand local neighborhoods; topology-aware serialization turns page spatial locality into later temporal page reuse | Retain pages using serialized-neighborhood affinity rather than generic recency/frequency | [LAC, PVLDB 2025](https://www.vldb.org/pvldb/vol18/p2859-korkmaz.pdf) | LAC uses the same graph-serialization information for replacement decisions, compares against GCLOCK, evaluates graph/query variation and cache sizes, and reports simulation plus Neo4j integration cost. | `DIRECT_FATAL`; **killer met:** the proposed retention decision is LAC’s core action, not a new N3 mechanism. |
| Temporal-semantic locality in vector-search queries | Nearby but nonidentical queries in a working-set window often share neighbors | Region-specific similarity thresholds and small search structures to answer a query before ANN backend execution | [QVCache](https://arxiv.org/abs/2602.02057) | QVCache learns region-dependent thresholds online, controls recall–hit-rate tradeoff, accounts for mini-index search/eviction cost, and compares multiple ANN backends. | `DIRECT_FATAL`; **killer met:** same semantic-query reuse and same quality/cost contract already exist. |
| Recurrent parametric SQL-template regions under changing plan caches | Parameterized workloads form recurring template/parameter regions while the eligible plan set changes | Select plan from a dynamically changing cache using both parameters and plan representations | [APQO, PACMMOD 2025](https://doi.org/10.1145/3769761) | APQO’s exact object is adaptive parameter query optimization under dynamic plan caches; its model takes both parameters and plans to avoid suboptimal reuse outside a static plan set. | `DIRECT_FATAL`; **killer met:** changing-cache plan selection is already the principal decision variable. |
| Call-site-specific runtime invariant values in production profiles | Real applications repeatedly supply invariant values at individual call sites despite lack of static proof | Profile values, choose a bounded set of specializations, and generate variants under a code-size/benefit cost model | [RIFS, CC 2026](https://www.sigplan.org/OpenTOC/cc26.html) | RIFS identifies runtime-invariant arguments, builds specialized variants, selects candidates with a predictive cost model, and compares against LLVM `-O3+PGO` on 11 applications. | `DIRECT_FATAL`; **killer met:** profile-stable-value exploitation, selection cost, and same-function specialization are already occupied. |

## Integrity notes

- A publication/implementation gap was not inferred from a missing source.  All four entries have adequate primary or official evidence to make a scientific collision finding.
- No generic union baseline was assembled.  Each collision is a finite, named, same-object system or paper.
- No scout was rejected for GPU access, unavailable private traces, low AI readiness, or a TLS/download problem; `BLOCKED_USER_ACTION_REQUIRED` is therefore inapplicable.
- Wave1’s Cholesky, sparse-attention, and SDDMM lines are outside wave2 scope and were not repackaged.

