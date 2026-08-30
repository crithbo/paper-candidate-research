# Unique opportunity families

All rows preserve the native object: a fixed initial state, a versioned update/fsync or write trace, a crash cut, stock recovery, and the stock observable contract.

| Deep ID | Exact object and stock oracle | Concrete two-action witness | Natural carrier and full cost |
|---|---|---|---|
| D01 | ext4 filesystem, VFS update/fsync trace, crash cut, mount/fsck/readback oracle | Fast-Commit-eligible logical logging versus JBD2 fallback for a complex/ineligible operation | xfstests/ext4 regression traces; compile CPU/RSS, journal bytes, flushes, fsync latency, replay time |
| D02 | OpenZFS dataset/zvol, synchronous write trace, crash cut, import/replay/readback oracle | ZIL intent-log durability versus transaction-group propagation | OpenZFS functional traces; CPU/RSS, log bytes, flushes, import/replay time, on-disk amplification |
| D03 | ZooKeeper data tree, transaction sequence, crash cut, server restart/read oracle | Recovery from snapshot plus ordered transaction log versus a later snapshot base | ZooKeeper server/regression traces; CPU/RSS, snapshot/log bytes, restart/replay time, request latency |

The witness only proves that native legal histories make distinct partial-commit choices. It is not evidence that a new construction exists.
