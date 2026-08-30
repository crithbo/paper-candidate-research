# Source110 S4 Seed Pool

| seed | offline idea | base denylist | S109 addendum | pre-lookup disposition |
|---|---|---|---|---|
| 01 | OpenVINO CPU/GPU benchmark cold/warm claim replication | DISTINCT | DISTINCT | retain RQ01 |
| 02 | ExecuTorch edge runtime compile/load/startup replication | DISTINCT | DISTINCT | retain RQ02 |
| 03 | OpenVINO benchmark full-cost host preprocessing endpoint | DISTINCT | DISTINCT | retain RQ03 |
| 04 | ExecuTorch compile cache/dynamic-shape | EXACT_OR_CONTAINS | EXACT_OR_CONTAINS | exclude |
| 05 | generic CPU/GPU energy goodput | EXACT_OR_CONTAINS | EXACT_OR_CONTAINS | exclude |
| 06 | ONNX Runtime I/O binding | RELATED_ONLY outside S4 | DISTINCT | backlog |
| 07 | OpenVINO release/result drift negative replication | DISTINCT | DISTINCT | retain RQ04 |
| 08 | ExecuTorch benchmark claim/config mismatch | DISTINCT | DISTINCT | retain RQ05 |
| 09-12 | generic tuning/cache/warmup variants | EXACT_OR_CONTAINS or no distinct endpoint | EXACT_OR_CONTAINS | backlog/exclude |

Every row was checked against both required denylist files before lookup. Selected RQs: 01,02,03,07,08.
