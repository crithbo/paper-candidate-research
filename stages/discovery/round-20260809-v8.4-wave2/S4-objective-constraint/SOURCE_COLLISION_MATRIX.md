# Wave 2 source / collision matrix

**Assignment:** `DISCOVERY-S4-20260809-V8.4-WAVE2`  
**Result:** `ZERO_PROPOSALS_AFTER_THREE_PASS_CONVERGENCE`

| Exact object / objective-change lead | First-party source | Current competing mechanism | Collision or eligibility result | Decision |
|---|---|---|---|---|
| GraalVM dynamic-compilation IR reuse under warmup / compilation-time cost | [ECOOP 2025 paper](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ECOOP.2025.25) | Trace compiler-interface calls; validate specializations on replay; cache highly optimized IR on a compilation server. | The natural follow-on “retain the right IR subject to a finite cache budget” has only an admission/eviction policy as its decision variable.  No new IR representation, fixed quality contract, or non-policy algorithm was identified. | `DROP__PROHIBITED_CACHE_CONTROLLER_FORM` |
| Android AOT binary outlining under scarce storage / memory | [CGO 2025 Calibro](https://2025.cgo.org/details/cgo-2025-papers/42/Calibro-Compilation-Assisted-Linking-Time-Binary-Code-Outlining-for-Code-Size-Reduct) | Compilation-time and linking-time outlining, parallel suffix tree, hot-function filter; reports production-app results. | A proposal to vary outline selection for a code-size/compile-time/tail objective merely retunes selection over the direct incumbent action.  It has no distinct N1/N2/N3 residual. | `DIRECT_SUBTRACT_TO_ZERO__ROUTINE_SELECTION` |
| Application data placement under bounded local far-memory capacity | [Eden official article](https://www.usenix.org/publications/loginonline/developer-friendly-approach-application-integrated-far-memory) | Object-granular AIFM, compiler-inserted guards (TrackFM/Mira), and Eden's selectively hinted hybrid guard approach. | “Prefer hot objects / prefetch scan objects / alter eviction priority” is placement policy.  A same-semantics new representation that changes the attainable page/object granularity frontier was not frozen. | `DROP__NO_DISTINCT_OBJECT_OR_ACTION` |
| Concurrent enclave ORAM / OMAP under low-tail-latency and high-throughput constraints | [SONIC, USENIX Security 2026](https://www.usenix.org/conference/usenixsecurity26/presentation/talur) | Concurrent RingORAM, lock-free access/reshuffle/stash, batch eviction; source declares the final paper embargoed at inspection. | The current work directly occupies the same security and performance objective.  No independently specified mechanism or publicly inspectable artifact route was available to establish a residual. | `DIRECT_FATAL_FOR_UNSPECIFIED_ORAM_VARIANT` |
| Cloud block store tail latency under burst / fairness constraints | [NSDI 2026 paper](https://www.usenix.org/conference/nsdi26/presentation/hu-chaolei) | Dual-bucket throttling and priority-based task scheduling, deployed in production. | This lead is a scheduler/throttler controller by construction and is disallowed even before novelty scoring. | `DROP__PROHIBITED_CONTROLLER` |

## Cross-cutting integrity checks

- No lead reuses a terminal candidate's exact object or frozen mechanism; in particular it does not revive `O4-DYNCACHE-PGM`, `S6-EGRAPH-LIVEEXTRACT`, or `S5-OCCUPANCY-CLIFF-JOINTCODEGEN`.
- No proposed comparison changes security semantics, runtime semantics, code-quality definition, workload, or cost ledger to manufacture headroom.
- `SEARCH_BOUNDED_OPEN` is not used as a positive novelty conclusion in this wave.
- The only retained sources are venue-hosted original papers or official/project pages.  The embargo status of SONIC is treated as an evidentiary boundary, not as a scientific negative result.

