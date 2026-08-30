# Wave 3 source / collision matrix

**Assignment:** `DISCOVERY-S4-20260809-V8.4-WAVE3`  
**Candidate:** `S4-SLO-PAGEPACK`

| Source | Exact object / objective | Mechanism | Relation to candidate | Required fair treatment |
|---|---|---|---|---|
| [HADES, DIMES 2025](https://research.cs.wisc.edu/adsl/Publications/dimes25-banakar.pdf) | Pointer-based objects in page-tiered unmanaged memory; reclaimability from hotness organization | Safe object migration between hot/cold heaps, decoupled from page backend | Closest precursor and object-layout baseline | Reproduce its layout/temperature organization before assigning any residual to joint packing. |
| [OBASE, OSDI 2026](https://www.usenix.org/conference/osdi26/technical-sessions) | Same object, updated/current system | Compiler-runtime instrumentation and lock-free relocation; enables existing page tiering backends | Current strongest object-layout baseline | Freeze page size, access epochs, object-mobility eligibility, backend, and all relocation/instrumentation costs. |
| [MDK, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/patel) | Data-center memory savings subject to SLO/performance | MPCs and an offline policy optimum | Constraint-side strong baseline, but it does not make object layout a decision variable | Apply MDK's target/policy with identical information to original and OBASE layouts. |
| `OBASE/HADES → MDK` same-information composition | Same candidate object and SLO | OBASE layout followed by MDK target/policy replay | Mandatory union baseline, not a candidate contribution and not a deployability claim | Count combined instrumentation, relocation, and backend costs.  If this composition absorbs the candidate, candidate stops. |
| [BRUMM, ECRTS 2026](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECRTS.2026.15) | Reclamation-latency budget in L4Re | Accounting quota that predicts/tracks mapping-reclamation latency | Methodological adjacent; different OS/object model | Do not compare throughput/memory values across systems.  Use only to establish that reclaim latency can be a formal constraint. |
| [CacheLib / CacheBench](https://github.com/facebook/CacheLib), [public cache corpus](https://github.com/cacheMon/cache_dataset) | Public cache workloads/traces | Upstream engine and trace records | Natural input/artifact route | Freeze trace slice, object-size interpretation, operation semantics, and any inferred mobility field. |

## Collision verdict

`DIRECT_FATAL: none found within the stated source boundary.`  This is not a claim of global novelty.  The candidate survives only as a narrow N2 hypothesis because the frozen union has not been shown to absorb its constrained-packing action; that comparison is its first killer.

