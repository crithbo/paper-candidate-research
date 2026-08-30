# UNIQUE_OPPORTUNITY_FAMILIES

Natural carriers/oracles: btrfs/ext4/XFS images, LMDB databases, LevelDB workloads and Lucene indexes; native post-crash recovery/checker/reader is the oracle. Full cost includes construction, metadata/data writes, flushes, recovery, space, latency, memory and recovered state. Every whole-action sketch collapses to native log/COW/commit construction plus excluded scheduling; none is admitted.
