# Unique opportunity family

## SST restart/block/index/filter joint planner — conditional residual

**Exact same object.** One `BlockBasedTable` SST for a fixed sorted KV manifest,
comparator, internal-key/version policy, checksum policy, compression choice and
reader-visible point/range/full-scan answers. The native oracle is the stock
RocksDB table/SST reader with checksum verification plus manifest-versus-scan
digest equivalence.

**Complete action catalogue to close.** A faithful candidate would have to include
data-block boundary sequence; data `block_restart_interval`; key-delta/restart
encoding; index representation/search type, `index_block_restart_interval`,
separator-shortening and partition boundary sequence; full/partitioned filter
policy and partition boundaries; format version; compression parameters; and
cache/pinning/read settings that affect the measured denominator. Regenerating
every data/meta/index handle, footer, properties and checksum is part of the
action, not a post-processing detail.

**Minimal legal action-divergence witness.** Take a sorted manifest with at least
three blocks under one legal cut. A second encoding may move one boundary and use
a different legal restart interval, then rebuild its index/filter handles. Both
files can retain exactly the same KV scan and lookup answers under the stock
reader while having different bytes and read paths. This demonstrates a
same-object action space; it does **not** demonstrate that the current union
cannot express the second choice.

**Possible N2 only if closed.** Given a frozen workload trace and a bounded
finite-state representation of block/restart/index/filter state, develop an
exact/FPT/Pareto construction that jointly chooses the whole boundary plan with
a stated cost/quality guarantee. The direct subtractor is the strongest current
RocksDB composition that may choose supported table options and official
partitioned-index/filter machinery with identical manifest, trace, compression,
cache budget and validation. The algorithm may use existing actions, but cannot
be a grid search or generic optimizer.

**Natural carrier and full cost.** A finite route is a version-pinned public
YCSB-compatible KV load/point/range trace converted without key reordering into
a sorted manifest. The ledger must include table build/write CPU/wall/RSS/temp
and SST bytes; open/checksum/full scan; point/range reader CPU/wall/RSS,
cache/I/O policy and decompression; plus validation failures. No result is
claimed here.

**Structural potential.** `TIER_B_Q2_VIABLE` only conditionally: a genuine joint
algorithm with a trace-independent approximation/exactness statement and
full-cost natural evidence could have Q2 shape. **Current evidence readiness:**
low, because source-level union and direct collision closure are incomplete.

**Finite 72h Stage-A killer if later admitted.** Pin a specific upstream commit;
construct two native-legal SST witnesses; replay every exposed producer option
and same-information composition; run stock read/checksum/scan equivalence; and
terminate the topic if (a) the candidate action is expressible by that union,
(b) any comparator/native semantic differs, (c) the promised finite-state
objective needs changed format/reader, or (d) no nontrivial guarantee remains
after charging build/read/RSS/bytes.
