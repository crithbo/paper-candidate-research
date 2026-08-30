# Discovery log — DISCOVERY-S2-20260811-V8.7-WAVE49-BOTTLENECK-TRANSFER-QUALITY

## Assignment freeze

| Field | Frozen value |
|---|---|
| `rules_revision` | `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__p1-shadow-not-authoritative` |
| `DISCOVERY_QUALITY_MODE` | `OFF` |
| Rule inputs SHA-256 | `AGENTS.md` `2B0DA6CAD951C6E1E4F371B7BCF8E2BDF6A5E41CF53D9895614E118219A6AC8D`; `ROLE_DISCOVERY.md` `585C35D2D7E46D30204F5F09B09040D562795E7CC005FF858B20CBCFBD9727A8`; `TOPIC_BRIEF.md` `41D7B1977C6C467E31762B097C3F53C4314900E5C69AD8351EBB709F3963A130` |
| Explicitly not used | v8.8 and R7 collision-first/depth-redteam production semantics; repair-vector telemetry as an admission, DROP, or scheduling authority |
| Static-work boundary | No experiments, benchmarks, downloads, Stage0/A/B directories, automation, or shared-control edits. |

## R5-P0 funnel ledger

### Raw row events

| Raw event | UNIQUE_OPPORTUNITY_FAMILY | Transferred bottleneck and tentative complete action | Funnel disposition |
|---|---|---|---|
| `RAW-01` | Linux eBPF verifier state pruning | Path expansion is curtailed by local cached-state pruning; candidate N2 would construct a dominance-safe, per-program antichain of verifier states and use it for exact same accept/reject verification. | `DEEP_DIVE_REQUIRED` → deep reviewed. |
| `RAW-02` | Lucene immutable-segment merging | Ingest/search improvements transfer cost to segment merge selection and rewrite amplification; candidate action would jointly choose a legal segment merge set and output layout under the same index/query semantics. | `DEEP_DIVE_REQUIRED` → deep reviewed. |
| `RAW-03` | Rust compiler incremental queries | Query caching transfers work to dependency invalidation/work-product retention; candidate action would jointly construct retained-query frontiers and artifact materialization under unchanged rustc output semantics. | `DEEP_DIVE_REQUIRED` → deep reviewed. |
| `RAW-04` | LLVM ThinLTO import/cache planning | Whole-program optimization transfers cost to import selection and cache materialization; candidate action would construct a global, budgeted import/reuse set. | `NOT_ADMITTED_UNFROZEN`: no fair same-output comparator/action contract frozen. |
| `RAW-05` | Btrfs incremental send clone selection | Incremental transfer transfers work to clone/back-reference discovery and stream emission; candidate action would choose a globally costed clone-reference cover. | `NOT_ADMITTED_UNFROZEN`: source-level same-stream legality and finite natural carrier not frozen. |
| `RAW-06` | Apache Lucene BKD construction | Query acceleration transfers cost to point-tree partition/layout construction; candidate action would build a bounded global partition tree with the same point-query semantics. | `NOT_ADMITTED_UNFROZEN`: current complete action/format and a non-configuration residual were not frozen. |
| `RAW-07` | KLEE symbolic-state management | Solver/path techniques transfer cost to state equivalence and cache management; candidate action would create a semantics-preserving state-subsumption structure. | `STRUCTURAL_DROP`: this is state scheduling/cache control without a named new verification/analysis action. |
| `RAW-08` | Bazel action-cache materialization | Remote/incremental build optimization transfers cost to artifact residency and action-cache reuse. | `STRUCTURAL_DROP`: a cache/admission controller; no new same-build object or guarantee. |
| `RAW-09` | OpenJDK class-data sharing archive layout | Startup optimization transfers cost to archive construction/layout; candidate action would choose a global class/metadata layout. | `NOT_ADMITTED_UNFROZEN`: complete reader/format action and finite official natural corpus route were not frozen. |
| `RAW-10` | Apache Arrow dataset scan planning | Columnar/vectorized execution transfers cost to fragment/row-group access and materialization order. | `STRUCTURAL_DROP`: a runtime scan scheduler unless a new same-result representation/algorithm is supplied. |
| `RAW-11` | Tantivy segment merge planning | Indexing transfers cost to segment compaction and merge amplification. | `STRUCTURAL_DROP`: same family as merge-policy selection; only controller actions were found. |
| `RAW-12` | Linux BPF JIT image layout | Verification/JIT improvements transfer cost to native image layout and branch-range repair. | `NOT_ADMITTED_UNFROZEN`: the exact object crosses verifier/JIT contracts and no finite same-binary guarantee route was frozen. |

### Repeat/rescreen ledger

No raw row reuses a Wave44–48, active, terminal, blocked, or hold object.
The following tempting directions were excluded **before** a raw event: AIGER
(active/blocked), PostgreSQL GIN (active Stage0 closing), WebGraph, HNSW, UST,
Parquet, LLVM bitcode, RocksDB, CVC5, Git, PB, S4, Kafka, Flink, SQLite,
io_uring, ClickHouse, and the Wave47 S2 zstd/LLVM-register-allocation/
PostgreSQL-join/Calcite families.  This is an identity exclusion, not evidence
against a renamed descendant.

### Unique-family count and candidate-grade deep reviews

`12` unique opportunity families were logged.  `3` were advanced to
candidate-grade deep review: eBPF verifier state pruning, Lucene immutable
segment merging, and Rust incremental queries.  Their current-reality,
paper/artifact, strongest-union, full-cost, and 72-hour-killer records are in
[SOURCE_COLLISION_MATRIX.md](SOURCE_COLLISION_MATRIX.md).

## Outcome

`COMPLETE_ZERO_PROPOSALS`.

This outcome is not based on unavailable implementations, absent results,
resource readiness, or AI readiness.  The deep-reviewed directions fail only
because the action is currently absorbed by the same-object union or reduces to
a policy/controller; the other raw directions never received the frozen
same-object/action/fidelity contracts needed to enter candidate-grade review.
No topic brief is warranted.
