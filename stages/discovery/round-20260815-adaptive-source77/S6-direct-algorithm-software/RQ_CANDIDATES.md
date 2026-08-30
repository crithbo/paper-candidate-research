# RQ candidates

## RQ-S77-01

- Anchor: GNU Coreutils 9.11 sort manual and official upstream mirror, checked 2026-08-15.
- Stable object: fixed input records, key comparison/locale/stability semantics, output mode and resource limits; same sorted byte/record output.
- Primary RQ: “Does GNU sort have a target-specific whole run-generation/merge construction with a non-generic guarantee beyond its current sort/merge/parallel/temp-file union?”
- Out of scope: changing keys/locale/stability, learned order prediction, generic external-sort replacement, parameter selection, or execution experiments.
- Source roles: official sort manual/current upstream mirror = ANCHOR/CURRENT; current merge grouping plus published ELSAR external-sort construction = CONTRARY. `NONE` selective nomination.
- FINER-lite: feasible CLEAR; relevance CONDITIONAL; novelty threat HIGH; scope PASS. `RQ_READY_FOR_ORDINARY_CLOSURE`.
