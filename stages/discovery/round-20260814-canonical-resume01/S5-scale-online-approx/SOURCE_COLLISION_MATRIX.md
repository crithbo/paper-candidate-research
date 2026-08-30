# Source and collision matrix

| Family | First-party current source | Native action/flags checked | Direct collision conclusion |
|---|---|---|---|
| SVN FSFS | Apache Subversion [filesystem API](https://subversion.apache.org/docs/api/latest/group__fs__handling.html) and [1.9 FSFS notes](https://subversion.apache.org/docs/release-notes/1.9) | `svn_fs_pack`, `svnadmin pack -M`, format-7 logical addressing, index consistency, `fsfs-block-read`, shard size/cache flags | Native pack already reorders/updates the same packed shard while preserving FSFS semantics. |
| restic | Official [repository design](https://github.com/restic/restic/blob/master/doc/design.rst) and [prune documentation](https://restic.readthedocs.io/en/latest/060_forget.html) | snapshot scan; keep/remove/repack decision; max-unused, max-repack-size, cacheable-only, smaller-than, compression, dry-run | Native prune expresses the complete recourse/repack action and explicitly counts remote/scratch constraints. |
| Borg | Official [data structures](https://borgbackup.readthedocs.io/en/stable/internals/data-structures.html) and [compact command](https://borgbackup.readthedocs.io/en/stable/usage/compact.html) | compact, threshold (default 10%), cleanup-commits, dry-run; append-only restriction | Native compact is the same segment reclamation action; a threshold schedule is not a new algorithm. |

Search boundary: official documentation/source and primary upstream material,
accessed 2026-08-14. No issue, release-note-only, or future-work statement was
used to prove an absence.
