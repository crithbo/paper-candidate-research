# Stage 0 PRIMARY report — O4-DYNCACHE-PGM

**Decision:** `REVISE_ONCE` — **AWAITING_CONFIRMATION**  
**Confidence:** 0.84 | **Route:** N1 + N2 | **Score:** academic 55/70 + AI 20/30 = **75/100**

## Frozen object and main claim

The object is a single-machine one-dimensional in-memory ordered index over fixed-width `(Hilbert-cell, OSM-element-id)` keys, with exact predecessor and output-sensitive closed-range semantics. PDEC chooses fixed pages, local epsilon-cover certificates, version visibility and rebuild credits under fixed epsilon, page size, and auxiliary-space cap. The claim is a cache/page-local, bounded-update-work Pareto residual—not “the first dynamic learned index.”

## Independent correction, collision, and finite baselines

The ESA 2025 paper is the closest theoretical subtractor: it gives a dynamic learned index with worst-case `O(log^2 n)` updates and records cache penalties. Its official Dagstuhl record also lists **DynamicLearnedIndex** and **LearnedIndexBench** artifacts. Therefore Discovery's `ESA code NOT_FOUND` statement is false and cannot be used to lower the baseline. This correction does not establish `DIRECT_FATAL`: the current sources did not demonstrate the same page-local certificate + bounded dual-version peak-space mechanism and result boundary.

Fair named baselines are (1) logarithmic PGM, (2) the executable ESA 2025 implementation/benchmark, (3) `tlx::btree`, and (4) ALEX; HIRE remains a paper-level current subtractor until its executable version is verified. Static PGM is a fixed-epoch ceiling only. OSM replication is natural chronological input but needs a second independent stream before any general claim.

## Facets, mechanisms, and natural headroom

| Facet | Candidate | ESA 2025 / fair baseline | Residual to prove |
|---|---|---|---|
| representation | page-local epsilon-cover | dynamic convex hull | locality state is not cosmetic |
| update | local certificate + credit rebuild | worst-case hull update | page-touch cap and peak space |
| semantics | exact predecessor/range | same core semantics | no weakened range path |
| evidence | OSM + second stream | learned-index benchmarks | cache and update Pareto |

Natural headroom is a published negative observation (ESA cache penalty) plus a public OSM stream; it is not a measured PDEC result. Mechanism A (page-local feasibility certificate) and B (dual-version credit rebuilding) each have a distinct falsifier. They cannot be combined as a universal selector.

## Killer, Q1 shape, AI

Within 72 hours, run only the authorized low-cost proof/provenance closure: verify page-touch and alternating update peak-space invariants; lock and use the ESA artifact; replay a fixed OSM interval plus one independent stream against PGM/ESA/B+tree/ALEX with the same oracle. If the invariant fails or a named baseline dominates the full `(p99 update, range p99, cache/TLB, bytes/key)` ledger, stop.

| Calibrator | Shape | Relevance |
|---|---|---|
| [PGM-index, PVLDB 2020](https://pgm.di.unipi.it/) | theory plus systems learned index | continuous baseline |
| [ALEX, SIGMOD 2020](https://github.com/microsoft/ALEX) | dynamic practical learned index | strong deployment baseline |
| [ESA 2025](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64) | worst-case dynamic learned-index theorem | closest research comparator |

Q1 shape is `PARITY_CONDITIONAL`: a non-amortized proof plus reproducible real-stream cache result could be comparable. AI core fraction is **0.65**, conditional on human proof audit.

## Atomic revision gate

`ESA_ARTIFACT_PARITY_AND_PDEC_TWO_INVARIANTS`: correct baseline provenance by pinning/reproducing the ESA artifact; prove/constructively check both page-touch and bounded dual-version-space invariants; quantify the same semantic ledger on two natural streams. No stage is authorized until confirmation.
