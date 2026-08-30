# GIN-POSTING-CUT-DP Source and Collision Audit

- Role: independent Stage 0 PRIMARY source verification
- Cutoff: `2026-08-10`
- Source policy: PostgreSQL official documentation/source mirror and original/publisher paper records only for technical conclusions. Search snippets and transport failures never prove absence.
- Novelty status: `SEARCH_BOUNDED_OPEN`
- Direct fatal found: `no`
- Decisive current-source contradiction: Discovery's local-segmentation novelty is removed because current GIN already uses independent compressed posting-list segments for random access and local updates.

## Input provenance

The Discovery manifest was independently recomputed `4/4 PASS`:

| File | SHA-256 |
|---|---|
| `DISCOVERY_LOG.md` | `2402C3B37ACA74E546AF3CD455B2973ABE10F53F17AB37A702224BD661A929AE` |
| `SOURCE_COLLISION_MATRIX.md` | `C2A2BA42CCAD31C77501406598EFFDE54C8B336545AA002926AE811ED5BBB41B` |
| `GIN-POSTING-CUT-DP_TOPIC_BRIEF.md` | `9715270E28906B28E976A74C990D127A10AA787133697960E9C5BFD94C2D83E6` |
| `handoff.yaml` | `A1BBFE63F661DA9ED45F468B05EC853AE1F5E8CC55DDD2395A7EAE95EE726B33` |
| Manifest self | `7CF1DF10736DCF06D63E6CD0FDEE37666452ADC56969F3E77CC01EED1A9FA698` |

## Current-upstream reality check

### Version pin

- Production documentation: PostgreSQL 18 current documentation as of the cutoff.
- Source branch: `REL_18_STABLE`.
- Observed branch head: [`545e2a9d74c3ccca3189e56a515a5793b782eb9b`](https://github.com/postgres/postgres/commit/545e2a9d74c3ccca3189e56a515a5793b782eb9b), dated 2026-07-20.
- The branch-specific raw cache failed during retrieval. Source semantics were checked against the current official GitHub mirror `master`; the branch head and PostgreSQL 18 docs were separately pinned. This is a provenance limitation, not an absence inference. Stage A must fetch/hash the exact branch files before claim-bearing work.

### Official documentation

1. [PostgreSQL 18 GIN documentation](https://www.postgresql.org/docs/current/gin.html)
   - Confirms one key B-tree whose leaf entry stores either an inline posting list or a pointer to a posting tree.
   - Confirms fast-update pending entries and their cleanup/query overhead.
   - Evidence grade: `A / authoritative current documentation`.

2. [PostgreSQL 18 CREATE INDEX](https://www.postgresql.org/docs/current/sql-createindex.html)
   - GIN storage parameters are `fastupdate` (default on) and per-index `gin_pending_list_limit`.
   - Parallel build, `maintenance_work_mem`, standard/concurrent build and worker controls affect execution resources/path, not per-key trace-aware boundaries.
   - Evidence grade: `A`.

3. [PostgreSQL current GIN tips](https://www.postgresql.org/docs/current/gin-tips.html)
   - Covers build-vs-insert, `maintenance_work_mem`, pending-list threshold and `gin_fuzzy_search_limit`.
   - A nonzero fuzzy limit returns a random subset, so it violates the candidate's identical-answer contract and is only a weaker-guarantee reference.
   - Evidence grade: `A`.

### Actual source paths and findings

1. [`src/backend/access/gin/README`](https://raw.githubusercontent.com/postgres/postgres/master/src/backend/access/gin/README)
   - Defines posting trees as B-trees over `ItemPointer` values.
   - Defines independent compressed posting-list segments inside leaf pages; the stated purpose is faster random access and localized re-encoding.
   - Describes right bounds, internal `PostingItem` downlinks, reader traversal, vacuum and concurrency.
   - Collision effect: any claim that the candidate invents sublist/segment partitioning is absorbed.

2. [`gindatapage.c`](https://raw.githubusercontent.com/postgres/postgres/master/src/backend/access/gin/gindatapage.c)
   - Fixed segment sizes: minimum 128, target 256, maximum 384 bytes.
   - `GinDataLeafPageGetItems` skips whole segments based on `advancePast`.
   - `leafRepackItems` and the split path pack build pages tightly; non-build paths balance pages, with an append-oriented 75% heuristic.
   - No inspected symbol consumes a workload trace or solves a global hierarchy objective.

3. [`ginget.c`](https://raw.githubusercontent.com/postgres/postgres/master/src/backend/access/gin/ginget.c)
   - `entryLoadMoreItems` either steps right or descends from the root using `advancePast`.
   - It skips pages whose right bounds are not beyond `advancePast` and loads/decompresses the relevant page/segment.
   - This validates a possible layout-dependent cost signal for multi-key scans. It also shows that mere key frequency is not the event model.

4. [`gininsert.c`](https://raw.githubusercontent.com/postgres/postgres/master/src/backend/access/gin/gininsert.c)
   - Current parallel/bulk build merges sorted TIDs per key and calls native `ginEntryInsert`.
   - Memory trimming changes when buffers flush but no checked path uses query-trace costs.

5. [`ginfast.c`](https://raw.githubusercontent.com/postgres/postgres/master/src/backend/access/gin/ginfast.c)
   - Pending entries are stored in a linear list and later transferred to the regular structure by bulk insertion.
   - This is a mandatory deployment baseline and maintenance cost, not the candidate page constructor.

6. [`gin_private.h`](https://raw.githubusercontent.com/postgres/postgres/master/src/include/access/gin_private.h)
   - Confirms current internal constants/default surfaces, including default fast update.

Additional files required at Stage A pin: `ginbtree.c`, `ginentrypage.c`, `ginpostinglist.c`, `ginvacuum.c`, `ginxlog.c` and matching headers/tests.

## Current action catalog

| Native action/configuration | Candidate relation | Classification |
|---|---|---|
| Inline posting list vs posting tree conversion | same object, native representation | mandatory baseline |
| 128/256/384-byte compressed segment repacking | local partition already native | direct subtract |
| build-full leaf split | fixed heuristic build layout | mandatory baseline |
| non-build 50/50 split | fixed incremental heuristic | mandatory baseline |
| append-oriented ~75% split | fixed incremental heuristic | mandatory baseline |
| `fastupdate` on/off | pending-list deployment choice | finite config baseline |
| `gin_pending_list_limit` | cleanup threshold | finite config baseline |
| serial/parallel build and `maintenance_work_mem` | construction-resource controls | finite config baseline |
| standard/concurrent build | concurrency/build path | finite config baseline |
| VACUUM / pending cleanup / REINDEX | maintenance path | mandatory ledger |
| `gin_fuzzy_search_limit > 0` | changes answer set | weaker-guarantee negative control only |
| trace-conditioned leaf/internal hierarchy | not present in inspected action surface | search-bounded residual |

## Paper and method genealogy

| Source | Verified record | Relevant claim boundary | Classification |
|---|---|---|---|
| Huynh et al., Endure | [official PVLDB PDF](https://www.vldb.org/pvldb/vol15/p1605-huynh.pdf), PVLDB 15(8), 2022, DOI `10.14778/3529337.3529345` | formal workload-conditioned tuning plus engine integration and artifact | Q1/evaluation anchor; methodological adjacent |
| Kimura et al., Compression Aware Physical Database Design | [official PVLDB PDF](https://www.vldb.org/pvldb/vol4/p657-kimura.pdf) | workload-aware physical design must charge size estimation and deployment costs | evaluation/full-cost anchor |
| Tzoumas et al., Workload-Aware Indexing of Continuously Moving Objects | [official PVLDB PDF](https://www.vldb.org/pvldb/vol2/vldb09-225.pdf) | workload-aware index actions can be paper-worthy but require a precise quality contract | domain-shape adjacent |
| Ottaviano and Venturini, Partitioned Elias–Fano Indexes | [publisher DOI](https://dl.acm.org/doi/10.1145/2600428.2609615) | generic partitioning of sorted integer sequences/blocks is not a new GIN contribution | strongest method subtractor; publisher page transport-unavailable, full-text semantic audit deferred |
| PostgreSQL GIN source/docs | links above | exact native representation, scan, construction and maintenance | strongest same-object union |

No source above simultaneously fixes PostgreSQL GIN's exact page format and reader, consumes a complete natural GIN logical scan trace, chooses the whole legal posting hierarchy, preserves maintenance/WAL/concurrency semantics, and proves the candidate frozen-model guarantee. The bounded search therefore remains open rather than novel-by-absence.

## Query-information audit

The Discovery phrase “query-frequency distribution” is not precise enough:

- A scalar frequency `f_k` for one key multiplies the cost of every complete scan of that key by the same constant. It creates no within-key boundary decision.
- Multi-key GIN scans can call `entryLoadMoreItems` with nontrivial `advancePast` values and skip pages/right-link ranges. A candidate may use a frozen sequence of query-key combinations and derive logical scan events from the fixed TID relation.
- The event extractor must be deterministic and independent of the candidate's physical page layout. Otherwise the DP cost table is circular.
- The same training trace must be available to the native configuration union and to the fixed-format partition baseline.
- Test queries must be held out or evaluated under a preregistered train/test chronology to avoid leakage.

## Recurrence audit

The proposed `D[i,h]` is incomplete for the claimed action:

1. It does not represent how multiple child pages are grouped into native internal pages.
2. It omits open internal-page slack/right-bound state or an equivalent bottom-up hierarchy construction.
3. It does not define how the logical trace becomes additive page/segment costs.
4. It says both “choose height” and “outer enumerate root fanout/height” without establishing whether height is independent once the native builder groups children.
5. It does not state polynomial/pseudopolynomial complexity in the number of TIDs, legal intervals, height and trace events.

This is not an implementation-readiness complaint. Until the state is complete, success cannot be distinguished from a generic leaf shortest path plus native full packing.

## Required revision evidence boundary

Atomic gate: `NATIVE_GIN_ADVANCEPAST_TRACE__HIERARCHICAL_PAGECUT_DP_CERTIFICATE`.

The revision may pass without code or performance only if it provides a complete static proposition: event schema, native legal tree class, state/transition/base cases, objective decomposition, complexity, exactness/approximation claim, one hand-checkable legal action-divergence witness and comparator mapping. If it instead needs only key frequencies, local segment weights, threshold selection or a wrapper around `CREATE INDEX`, the direction is structurally below Q2.

## Search log

Queries included:

- PostgreSQL current GIN documentation, storage parameters and pending-list semantics.
- current `gindatapage.c`, `ginget.c`, `gininsert.c`, `ginfast.c`, `gin_private.h` symbols and branch history.
- PostgreSQL GIN posting-tree/page-split optimization.
- workload-aware inverted-index posting partition/page layout.
- query-aware inverted-index compression and sorted-integer partitioning.
- workload-aware physical database design and robust index tuning.

Transport limitations:

- Some GitHub branch-directory/raw commit URLs and ACM publisher pages timed out or returned cache/safe-open errors.
- No absence conclusion uses those failures.
- The decisive current behavior is supported by successfully retrieved official docs/current source; latest literature remains `SEARCH_BOUNDED_OPEN` and must be refreshed before any Stage B claim.

## Source-verification verdict

- Current object and native union: `VERIFIED`.
- Discovery's “no trace-aware DP” claim: `NARROWED_SEARCH_BOUNDED_OPEN`, not verified absence.
- Static structural residual: `PLAUSIBLE_IF_ATOMIC_REVISION_CLOSES`.
- Evidence integrity: no performance, implementation or natural-benefit claim is supported at Stage 0.
