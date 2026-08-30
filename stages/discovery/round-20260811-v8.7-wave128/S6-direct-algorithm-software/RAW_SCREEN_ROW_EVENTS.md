# Raw screen row events

| Row | Exact native assignment constructor | Current local/fixed-order cue | Result |
|---|---|---|---|
| R01 | SQLite B-tree cells to pages/overflow pages | local page balancing and cell/overflow allocation | DEEP |
| R02 | LMDB records/free pages to page-number/free-list state | current page allocation/reuse path | DEEP |
| R03 | PDF objects to object numbers/xref records | writer-assigned object IDs/xref offsets | DEEP |

All three are new exact objects, distinct from prior SQLite R-tree, Git/RocksDB, Parquet/LLVM and active cross-lane objects.
