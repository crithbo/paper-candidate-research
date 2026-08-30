# Unique opportunity family

## F1 — EROFS tail-pack, pcluster, and image-layout joint planner

**Same-object contract.** Given the same filesystem tree, file bytes, metadata, xattrs, and fixed observable directory/readdir behavior, produce a standards-conforming EROFS image accepted by stock Linux EROFS and `fsck.erofs`/`dump.erofs`. No external wrapper, changed inode names/order visible to readdir, changed reader, or compression-level-only comparison is allowed.

**Putative whole action.** Choose a native-legal file/data layout; assign file tails and small files to inline/fragment handling; select compatible physical-cluster and compressed-dedup references; regenerate metadata/block addresses; preserve all directory and inode references. A genuine N2 would require an explicit approximation, bounded-recourse, or multi-objective guarantee that simultaneously accounts for image bytes and random/cold/sequential decompression behavior.

**Minimal native-legal witness.** Two small regular files with identical fixed bytes can be represented as ordinary data extents or, under an enabled native fragment feature, packed into the special fragment inode with regenerated inode/block references. Stock readers expose the same file bytes. This is a legal construction choice only; it does not show an action outside the current feature/heuristic union, and it cannot be reduced to changing `-z` compression level.

**Why not admitted.** Current official documentation already exposes native fragment, tail-packing, dedupe, physical-cluster and data-order actions, including explicit performance cautions. The complete erofs-utils mkfs action graph and kernel acceptance paths are not commit-pinned, so this review cannot distinguish a novel global joint planner from current feature combinations, internal layout code, or generic packing. Direct same-object algorithm collision is also unclosed.

**Natural route.** A versioned open rootfs/container tree can be a natural carrier. A later gate would retain identical tree/xattrs and run stock fsck/dump/mount equivalence, with cold/random/sequential reads and full image-build costs; no corpus or run was performed here.
