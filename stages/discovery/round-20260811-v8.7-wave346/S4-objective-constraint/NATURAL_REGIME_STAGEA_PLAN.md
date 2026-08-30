# Preserved natural-regime Stage A plan

## Versioned natural carrier

Use a pre-registered 20-image manifest of public, versioned Linux distribution rootfs/cloud images. Before observation, record each release URL/version, published checksum, kernel/e2fsprogs version, filesystem block/features, package file-list hash, and directory-tree listing hash. These real distribution trees—not collision-crafted directories—are the natural carrier.

## Measurement and confounds

For each selected directory population, record entry count, name-length/prefix distribution, HTree depth, collision/overflow markers, inode/block placement, and index/image bytes. The full measurement schema is: construction CPU/RSS/temp; cold and warm stock lookup/readdir p50/p95/p99/RSS; cache/device state; and e2fsck/rebuild CPU/RSS/temp. Match kernel, block size, features, device, cache state, and directory-content strata. Require a repeated frontier elbow across independently selected images after conditioning on name/entry distribution; monotone size or a single collision is not N3.

## Finite fidelity and killer

Freeze Linux/e2fsprogs pins and the carrier manifest; verify stock mount, lookup/readdir listing equivalence, and feature legality on a smallest witness before any claim-bearing run. The plan is killed if the normalized elbow does not repeat, if stock semantics vary, or if any apparent action maps to the current union in `ACTION_GAP_REFUTATION.md`.

This plan is intentionally unexecuted and cannot support a regime-law claim today.
