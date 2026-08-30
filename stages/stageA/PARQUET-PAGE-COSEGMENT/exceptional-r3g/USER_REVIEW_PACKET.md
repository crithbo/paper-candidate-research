# User review packet — PARQUET-PAGE-COSEGMENT R3G

## Recommended decision

`STOP_RECOMMENDED__NARROW_FROZEN_MECHANISM` with confidence `0.99`.

The three fidelity defects identified by the independent gate are now actually repaired. The result is not a repeat of the invalid `126×` accounting. With fair attribution, the candidate still loses decisively because its unchanged planner cannot finish within the same 120-second selection budget; all 40 runs fall back to the exact strongest-union output.

## Key facts

- 20 natural NYC TLC Parquet objects, two independent replays.
- 106 executable baseline points/file, 4,240 materializations total.
- 40/40 semantic-equivalent outputs.
- 20/20 replay-paired non-timing records and output hashes equal.
- Candidate fallback: 20/20 in both replays.
- p50 ≥10%: 0/20 in both.
- p90 non-worse: 8/20 and 11/20.
- strict full-cost residual: 0/20 in both.
- median full-cost ratios: 6.75683× and 6.73305×.
- completed claim-run CPU: 1.96143 h; conservative cumulative bound including interrupted diagnostics: <2.27 h.
- peak RSS: 1.381 GB; final package far below 4 GiB.

## What STOP means

It applies only to the frozen global budgeted co-segmentation mechanism, frozen workload, 20 objects, complete current union and 120-second budget. It is not a claim that all workload-aware Parquet page-layout research is impossible.

## Requested mainline action

Send this immutable package to an independent Stage A closing gate. If that gate confirms the construction and recomputation, register the narrow scientific STOP. Do not start Stage B and do not create a paper project.

