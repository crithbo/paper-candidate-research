# Discovery log — S2 allocation / lifetime bottleneck migration

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE80-ALLOCATION-LIFETIME-BOTTLENECK-MIGRATION`  
**Cutoff:** 2026-08-11 · **result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen admission contract

Method: accepted `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; revision `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`. v8.8/R7 shadow/dormant semantics and repair-vector canonical authority were not used.

The frozen object for this pass includes allocation, object reachability/visibility, safety/liveness, retirement, reclamation, and memory returned or retained by the OS. A proposed N2 must define a whole same-object allocation-lifetime construction with a finite fidelity plan. It cannot be just allocator selection, per-knob purge timing, cache policy, collector pacing, or callback scheduling.

## R5-P0 funnel ledger

| Event | Opportunity family | Classification |
|---|---|---|
| raw-01 | mimalloc abandoned-page/segment reclamation after scalable allocation | unique; deep reviewed |
| raw-02 | mimalloc purge delay and reset/decommit | repeat of raw-01 | `EXCLUDED` |
| raw-03 | Crossbeam epoch reclamation for concurrent data structures | unique; deep reviewed |
| raw-04 | hazard-pointer retirement in Crossbeam ecosystem | repeat of raw-03 | `EXCLUDED` |
| raw-05 | Linux RCU callback/grace-period reclamation | unique; deep reviewed |
| raw-06 | RCU callback offload scheduling | repeat of raw-05 | `EXCLUDED` |
| raw-07 | Go runtime concurrent GC/pacer after allocation throughput improvements | unique; deep reviewed |
| raw-08 | Go memory-limit/pacing settings | repeat of raw-07 | `EXCLUDED` |
| raw-09 | snmalloc remote deallocation and message passing | unique |
| raw-10 | CPython cyclic GC / immortal-object retention | unique |
| raw-11 | .NET GC LOH/POH reclamation | unique |
| raw-12 | PostgreSQL MVCC dead-tuple/vacuum retention | unique |
| raw-13 | FoundationDB storage-server version retention | unique |
| raw-14 | Linux cgroup memory reclaim | unique |
| raw-15 | jemalloc slab decay | repeat of Wave60 allocator family | `EXCLUDED` |

Counts: `raw_row_events=15`; `repeat_rescreen_events=5`; `unique_opportunity_families=9`; `candidate_grade_deep_reviews=4`; `grounded_briefs=0`.

## Candidate-grade deep reviews

### mimalloc abandoned pages/segments — `DROP`

**Exact object:** allocation/free operations with C/C++ allocation semantics; denominator covers allocation, cross-thread free, live-object retention, page/segment state, OS purge/decommit and application-visible RSS/commit. **Information:** allocator metadata and free/owner events, not application reachability beyond the allocator contract. Current upstream documents multi-sharded local/concurrent free lists, eager page purging, cross-thread reclamation of abandoned pages, and the current bitmap-based abandoned-segment collection. It also exposes `mi_option_abandoned_reclaim_on_free`, maximum segment-reclaim percentage, purge delay, reset/decommit and arena configuration.

Those knobs are not treated as an automatic collision. The proposed atomic action in this screen was a global choice of when/how much abandoned allocation state to reclaim based on that same metadata. It is absorbed as policy over native collection/reclaim operations, and no distinct whole allocation/reclamation algorithm or new safety/fragmentation/complexity guarantee was frozen. A finite natural route could use the upstream benchmarks and multithreaded server traces, but no StageA fidelity plan is emitted without a union-external construction. Missing hardware or results did not inform this decision.

### Crossbeam epoch — `DROP`

**Exact object:** a concurrent data-structure operation preserving Rust memory safety, linearizability contract of the target structure, and safe reclamation after readers cease access. **Full cost:** operation work, pin/unpin, retire lists, epoch advancement, reclamation and retained memory. Crossbeam’s official upstream identifies `crossbeam-epoch` as epoch-based garbage collection for concurrent data structures. The candidate residual after lock-free operation optimization is delayed retirement/retention. The screened actions—pinning, retiring, epoch collection and reclaim timing—belong to the current epoch protocol. A proposal that changes the grace/safety protocol requires a new proof and exact target-structure contract; neither a bounded new algorithm nor same-object guarantee witness was fixed. It is dropped for absent action divergence, not because a proof/implementation is currently unavailable.

### Linux RCU reclamation — `DROP`

**Exact object:** a kernel object reclaimed only after RCU reader safety and callback/grace-period requirements are satisfied; full cost includes update, grace-period detection, callback queueing/invocation and retained memory. The official current RCU requirements document expressly constrains callback behavior and defines the reader-safety setting. The plausible transferred bottleneck is callback retention after fast read-side access. Candidate actions considered were callback batching, CPU/offload assignment and threshold/pacing choice. These are scheduler/controller formulations; no new full protocol was named that preserves the required RCU safety/liveness guarantees while providing a finite complexity or retention guarantee. This row is a structural drop, not an absence claim about all RCU research.

### Go runtime GC/pacer — `DROP`

**Exact object:** a Go program with language/runtime reachability and finalization semantics; denominator includes mutator allocation, marking, sweeping, assist work, retained heap and pause/CPU cost. Current official Go runtime documentation exposes the garbage collector and memory-limit/pacing surface. The post-allocation residual is retention/pacing. The screened atomic actions—adjust growth target, memory limit, assist/background work and scavenging timing—are collector policy/configuration. No union-external collector construction with a fixed same-program semantic contract and finite natural killer was found. This is not a resource/readiness rejection.

## Bounded screens

| Family | Disposition |
|---|---|
| snmalloc remote free | `NOT_ADMITTED_UNFROZEN`: target concurrent allocation object and a new message/reclamation construction were not fixed together. |
| CPython cyclic GC | `STRUCTURAL_DROP`: thresholds/generation scheduling are controller choices; changing object lifetime semantics fails same-object. |
| .NET GC LOH/POH | `STRUCTURAL_DROP`: placement/compaction configuration is not a new complete lifetime action. |
| PostgreSQL MVCC vacuum | `STRUCTURAL_DROP`: retention/reclaim scheduling is controller-like and may alter transactional/storage conditions; no same-object construction frozen. |
| FoundationDB retention | `NOT_ADMITTED_UNFROZEN`: a finite same-transaction/version-retention action was not fixed without entering active distributed-storage scope. |
| Linux cgroup reclaim | `STRUCTURAL_DROP`: resource-policy/controller object rather than program-level allocation/lifetime N2. |

## Evidence integrity and outcome

All deep reviews use official current upstream/source documentation; bounded rows are not implementation-absence claims. Natural carriers are available in principle (mimalloc stress/server workloads, concurrent structure tests, kernel RCU selftests, Go runtime tests), but no natural StageA killer is stated because the preceding action-gap requirement failed. No direction was dropped for missing implementation, core result, data, resource, download or AI readiness. No experiment, benchmark, Stage0/A/B directory, automation or shared control file was created.

`PROPOSE_STAGE0: []`. State after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
