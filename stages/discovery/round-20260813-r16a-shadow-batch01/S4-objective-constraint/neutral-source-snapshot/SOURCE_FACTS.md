# Neutral source facts

## F01 Linux kallsyms

Current Linux source revision is pinned in `SNAPSHOT_INDEX.md`. The neutral research question is whether a versioned set of released kernel images can show a stable tradeoff regime between symbol-table construction cost/bytes and stock symbol lookup/stack presentation. It requires a source-level enumeration of the build script’s current representation/configuration choices before any absence or action-gap assertion.

## F02 ELF GNU hash

The neutral object is a dynamic symbol set with the same ELF dynamic-link semantics. Current GNU linker documentation says the linker can create classic SysV, GNU, or both hash-table styles; current glibc documentation establishes loader/dynamic-link context. This does not by itself establish a GNU-hash action gap.

## F03 CPython zipimport

Official Python documentation says `zipimporter` imports `.py` and `.pyc` modules/packages from ZIP archives and disallows ZIP importing dynamic modules. The neutral question is whether versioned public wheel/zip application archives exhibit a reproducible archive-shape regime under the same importer semantics.

## F04 systemd journal

The official journal-file format describes field/data hash tables, entry arrays, append behavior, hash-table fill/rotation guidance, compression/sealing, and native API preference. The neutral question is whether versioned public journal artifacts reveal a stable append/seek/full-cost regime under the same native format/API contract.
