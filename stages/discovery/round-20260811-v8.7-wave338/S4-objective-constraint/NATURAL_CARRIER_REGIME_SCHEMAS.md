# Versioned natural carriers and regime schemas

## Tree-sitter

**Frozen carrier class.** The carrier is the public Tree-sitter parser ecosystem listed by the project’s [parser list](https://github.com/tree-sitter/tree-sitter/wiki/List-of-parsers), restricted to repositories that publish a versioned grammar, generated `src/parser.c`, and a real-language corpus. The Stage A manifest must name 20 repositories by release tag/commit and record the source and generated-file SHA-256 before observation; this is a finite, public, versioned route rather than an unfrozen synthetic generator.

**Regime schema.** For each grammar/corpus pair: record grammar rule count, conflict count, parse-state count, external-scanner presence, source-byte/syntax mix, and edit span. Measure generator CPU/RSS/temp, generated source/object bytes, compile cost, cold parse plus incremental-edit p50/p95/p99 latency and tree RSS. Require an elbow that repeats across at least two independently selected grammar strata after matching grammar and source complexity. Hold ABI, runtime, compiler, build mode, input encoding, edit script, and warm/cold state fixed.

## ext4 HTree

**Frozen carrier class.** The carrier is a finite 20-image manifest of publicly versioned Linux distribution rootfs/cloud images paired with their published release checksums and package file lists. For each selected release, image checksum, kernel/e2fsprogs version, filesystem block size/features, and directory-tree listing hash must be recorded before observation. This preserves actual distribution directory populations rather than manufacturing a collision-only directory.

**Regime schema.** Record directory entry count/name-length and hash-prefix distributions, HTree depth/collision markers, inode/block layout, and index/image bytes. Measure image-construction CPU/RSS/temp; cold/warm stock lookup and `readdir` p50/p95/p99/RSS; cache/device state; and e2fsck/rebuild costs. Match kernel, block size, filesystem features, device, cache state, and directory-content strata. A valid regime is a repeated frontier elbow across independently selected images after conditioning on entry/name distributions, not merely a size trend or one hash collision.

Neither schema has been measured in this assignment.
