# Raw screen-row events

| Row | First-party evidence | Consequence |
|---|---|---|
| R1 | Official layout defines header(s), per-part chunk-offset table(s), and scanline/tile/deep chunks. | Reader contract is concrete. |
| R2 | Tile entries in the offset table are sorted by `INCREASING_Y`; multipart has a table for each part. | Many apparent reorderings are constrained, not free planner actions. |
| R3 | Tile coordinates contain `(tileX,tileY,levelX,levelY)` and pixel payload size. | Regenerated references can represent distinct physical chunk layouts only where writer/format permits. |
| R4 | Official project is both specification and reference implementation. | Current source/API/default union must be pinned from that implementation. |
| R5 | Candidate joint chunk order/offset-table planner. | retained only as conditional action witness; no residual admission. |
