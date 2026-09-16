# ARROW-IPC-STREAM-JOINT-DICTIONARY-EVOLUTION Revision 1 Results

## Outcome

Owner recommendation: `STOP_RECOMMENDED__NARROW_FROZEN_MECHANISM`.

The fidelity repair is correct, but it removes the apparent compression of the
factorized representation. Across two independent corrected executions of all
32 frozen NYC windows, there were zero useful and zero strict rank-compression
windows: 30 ratios were `infinity` and two were `2.0`. The frozen 40-window
success and product-sized killer are therefore decided even without executing
the eight Adult windows.

## Exactness and native semantics

| Check | Result |
|---|---|
| observed delta-disabled tie | 17/17 boundaries exact in cost and full signature |
| frozen delta-enabled tie | 11/11 boundaries exact; all four event branches live |
| complete tiny preclaim | 6/6 arms exact at every boundary |
| natural feasible windows | 32/32 windows, both delta arms, RP/product exact |
| stock writer/reader equality | all completed arms native-equivalent and deterministic |
| independent non-volatile replay | 32/32 window projections byte-identical |

## Frozen rank/product killer

| Quantity | Primary | Independent execution |
|---|---:|---:|
| completed frozen NYC windows | 32 | 32 |
| useful rank ratio <= 0.75 | 0 | 0 |
| strict rank ratio < 1 | 0 | 0 |
| ratio = 2.0 | 2 | 2 |
| ratio = infinity | 30 | 30 |

Only eight frozen windows remain. Even if all eight were useful and strict, the
maximum totals would be 8 useful and 8 strict, below the required 10 and 20.
Because 32 observed values are at least 2, the lowest possible 40-window median
is 2.0, which independently triggers the preregistered `median >= 1`
product-sized killer.

## Full-cost strongest-union comparison

The table reports the primary run's median across the 32 windows of each
window's measured p50/p90 end-to-end wall time. Stream-byte sums were identical
for every arm (30,104 B), so corrected RP-FDP created no byte advantage.

| Arm | delta | stream bytes sum | end-to-end p50/p90 median (ms) | planning p50 median (ms) | max window p90 temporary (B) |
|---|---:|---:|---:|---:|---:|
| current grid | false | 30,104 | 215.313 / 216.174 | 13.077 | 46,577 |
| current grid | true | 30,104 | 215.209 / 216.097 | 13.235 | 46,577 |
| independent optimal cut-pool merge | false | 30,104 | 241.803 / 242.146 | 29.138 | 575,447 |
| independent optimal cut-pool merge | true | 30,104 | 242.243 / 242.663 | 29.231 | 575,447 |
| exact product | false | 30,104 | 251.978 / 252.664 | 38.367 | 643,344 |
| exact product | true | 30,104 | 251.693 / 252.273 | 38.488 | 643,344 |
| corrected RP-FDP | false | 30,104 | 318.260 / 319.345 | 113.462 | 1,231,589 |
| corrected RP-FDP | true | 30,104 | 318.396 / 319.668 | 114.084 | 1,270,035 |

Per-window p50+p90 Pareto residual counts were 8/32 in primary and 6/32 in the
independent run; they were not replay-stable and both were below the required
10/40. More importantly, all arms emitted identical total bytes while corrected
RP-FDP had materially larger planning and temporary cost. The Adult exact
product upper-state estimates exceed the frozen 4,096 cap, so the frozen
disposition gives those windows zero candidate-superiority eligibility and an
Adult residual upper bound of 0/8, below the required 2/8.

## Adult resource/scale boundary

The initial runner incorrectly aborted rather than applying the already-frozen
above-cap disposition. After that mechanical contract correction, Adult window
0 omitted exact product and began corrected RP-FDP planning. Its exact-product
upper estimate was 15,782,560 states. The corrected candidate reached 3,553.5
MiB RSS and 4,305.1 MiB private memory at the last sample and was terminated at
the 4 GiB fail-closed boundary. No Adult result was claimed.

This is not a download, permission, or toolchain blocker. It follows a passed
preclaim and two natural claim-bearing executions, and is consistent with the
preregistered product-sized mechanism killer. No further solver run was made.

## Replay scope and decision sufficiency

The complete 40-window timing run and full Adult replay2 did not complete. The
two independent current-revision executions nevertheless cover the same 32 NYC
windows and match every decision-bearing non-volatile field. The missing eight
outcomes cannot reverse either the rank-success failure or the median product
killer, and their frozen superiority upper bound is zero. Therefore the narrow
negative decision is logically complete under the frozen thresholds, while the
evidence ceiling explicitly records incomplete Adult execution.

Key machine-readable artifacts:

- `artifacts/preclaim_revision_exactness/results.json`
- `artifacts/preclaim/preclaim_results.json`
- `artifacts/replay_validation.json`
- `artifacts/revision_summary.json`
- both immutable 32-window result trees under `artifacts/`
