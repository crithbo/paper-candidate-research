# UNIQUE_OPPORTUNITY_FAMILIES

Natural carriers/oracles are respectively btrfs/ext4/XFS filesystem test images, LMDB databases, LevelDB workloads and Lucene indexes; each uses native post-crash checker/replay/reader as oracle. Full cost includes normal construction, metadata/data writes, flushes, recovery/replay, space, latency, memory and recovered observable state. Whole-action sketches all collapse to native log/COW/commit construction plus excluded scheduling, so none is admitted.
