# Source and collision matrix

| Family | First-party/current evidence consulted | Primary collision status | Outcome |
|---|---|---|---|
| ext4 Fast Commit | Linux current `fs/ext4/fast_commit.c`; kernel ext4 documentation | FastCommit, USENIX ATC 2024, direct same-object mechanism | `DROP`: current hybrid design absorbs the apparent action rule |
| OpenZFS ZIL | OpenZFS current `module/zfs` source tree; official workload-tuning documentation | Not closed to required primary same-object level | `NOT_ADMITTED_UNFROZEN` |
| ZooKeeper snapshot/log | Apache ZooKeeper current administration documentation and upstream persistence source route | Not closed to required primary same-object level | `NOT_ADMITTED_UNFROZEN` |
| F2FS | Official project/primary OSDI'25 route identified | Complete current union not frozen | `NOT_ADMITTED_UNFROZEN` |
| BookKeeper, Cassandra, LevelDB, bcachefs, Mercurial, JFS | Official/upstream routes identified during raw screen | No claim of absence or novelty made | `NOT_ADMITTED_UNFROZEN` |

No old issue, future-work statement, or missing implementation was treated as proof of a residual.
