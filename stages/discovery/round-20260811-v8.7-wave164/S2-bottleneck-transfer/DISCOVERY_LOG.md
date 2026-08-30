# Discovery log — S2 native bottleneck-migration constructor breadth

**Assignment:** `DISCOVERY-S2-20260811-V8.7-WAVE164-NATIVE-BOTTLENECK-MIGRATION-CONSTRUCTOR-BREADTH`  
**Cutoff:** 2026-08-11  
**Result:** `COMPLETE_ZERO_PROPOSALS`

## Frozen method

Method: `production_v2_v8.1 + v8.6 fidelity-closure-plan + v8.7 CURRENT_UPSTREAM_REALITY_CHECK`; revision: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`.

The pass is action-first. Each row freezes a current first-party action/config union, carrier, native oracle, full denominator and bounded killer before candidate-grade work. Registry/previous-wave screening excludes known active, blocked, terminal and recently rescreened objects. Missing implementation, result, resource, or AI readiness is not a rejection premise.

## R5-P0 breadth ledger

| Family | Current whole action/config union | Natural carrier; oracle; full-cost; 72h killer | Result |
|---|---|---|---|
| Apache Iceberg manifest scan | snapshot, manifest-list pruning, manifest reads, inclusive partition projection, delete-file selection, scan planning | sample table/snapshot history; Iceberg spec; metadata+manifest+delete+data-read CPU/RSS/bytes/latency; fixed snapshot/predicate, fail on selected-file/result mismatch | deep; `DROP` |
| LLVM ThinLTO | per-module summaries, combined summary index, global import decision, backend index files, cache/linker flags | LLVM ThinLTO tests; IR/object oracle; compile+thin-link+backend+cache CPU/RSS/I/O/latency; fixed modules, fail on output/import-plan mismatch | deep; `DROP` |
| rustc incremental | query DAG, fingerprints, red-green marking, persisted graph/cache, cache promotion, CGU reuse | rustc incremental tests; artifact/diagnostic oracle; query+graph+cache+codegen CPU/RSS/bytes/latency; two-edit fixture, fail on artifact or invalidation mismatch | deep; `DROP` |
| Apache Parquet page index | optional ColumnIndex/OffsetIndex, page skipping, predicate/page choice, reader/metadata | versioned page-index file; Parquet spec; footer/index+I/O+decode CPU/RSS/bytes/latency; fixed predicate, fail on row set mismatch | `NOT_ADMITTED_UNFROZEN` |
| Apache Arrow IPC reader | schema/message framing, dictionary batches/memoization, record buffers, validating reader | Arrow integration fixtures; IPC reader oracle; framing+metadata+buffers+validation/decode CPU/RSS/bytes/latency; cross-reader fixture, fail on values/schema mismatch | `NOT_ADMITTED_UNFROZEN` |
| Apache OpenDAL operation layers | accessor operations plus retry/cache/blocking/async layer composition | upstream layer tests; result/error oracle; request+retry+metadata+I/O CPU/RSS/bytes/latency; temporary-error trace, fail on result/error mismatch | `NOT_ADMITTED_UNFROZEN` |

Counts: `raw_row_events=6`; `repeat_rescreen_events=0`; `unique_opportunity_families=6`; `preliminary_action_divergence_witnesses=3`; `candidate_grade_deep_reviews=3`; `grounded_briefs=0`.

## Candidate-grade deep review — Iceberg

**Same object:** one Iceberg table at a fixed current snapshot and query predicate, with equal selected data/delete files and row result. The current specification plans scans from current-snapshot manifests, filters via manifest-list summaries, and uses inclusive partition projection. That is already a complete global metadata constructor.

**Attempted witness:** another joint manifest/partition/delete-file plan with fewer metadata reads, equal information and unchanged selected-file safety. Identical plan construction is absorbed. Skipping beyond inclusive projection changes correctness or needs a new index/format/object; changing metadata construction changes snapshot contract. `DROP` for absorption/changed object, not readiness.

## Candidate-grade deep review — LLVM ThinLTO

**Same object:** fixed bitcode modules, target/options and linker inputs producing the same link artifact and permitted optimization semantics. Current ThinLTO merges module summaries into a combined index, decides imports/global optimizations, emits backend work, and has cache/parallelism controls.

**Attempted witness:** a different global import/index constructor with equal information, output and guarantee. The combined-summary/index/import machinery already is the whole global action. Repacking summaries is representation-only; altering imports changes code quality, output or comparison contract; cache/job flags are tuning. `DROP`.

## Candidate-grade deep review — rustc incremental compilation

**Same object:** fixed Rust crate revision sequence/options and final artifact/diagnostics, including sound cross-session invalidation. Current rustc tracks a query DAG and uses stable fingerprints, red-green evaluation, persisted graph/cache, cache promotion and CGU reuse.

**Attempted witness:** a different global retention/reconstruction plan that preserves invalidation soundness with equal source information. The named action is current red-green/cache-promotion machinery. Coarser retention risks invalidation; same graph serialization is representation-only; policy is tuning. `DROP`.

## Outcome

Parquet, Arrow IPC and OpenDAL exposed only current reader/layer/configuration paths, not a legal union-external complete action, so remain `NOT_ADMITTED_UNFROZEN`. No brief is produced. No experiment, benchmark, download, automation, Stage0/A/B creation or shared-control mutation occurred. State: `IDLE_REUSABLE_AWAITING_MAINLINE`.
