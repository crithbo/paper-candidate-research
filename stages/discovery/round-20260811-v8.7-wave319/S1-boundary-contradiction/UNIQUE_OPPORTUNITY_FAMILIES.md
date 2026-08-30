# UNIQUE_OPPORTUNITY_FAMILIES

## U01 — Btrfs fsync tree-log / full-transaction recovery seam

**Exact same-object contract.** A fixed Btrfs initial filesystem, an ordered versioned `create/write/link/rename/unlink/fsync` trace, a specified crash cut and subsequent stock mount/recovery. The candidate must preserve the same durable result for every completed fsync, mountability, checksums, and stock observable namespace/data semantics. It may not weaken to “metadata consistent only”, substitute a different filesystem, or modify the crash model.

**Current complete union.** The Linux current `fs/btrfs/tree-log.c` tree-log path is a special WAL for fsync/O_SYNC that copies changed file/directory items selected by key ranges and transaction ids, writes the per-subvolume log tree, and replays it after crash. `start_log_trans` selects `BTRFS_LOG_FORCE_COMMIT` whenever `btrfs_need_log_full_commit()` requires it; in zoned mode it also forces full commit to avoid mixing log transactions. It includes log-writer counting, join/wait, replay pinning, checksums/error-abort paths. `fs/btrfs/transaction.c` defines commit winner/waiter state transitions, blocking types, delayed references and superblock completion. The stock action space is therefore not merely an `fsync` flag: log, join/wait, forced full commit, replay and abort are all native branches.

**Natural route / oracle / cost.** Linux xfstests Btrfs fsync/log-replay cases plus a bounded public fstests-style versioned metadata trace; stock mount, `btrfs check`, file/hash/namespace comparison, dmesg error state. Full cost: CPU/RSS, data+metadata+log writes, flushes, log-tree blocks, full-commit blocks, fsync latency, recovery/mount time and checker time.
