# DISCOVERY-S5-20260811-V8.7-WAVE89-ONLINE-COMPACTION-REBUILD-MIGRATION

- Lane/cutoff: `DISCOVERY-S5-SCALE-ONLINE-APPROX`, primary-source cutoff `2026-08-11`.
- Frozen authority: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`; `DISCOVERY_QUALITY_MODE=OFF`.
- Method: accepted v2/v8.1, v8.6 finite fidelity admission and v8.7 upstream reality if an implementation-absence claim is made. No v8.8/R7 shadow/dormant semantic is canonical.
- Required contract: online arrival/update information; live/immutable state across compaction or rebuild; exact, approximate, or competitive guarantee; and end-to-end foreground, background, data-movement, duplicate-state, read/write amplification, recovery and migration costs. Configuration-only compaction choice and controllers are ineligible.
- Input SHA-256: `AGENTS.md=66231f71ef6ab250a1ad9ff576d5840978f09efc03bf5d2f0527d47f4d82b063`; `plan.md=69a55e0fe3e69a549e9fac0f941941743a96962b0898d74296a4c8e916d61333`; `registry.yaml=f07299fef161dd6247891bbb7c4cce1ffe927fcb6e2e982e87a3584dff9b3586`; `ROLE_DISCOVERY=fcb9bd73c39f39d31f6c8154e6b48ea23187ff28bdf2bb3d9c59e3d28fa518a3`.

## Funnel

| Unit | Count | Result |
|---|---:|---|
| `RAW_SCREEN_ROW_EVENT` | 10 | First-party author/project/conference sources. |
| `UNIQUE_OPPORTUNITY_FAMILY` | 10 | Matrix below. |
| `CANDIDATE_GRADE_DEEP_REVIEW` | 4 | RangeReduce, SynchroStore, Mycelium, LSM-Raft. |
| `STAGE0_BRIEF` | 0 | `COMPLETE_ZERO_PROPOSALS`. |

## Deep-review record

### RangeReduce — `DROP`

The object is LSM range-query execution plus compaction under incoming updates, with result correctness and total query/compaction data movement. RangeReduce explicitly turns an already-read range-query region into a compaction action to reduce future reads, writes, space amplification and compaction debt. The possible remainder—when to invoke that action or what query score to use—is a controller. No union-external state representation or same-function guarantee was frozen.

### SynchroStore — `DROP`

The object is hybrid row/column storage through updates, freezing, row-to-column conversion and fine-grained compaction. The native construction already names the incremental representation and transformation action; its cost-based scheduling layer is not separately admissible. A proposed rebuild threshold/queue would be parameter control, while replacing the row/column semantics changes object.

### Mycelium — `DROP`

The object is transformation-embedded LSM compaction that preserves KV-store function while amortizing transformations through compaction. Mycelium's transformer interface and cross-column-family merge are already the complete data-representation action. It is implemented on excluded RocksDB lineage, and any remaining transformation selection is a controller. It cannot be revived by renaming it as migration.

### LSM-Raft — `DROP`

The object is a strongly consistent replicated log whose entries can include compacted SSTables. LSM-Raft explicitly incorporates compaction into the replication/log representation, so has already frozen both consistency and migration/compaction state. Changing compaction cadence or follower transfer order is a policy; no same-guarantee union-external action was found.

## Three-pass result

1. **Genealogy:** the scan covers query-driven compaction, coordinated sorted-run partitioning, hybrid row/column transformation, compaction-embedded transformation, replication-aware SSTable compaction, and dynamic Bloom-filter rebuilding.
2. **Union:** native constructors plus generic LSM compaction/merge and compatible replication actions form the fair same-object union. All candidate-like residuals reduce to trigger/score/queue choices or re-use an existing direct construction.
3. **Natural route/fidelity:** real YCSB-style KV/update logs, range-query traces, and replicated-log streams are natural carriers. But without an atomic action gap there is no honest finite Stage-A fidelity plan or killer. This is not a rejection based on unavailable implementation, result, resource, or AI readiness.

## Canonical outcome

`COMPLETE_ZERO_PROPOSALS`. No brief was created. No experiment, benchmark, automated collection, large download, downstream-stage directory, or shared-control mutation occurred.
