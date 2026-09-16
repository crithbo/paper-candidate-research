# GIN-POSTING-CUT-DP — Trace-Aware Bounded Posting-Tree Construction for PostgreSQL GIN

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origin: `O3`
- Domain tags: database indexes, data structures, dynamic programming
- Contribution route: `N2` with testable `N3`
- Discovery date: `2026-08-10`

## Research question

For the same fixed GIN key-to-TID relation and the same SQL/index semantics, can an offline bounded dynamic program construct legal posting-tree page cuts and height using a frozen natural query-frequency distribution, reducing fully charged expected page reads/bytes/build cost versus all fair current GIN construction paths?

## Exact object, natural carrier and baseline union

- Object: a fixed PostgreSQL table, fixed GIN operator class/key extraction, fixed sorted TID set per key and identical query answers.
- Natural carrier: a public natural document/tag/array corpus loaded unchanged plus its released query log or an auditable same-corpus access distribution. Stage A must freeze 20–50 corpus slices and query-trace identities; a synthetic TID layout is legality-only, never positive evidence.
- Strongest union: current GIN posting-list/tree representation, bulk construction/insertion, default and non-default `fastupdate`, pending-list limit/cleanup, legal fill/page behavior and all current compatible query paths.
- Full-cost: index build CPU/wall time, WAL, index bytes, pending-list/vacuum cleanup, cache-cold/warm query page reads, update cost and retained index size.

## Complete constructor and finite-state recurrence

For a key's ordered TIDs, generate only native-legal leaf pages. Let `D[i,h]` be the minimum frozen additive objective to encode suffix `TID[i:]` with at most `h` remaining posting-tree levels. For each legal page ending `j`, transition to `D[j+1,h]`, adding leaf bytes, frequency-weighted page-read term, child-pointer/fanout contribution and build/WAL term. A finite outer enumeration covers legal root fanout/height. The output is ordinary legal posting pages, not an external index or a query controller.

The exact guarantee is feasibility and optimum for the declared finite additive model. Any pruning must state its approximation bound; no empirical speedup or global optimality beyond that model is claimed.

## Current collision and reality check

- Current official anchor: [PostgreSQL current GIN documentation](https://www.postgresql.org/docs/current/gin.html).
- Direct subtractors: an existing current GIN build that carries out the same trace-aware state recurrence/objective; a prior same-object posting-tree DP with equal semantics/full cost; or a legal native setting that exactly replays the complete constructor.
- Actual source/flags to inspect before Stage A: pinned PostgreSQL source in `src/backend/access/gin/`, build/insertion/page split code, `fastupdate`, `gin_pending_list_limit`, all reloptions and bulk/pending paths. This requirement is not satisfied by old documentation or issue history.
- Seed distance: native settings choose/update a construction path; the candidate solves a coupled, frequency-aware page-cut/tree-height optimization with an explicit finite state and model guarantee.

## Fidelity closure plan and 72-hour falsifier

- Status: `FINITE_FIDELITY_GAP`.
- Small witness: a single key with enough TIDs for two legal leaf cuts, two query-frequency classes and exact `EXPLAIN`/index result equivalence; confirm unchanged page/reader/query semantics.
- Finite closure: pin release/source/options; reproduce legal native pages; implement the recurrence; verify index answers on witness; then use 20–50 frozen natural slices with full ledger.
- Falsifier: stop if source/options already provide equivalent construction, native page semantics cannot represent the computed cuts, query results or maintenance semantics differ, or no predeclared natural stratum has a full-cost residual after all costs.

## Q1/Q2 and readiness

- Structural paper potential: `TIER_B_Q2_VIABLE` only if natural trace structure, exact compatibility, a reproducible no-gain map and full-cost benefit survive. Tier A needs formal approximation/scalability and broad workloads.
- Current evidence readiness: `FINITE_FIDELITY_GAP`; no implementation, natural result or speed claim exists.
- AI readiness: `AI_CORE_CONDITIONAL`; recurrence/verifier tooling is tractable, while source/API and database semantics need supervised validation.
