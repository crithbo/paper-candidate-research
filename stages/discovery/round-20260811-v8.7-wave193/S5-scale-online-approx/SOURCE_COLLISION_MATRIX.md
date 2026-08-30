# Wave193 Native Union / Legality Matrix

| Facet | Current source-backed union | Redistribution witness status |
|---|---|---|
| Leaf structure | high key on every non-rightmost page; sibling links; parent downlinks, page split cascade | `L`/`R` before-state and sorted suffix move can be specified, but concurrent parent-pivot transition is unproven. |
| Cleanup | bottom-up/simple deletion, dedup, VACUUM and half-dead page unlink/delete | Not absorbed: none documents general redistribution of nonempty leaves. Not proof of absence. |
| Concurrency | short-term page share/exclusive locks, released per row operation | Required two-leaf/parent lock ordering is unproven. |
| WAL/recovery | page LSN, WAL, recovery configuration; special deletion path in `nbtpage.c` | Required multi-buffer record/redo cut points are unproven. |
| Exact oracle | amcheck parent/root/heapallindexed, SQL snapshots, pageinspect, recovery | Frozen for a future finite killer. |
| Disallowed substitutes | VACUUM policy, deduplicate setting, REINDEX, generic packing/ILP, MVCC/reader replacement | Excluded as controller/configuration/object change. |
