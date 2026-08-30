# Source / collision / bounded-constructor matrix — WAVE46

## Current-upstream reality record

Current official sources cited in `DISCOVERY_LOG.md` were checked at the frozen cutoff. Native configuration/action surfaces are strong baselines, but only replay of the candidate's full decision rule, information, complexity, guarantee and full-cost denominator can absorb it.

| Lineage | Complete candidate action / state | Information | Recurrence or guarantee | Current union and full cost | Natural killer | Verdict |
|---|---|---|---|---|---|---|
| **GIN posting-tree** | For each key's sorted TID sequence, choose legal page-cut positions and posting-tree levels under fixed page capacity, legal fill bound and max depth; emit normal GIN posting pages. State `D[i,h]` = minimal charged expected cost for suffix starting at TID `i` with remaining height `h`; transition over legal next cut `j` and legal child-page state. | Same sorted TIDs, existing page/layout constraints, and a pre-frozen natural query-log key/access frequency available equally to an offline baseline. No future timing oracle. | Exact index/query semantics. DP finds an optimum for the finite additive leaf/internal-page cost model (or stated bounded approximation after state pruning). | GIN posting list/tree, pending-list/fastupdate option, bulk insert and all native page/build paths. Charge build, WAL, index bytes, vacuum/pending cleanup, cache-cold/warm query page reads and updates. | Pin current PostgreSQL source/options. Drop if bulk build already realizes equivalent trace-aware cut/height DP, if legal pages cannot be read unchanged, or if no natural stratum has charged residual. | `PROPOSE_STAGE0` conditional. |
| BRIN | Range summary/page selection | table order/query bounds | no new state beyond pages-per-range | native range/autosummarization; build/index/scan | no non-config action | `DROP__SELECTOR` |
| Cassandra SSTable | block-cut/index/codec choices | sorted partitions/workload | no reader-compatible new recurrence isolated | native SSTable/compression + write/read/compaction | changed reader or config | `DROP__OBJECT_CHANGE_OR_SELECTOR` |
| LLD layout | section permutation under constraints | symbol/profile order | external DP outputs an order file | script/orderfile already expresses final native action; link/runtime costs | wrapper replay | `DROP__WRAPPER` |
| Cranelift allocation | assignment/spill state | MIR/interference | allocator is native final pipeline | allocation/compile/code quality costs | no distinct constructor | `DROP__DIRECT_SUBTRACT` |
| Zstd parse | match/block parse state | input bytes/window | parser/strategy native codec choice | compression/decompression/format cost | no non-tuning action | `DROP__SELECTOR` |

## GIN current-source reality and action-divergence witness

- Current object: PostgreSQL current documentation specifies a key B-tree whose leaf tuple holds either a posting list or pointer to a posting tree; it also specifies pending-list/`fastupdate` behavior and cleanup costs.
- Source facets to pin before claim-bearing work: current PostgreSQL tag/commit, `src/backend/access/gin/` bulk build, insertion and B-tree/page split paths; all GIN reloptions including `fastupdate` and `gin_pending_list_limit`; default and non-default build/pending-list paths.
- Contrary evidence: native bulk insertion, posting-tree construction, page sizing and pending-list cleanup may already instantiate the complete cut action. This is a direct subtractor, not a reason to claim absence now.
- Action-divergence witness: two legal candidate leaf boundaries can have equal byte fill but different frozen query-frequency-weighted page-read contributions and different parent fanout. A fixed fill/greedy build has no proof of minimizing the coupled leaf/internal objective. The witness is invalid if the pinned native build uses the same objective/state recurrence or an equivalent construction.
