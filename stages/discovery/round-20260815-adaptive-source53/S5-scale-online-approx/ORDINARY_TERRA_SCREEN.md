# Source53 ordinary Terra source screen

The declared selective route was `NONE`; no Sol/high task was requested or run. The following ordinary source checks happened after anchor/RQ freeze.

## S53-01 PostgreSQL materialized views — not admitted

PostgreSQL 18 documentation specifies that a materialized view persists table-like results but cannot be directly updated; `REFRESH MATERIALIZED VIEW` generates fresh data from the stored query. The SQL command documentation says refresh completely replaces contents, with `CONCURRENTLY` providing a stock reader-availability alternative subject to a unique-index requirement. The independently maintained `pg_ivm` project is an obvious same-object incremental-view-maintenance subtractor, so a proposal described only as “bounded-recourse IVM” has not frozen a non-generic residual/action beyond known IVM.

- Identity preflight against registry SHA256 `9EDBD901B67809D59F9D7FE2FAEC4E4421EFECCF7D5971A95408124A37F68D23`: prior PostgreSQL B-tree material is `RELATED_ONLY` (different object/action/endpoint); no-match is not novelty.
- Raw gate failure: source-supported non-generic discriminator and finite natural/versioned update carrier are not frozen. The existing IVM route is a direct subtractor, not evidence of current absence.
- Disposition: `LOCATOR_ONLY__GENERIC_INCREMENTAL_MV_MAINTENANCE_NO_FROZEN_TARGET_SPECIFIC_N2`.
- Sources: PostgreSQL 18 materialized-views documentation (`https://www.postgresql.org/docs/current/rules-materializedviews.html`); PostgreSQL 17 `REFRESH MATERIALIZED VIEW` reference (`https://www.postgresql.org/docs/17/sql-refreshmaterializedview.html`); pg_ivm project/issues (`https://github.com/sraoss/pg_ivm`).

## S53-02 HotSpot code cache — bounded unresolved locator

Current OpenJDK source exposes segmented code heaps, allocation/freeing, `UseCodeCacheFlushing`, `NmethodSweepActivity`, and code-cache pressure accounting. This is enough to distinguish the object from a generic allocator, but not enough to freeze a legal method-relocation interface, a versioned natural/canonical carrier, and a stock semantic oracle together. The screen does not claim that relocation is absent: no full default/non-default union or direct-collision review was completed.

- Identity preflight: no exact five-field hit found in this registry lookup; this is not a novelty finding.
- Raw gate failure: carrier/oracle plus atomic relocation legality remain unclosed; a generic compactor cannot enter raw.
- Disposition: `LOCATOR_ONLY__RQ_BACKLOG__HOTSPOT_RELOCATION_SEMANTICS_AND_CARRIER_UNFROZEN`.
- Source: OpenJDK current `codeCache.cpp` (`https://github.com/openjdk/jdk/blob/master/src/hotspot/share/code/codeCache.cpp`).

## S53-03 Bazel build graph — structural generic collapse

Bazel's official project description already describes rebuilding only necessary work through optimized dependency analysis, local/distributed caching, and incremental builds. The seed did not name a target-specific action beyond that native incremental/caching union, nor a non-generic fixed guarantee. A threshold/TTL or cache-policy rewrite is excluded by the assignment contract.

- Identity preflight: no exact five-field historical match was used as an exclusion; the collapse is the current native/generic action itself.
- Disposition: `STRUCTURAL_DROP__CURRENT_NATIVE_INCREMENTAL_BUILD_UNION_AND_GENERIC_CACHE_KERNEL`.
- Source: Bazel official repository (`https://github.com/bazelbuild/bazel`) and build reference (`https://bazel.build/concepts/build-ref`).

## Screen boundary

Current-source reads were bounded to official documentation/repositories. No paper-own constructor, future-work statement, issue text, parameter controller, generic solver, or absence claim was used to create a raw family. No current-implementation absence claim was made.
