# Source and collision matrix

| Source | Evidence / consequence |
|---|---|
| [Xapian scalability](https://xapian.org/docs/scalability.html) | Glass B-tree tables, spare-room heuristic, compaction fills blocks; native witness absorbed. |
| [Xapian administration](https://xapian.org/docs/admin_notes.html) | Glass table files, block size, `xapian-compact`, `FULL`/legacy `FULLER`; current builder/compactor union. |
| [GlassTable source docs](https://xapian.org/docs/sourcedoc/html/classGlassTable.html) | B-tree `compact`, `create_and_open`, `split_root` paths. |
| [B-Trees Are Back](https://www.cs.cit.tum.de/fileadmin/w00cfj/dis/papers/btree-are-back.pdf) | Direct generic node/page-layout family; cannot be relabelled as target-specific Glass N2. |

No absence claim is made. Native union and direct generic collision suffice for this structural decision.
