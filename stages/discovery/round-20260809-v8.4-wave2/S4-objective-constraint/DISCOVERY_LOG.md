# S4 Objective / Constraint Shift — Wave 2 Discovery log

**Assignment:** `DISCOVERY-S4-20260809-V8.4-WAVE2`  
**Date cut-off:** 2026-08-09  
**Permitted method:** accepted and calibrated production Discovery `v2 / v8.1` only.  The TLS-blocked two-axis `v8.2r2` method was not used, relied on, or represented as production evidence.

## Scope

The wave sought a 2025–2026 algorithm, data-structure, database, or compiler lineage in which a capacity, tail-latency, compilation-time, or finite-resource objective changes the **action space**.  A retained candidate would need a distinct N1/N2/N3 route, fixed semantics, current fair same-object baselines, a natural public workload, full-cost accounting, and a finite CPU/solver Stage A killer.  `compressed TSDB` was intentionally excluded.

## Source record

| UTC date | Search family | Original / first-party source checked | Result |
|---|---|---|---|
| 2026-08-09 | JIT warmup, compilation-time, code-cache capacity | [Pečimúth et al., ECOOP 2025](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2025.25) | A current direct mechanism stores and reuses highly optimized IR, preserving peak performance while reducing compile time and warmup on four standard suites. |
| 2026-08-09 | binary code size, linking-time compilation budget | [Calibro, CGO 2025](https://2025.cgo.org/details/cgo-2025-papers/42/Calibro-Compilation-Assisted-Linking-Time-Binary-Code-Outlining-for-Code-Size-Reduct) | Direct production-app code-size mechanism: compilation-assisted link-time outlining, parallel suffix-tree construction, and hot-function filtering. |
| 2026-08-09 | far-memory local-capacity constraint, object/page placement | [Eden official project article](https://www.usenix.org/publications/loginonline/developer-friendly-approach-application-integrated-far-memory) | Current design space already includes object-aware AIFM, compiler guard insertion, and Eden's selectively hinted/hybrid guard path; the natural DataFrame and web examples are public but do not by themselves define a new action. |
| 2026-08-09 | low latency / high throughput oblivious data structures | [SONIC, USENIX Security 2026](https://www.usenix.org/conference/usenixsecurity26/presentation/talur) | The precise low-latency/high-throughput ORAM frontier is directly occupied by a current concurrent RingORAM mechanism; moreover the source was still embargoed at inspection. |
| 2026-08-09 | production block-storage tail latency | [Hu et al., NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/hu-chaolei) | Direct mechanisms are dual-bucket throttling and priority scheduling: controllers/schedulers, not an eligible S4 data-structure or algorithm residual. |

## Three-pass convergence

### Pass 1 — genealogy and decision-variable test

The concrete objective changes were genuine: JIT warmup under compilation cost, mobile binary footprint, local-memory capacity in far memory, and tail latency under storage/ORAM concurrency.  The action test failed for every plausible follow-on:

- JIT IR/cached-code **admission, eviction, or retention** is a cache policy/controller unless a new representation with a preserved semantic and cost contract is independently specified.
- Binary outlining at a stricter build or I-cache budget is already an existing code-size action; changing its hotness threshold, build budget, or outline selection is routine tuning/selection.
- Far-memory placement, prefetching, priority, and local-capacity allocation are existing placement/policy actions.  A new object representation was not identified.
- Storage throttling/scheduling is explicitly the prohibited controller form.
- ORAM concurrency is a direct current mechanism; no distinct same-security, same-TEE residual was specified.

### Pass 2 — current strongest mechanism and same-object collision

The matrix in `SOURCE_COLLISION_MATRIX.md` records the closest current mechanisms and the exact reason that each lead is not a frozen proposal.  In particular, a search-bounded absence of a new variant is **not** asserted as novelty: it is a reason to abstain rather than to promote.

### Pass 3 — artifacts, natural input, and executable killer audit

ECOOP's four industry-standard JVM suites, Calibro's production Android apps, and Eden's natural application examples show that public/evaluable material exists for parts of these families.  This is not an AI-readiness or temporary-resource rejection.  The failure is upstream: no distinct core action survives same-object comparison.  Running a Stage A probe before that would only compare an ordinary policy or parameterization against a stronger incumbent, so no probe is proposed.

## Outcome

`PROPOSE_STAGE0: none`

No topic brief exists because no candidate crossed the minimum `TIER_B_Q2_VIABLE` structural threshold.  The zero result is an evidence-honest production outcome, not a claim that the areas lack research value.

