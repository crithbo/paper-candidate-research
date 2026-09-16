# Source and collision matrix

| Role | First-party source | Support | Boundary |
|---|---|---|---|
| GiST semantics | [PostgreSQL GiST indexes](https://www.postgresql.org/docs/19/gist.html) | Correctness/efficiency callbacks, page splitting, sortsupport, and initial-build behavior. | Does not close exact current core/opclass source paths. |
| Build modes | [PostgreSQL GiST indexes v18](https://www.postgresql.org/docs/18/gist.html) | Sorted and buffered initial builds and buffering CPU tradeoff. | Not a global residual proof. |
| Callback interface | [Interfacing extensions to indexes](https://www.postgresql.org/docs/18/xindex.html) | Formal support-function surface including `picksplit`, `union`, and sortsupport. | A fixed opclass can still have source-specific behavior. |
| WAL constraint | [PostgreSQL WAL source README](https://github.com/postgres/postgres/blob/master/src/backend/access/transam/README) | Page updates use WAL buffer/data registration. | No complete GiST WAL path audit. |
| Integrity caveat | [amcheck documentation](https://www.postgresql.org/docs/16/amcheck.html) | Logical consistency tooling has defined scope. | Does not itself prove full GiST semantic equivalence. |

## Collision conclusion

No collision-free conclusion is claimed. GiST’s callback surface plus sorted/buffered builds is already a powerful same-object union, and R-tree/GiST split/bulk-loading direct collision remains to be closed. A future proposal needs a commit-pinned, fixed-opclass global guarantee that cannot be implemented as an existing callback or build configuration.
