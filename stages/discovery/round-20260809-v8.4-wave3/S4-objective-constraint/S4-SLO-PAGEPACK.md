# S4-SLO-PAGEPACK — SLO-constrained object page packing for memory reclamation

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O4_OBJECTIVE_OR_CONSTRAINT_SHIFT`
- Domain tags: `ALGORITHM_DATA_STRUCTURE`, `MEMORY_SYSTEM`, `RUNTIME_SYSTEM`, `NON_CUDA`
- Contribution route: `N2_NEW_ALGORITHM_OR_OPTIMIZATION`
- Discovery date: 2026-08-09
- Discovery method revision: `v2 / v8.1` (accepted and calibrated)

## Research question

For an unmanaged, pointer-based cache/data structure with observed object accesses in fixed epochs, can an **epoch-boundary object-to-page packing algorithm** reclaim more fast-tier memory than current object reorganization plus current SLO-aware reclamation policies, while preserving lookup/update semantics and meeting a fixed slowdown/SLO budget after charging all migration, indirection, page-fault, and background CPU costs?

The contribution is not a runtime admission, eviction, or priority controller.  It is a finite layout transformation: given an epoch's object sizes, access classes, object graph/mobility eligibility, and a reclamation target, construct a new page composition and a bounded set of pointer-safe migrations.  The page backend remains unchanged.

## Paper genealogy

- Anchor paper: Banakar et al., [*Tidying Up the Address Space* (DIMES 2025)](https://research.cs.wisc.edu/adsl/Publications/dimes25-banakar.pdf).  It introduces object-level hot/cold reorganization ahead of page-level reclamation.
- Current object-layout successor / closest paper: Banakar et al., [*OBASE* (OSDI 2026)](https://www.usenix.org/conference/osdi26/technical-sessions).  OBASE dynamically clusters hot and cold objects for existing page-tiering backends.
- Current constraint-side paper: Patel et al., [*MDK* (OSDI 2026)](https://www.usenix.org/conference/osdi26/presentation/patel).  MDK changes the objective from performance under fixed memory to maximal reclaimed memory subject to SLO preservation, supplies MPCs and an offline optimum for policies.
- Adjacent constraint work: Reusch et al., [*BRUMM* (ECRTS 2026)](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECRTS.2026.15).  It makes reclamation latency an explicitly budgeted resource for L4Re mappings; it does not pack application objects into pages.
- Artifact / natural workload: [Meta CacheLib and CacheBench](https://github.com/facebook/CacheLib) are public and support production-workload evaluation; the upstream [cacheMon trace corpus](https://github.com/cacheMon/cache_dataset) includes public MetaKV and Twitter KV traces.
- Search boundary: venue-hosted papers and upstream project/artifact sources queried through 2026-08-09. `SEARCH_BOUNDED_OPEN` below is not an originality conclusion.

## Topic-origin card

- Trigger: OBASE/HADES optimizes page hotness homogeneity; MDK optimizes reclaimed bytes under an SLO.  Neither source states an object-page packing objective that jointly charges migration and solves for the layout required by the SLO target.
- Measurable observation / quantitative anchor: HADES reports up to 70% memory reduction with 3–5% performance degradation on YCSB; OBASE reports 2–4× page-utilization improvement and up to 70% lower footprint across ten structures/backends; MDK provides MPCs and an offline policy optimum, and reports policies improving average memory savings up to 10%.
- Baseline limitation: HADES/OBASE classify and migrate by access temperature to make pages uniform, whereas MDK's policy model assumes a memory/reclamation choice but does not introduce object-level layout as a decision variable.  A temperature-only packing can consume migration budget on objects whose movement does not change the chosen SLO point.
- Structural cause: object sizes, access persistence, page slack, pointer-safe mobility, and migration cost couple the object layout to the page-level SLO frontier.
- Decision variable: per epoch, assign movable objects to page slots and select migrations, subject to page size, semantic reachability/pointer-safety, migration work, and the frozen SLO budget.  This is a layout algorithm, not a request-time controller.
- Candidate Q1 venue family: systems/data-management venues; current claim is deliberately Tier B pending novelty and natural-trace evidence.

## Historical method calibration

- Source-session backtest file: `stages/discovery/_method-backtests/O4_OBJECTIVE_CONSTRAINT_SHIFT/v2/backtest_review.md`
- Backtest status: `CALIBRATED`
- This field calibrates the discovery method and is not candidate evidence.

## Importance and group fit

The object/page semantic gap affects tiered-memory reclamation in unmanaged caches and indexes.  The candidate is CPU/solver-first: its decisive Stage A can be a trace-driven packing/replay experiment, without accelerator hardware.

## Exact object

`EPOCHAL_UNMANAGED_POINTER_BASED_OBJECT_HEAP_WITH_POINTER_SAFE_RELOCATION__4KIB_PAGE_TIERING_BACKEND__TRACE_DEFINED_GET_SET_SEMANTICS__FIXED_SLOWDOWN_OR_SLO_CAP`

Function and quality are fixed: identical key/value results, update visibility, object lifetime, and concurrent pointer validity; page backend and page size are unchanged.  A claim may only concern the fast-tier bytes reclaimed and the SLO/slowdown surface, never a different cache policy, altered hit semantics, or relaxed consistency.

## Named fair baselines

1. **Deployment/default:** stock page-level backend on the original layout (e.g., Linux reclamation / a documented page-tiering backend), with no object movement.
2. **Closest current object-layout baseline:** HADES/OBASE hot/cold reorganization with its published layout rule and the same backend.
3. **Closest current constraint baseline:** MDK-style SLO/MPC policy on the original layout, using the same epoch access information and performance cap.
4. **Required fair same-information union:** `OBASE/HADES layout → MDK SLO target/policy replay`.  This is an analytical Stage-A baseline, not claimed as a deployable product.  It is permitted only with the same object trace, epoch boundaries, page size, migration eligibility, backend, SLO definition, and complete layout/migration/indirection/page-fault CPU ledger as the candidate.  It must be implemented or emulated faithfully before any positive result is claimed.
5. **Offline ceiling:** an exact ILP/branch-and-bound page-packing solution on reduced epochs, with the same migration and SLO constraints.  It is a ceiling, not a deployment baseline.

## Mechanism hypothesis

`SLO-PAGEPACK` treats layout as a constrained packing problem.  A page is valuable only if moving its cold contents makes the entire page reclaimable **and** the achieved reclamation remains under the epoch SLO after accounting for movement and subsequent remote/page costs.  The algorithm uses access persistence rather than a single hot/cold label, packs high-persistence hot objects densely, and leaves low-persistence/cold objects in reclaimable pages; objects whose movement has insufficient predicted frontier benefit are left in place.

## Competing mechanisms

- Mechanism A — **persistence-bucket greedy packing:** place objects by benefit-per-migration-byte, respecting page slack and an epoch migration credit.  Prediction: wins when object sizes are heterogeneous but hotness is stable.
- Mechanism B — **migration-aware min-cost-flow / Lagrangian packing:** solve a relaxed assignment with SLO dual cost, then round while preserving page capacity.  Prediction: wins when target SLO is tight and naive hot/cold grouping over-migrates.
- Preferred mechanism and why: Mechanism B is the frozen N2 route because its decision variables simultaneously include page composition and migration cost.  It is not equivalent to choosing an OBASE threshold or an MDK policy.

## Mechanism signature

At fixed SLO and equal backend, gains must concentrate in pages whose cold-byte reclaimability becomes feasible only after *selective* movement, while total migration work remains below the candidate's declared credit.  A uniform-hotness layout, a pure MDK policy, or their fair union should fail to reproduce that page set under the same ledger.

## Seed-distance test

- What changes relative to OBASE/HADES: from temperature-driven dynamic organization to an explicit constrained packing problem with migration cost and an SLO frontier as first-class constraints.
- What changes relative to MDK: from selecting/evaluating reclamation policies on a given layout to optimizing the object-to-page layout that makes a particular SLO point attainable.
- Why this is not an application/backend rename: page size, backend, access trace, and semantics stay fixed; only the object-page assignment and its algorithm change.
- Result of method-name deletion test: “Given objects, pages, access epochs, relocation cost, and a slowdown cap, pack/move objects so the largest number of whole pages can be reclaimed” remains a specific optimization problem.

## Candidate paper claim

Under a fixed page-tiering backend and unchanged cache semantics, a migration-aware object-page packing algorithm can enlarge the SLO-feasible reclaimable-memory frontier beyond temperature-only object organization, SLO-aware page policy, and their same-information composition on natural cache traces.

## Evidence route

`PARETO_APPROXIMATION`, `PERFORMANCE`, `MEASUREMENT_MECHANISM`

## Software/algorithm performance admissibility

- Same-function contract: replayed GET/SET outcomes, object lifetime, pointer safety, and backend policy interface are identical.
- Algorithmic delta: constrained object-page packing with explicit migration/SLO costs; not a hotness threshold, cache priority, or selector.
- Full-cost ledger scope: object-copy bytes, pointer indirection and validation work, heap/page metadata, runtime instrumentation, migration CPU/latency, TLB/huge-page effects, backend/page-fault I/O, and any warm-up/repacking interval.
- Generality hypothesis: heterogeneous-size, temporally persistent hot objects create a residual; uniform object size, rapidly drifting heat, or migration cost dominating benefit are expected no-gain regions.
- Why this is not routine tuning: it changes the combinatorial layout/migration action set and can be compared to an exact ceiling on reduced traces.
- Expected no-gain region: pages already homogeneous; extremely short heat half-life; no pointer-safe movable-object set; or SLO cap below the unavoidable migration cost.

## Nearest-prior facet matrix

| Facet | Candidate | OBASE/HADES | MDK |
|---|---|---|---|
| Research problem | Maximize reclaimable bytes at fixed SLO after layout change | Remove hotness fragmentation | Maximize memory savings at fixed performance/SLO |
| Exact object | Object-to-page layout plus migrations | Object hot/cold organization | Reclamation policy on a layout |
| Decision variables | Page slot assignment and migration set | Object temperature grouping/migration | Policy/reclamation amount |
| Constraints / information | Page capacity, SLO, migration ledger, same epoch data | Access intensity and pointer-safe relocation | SLO/performance curve |
| Core algorithm | Migration-aware constrained packing | Runtime temperature organization | MPC/policy evaluation and offline policy optimum |
| Guarantee | To be established: feasible-layout/frontier bound or approximation | Safe lock-free relocation | Offline policy bound/MPC |
| Evidence object | Public cache traces + CacheLib replay | YCSB, structures, production traces | Data-center policy evaluation |

## Current collision classification

- DIRECT_FATAL: none found within the stated cut-off and sources.  No global-first claim is made.
- DIRECT_SUBTRACT: OBASE/HADES covers generic hot/cold migration; MDK covers policy/SLO evaluation.  These are removed from the candidate claim.
- METHODOLOGICAL_ADJACENT: BRUMM budgets reclamation latency but operates on L4Re user-space mappings, not object-to-page packing in unmanaged application heaps.
- DEPLOYMENT_BASELINE: page-level Linux/tiering backends and CacheLib.
- SEARCH_BOUNDED_OPEN: no source found that jointly optimizes object-page assignment and migration budget against an MDK-style SLO frontier; this is a bounded search statement only.

## Decisive falsifier

On at least three distinct natural-cache trace epochs and a fixed SLO cap, if the exact reduced-epoch solver shows that the candidate's feasible packing has **no strict reclaimed-byte residual** over the faithful `OBASE/HADES → MDK` same-information union after all migration, instrumentation, and backend costs, stop.  Also stop if any claimed residual disappears when equal pointer-safety or replay semantics are enforced.

## Executable evidence path

### 72-hour first evidence

Build a trace-level CPU solver/replayer only: (1) use public CacheLib/CacheBench-compatible object-size/access records plus public cache traces; (2) create reduced fixed epochs with 4 KiB pages and explicit object-mobility flags; (3) enumerate/ILP solve the joint packing; (4) replay the four named baselines under the identical ledger.  Output only feasibility, residual, and no-gain-region tables—no paper-performance claim.

### AI core fraction and critical path

`AI_CORE_EXECUTABLE` (estimated 0.75): trace normalization, solver, cost ledger, and baseline replay are auditable CPU work.  A later production C++ concurrency integration would require independent review and is not presumed complete here.

### Semantics-preserving open alternatives

CacheLib/CacheBench and public cache traces provide the first route.  If trace object-mobility cannot be reconstructed faithfully, retain only a trace-level claim ceiling and do not substitute a different application object model.

## Q1/Q2 sufficiency hypothesis

- Why this supports at least a complete Q2 paper: it has a concrete algorithmic object, two current high-quality anchors, a fair union baseline, a natural public trace route, an exact small-instance ceiling, a full-cost contract, and a falsifiable causal signature.
- Why it remains Tier B: novelty against OBASE's detailed implementation and natural replay fidelity must be independently audited; the current evidence is design-stage only.
- What would still be required at Stage B: production-compatible implementation, updated collision audit, multiple public trace families, concurrent correctness validation, and complete cost/scalability results.
- Preliminary contribution-shape analogs: OBASE (OSDI 2026), MDK (OSDI 2026), and BRUMM (ECRTS 2026).  These calibrate shape only and are not novelty proof.

## Non-relaxable quality audit

- Same-object: frozen unmanaged pointer-object heap / page-tiering semantics; no cross-object comparison permitted.
- Latest collision: checked through 2026-08-09 against original/official sources; requires recheck at Stage 0 and Stage B.
- Strong fair baselines: explicit original-layout, OBASE/HADES, MDK, and same-information union; exact ceiling for reduced epochs.
- Natural input/evidence: public CacheLib and public MetaKV/Twitter cache traces; Stage A must report any schema/mobility limitation.
- Full-cost: migration, pointer protection, tracing, page/backend, and hardware-translation costs are mandatory.
- Reproducibility: fixed epochs, trace hashes, solver version, cost parameters, and baseline configurations must be frozen before Stage A.
- Evidence/claim honesty: this is a structural-potential recommendation only; no residual or performance result is asserted.

## Dual-axis score

- Academic value: `49/70`
- AI executability bonus: `22/30`
- Total: `71/100`

## AI and researcher boundary

Current structural paper potential: `TIER_B_Q2_VIABLE`.  Current evidence readiness: `DISCOVERY_ONLY__FINITE_CPU_SOLVER_ROUTE`.  The latter is not a negative academic decision.  Independent Stage 0 must decide whether the exact OBASE+MDK union can be faithfully instantiated and whether the residual is sufficient.

