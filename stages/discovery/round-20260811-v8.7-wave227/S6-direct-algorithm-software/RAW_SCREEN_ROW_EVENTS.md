# Raw screen row events

| Row | First-party evidence | Frozen fact / action implication | Outcome |
|---|---|---|---|
| R1 | EROFS build documentation | `mkfs.erofs` exposes compressor/level, physical cluster size, fragments, tail packing, all-fragments, dedupe, timestamps, block size, and tar-order controls. | strong union component |
| R2 | EROFS kernel documentation | EROFS is a read-only image filesystem with optional compression, fragments, and deduplication; `mkfs.erofs`, `fsck.erofs`, and `dump.erofs` are native tools. | reader/oracle route |
| R3 | EROFS technical design | Fixed-size compression, small pclusters, and deduplicated multi-reference pclusters deliberately trade image density, memory, and random-access behavior. | full-cost requirement |
| R4 | EROFS on-disk/chunk documentation | Chunked layouts and physical-cluster representations impose concrete block/address/index constraints. | retain for depth |
| R5 | Current-source closure | Current erofs-utils and kernel revisions, implementation paths for order/cluster/fragment/dedup, and all defaults/nondefaults were not source-pinned. | `NOT_ADMITTED_UNFROZEN` |

R5 is not a claim that the native tools lack a global constructor. Documentation alone cannot establish that absence.
