# PIM-EMBED-REDUCE-OWNERS Ownership-Changing Embedding Reduction Layout

- Status: `RESERVE_RECOMMENDED`
- Primary lane: PIM / embedding data layout
- Discovery date: 2026-08-02

## Research question

For update-heavy embedding bags on a banked PIM device, can an ownership-changing reduction layout reduce cross-bank reduction traffic with a provable bound while preserving exact accumulation and update visibility?

## Importance and group fit

Embedding reductions dominate recommendation workloads and expose a mapping/communication problem distinct from the prior UPMEM sparse owner-set proposal: this object permits ownership transfer at reduction epochs and studies exact update visibility, rather than static sparse-owner assignment.

## Exact object

Banked PIM embedding-bag lookup/update streams with exact fixed-point accumulation, pinned consistency/epoch semantics, and bank-local capacity. Full cost: migration copies, ownership metadata, reduction messages, write visibility fences, host coordination, imbalance, and fallback.

## Strongest fair baseline

Static row-wise and table-wise sharding, replicated-hot-row caching, host-mediated reduction, and a small-instance offline min-cut/migration oracle with all migration/fence costs.

## Mechanism hypothesis

Maintain a compact epochal ownership graph; transfer only a bounded frontier whose saved reduction edges exceed a migration-and-visibility debt. The target is a communication bound tied to the changing co-access graph.

## Competing mechanisms

- Mechanism A: bounded-frontier ownership transfer.
- Mechanism B: replicated hot-set with version leases.
- Mechanism C: deterministic co-access hypergraph partition at fixed epochs.
- Preferred mechanism and why: A has an explicit migration debt and a falsifiable communication inequality.

## Candidate paper claim

Under pinned update streams and a PIM ISA, the mechanism preserves exact bag sums and visibility while reducing charged cross-bank bytes beyond static/replication/host baselines. This is a restricted architectural claim, not a universal recommender result.

## Current collision subtraction

Static placement, replication, and generic graph partitioning are the strongest union. The residual is dynamic ownership with exact update visibility and its debt bound. Public bounded scan found no direct same-object source; it remains `SEARCH_BOUNDED_OPEN`.

## Decisive falsifier

If a static/replicated/offline-union arm matches all cross-bank-byte points after migration/fence costs, or the visibility oracle finds a stale/duplicated update, stop.

## Executable evidence path

### 72-hour first evidence

A high-level deterministic bank simulator can test the communication bound on public Criteo-like access traces, but it cannot validate real PIM timing, ISA effects, or lawful firmware deployment.

### AI core fraction and critical path

`0.31` (`AI_AUXILIARY_ONLY`): AI can build the simulator and exact visibility oracle, but decisive same-object evidence needs a user-controlled PIM platform/approved simulator model with validated timing semantics.

### Semantics-preserving open alternatives

Open PIM simulators may support analytical early evidence, but no checked alternative currently closes the device-level claim. This is why the route is reserve, not STOP.

## Dual-axis score

- Academic value: `56/70`
- AI executability bonus: `9/30`
- Total: `65/100`

## AI and researcher boundary

Reserve for user-controlled PIM resources and platform semantics. Do not activate automatic Stage A solely from a high-level simulation.
