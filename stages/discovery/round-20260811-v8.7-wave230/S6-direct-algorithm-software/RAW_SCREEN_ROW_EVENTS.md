# Raw screen row events

| Row | First-party evidence | Frozen fact / action implication | Outcome |
|---|---|---|---|
| R1 | PostgreSQL GiST documentation | Correctness comes from `same`, `consistent`, and `union`; `penalty` and `picksplit` control efficiency. | strong same-object union |
| R2 | PostgreSQL GiST documentation | `picksplit` partitions a split page; `sortsupport` can supply locality-preserving order for CREATE INDEX/REINDEX. | strong bulk/split comparator |
| R3 | PostgreSQL current docs | Initial GiST build supports sorted and buffered modes; buffered build has different CPU/size behavior and configuration threshold. | full-cost union component |
| R4 | PostgreSQL index extension documentation | Support functions include penalty, picksplit, union, same, options, and sortsupport. | opclass boundary |
| R5 | PostgreSQL WAL source documentation | Page changes use WAL buffer/data registration mechanisms. | durability/full-cost constraint |
| R6 | Current-source/collision closure | Exact current build/insert/split/WAL/vacuum source paths, all representative built-in opclasses/options, and R-tree/GiST direct collision are not fully pinned. | `NOT_ADMITTED_UNFROZEN` |

No absence claim is made from R6.
