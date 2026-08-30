# PARQUET-PAGE-COSEGMENT User Review Packet

- Stage: `STAGEA`
- Lane id: `CANDIDATE_EXECUTION_LANE_1`
- Assignment id: `STAGEA-L1-20260811-PARQUET-PAGE-COSEGMENT-RESUME1-V8.7`
- Decision: `STOP_NARROW_FROZEN_MECHANISM`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `STAGEA_SCIENTIFIC_NEGATIVE__NARROW_FROZEN_MECHANISM`
- Claim-bearing observation obtained: `yes`
- Scientific revision consumed: `no`
- Pending user Stage B review: `no`
- Stage B authorized: `false`
- Stage B user approval id: `null`

## What is established

The same frozen implementation completed two 20-file natural replays. Every candidate and strongest-union output preserves the exact object and reader results. Non-timing action/layout fields agree 20/20 and 340 output Parquet hashes agree across replays.

The mechanism has real outside-union actions and produces files about 3.06% smaller, but only 126 of 1608 complete actions retain positive useful contribution (7.8358%). The required p50 and all-file p90 gates fail, and no file retains a strict query-plus-full-cost residual. Candidate full-cost is 126.50x and 130.68x the strongest union under conservative charging.

## What is not established

No Q2/Q1 contribution, query acceleration, production generality, full-cost optimizer advantage, cross-workload result, Stage B evidence, or paper main claim is established. Size-only Pareto non-dominance is not treated as query-performance support.

## Exact object and boundary

The decision applies only to the standard single-file Parquet, fixed row/schema/row-group object; frozen NYC TLC 2024-01 through 2025-08 files; fixed training/held-out workload; current fixed-writer/CDC union; and `GLOBAL_BUDGETED_WORKLOAD_CONDITIONED_COSEGMENT` action. It does not archive or reject unrelated Parquet topics.

## Fair baseline and full-cost status

The strongest comparator is an executable same-information training-selected union, not an oracle or metric-wise envelope. Planning/search is charged to candidate, and complete write/query samples and bytes are retained. Full cost eliminates the intended directional residual even though candidate files are smaller.

## Integrity

- Continuity/checkpoint: PASS.
- Preclaim fidelity: PASS.
- Natural files: 20.
- Double replay: complete.
- Exact stable projection: 20/20.
- Output Parquet hash equality: 340/340.
- Resource blocker: none.
- Resume writes outside `resume1`: none.

## Recommended next state

`STOP` for this narrow frozen mechanism after any required independent Stage A closing review. Do not start Stage B. The candidate execution lane may return to `IDLE_REUSABLE_AWAITING_MAINLINE` after mechanical acceptance.

This packet is a review aid and grants no Stage B or project authority.

