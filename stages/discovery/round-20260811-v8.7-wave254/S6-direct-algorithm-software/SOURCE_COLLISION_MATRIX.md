# Source and collision matrix

| Source (primary/official) | What it establishes | Collision / baseline consequence |
|---|---|---|
| [RocksDB BlockBasedTable format](https://github.com/facebook/rocksdb/wiki/Rocksdb-BlockBasedTable-Format) | Sorted KV data blocks, metadata/index/filter layout, block handles, footer, optional compression and table properties. | Fixes the native object and shows that regenerated handles are required. It does not establish a residual. |
| [RocksDB index-block format](https://github.com/facebook/rocksdb/wiki/Index-Block-Format) | Index key/handle semantics, separate index restart interval, separator shortening, first-key and two-level index variants. | A fair union includes these native actions; a restart-only idea is not enough. |
| [RocksDB partitioned index/filter article](https://rocksdb.org/blog/2017/05/12/partitioned-index-filter.html) | Native partitioning changes index/filter read and cache costs through top-level and on-demand partitions. | Direct same-object subtractor; any planner must subtract partitioned construction, not a monolithic-index baseline. |
| [RocksDB current releases](https://github.com/facebook/rocksdb/releases) | Current 11.1.0 notes advertise `kAuto` per-index-block binary/interpolation selection and configurable uniformity threshold. | Latest current union is broader than historic fixed-index choices. |
| [RocksDB source tree](https://github.com/facebook/rocksdb) | Authoritative location for `include/rocksdb/table.h` and block-based builder/factory paths. | Required next source pin; not treated as exhaustively audited in this package. |
| [bloomRF primary paper](https://arxiv.org/abs/2012.15596) | A nontrivial filter mechanism evaluated in RocksDB. | Adjacent direct collision that must be subtracted if filter construction is part of a future claim. |
| [RocksDB learned-index paper](https://arxiv.org/abs/2605.23815) | Recent storage-level block-aware learned-index direction mentioning RocksDB. | Recent collision lead only; its exact same-object/action scope needs primary-artifact audit before admission. |

**Collision verdict:** not closed. The official native partitioning and current
auto-index mechanisms are already strong same-object components, while the
primary literature/tool comparison has not been fully audited. Therefore this
matrix supports `NOT_ADMITTED_UNFROZEN`, not novelty.
