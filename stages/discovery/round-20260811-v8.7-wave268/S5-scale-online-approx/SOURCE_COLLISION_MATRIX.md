# Wave268 FITS Action Matrix

| Facet | Current union | Candidate result |
|---|---|---|
| Tiled image | tile rows in variable-length binary table; stock transparent image reader | tile choice/codec is config, not N2 |
| Heap | auto extension, shifting for added rows, overwrite behavior, `fits_compress_heap` | vector relocation is native heap maintenance/rewrite |
| Integrity | header/checksum maintained by stock tooling | must preserve exact decode/checksum |
| Cross-HDU | separate HDU/header objects | joint state changes object; excluded |
| Full-cost killer | bytes, rewrite/temp/RSS, CPU/I/O, read/write/checksum | fail on any semantic difference, union absorption or no Pareto gain |
