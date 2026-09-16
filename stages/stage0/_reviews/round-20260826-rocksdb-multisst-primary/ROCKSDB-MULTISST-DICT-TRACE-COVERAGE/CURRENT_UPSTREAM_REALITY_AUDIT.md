# ROCKSDB-MULTISST-DICT-TRACE-COVERAGE — Independent current-upstream audit

## Scope and cutoff

- Independent check date: `2026-08-26`
- Evidence ceiling: current official documentation and source inspection only; no candidate build, implementation, or experiment.
- Network stop: `30/30` frozen connector attempts consumed. Search remains `SEARCH_BOUNDED_OPEN`; no global absence claim is made.
- Discovery's `v11.1.2` is retained as a reproducible release tag, but it is not accepted as the sole current identity.

## Current identities

1. The official [RocksDB releases page](https://github.com/facebook/rocksdb/releases) exposed `v11.1.2` (`3b44608`) in the indexed release snapshot.
2. The official [main-branch commit history](https://github.com/facebook/rocksdb/commits) was read on 2026-08-26 and identified the visible head link as `e6a2ee0bd211489e64a45a6a0f6ce1dc67e195d7` (2026-08-22). The same history includes the 2026-08-20 commit “Update version to 11.10.0 for 11.9 release,” so the Discovery statement that `v11.1.2` is the current stable line is stale or at least insufficiently current.
3. The current-main builder content was inspected through the official [raw `block_based_table_builder.cc`](https://raw.githubusercontent.com/facebook/rocksdb/main/table/block_based/block_based_table_builder.cc). The connector could not cache-pin that raw body to the full head SHA, so the content identity is `MAIN_DATED_READ_20260826__HEAD_LINK_SEPARATELY_VERIFIED`, not a content-hash-pinned snapshot.

## Current builder and dictionary path

- The official [Dictionary Compression](https://github.com/facebook/rocksdb/wiki/Dictionary-Compression) documentation still specifies `CompressionOptions::max_dict_bytes` as a maximum per-file dictionary size and describes training a dictionary for each SST from buffered blocks in that file.
- The official [Compression](https://github.com/facebook/rocksdb/wiki/Compression) page describes a dictionary stored with each SST.
- Current `BlockBasedTableBuilder` keeps file-local `data_block_buffers`, builds `Compressor::DictSamples`, specializes one data-block compressor, obtains one `GetSerializedDict()`, and writes one compression-dictionary meta block into the current SST.
- Current builder source exposes the exact serialized dictionary and verification-decompressor construction, but the checked loci do not expose retained-fragment identity or dictionary-offset matches for every compressed block.

## Default and non-default surface

The independent union includes:

- `max_dict_bytes`, `zstd_max_train_bytes`, `max_dict_buffer_bytes`, `use_zstd_dict_trainer`, and `parallel_threads`;
- ordinary and `bottommost_compression_opts` paths;
- 4096-byte `BlockBasedTableOptions::block_size`, format version, checksums, and reader compatibility;
- `CompressionManager`, including current support for mixing compression algorithms in one file;
- current integrated ratio-aware compression AutoSkip and its inter-file carryover of a compression-ratio estimate.

The AutoSkip/CompressionManager surface is a material Discovery omission and must be part of any current strong baseline. It changes whether/how blocks attempt compression and can carry a ratio estimate across files, but it does not train a collection-level dictionary portfolio, allocate a global dictionary-training sample budget, assign portfolio dictionaries to SSTs, or emit the required dictionary-match causal trace.

## Current-union verdict

- Native current full action: `NOT_FOUND_WITHIN_BOUND`
- Historical one-shared-dictionary reuse: `DIRECT_SUBTRACT`
- AutoSkip/CompressionManager: `CURRENT_NATIVE_ADJACENT__STRONG_DEPLOYMENT_BASELINE`
- Generic multi-dictionary selection: `GENERIC_KERNEL__DIRECT_SUBTRACT`
- Exact current stable release identity: `OPEN_BOUNDED__DISCOVERY_TAG_STALE`
- Direct fatal from current upstream alone: `NO`

The current implementation can host custom behavior, but generic extensibility is not evidence that the candidate algorithm is already implemented. Conversely, extensibility does not create novelty for an algorithm whose optimization kernel is already generic.

## Recent storage-literature closure

The bounded search covered current RocksDB/Zstd sources, DCC multi-dictionary segmentation, WSDM multi-dictionary selection, CIDR RocksDB space-amplification work, FAST storage compression, and recent LSM compaction literature including the 2025 EDBT partial-compaction study. The recent storage results found in this bound address compaction, write/space amplification, or device-transparent compression; none was read deeply enough to establish same-object direct coverage of the complete candidate action. This remains a bounded-negative locator result, not a novelty proof.

