# Canonical v8.7 family reviews

This document is canonical-only. It was derived from `../neutral-source-snapshot/` before any V9 shadow file was written.

## S4-R16A-F01-KALLSYMS

- **Exact same object / strong union:** unchanged kernel symbol set and stock kallsyms lookup semantics. Required union includes current scripts/kallsyms generation, base-relative/absolute-percpu/all-symbols configurations, linker/kernel configuration and stock symbol lookup.
- **Natural carrier:** 20–50 versioned upstream or distribution kernel `vmlinux` images, release/config hashes frozen before observation. Normalize architecture, kernel config, LTO/debug stripping, symbol count/name distribution, compression and build provenance.
- **Full cost / finite closure:** construction CPU/RSS/temp plus `vmlinux` bytes, boot/load effects where applicable, stock lookup/stack-symbolization CPU/RSS/latency. Small witness: same symbol map and stock resolver output under two legal generated tables.
- **Canonical finding:** current source/action/config union not sufficiently closed from bounded public reading; no stock-legal whole-action divergence or target-specific guarantee frozen. No absence claim.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`.

## S4-R16A-F02-ELF-GNUHASH

- **Exact same object / strong union:** identical ELF dynamic symbol set and loader behavior, with lld/GNU ld producer configurations and stock glibc loader as fair union. GNU ld documents `--hash-style=sysv|gnu|both`; glibc loader semantics and current linker contract are included rather than omitted.
- **Natural carrier:** 20–50 versioned ELF shared objects/executables from signed distribution package sets, with package/release checksums and `readelf` metadata frozen before observation. Control ISA, relocation model, dynsym size/name distribution, linker version, build flags, filesystem cache and loader configuration.
- **Full cost / finite closure:** link CPU/RSS/temp, image bytes, relocation/load and symbol-lookup CPU/RSS/latency. Small witness: two stock-loadable binaries with identical exported/imported symbol and relocation semantics.
- **Canonical finding:** visible choices are current hash-style/producer layout configurations; a distinct non-generic, same-object action/guarantee outside the complete producer/loader union was not frozen. The natural regime remains unmeasured.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`.

## S4-R16A-F03-ZIPIMPORT

- **Exact same object / strong union:** identical importable `.py`/`.pyc` module/package set under the matching stock `zipimporter`; dynamic-module changes are excluded by the official contract. Union includes archive central-directory/deflate store choices allowed by the producer, bytecode validity/timestamp/invalidation conditions, importer caching and current Python flags.
- **Natural carrier:** 20–50 versioned public Python wheel/zip application releases, selected and hash-recorded before observation. Control CPython revision, import graph/module mix, bytecode/source form, compression, filesystem cache, and cold/warm import state.
- **Full cost / finite closure:** archive build CPU/RSS/temp, archive bytes, module lookup/decompression/bytecode-read startup CPU/RSS/latency, cache/invalidation. Small witness: two archives accepted by unchanged importer yielding identical module import results.
- **Canonical finding:** source/producer and default/non-default importer union is not closed by the bounded review; no union-external archive constructor with same importer semantics is frozen. No N3 fact is asserted.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`.

## S4-R16A-F04-JOURNAL

- **Exact same object / strong union:** identical journal entries/fields and stock journal API result semantics. Union includes current native writer/reader, field/data hash tables, entry arrays, mmap windows, rotation, compression, sealing, and journald configuration/defaults/non-defaults.
- **Natural carrier:** 20–50 publicly archived, versioned journal files or officially published system-image journal artifacts, source/version/checksum frozen before observation. Control systemd version, file flags, field cardinality/value repetition, rotation state, compression/sealing, storage/cache and query predicate.
- **Full cost / finite closure:** writer append CPU/RSS/temp, file/index bytes, rotation/seal cost, reader seek/query CPU/RSS/latency and cache cost. Small witness: two stock-readable files with identical API-visible entries/fields and integrity behavior.
- **Canonical finding:** the official format already describes hash-table sizing/rotation and object/index mechanisms. No complete source-closed action outside native writer/format/config union was identified; the natural regime is unmeasured.
- **Disposition:** `NOT_ADMITTED_UNFROZEN`.
