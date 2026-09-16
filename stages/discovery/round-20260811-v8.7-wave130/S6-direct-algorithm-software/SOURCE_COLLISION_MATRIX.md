# Source / collision matrix

| source (first party) | frozen current evidence | action / semantic consequence | collision role |
|---|---|---|---|
| SQLite upstream GitHub history, master, head `e0725b0`, 2026-08-08 | Current upstream selector pinned at assignment cutoff. | Source inspection is against this head; no absence claim rests on an old issue or future-work note. | Reality anchor. |
| SQLite `src/btree.c`, master at that head | `BTALLOC_ANY`, `BTALLOC_EXACT`, `BTALLOC_LE`; `allocateBtreePage`; `freePage2`; `balance_nonroot`; `balance_quick`; commit phases. | Native union includes page allocation choices, freeing/overflow handling, local rebuild, and transaction commit/journal path. | Strong same-object implementation union. |
| `balance_nonroot` source comment | It redistributes cells between a page and up to two siblings and updates the parent. | The minimal 2--3-page cell-to-page witness is directly absorbed. | Direct subtractor. |
| `incrVacuumStep` source | Autovacuum relocates a used final page into a free page, fixes pointers/ptrmap, and can run on commit. | Page-number relocation and free-list consumption are already native, with their transaction costs. | Direct subtractor / counterevidence. |
| SQLite file-format documentation | B-tree cell physical locations are arbitrary, but logical keys are ascending; pages, freelist, overflow and pointer-map structures are format-visible. | A valid proposal must preserve B-tree order, parent separators, overflow chains and auxiliary metadata—not merely rearrange bytes. | Same-object oracle boundary. |
| SQLite VACUUM documentation | VACUUM rebuilds a database and can reduce file size/fragmentation. | File-wide repacking is an existing same-reader operation, but is not a free per-update action; its rewrite cost must be paid. | Full-cost subtractor. |
| SQLite PRAGMA documentation | `integrity_check` verifies structural integrity. | Required native legality oracle, supplemented by SQL query-result equality. | Fidelity route. |

Official URLs: [source](https://github.com/sqlite/sqlite/blob/e0725b0/src/btree.c), [file format](https://www.sqlite.org/fileformat2.html), [VACUUM](https://www.sqlite.org/lang_vacuum.html), [PRAGMA integrity_check](https://www.sqlite.org/pragma.html), [history](https://github.com/sqlite/sqlite/commits/master).

Current-source counterevidence is decisive here: the native union already provides the bounded redistribution, allocation/free-list, relocation, and commit actions needed to cover the proposed minimal witness.
