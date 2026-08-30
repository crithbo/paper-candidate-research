# Current upstream reality check — RocksDB multi-SST dictionary portfolio

## Frozen identity and cutoff

- Check date: `2026-08-26`
- Exact current stable tag: `facebook/rocksdb v11.1.2` (official release page, 2026-06-24).
- Moving current source inspected: `facebook/rocksdb refs/heads/main` on 2026-08-26; exact main commit was unavailable because the shell Git route failed at Schannel before receiving bytes and the connector did not expose a full commit hash. No retry or absence inference was made from that failure.
- Dated implementation fallback: accepted RocksDB commit `1dfa7297933df05237ac11376d6cb69d32591b1d` and Zstd commit `82d322c4973d9e2968d94047a40892bc6d9a9bdf` from the predecessor package, used only to bound a future engineering route—not to prove current absence.

## Official documentation and current source

1. Current Dictionary Compression documentation calls `max_dict_bytes` a per-file dictionary size and describes constructing a dictionary for each SST in a subcompaction from buffered data blocks.
2. Current `BlockBasedTableBuilder` has a per-builder/per-file `data_block_buffers` collection. `MaybeEnterUnbuffered` samples those blocks, creates one specialized compressor, obtains one serialized dictionary, replays that file’s blocks, and `Finish` writes the dictionary meta-block into that SST.
3. Verification comments explicitly describe a dictionary sampled/trained "from this file".
4. Current source exposes aggregate compression/sampling/rejection/bypass counters, but the bounded loci do not expose selected-fragment identity, final-dictionary membership, or dictionary-offset matches for each compressed block.

## Default and non-default configuration surface

Checked current controls:

- `CompressionOptions::max_dict_bytes`
- `CompressionOptions::zstd_max_train_bytes`
- `CompressionOptions::max_dict_buffer_bytes`
- `CompressionOptions::use_zstd_dict_trainer`
- `CompressionOptions::parallel_threads`
- ordinary versus `bottommost_compression_opts`
- block-cache charging for `kCompressionDictionaryBuildingBuffer`
- current custom `CompressionManager` extension point and format-version compatibility
- native `BlockBasedTableOptions` including 4096-byte block configuration

None of these configuration entries, alone or as a finite ordinary configuration grid, specifies a bounded collection-level dictionary portfolio, jointly assigns dictionaries to SSTs, charges duplicate dictionary bytes per assigned SST in the optimizer, or supplies the required causal trace. A custom `CompressionManager` is an implementation vehicle and strong deployment baseline; generic extensibility does not itself implement the candidate algorithm.

## Contrary evidence and subtraction

- Historical RocksDB documentation describes a subcompaction path in which a dictionary from the first output file was reused/stored in subsequent output SSTs. Therefore "share one dictionary across SSTs" is already known and cannot be claimed.
- DCC’01 formalizes selecting multiple preset dictionaries and assigning the best dictionary to each object as compression segmentation and proves natural variants NP-hard. Therefore dictionary-family selection/assignment is not a new abstraction.
- WSDM’19 and earlier cited work use suites of dictionaries, select a matching dictionary for each block, signal the selector, and study compression/decoding trade-offs. Therefore per-block selector mechanics are not novel.
- Zstd already provides dictionary training, cover/fastCover, dictionary IDs, prepared `CDict`s and reuse. These are primitives/strong baselines, not contributions.

## Bounded residual

The only residual not directly expressed in the checked union is a RocksDB-specific algorithm that jointly handles:

1. a result-independent legal native multi-SST construction for the exact 20-manifest logical dataset;
2. one global retained-sample budget across SSTs;
3. a bounded dictionary portfolio and per-SST assignment;
4. reader-local dictionary meta-block duplication cost, compaction/build order and memory limits;
5. unchanged 4096-byte blocks, ZDICT/Zstd and ordered KV/checksum semantics;
6. content-addressed retained-fragment → final dictionary → dictionary-offset compressed-block match evidence.

This is `SEARCH_BOUNDED_OPEN`, not a global novelty claim. Stage 0 must independently recheck recent systems/storage literature, current PR/issue/source union and whether the proposed solver is more than generic compression segmentation/facility location with RocksDB nouns.

## Disposition

- Current native direct fatal: `NONE_FOUND_WITHIN_BOUND`
- Historical/current subtraction: `MAJOR`
- Fidelity route: `FINITE_CONDITIONAL`
- Claim ceiling: `TIER_B_Q2_VIABLE only if the target-specific constrained algorithm and strong-baseline residual survive independent Stage 0; Q1 remains conditional on broad natural evidence and algorithmic depth.`
