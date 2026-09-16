# Full-cost ledger

Scope: `STAGEA_DIRECTIONAL_FULL_COST` for the corrected trace-profiled 24-model/8-arm run. Every reported method row uses the same object, native writer/reader/verifier, request program and timing denominators.

## One-time training-trace cost

| Item | Measured value |
|---|---:|
| Training models | 11 |
| Requests / ordered events | 704 / 23,936 |
| Native collector wall sum | 13.4489 ms |
| Native collector CPU sum | 14.0000 ms |
| Python orchestration wall | 402.9503 ms |
| Collector peak RSS | 4,542,464 bytes |
| Frozen trace artifacts, including freeze YAML | 1,686,450 bytes |

This cost is reported once, not hidden inside candidate rows. The frozen profile is identical for B0-HOT, B1, B2 and FB-RCFDP. Non-profile methods do not receive a fictitious per-buffer share of trace-training cost.

## Per-output collection boundary

| Component | Unit / denominator | Collection path |
|---|---|---|
| Graph/profile extraction | wall and CPU us, peak RSS | native reflection graph extraction; charged to direct/profile-planned arms that require it |
| Planner | wall/CPU ms, peak RSS, retained states, expanded transitions | method-specific plan construction; beam width 8 and cap 20,000 unchanged |
| Planner temp | bytes | high-water sum of retained raw native prefixes, plan backpointers and label objects |
| Writer | wall/CPU us | mean of 30 fresh native builders |
| Writer buffer/temp | bytes | exact protected stock `vector_downward` capacity and scratch telemetry exposed by a read-only subclass; stock allocator unchanged |
| Reallocation | Boolean | final native capacity greater than the arm's frozen initial capacity |
| Stock verifier | wall/CPU us | mean of 200 `tflite::VerifyModelBuffer` calls |
| Canonical equivalence | wall/CPU us | full replay graph, value/presence/vector/key/identity/alias digest and alignment check |
| Generic reader control | warm ns over 5,000; cold ns over 50 | retained non-claim-bearing `ReaderChecksum` control |
| Profile-matched reader | warm wall/CPU ns over 5,000; cold wall/CPU ns over 50 | exact frozen request descriptors through the generated native reader |
| Cold preparation | fixed work per repetition | identical 8 MiB array, 64-byte stride, before every cold request |
| Raw output | exact bytes | ordinary TFL3 buffer plus fixed identifier |
| Process RSS | bytes | maximum native working set observed across extraction/planning/build/read |
| Fallback | Boolean and count | deterministic stable fallback; never removed from cost or useful-action denominator |

End-to-end construction is `required graph extraction + planner + writer + stock verifier + canonical equivalence`. Total temporary bytes are `planner high-water + exact builder capacity + exact builder scratch`.

## Candidate held-out p50/p90

| Dimension | p50 | p90 |
|---|---:|---:|
| Raw bytes | 2,064 | 3,254.4 |
| Graph extraction wall | 98.100 us | 129.360 us |
| Planner wall | 41.277 ms | 101.285 ms |
| Planner CPU | 41.000 ms | 101.200 ms |
| Writer wall | 5.233 us | 8.581 us |
| Stock verifier wall | 0.241 us | 0.463 us |
| Canonical equivalence wall | 65.300 us | 95.460 us |
| Trace reader warm wall | 28.220 ns | 29.096 ns |
| Trace reader cold wall, including fixed eviction | 68,486 ns | 69,712 ns |
| Trace reader cold CPU | 60,000 ns | 80,000 ns |
| End-to-end construction wall | 41,448.723 us | 101,592.256 us |
| End-to-end construction CPU | 41,000.000 us | 101,226.666 us |
| Process peak RSS | 13,934,592 bytes | 14,503,116.8 bytes |
| Planner temp | 14,656 bytes | 29,574.4 bytes |
| Exact builder capacity | 2,304 bytes | 4,454.4 bytes |
| Total temporary bytes | 16,192 bytes | 33,956.8 bytes |

Candidate fallback count is `2/13` held-out (`2/24` overall). Candidate stock-builder reallocation flag is true on `13/24` models; all eight arms expose the same capacity/reallocation telemetry.

## Timer-resolution disclosure

`std::clock` in the pinned Windows runtime has millisecond-scale accounting. CPU totals for sub-millisecond 30-build, 200-verify and 5,000-warm-request batches can therefore be resolution-censored to zero after division. The raw CSV retains these measured zeros; wall time, planner CPU and cold-reader CPU are nonzero. This censoring cannot manufacture the negative result: raw bytes are exact, all held-out warm/cold wall residuals are adverse, useful action coverage is exactly zero, and the Pareto computation conservatively still keeps the candidate on both aggregate frontiers.

## Whole-arm frontier and no cost-only novelty

The frontier vector is exactly: raw bytes; trace warm/cold wall; end-to-end construction wall/CPU; trace warm/cold CPU; peak RSS; total temp; fallback. Candidate is nondominated at both aggregate held-out p50 and p90, but has no real byte or matched-access primary benefit. The registered rule therefore rejects cost/noise-only nondominance.

## Resource budget

- Natural orchestration wall: `3.3709234 s`.
- Trace orchestration wall: `0.4029503 s`.
- All executables are single-process public CPU; no GPU or exclusive device.
- Build and analysis completed in tens of seconds, far below `4 CPU-hours`.
- Topic tree before final text/manifest sealing: `962,817,594 bytes`, below `4 GiB`; revision1 itself was `5,507,552 bytes` at that checkpoint.
- No download, system installation or global environment modification occurred in revision1.
