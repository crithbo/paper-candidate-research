# User Review Packet — PARQUET-PAGE-COSEGMENT Exceptional R3G Closing

## Independent decision

`CONFIRM_STOP`, confidence `0.97`, quality tier `BELOW_Q2_STOP`.

This is a real scientific negative for the frozen mechanism, not a resource failure or readiness downgrade. Stage B is not authorized.

## What independently reproduced

- Owner package manifest: `157/157 PASS`, no missing or extra non-manifest files.
- Complete comparator family: exactly 106 unique executable identifiers in every one of 40 records.
- Latin rotation: all 4,400 schedule rows obey the frozen parity formula; every file is 55/55 arm-first balanced.
- Semantics and fallback: `40/40` outputs equivalent; `40/40` candidate attempts time out and fall back to the exact selected union.
- Replay: all 20 non-timing pairs and all union/candidate output-hash pairs match.
- p50 ≥10%: `0/20` in each replay.
- p90 non-worse: `8/20` and `11/20`, below the required `20/20`.
- Strict full-wall residual: `0/20` in each replay.
- Median candidate/union full-wall ratios: `6.7568297801×` and `6.7330471630×`.

The four-worker baseline concern does not reverse the result. Median baseline selection uses about `53.61` CPU-seconds, while the frozen candidate uses about `119.20` CPU-seconds before timing out. Thus the baseline is not winning merely by hiding extra CPU.

## Important claim limitation

The owner’s “strict full-cost residual” is a preregistered full-wall sentinel, not a universal multidimensional Pareto theorem. That phrase must not be expanded into “the candidate is worse on every possible cost dimension.”

This limitation does not invalidate the STOP: the candidate produces no candidate-specific action on any of 40 records and separately fails the frozen p50 and p90 requirements. The fallback is byte-identical to the strongest union and only adds planning work.

## Exact scope

The decision applies only to the frozen global-budgeted workload-conditioned co-segmentation mechanism, the 20 NYC TLC monthly Parquet objects, the declared SQL workload, the pinned PyArrow/DataFusion/Parquet stack, the complete 106-point family, the 120-second selection budget and the two recorded replays.

It is not evidence that all Parquet layout optimization, all workload-aware page segmentation, or a new mechanism under a new candidate identity is impossible.

## Mainline action requested

After mechanical acceptance, mainline may register the narrow scientific STOP. Do not initiate Stage B, create a formal project, or reinterpret this as a general Parquet impossibility result.

- `StageB=false`
- `stageb_user_approval_id=null`
- lane: `IDLE_REUSABLE_AWAITING_MAINLINE`
