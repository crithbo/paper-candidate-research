# Source and collision matrix

| Role | First-party source | Support | Boundary |
|---|---|---|---|
| Build/action union | [EROFS Build & Mount](https://erofs.docs.kernel.org/en/latest/mkfs.html) | `mkfs.erofs` options for compression, pclusters, fragments, tail packing, dedupe, and tar data order; official size/random-access caution. | Not a commit-pinned internal action enumeration. |
| Native semantics | [Linux EROFS documentation](https://www.kernel.org/doc/html/latest/filesystems/erofs.html) | Image semantics, compression, fragments, dedupe, and native mkfs/fsck/dump tools. | Does not close current writer internals. |
| Cost rationale | [EROFS Technical Design](https://erofs.docs.kernel.org/en/latest/design.html) | Compression/dedupe structure and performance/memory design tradeoffs. | Not an algorithmic residual. |
| On-disk constraint | [Chunk-based inode layout](https://erofs.docs.kernel.org/en/latest/ondisk/chunked_format.html) | Chunk-based inode fields and consecutive physical-block mappings. | No proof of a global planner gap. |

## Collision conclusion

No collision-free conclusion is claimed. The official `mkfs.erofs` union already covers several purported primitive actions and exposes their tradeoffs. Reopening requires commit-pinned erofs-utils/kernel source paths plus primary same-object collision closure and an explicit global guarantee beyond native feature composition.
