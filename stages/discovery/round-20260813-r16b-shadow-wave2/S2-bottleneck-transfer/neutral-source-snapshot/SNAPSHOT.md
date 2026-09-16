# Neutral source snapshot — R16B S2

Frozen: 2026-08-13T23:21:31+08:00. This snapshot precedes canonical disposition and V9 shadow rendering.

| ID | Canonical signature | Fixed object and stock oracle | Current first-party source route |
|---|---|---|---|
| S2R16B-01-LDCONFIG-CACHE | `GLIBC_LDCONFIG|FIXED_SHARED_LIBRARY_SET|SONAME_LINK_CACHE_CONSTRUCTION|STOCK_LD_SO_RESOLUTION|BUILD_LOOKUP_LOAD_BYTES` | Same library files/SONAMEs and stock loader resolution. | `ldconfig(8)` and `ld.so(8)`; glibc `elf/cache.c`, `elf/ldconfig.c`; default cache format `new` since glibc 2.32 plus `old/compat`, `-C/-f/-r/-N/-X/-n/-l`. |
| S2R16B-02-MANDB-INDEX | `MANDB_INDEX|FIXED_MANPAGE_SET|WHATIS_INDEX_CACHE|STOCK_MAN_LOOKUP|BUILD_QUERY_BYTES` | Same manpage corpus and stock man/whatis lookup results. | man-db `mandb(8)`; upstream `src/mandb.c` and database backend route; documented `-C`, hierarchy/path and index cache variants. |
| S2R16B-03-TEXLIVE-LSR | `TEXLIVE_LSR|FIXED_TEXMF_TREE|KPATHSEA_FILENAME_DATABASE|STOCK_FILE_RESOLUTION|BUILD_LOOKUP_BYTES` | Same TEXMF tree and Kpathsea file resolution. | TeX Live Guide 2026 / Kpathsea docs; `mktexlsr` and `ls-R`, `TEXMFDBS`, `!!` database-only behavior. |
| S2R16B-04-DESKTOP-MIMEINFO | `XDG_DESKTOP_MIMEINFO|FIXED_DESKTOP_ENTRY_SET|MIMETYPE_TO_DESKTOP_CACHE|STOCK_XDG_MIME_LOOKUP|BUILD_QUERY_BYTES` | Same `.desktop` set and MIME handler lookup under stock XDG precedence. | desktop-file-utils `update-desktop-database(1)` and Desktop Entry Specification; upstream `src/update-desktop-database.c`; default `$XDG_DATA_DIRS/applications`, `-q/-v`. |

Dedup: exact-signature scans against registry/history and R16A sample24 show no match. GTK icon-cache was excluded because registry history already records a related GTK/GDK cache family. Cross-lane ownership remains for mainline mechanical comparison. No source absence claim is made; no experiment, download, installation, E2, benchmark, or automation occurred.
