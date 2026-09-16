# Raw screen-row events

| Event | Result |
|---|---|
| Object | Fixed rows, opclass/hash values, update trace, stock equality lookup, bitmap scan, WAL replay and recovery. |
| Current structure | Official docs require exactly one existing bucket to split when adding a bucket; current `hash.h` exposes metapage, bucket, overflow, bitmap, split, squeeze, build, insert and vacuum state. |
| Witness test | Alternative page chains need regenerated links, mapping and WAL but provide no freely selectable global split. |
| Outcome | `STRUCTURAL_DROP`: the remainder is fillfactor/threshold control or generic packing. |
