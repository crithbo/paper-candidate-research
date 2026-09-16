# Neutral source snapshot — R16A S4

Frozen 2026-08-13 before canonical decisions and before any V9 shadow rendering. This index contains neutral source facts and canonical signatures only; it contains no disposition, score, tier, or V9 claim-pack field.

| Family ID | Canonical signature | Exact object and neutral snapshot | Current official sources / pinned revision |
|---|---|---|---|
| `S4-R16A-F01-KALLSYMS` | `LINUX_KALLSYMS_CONSTRUCTOR__VMLINUX_SYMBOL_SET__STOCK_KERNEL_KALLSYMS_LOOKUP__SIZE_BUILD_COST_LOOKUP_FULL_COST` | Linux `vmlinux` kallsyms table for an unchanged symbol set, consumed by matching stock kernel lookup/stack-symbolization semantics | Linux master `3d6d817622b0a9721e3cc404df3469171582be13`; official kernel source and documentation search snapshot. |
| `S4-R16A-F02-ELF-GNUHASH` | `ELF_GNU_HASH_CONSTRUCTOR__DYNAMIC_SYMBOL_SET__STOCK_GLIBC_LOADER__IMAGE_BYTES_LINK_COST_LOOKUP_LOAD_COST` | ELF `.gnu.hash`/dynamic-symbol layout for unchanged ELF dynamic-link semantics, produced by lld and consumed by stock glibc loader | LLVM main `866bc8d6a9930a75b2b10a8f9d0a31982c5479bb`; current GNU ld/glibc documentation snapshot. |
| `S4-R16A-F03-ZIPIMPORT` | `CPYTHON_ZIPIMPORT_ARCHIVE__PY_PYC_MODULE_SET__STOCK_ZIPIMPORTER__ARCHIVE_BYTES_IMPORT_CPU_RSS_STARTUP_COST` | CPython ZIP import archive for unchanged import/module semantics, consumed by stock `zipimporter` | CPython main `cd98657f0a8767e44c1db40dadedb5e278f7bdac`; current official Python zipimport documentation snapshot. |
| `S4-R16A-F04-JOURNAL` | `SYSTEMD_JOURNAL_FILE_CONSTRUCTOR__ENTRY_FIELD_STREAM__STOCK_JOURNAL_API__BYTES_APPEND_CPU_RSS_SEEK_QUERY_COST` | systemd journal binary file with unchanged entries/field values, consumed by stock journal API | systemd main `d66923ea07223808cf81de4ea3d0fcf7c04847a2`; current official journal-file format snapshot. |

No cross-lane duplicate was found in the frozen registry/plan and lane-contract scopes. This is a local snapshot result only; mainline resolves any subsequently reported identical signature using its R16A policy.
