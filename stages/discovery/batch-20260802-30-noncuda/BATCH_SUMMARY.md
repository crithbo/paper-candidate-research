# Discovery batch 20260802-30 — non-CUDA

## Decision

Screened 14 non-synonymous directions across compiler/AI systems, databases, graph/stream algorithms, data structures, and storage. Two satisfy the discovery threshold (academic >=45, total >=72, no `DIRECT_FATAL`) and are proposed for Stage 0; 12 are concentrated in [DROP.md](DROP.md).

| Proposed topic | Object and paper kernel | Score | AI path | Decision-defining risk |
|---|---|---:|---|---|
| [MLIR-SHAPE-REGION](MLIR-SHAPE-REGION/topic_brief.md) | Budgeted guarded shape-region construction plus compiled variants; net-cost non-regression contract | 49+25=74 | AI-core executable (0.74), CPU MLIR/IREE proxy | May collapse to existing multiversioning/profile-clustering union once all costs are charged. |
| [IVM-PRESTATE-COARSEN](IVM-PRESTATE-COARSEN/topic_brief.md) | Memory-bounded lineage-witness coarsening for concurrent outer-join IVM; correction/freshness bound | 48+24=72 | AI-core executable (0.71), differential CPU SQL oracle | May be an auxiliary-table selection rename or directly covered by Streaming View. |

## Required Stage 0 focus

1. Perform deep same-object collision searches before implementation.
2. Freeze the complete unions and cost ledgers, including compilation/dispatch/fallback for the compiler topic and state/backfill/staleness for the IVM topic.
3. Run one small, public, CPU-only killer per topic only after mainline creates Stage 0 and authorizes it.

## Boundary

This batch did not alter registry, plan, history, or downstream stages. It contains no experimental result, no large download, and no hardware claim. `SEARCH_BOUNDED_OPEN` is not a novelty conclusion.
