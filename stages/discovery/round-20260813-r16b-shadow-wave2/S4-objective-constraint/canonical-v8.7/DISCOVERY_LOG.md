# Canonical Discovery Log — R16B S4

Frozen canonical method: v8.7/R5-P0 legacy disposition, produced before any V9 shadow material. Snapshot identity and four canonical signatures are frozen in `../neutral-source-snapshot/FAMILY_SNAPSHOTS.yaml`.

## Bounded evidence and contrary checks

| Family | First-party current evidence | Natural/canonical carrier | Action-union result | Canonical disposition |
|---|---|---|---|---|
| GLIBC_LOCALE_ARCHIVE | glibc manual documents `locale-archive`, `localedef` and `--no-archive`; upstream paths recorded | versioned glibc localedata locale set | archive writer/reader source/config union is not closed at code level | NOT_ADMITTED_UNFROZEN |
| MANDB_WHATIS_INDEX | apropos(1) documents mandb-maintained index and reader locations | public man-page trees/release manual corpus | current writer/reader and DB backend/config union not closed | NOT_ADMITTED_UNFROZEN |
| PLOCATE_DATABASE | official project entry point and named builder/reader paths recorded | versioned filesystem-tree listing or distro package file list | current format, builder and query option union not closed | NOT_ADMITTED_UNFROZEN |
| KMOD_MODULE_DEPENDENCY_INDEX | official kernel kmod entry point and depmod/modprobe paths recorded | kernel release module tree | current index writer/lookup/option union not closed | NOT_ADMITTED_UNFROZEN |

No disposition is based on absent implementation, result, compute, hardware, or AI readiness. The unsuccessful read-only Git transport is a provenance limitation only.

## Search boundary

- 2026-08-13: registry/history/R16A accepted-and-excluded ledgers searched for family/object signatures; GTK/GdkPixbuf cache was excluded as historical repeat.
- 2026-08-13: official documentation/current-source locator searches for glibc, man-db, plocate, and kmod; source endpoints were not downloaded or executed.
- Contrary hypothesis: each named upstream may already expose an equivalent whole-constructor action. This remains unresolved until a source-pinned, default/non-default union can be read.

## Canonical conclusion

`canonical_clean_briefs: 0`; `canonical_stage0_proposals: 0`. The four families are unique discovery units, but are not promoted to a claim package because their decisive action/configuration union is incomplete. This is neither a structural DROP nor a claim of current absence.
