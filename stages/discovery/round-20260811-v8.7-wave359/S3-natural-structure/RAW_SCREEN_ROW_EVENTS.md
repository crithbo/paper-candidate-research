# RAW_SCREEN_ROW_EVENTS — Wave 359

## R lazy-load database, bounded closure

| Field | Frozen record |
|---|---|
| Exact object | An installed R package's stock `R/<package>.rdb` and `.rdx` lazy-load database, produced from a fixed package namespace/logical bindings under one pinned R runtime and read by the stock namespace/lazy loader. |
| Natural carrier | Official CRAN package archive version chain (20–50 adjacent releases of one package lineage), plus the R release used to build each package. No package archive was downloaded or measured in Discovery. |
| Same-object oracle | Stock `lazyLoadDBexec`/`lazyLoad` reconstruction of the same named bindings, references, environment metadata and lazy-binding behavior; no custom reader. |
| Prospective law | After fixing R version, package lineage, source-object hash, `DESCRIPTION`/namespace metadata, `keep.source`, `keep.parse.data`, compression and platform, test whether an adjacent release repeatedly preserves a high fraction of named serialized payload identities and whether a predecessor-aware layout changes total `.rdb+.rdx+patch` cost on held-out releases. |
| Confound controls | Stratify by R serialization format/runtime, package major/minor line, changed binding count/type, source/reference metadata and compression mode; reject a law that disappears under these controls or in held-out contiguous release windows. |
| Legal action catalog | Current `makeLazyLoadDB`: source environment/list; optional `variables` ordering; `compress`; `ascii`; environment/reference hooks; and `set.install.dir`. `makeLazyLoading`/install exposes package production choices including `keep.source`, `keep.parse.data` and compression. |
| Minimal two-action witness | For an unchanged logical namespace, supply the same `variables` set in lexical order versus a predecessor-derived order to `makeLazyLoadDB`; both map each name to a `.rdb` key and are read by the stock loader. This proves writer-level layout freedom, not a contribution. |
| Decision | `STRUCTURAL_DROP_CURRENT_UNION_AND_GENERIC_DELTA_ONLY` |

The witness does not support a brief.  The current stock writer already admits an explicit `variables` sequence, while any gain from choosing that sequence is only changed serialization order plus generic binary-delta locality.  It neither creates a new R-specific whole-object guarantee nor escapes the assignment's ban on generic serialization/compression/delta/cache/controller mechanisms.
