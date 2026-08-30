# Source and collision matrix — Wave343

| Family | Official current source | Existing coupled state machinery | Result |
|---|---|---|---|
| ext4/JBD2 | [ext4 journal](https://www.kernel.org/doc/html/latest/filesystems/ext4/journal.html), [journalling API](https://cdn.kernel.org/doc/html/latest/filesystems/journalling.html) | Commit records, checksums, replay and already-supported idempotent fast commits/full fallback. | NOT_ADMITTED_UNFROZEN. |
| PostgreSQL WAL | [WAL reliability](https://www.postgresql.org/docs/current/wal-reliability.html), [WAL chapter](https://www.postgresql.org/docs/current/wal.html) | CRC-protected WAL and stock recovery/rebuild semantics. | NOT_ADMITTED_UNFROZEN. |
| OpenZFS | [send and receive](https://openzfs.github.io/openzfs-docs/Basic%20Concepts/Operations/Send%20and%20Receive.html) | Snapshot stream/receive semantics, incremental base and checksummed destination. | NOT_ADMITTED_UNFROZEN. |
| XFS/btrfs/etcd/Redis/Kubernetes | Current official source/spec needed for action closure. | No legal atomic witness at breadth stage. | Raw. |

## Collision conclusion

No direct same-object collision or novelty clearance is asserted. The current mechanisms are strongest baseline union components, and no union-external complete action has crossed the witness gate.
