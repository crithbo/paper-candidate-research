# Candidate-grade deep review

## F1 — EROFS global layout constructor

**Disposition:** `NOT_ADMITTED_UNFROZEN`; no brief.

| Gate | Frozen record |
|---|---|
| Exact object | Same tree/file bytes/metadata/xattrs and stock kernel EROFS semantics, including fixed externally observable path and directory behavior. |
| Native action catalog | File/data order; inline/fragment/tail assignment; physical clusters; compatible compressed cluster references; dedup; metadata and block-address regeneration; native compressor choice only as a fixed contract parameter. |
| Strongest current union | `mkfs.erofs` default and nondefault compressor, `-C`, fragments, ztailpacking, all-fragments, dedupe, block/time/tar/sort features; kernel on-disk compressed/chunked acceptance and fsck/dump tooling. Full source union is unclosed. |
| Legal witness | The same two-file content can legally use ordinary extents or native fragments with regenerated references when the feature is enabled. This is not a union-external action certificate. |
| Putative N2 | Global construction optimizing bytes and access/decompression costs subject to format constraints, with a formal approximation/quality guarantee. None is distinguished from native mechanisms. |
| Natural carrier | Versioned public rootfs or container-image tree. |
| Full cost | Image bytes; mkfs CPU/wall/RSS/temp; fsck/dump/mount validation; cold/random/sequential read and decompression CPU/RSS/I/O; any rewrite or metadata overhead. |
| 72h killer | Pin erofs-utils and Linux revisions; enumerate mkfs layout/fragment/dedup/cluster/order paths plus all flags/defaults; construct the two-file feature witness; verify same tree via stock tools; reject if current union expresses the action, observables differ, only compression parameters remain, or full costs erase gains. |
| Fidelity closure | Finite but incomplete: source/options and direct-collision closure precede an action-gap claim. |

### Residual audit

- The candidate must jointly choose format-native actions using no extra information beyond the fixed tree and native constraints.
- Image bytes alone do not suffice: official documentation explicitly warns that large clusters/fragments can hurt random access or memory.
- Generic bin packing, external recompression, changed readdir observables, and compression-level sweeps are excluded.
- The withheld state is caused by incomplete union/collision closure, not by absent implementation, results, resources, or AI readiness.
