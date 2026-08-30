# Canonical Source / Collision Matrix

| Signature | Same-object contract | Strongest fair union to close | Direct-collision result | Full-cost boundary | Finite closure / killer |
|---|---|---|---|---|---|
| S4_GLIBC_LOCALE_ARCHIVE_CONSTRUCTOR | fixed locale set and stock `setlocale` behavior | localedef archive/no-archive plus reader behavior and relevant build/install controls | `CU_UNKNOWN`: no source-complete proof of either residual or absorption | archive bytes, construction CPU/RSS/temp, locale-load latency/RSS | read pinned `locarchive.c` and localedef options; one fixed locale set must preserve category lookup while measuring both archive variants; STOP if stock union expresses the proposed global action |
| S4_MANDB_WHATIS_INDEX_CONSTRUCTOR | fixed man-page corpus and stock apropos/whatis match semantics | mandb writer, database backend/index options, reader regex semantics | `CU_UNKNOWN` | index bytes, mandb CPU/RSS/temp, cold/warm query latency/RSS | read pinned writer/reader implementation; 20 public man pages as legality set; STOP if only backend choice or output ordering remains |
| S4_PLOCATE_DATABASE_CONSTRUCTOR | fixed pathname corpus and stock plocate match semantics | updatedb construction, format, compression/block and query controls | `CU_UNKNOWN` | database bytes, build CPU/RSS/temp, cold/warm query CPU/RSS/latency | read pinned builder/reader and all flags; fixed distro file list; STOP if residual is only generic compression or option selection |
| S4_KMOD_MODULE_DEPENDENCY_INDEX_CONSTRUCTOR | fixed module tree/metadata and stock modprobe resolution | depmod parser/index forms plus libkmod/modprobe lookup controls | `CU_UNKNOWN` | index bytes, depmod CPU/RSS/temp, modprobe resolution CPU/RSS/latency | read pinned depmod and libkmod lookup paths; fixed release tree; STOP if action changes aliases/modules or reduces semantics |

All four routes are finite only after source-pin closure. They are held `NOT_ADMITTED_UNFROZEN`, not dropped.
