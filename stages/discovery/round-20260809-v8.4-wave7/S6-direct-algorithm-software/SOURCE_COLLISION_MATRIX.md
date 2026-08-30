# S6 Wave 7 — action-space and collision matrix

Primary paper originals and official/upstream artifacts only, checked through 2026-08-09. No experiment was run.

| ID | Exact object / natural carrier | Strong same-object union frozen first | Collision/subtractor | Classification | Decision |
|---|---|---|---|---|---|
| `ROCKSDB-DICT-COVER` | Fixed sorted natural-record KV manifest → one dictionary-compressed RocksDB BlockBasedTable SST | No dictionary; raw sample and Zstd-trained per-SST dictionary modes; legal finite dictionary/train/buffer/block/level settings; same-budget uniform/random reservoirs | Official RocksDB [design](https://rocksdb.org/blog/2021/05/31/dictionary-compression.html) defines per-SST buffered training/persistence and costs; official [format](https://github.com/facebook/rocksdb/wiki/Rocksdb-BlockBasedTable-Format) documents uniform random 64B samples; official [Zstd builder](https://github.com/facebook/zstd/blob/dev/programs/zstd.1.md) supplies Cover/FastCover and random capping. | Existing modes are `DIRECT_SUBTRACT`; only internal, same-budget online retained-cover construction is `SEARCH_BOUNDED_OPEN`. | **One `PROPOSE_STAGE0`, Tier B.** |
| `W7-D1-ROCKSDB-DICT-PARAMETERS` | Same SST with changed `max_dict_bytes`, Zstd train bytes/level, block size, cache setting | Current exposed settings | RocksDB and Zstd explicitly expose the settings and tradeoffs. | `ROUTINE_TUNING` | Drop. |
| `W7-D2-ROCKSDB-CROSS-SST-DICT-MANAGER` | Column-family/global/shared dictionaries | RocksDB per-SST format; Cassandra/Scylla table-level approaches | It changes dictionary scope/reader/compatibility and becomes system policy, not the frozen SST object. | `CHANGED_OBJECT_CONTROLLER` | Drop. |
| `W7-D3-EXTERNAL-KV-REORDER-THEN-COMPRESS` | Reorder natural records then send to current builder | Sorted KV contract | Changing sort key/order changes SST range/index/iteration properties; leaving it external is pipeline glue. | `SAME_OBJECT_FAIL_WRAPPER` | Drop. |

## Residual gate

No proposal may state that it improves Zstd training generally or outperforms a default RocksDB option. The only retained action is a budgeted per-SST training-input construction, using the existing trainer and metadata. Stage A must demonstrate an action difference against the full union before measuring a paper claim.
