# Unique opportunity family

## F1 — SquashFS joint block/fragment/deduplication image constructor

**Exact object.** Given a fixed source directory tree, file bytes, required metadata and xattrs, fixed SquashFS format version and compression family/options, emit an image accepted by the stock Linux SquashFS reader and `unsquashfs`, with the same decoded tree and bytes. Directory ordering, inode observables and metadata must not be changed merely to manufacture a benefit.

**Static legal freedom witness.** The kernel format permits regular-file data as compressed data blocks and/or a tail fragment, with a fragment lookup table. Upstream source initializes `no_fragments=FALSE`, `always_use_fragments=FALSE`, `duplicate_checking=TRUE`, has a configurable data-block size and maintains fragment, duplicate, sort and ordering machinery. Thus a fixed small/tail-bearing file set has at least the format-level alternatives “tail represented through a legal fragment path” and “legal non-fragment/data-block path”, with regenerated inode/block-list/fragment-table references. This is an action-divergence witness, not evidence that the upstream union lacks a composition.

**Candidate N2 shape, conditional only.** A bicriteria global constructor could jointly assign tails to fragments, select duplicate representatives and schedule legal write groups, with an explicit bound/trade-off between image bytes and a fixed random/sequential decompression-amplification budget. It must be stronger than independent `-sort`, fragment mode, duplicate checking, alignment/action rules and compressor settings. Generic bin packing/ILP, a flag sweep, external recompression, or changing reader-visible directory order is excluded.

**Natural carrier and oracle.** A version-pinned public Buildroot/OpenWrt-style root filesystem tree with recorded manifest, file bytes and xattrs is a natural route. Fidelity oracle: stock `unsquashfs` extraction plus manifest/hash/xattr comparison; where available, stock kernel mount/read must agree. No such run was performed.

**Full-cost denominator.** `mksquashfs` wall/CPU time, peak RSS, temporary space, image bytes and output I/O; stock mount/read plus random and sequential decompression CPU/RSS/I/O; and any lookup/index-memory effects. Compression level, block size and reader thread mode are fixed or charged, never silently optimized away.

**Admission result.** `NOT_ADMITTED_UNFROZEN`. The master source demonstrates a wide compositional action surface (including sort/action, fragment controls, duplicates, parallel ordering, compression and xattrs), but this review did not source-pin and enumerate every relevant call path/default/non-default interaction, nor close the direct same-object algorithmic literature/tool collision. Therefore no claim that the family is outside the strongest current union is warranted.
