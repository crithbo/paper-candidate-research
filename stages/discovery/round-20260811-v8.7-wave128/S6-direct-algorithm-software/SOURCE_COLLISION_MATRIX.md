# Source and collision matrix

| Family | Official/current source | Reality check / union conclusion |
|---|---|---|
| SQLite B-tree | [SQLite file format](https://www.sqlite.org/fileformat2.html); [upstream source](https://github.com/sqlite/sqlite) | page, cell, overflow and freelist semantics are native complete-update surface; global action remains unfrozen |
| LMDB | [upstream source](https://github.com/LMDB/lmdb); [official technical overview](https://www.symas.com/lmdb/technical/) | COW/page/free-list/transaction actions are inseparable current union; global action remains unfrozen |
| PDF object assignment | [PDF specification](https://pdfa.org/resource/iso-32000-pdf/); [PDFium source](https://github.com/chromium/pdfium) | object/xref/stream/linearization are existing writer actions; numbering alone is emitter-local |

No absence claim rests on issues, future work or unverified source. The current-source review supports positive native semantics; incomplete global action separation is recorded as `NOT_ADMITTED_UNFROZEN`.
