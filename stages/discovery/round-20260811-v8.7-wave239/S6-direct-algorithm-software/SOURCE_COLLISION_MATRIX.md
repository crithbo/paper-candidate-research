# Source and collision matrix

| Claim/use | Primary source | What it establishes | Limitation / opposite evidence |
|---|---|---|---|
| Native reader/format contract | Linux kernel, [SquashFS 4.0 filesystem documentation](https://docs.kernel.org/filesystems/squashfs.html) | Read-only compressed filesystem; data blocks/fragments, lookup tables, compression options, sorted directories and xattrs are reader-format facts. | Does not enumerate `mksquashfs` producer composition or establish an algorithmic residual. |
| Current upstream identity/release | [Official squashfs-tools repository](https://github.com/plougher/squashfs-tools) | Identifies the official repository, master branch and 4.7.5 as latest release at review time. | Repository landing page alone is insufficient to prove all action paths. |
| Current producer action controls | [Current `mksquashfs.c`](https://raw.githubusercontent.com/plougher/squashfs-tools/master/squashfs-tools/mksquashfs.c) | Declares fragment, duplicate, block-size, xattr, sort, compressor, queue/order and option-table state. | Required source-level call-path/default/config interaction enumeration is unfinished. |
| Fragment/default behavior and existing mechanisms | [Upstream README 4.7.4](https://github.com/plougher/squashfs-tools/blob/master/Documentation/4.7.4/README.md) | Documents default small-file fragment packing, `-no-fragments`, `-no-duplicates`, block/compressor options, reproducibility/order changes and `align` actions. | It is strong contrary evidence to a simplistic “tool only uses fixed local packing” assertion; not a complete latest collision survey. |
| Direct same-object collision | No primary paper/tool collision set was closed in this assignment. | — | Open collision is an admission blocker, not evidence of novelty. |

Frozen review cutoff: 2026-08-11. Only official upstream/kernel sources were used. The current source retrieval is master-at-retrieval; a StageA fidelity plan must record an immutable commit before any claim-bearing comparison.
