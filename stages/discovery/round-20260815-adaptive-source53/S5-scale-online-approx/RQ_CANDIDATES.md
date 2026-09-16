# Source53 primary RQ cards

All RQs below were frozen before their respective current/contrary source checks. FINER-lite is scheduling-only and makes no novelty or Q2 finding.

## RQ53-01 — PostgreSQL materialized-view state update

- Exact anchor: PostgreSQL 18 documentation, `39.3 Materialized Views`, retrieved 2026-08-15.
- Stable object/guarantee: fixed PostgreSQL materialized-view definition, base-table update sequence, and exact query-visible stored result; no change to SQL query or reader semantics.
- Primary RQ: *Can a non-generic, target-native PostgreSQL constructor maintain the exact stored result of a fixed materialized view under base-table updates with a bounded-recourse/full-cost guarantee outside stock refresh and known IVM actions?*
- Counterfactual decision: an operator could preserve current materialized-view reads without choosing between a full refresh and an ungrounded extension-specific policy.
- Primary route: PostgreSQL current materialized-view/REFRESH docs; contrary route: `sraoss/pg_ivm` source. Transport fallback: PostgreSQL 18 SQL reference only.
- Pre-RQ nomination: `NONE`; the starting sketch did not freeze a distinct target-native action beyond the known IVM family.

## RQ53-02 — HotSpot nmethod code-cache relocation

- Exact anchor: OpenJDK `jdk` master, `src/hotspot/share/code/codeCache.cpp`, retrieved 2026-08-15.
- Stable object/guarantee: HotSpot nmethod/code-blob code-cache state and exact execution/metadata reachability; proposed movement may not change Java or VM observable semantics.
- Primary RQ: *For a fixed HotSpot nmethod population and code-cache pressure sequence, is there a VM-native bounded-recourse relocation action that preserves nmethod reachability and execution semantics rather than merely selecting a flushing threshold?*
- Counterfactual decision: code-cache pressure could be resolved without invalidating/recompiling an otherwise live nmethod set.
- Primary route: current `codeCache.cpp`; fallback: same-repository code-cache jtreg selection rule, only if it names a test with both a Java semantic oracle and code-cache observation.
- Pre-RQ nomination: `NONE`; pre-evidence material did not freeze a narrow legal relocation/action interface and exact carrier-oracle pair, so a strong-slot request would have been premature.

## RQ53-03 — Bazel build-graph recourse

- Exact anchor: Bazel current official build reference and `bazelbuild/bazel` repository, retrieved 2026-08-15.
- Stable object/guarantee: exact build target outputs under unchanged declared inputs/toolchains; no change to target graph or build semantics.
- Primary RQ: *Can a target-specific constructor improve exact Bazel dependency-state maintenance under source churn with a guarantee beyond native incremental evaluation and cache invalidation?*
- Counterfactual decision: an affected target set or rebuild cost bound would change for the same build command and declared inputs.
- Primary route: official Bazel current documentation/source; fallback: none, because a different build system would change object.
- Pre-RQ nomination: `NONE`; the action was already strongly suspected to be a generic cache/invalidation rephrasing.
