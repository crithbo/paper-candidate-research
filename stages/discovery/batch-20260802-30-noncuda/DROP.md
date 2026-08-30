# Wave 30 non-CUDA drops

The following 12 non-synonymous directions were screened. Scores are conservative discovery estimates; a `DROP` below means an academic collision or an empty paper kernel, not an AI-resource failure.

| ID | Frozen object / proposed kernel | Collision-first decision | Score (A+AI) |
|---|---|---|---:|
| DB-PLAN-REPAIR-ROBUST | Runtime join-plan repair after cardinality feedback | `DROP`: adaptive query optimization already owns the legal plan-repair decision; without a new guarantee it is a feedback selector. | 38+24=62 |
| DB-CARD-CERT | Cardinality-estimate confidence certificate deciding join order | `DROP`: checker/certificate on a mature estimator/optimizer, with no new optimization object. | 33+25=58 |
| GRAPH-DYNKCORE-RETRACT | Bounded-retraction dynamic k-core under edge stream | `DROP`: direct adjacency to established insertion/deletion dynamic k-core; no distinct bound or natural residual was frozen. | 40+22=62 |
| GRAPH-MOTIF-LATE-REPAIR | Reorder-aware late-event motif repair | `DROP`: overlaps the active late-window temporal-motif object; full union includes buffering, reordering, and sampling. | 31+23=54 |
| STREAM-JOIN-SKETCH-ALLOC | Sketch allocation for approximate multiway stream joins | `DROP`: allocation is a standard resource selector; no new sketch/error theorem was specified. | 39+24=63 |
| IVM-AUX-TABLE-CHOOSER | Auxiliary-table chooser for deferred IVM | `DIRECT_FATAL`: ordinary auxiliary-state selection is already the core of deferred maintenance. | 28+23=51 |
| LSM-CREDIT-ADMISSION | Credit-based compaction admission | `DROP`: scalar reparameterization of compaction queue/admission; existing LSM boundary/credit directions cover the decision. | 34+24=58 |
| LEARNED-BLOOM-UPDATE | Learned Bloom filter rebuild policy under updates | `DROP`: product/rebuild selector; strongest union includes standard filters and retraining/rebuild policies. | 35+23=58 |
| ANN-INDEX-MIGRATION | Online ANN shard migration for skew | `DROP`: systems scheduling policy with no frozen correctness/approximation residual; risks productization. | 37+21=58 |
| FLINK-WATERMARK-BUDGET | Watermark budget selector for late data | `DROP`: selector/checker on existing watermark/lateness controls; no new stream semantics or theorem. | 34+24=58 |
| EGRAPH-EXTRACT-BUDGET | E-graph extraction under compile-time/code-size budget | `DROP`: direct extension of multiobjective extraction unless a new tractable approximation/separation is supplied; current idea is textbook objective scalarization. | 40+24=64 |
| LLVM-REMARK-TRIAGE | Optimization-remark-based pass triage | `DROP`: instrumentation/diagnosis wrapper; no independent compiler decision or non-dominated result. | 25+25=50 |

## Shared decisive risk

Several candidates tried to turn an existing optimizer's observability, profile, cache, or queue into a new decision rule. Per the full-union rule, these are not retained unless they change the object, guarantee, and complete cost boundary. No low-AI candidate was dropped for lack of hardware or proprietary data.
