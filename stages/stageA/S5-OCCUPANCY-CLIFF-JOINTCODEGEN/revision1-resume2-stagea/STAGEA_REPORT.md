# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Stage A R2A Report

- Lane id: `CANDIDATE_EXECUTION_LANE_1`
- Assignment id: `STAGEA-L1-20260811-S5-OCCUPANCY-CLIFF-JOINTCODEGEN-RESUME2-STAGEA-R2A`
- Authorization id: `STAGEA-RESUME-S5-20260811-R2A`
- Cross-assignment contamination: `false`
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: `TIER_B_Q2_VIABLE` carried from frozen Stage 0; not rescored by resource failure
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Novelty route: `N2`
- Stage B authorized: `false`

## Pre-claim contract fidelity gate

- Gate status: `FAIL_CLOSED_RESOURCE_TOOLCHAIN`
- Frozen atomic actions mapped: contract only; no executable candidate path was admitted
- Comparator audit: real exact-commit `GCNSchedStrategy + greedy` remains mandatory and was not run
- Native tool parity: failed; `llc`, `FileCheck`, and `llvm-calc-occupancy` are absent
- Metric/full-cost contract: frozen in `EXPERIMENT_CONTRACT.yaml`; no scientific denominator was instantiated
- Natural object: `0/8` minimum complete MIR because corpus work correctly did not start after exact-tool failure
- Claim-bearing run started only after PASS: `false`; no claim-bearing run started
- Scientific revision consumed: `false`

## Frozen object and intended killer

The unchanged object is exact LLVM commit `1f112d62e1fa2c4f1a04887abd72da1ed61cf791`, `amdgpu11.00`, wave32, byte-identical complete pre-scheduler natural MIR, real `GCNSchedStrategy + greedy`, the frozen bounded tier-frontier candidate followed by the same allocator, MachineVerifier legality, and full construction/fallback cost. The intended finite killer remains whether the candidate produces a legal, replayable, non-dominated occupancy-tier or spill point on 8–16 natural regions.

This assignment did not reach that killer.

## Exact blocker

The verified llvm-mingw archive is only a bootstrap compiler. It contains no required evaluated tools and its own build lacks AMDGPU. CMake and Ninja were successfully closed, and an exact filtered commit fetch succeeded. Sparse checkout of the required `llvm/` blobs then failed from the official origin with:

```text
error: RPC failed; curl 28 Operation too slow. Less than 1 bytes/sec transferred the last 120 seconds
error: 5450 bytes of body are still expected
fetch-pack: unexpected disconnect while reading sideband packet
fatal: early EOF
fatal: fetch-pack: invalid index-pack output
```

The failure state is preserved rather than silently retried. `FETCH_HEAD` and the commit object match the frozen SHA, but there is no `HEAD`, no `llvm/` worktree, no exact executable tool, and no scientific observation.

## Full-cost boundary

- bootstrap asset network: `0` in this assignment; read-only local asset
- bootstrap extraction: 176.968 s; 740,825,211 bytes
- verified CMake/Ninja downloads: 37,847,576 bytes total
- source/Git failure state: 187,851,937 on-disk bytes
- directory before reports: 1,053,455,557 bytes, below 4 GiB
- exact build/scientific CPU: 0 CPU-hours
- GPU/exclusive hardware: none
- configure/build/corpus/baseline/candidate/verifier/replay: not run

## Claim audit

Established: frozen resource hashes; safe extraction; bootstrap identity; exact Git commit metadata; exact checkout failure; all downstream non-actions.

Not established: executable exact LLVM parity, natural occupancy-cliff prevalence, candidate legality, candidate residual, baseline absorption, spill/occupancy improvement, compile full-cost result, runtime, GPU performance, or paper contribution.

The initial static Python proxy remains non-claim-bearing and was not rerun or reused as evidence.

## User-action blocker

- Blocker packet: `USER_BLOCKER_PACKET.md`
- Immutable failure directory: this directory after manifest closure
- Resume rule: mainline must create a new resume directory; never overwrite this package
- Scientific revision: still unconsumed
- Scientific STOP/reserve: forbidden for this failure

## Recommended next state

`BLOCKED_USER_ACTION_REQUIRED`. Release this lane as `IDLE_REUSABLE_AWAITING_MAINLINE`. After exact resources are supplied, mainline may resume the unchanged preclaim contract in a new directory. No independent Stage A scientific gate is requested because the preclaim gate did not pass.
