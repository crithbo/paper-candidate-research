# S4 Objective / Constraint Shift — Wave 3 Discovery log

**Assignment:** `DISCOVERY-S4-20260809-V8.4-WAVE3`  
**Cut-off:** 2026-08-09  
**Method:** accepted production Discovery `v2 / v8.1`; the TLS-blocked two-axis `v8.2r2` method was not used.

## Search strategy

This wave required a tension between two or more 2025–2026 works on the same object.  A lead was retained only if a joint action remained after the strongest same-information union and if that action was not a meta-selector/controller.

| Search family | First-party sources retained | Outcome |
|---|---|---|
| Object-level/page-level memory tiering and memory reclamation SLOs | HADES (DIMES 2025), OBASE (OSDI 2026), MDK (OSDI 2026), BRUMM (ECRTS 2026), CacheLib/cacheMon | One narrow candidate: object-page packing with an explicit migration/SLO ledger. |
| Columnar storage compression versus row skipping | [Functional decomposition of storage formats (CIDR 2025)](https://www.vldb.org/cidrdb/2025/towards-functional-decomposition-of-storage-formats.html) | Dropped: the key structural action—decoupling storage and search-acceleration layers—is already the source's central mechanism; no new joint action was specified. |
| KV offload / scheduling and userspace-runtime tail latency | OSDI 2026 technical-session papers | Dropped: the remaining mechanisms were cache managers, request schedulers, or controllers, which are prohibited in this lane. |

## Three passes

1. **Genealogy:** HADES/OBASE show that object layout can make existing page backends effective; MDK shows that the objective flips to memory reclaimed subject to performance.  The gap is a layout action under the latter constraint, not a policy merger.
2. **Competing mechanisms:** OBASE, MDK, and their same-information composition are all frozen.  The candidate's action is only page-slot assignment plus a bounded migration set.  It does not select among policy outputs per request.
3. **Artifact / killer:** CacheLib/CacheBench and public cache traces allow a CPU trace/solver Stage A.  The exact reduced-epoch packing solution is an immediate falsifier, avoiding a full runtime implementation before the residual is known.

## Boundaries

- No experiment was run and no result is claimed.
- Current evidence readiness is `DISCOVERY_ONLY__FINITE_CPU_SOLVER_ROUTE`; structural potential is separately `TIER_B_Q2_VIABLE`.
- The trace corpus is an artifact route, not proof that all object-mobility metadata can be reconstructed.  Failure to reconstruct the same object model would lower the evidence ceiling rather than justify a cross-object substitute.

