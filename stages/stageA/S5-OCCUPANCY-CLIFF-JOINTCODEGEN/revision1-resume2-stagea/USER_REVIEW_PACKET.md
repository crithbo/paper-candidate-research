# S5-OCCUPANCY-CLIFF-JOINTCODEGEN User Review Packet — R2A

- Stage: `STAGEA_RESUME_FROM_BLOCKER`
- Lane: `CANDIDATE_EXECUTION_LANE_1`
- Assignment: `STAGEA-L1-20260811-S5-OCCUPANCY-CLIFF-JOINTCODEGEN-RESUME2-STAGEA-R2A`
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing observation: `no`
- Scientific revision consumed: `no`
- Pending Stage B review: `no`
- Stage B authorized: `false`; approval id `null`

## What is established

The frozen bootstrap archive is intact and safe to expand, but it is not the exact evaluated toolchain. CMake/Ninja are ready. Exact LLVM commit metadata was obtained, but the required `llvm/` worktree transfer failed with curl 28/early EOF. All downstream science remained off.

## What is not established

No natural MIR, real baseline, candidate, verifier, occupancy/spill result, full-cost comparison or replay exists. There is no basis for PASS, STOP, reserve, Stage B, runtime or paper claims.

## Minimum user action

Provide either a complete exact-commit LLVM source snapshot that can be built locally, or an exact-commit Windows tool bundle containing `llc`, `FileCheck`, and `llvm-calc-occupancy` with AMDGPU support, together with immutable provenance and licenses. Also provide the frozen ROCm natural source snapshot or 8–16 complete natural pre-scheduler MIR objects with the required provenance. Mainline must assign a new resume directory.

## Recommended next state

`BLOCKED_USER_ACTION_REQUIRED`; lane returns `IDLE_REUSABLE_AWAITING_MAINLINE` after package acceptance.
