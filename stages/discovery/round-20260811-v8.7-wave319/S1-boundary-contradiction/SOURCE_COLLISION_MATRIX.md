# SOURCE_COLLISION_MATRIX

| Question | First-party / primary source pinned 2026-08-11 | What it establishes |
|---|---|---|
| Why tree log differs from full commit | [Linux current `tree-log.c`](https://github.com/torvalds/linux/blob/master/fs/btrfs/tree-log.c) | The source comment calls tree logging a special WAL for fsync/O_SYNC, copies items selected by transaction/key ranges, writes a per-root log tree and replays it after crash. |
| Whether a full commit is an explicit current branch | [same source, `start_log_trans`](https://github.com/torvalds/linux/blob/master/fs/btrfs/tree-log.c#L2645) | `btrfs_need_log_full_commit()` returns `BTRFS_LOG_FORCE_COMMIT`; zoned log-transaction handling also forces commit. |
| Global commit state/ownership | [Linux current `transaction.c`](https://github.com/torvalds/linux/blob/master/fs/btrfs/transaction.c#L2275) | One simultaneous commit caller wins; others wait; commit states constrain later transaction entry and complete after tree/superblock write. |
| Public current Btrfs contract | [Linux Btrfs documentation](https://docs.kernel.org/filesystems/btrfs.html) | Official filesystem context; it does not alone prove source-level absence. |
| Historical/direct crash-consistency subtractor | [CrashMonkey/ACE, OSDI 2018](https://www.usenix.org/system/files/osdi18-mohan.pdf) | Btrfs crash-consistency bugs and a concrete historical fsync/recovery trace; testing/diagnosis, not a current same-object N2 constructor. |
| Cross-layer non-subtractor | [ATC 2025 cache crash consistency](https://www.usenix.org/system/files/atc25-duan-shaohua.pdf) | Changes the cache/filesystem compatibility layer; cannot absorb or support a Btrfs-native action claim. |

No issue, old release note, or future-work statement is used to establish an implementation absence.
