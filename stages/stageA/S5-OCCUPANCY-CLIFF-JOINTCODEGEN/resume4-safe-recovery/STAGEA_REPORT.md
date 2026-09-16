# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Stage A Safe-Recovery Report

## 中文摘要

- 得到什么：8 个来源目录、8 个完整自然 gfx1100/wave32 pre-scheduler MIR，8/8 verifier 通过，8/8 双重重放哈希一致。
- 为什么：官方便携 Linux C/C++ 头文件补齐了旧 Windows host-ABI 解析缺口，未改变冻结对象或源码。
- 当前证据上限：`RESOURCE_AND_PRECLAIM_FIDELITY_PASS_ONLY__NO_SCIENTIFIC_INFERENCE`。
- 下一步：主线验收后恢复旧 Stage A；本包不运行候选/基线。

- Lane id: `CANDIDATE-EXECUTION-LANE-2`
- Assignment id: `SAFE-RECOVERY-L2-20260815-S5-GFX11-MIR-RESUME4`
- Decision: `RESOURCE_RECOVERY_PASS__NO_SCIENTIFIC_DECISION`
- Quality tier: `TIER_B_Q2_VIABLE` (unchanged registry provenance)
- Scientific revision consumed: `false`
- Claim-bearing observation: `false`

## Pre-claim contract fidelity gate

- Gate status: `PASS`
- Exact action: complete natural gfx1100/wave32 pre-machine-scheduler MIR construction.
- Native path: exact commit Clang to AMDGPU IR; exact commit llc to pre-scheduler MIR.
- Small/object checks: 8 natural sources, one machine function each, exact verifier 8/8.
- Reproducibility: second MIR derivation matched 8/8 SHA-256 values.
- Claim-bearing run started only after PASS: `false`; none is authorized in this recovery assignment.

## Frozen contract and boundaries

The parent scientific contract remains unchanged. This assignment did not execute `GCNSchedStrategy+greedy` corpus baselines, candidate variants, occupancy-cliff comparisons, full-cost outcome comparisons, or scientific decision logic. It only removes the natural-MIR blocker.

## Non-relaxable quality audit

- Same-object: preserved (`gfx1100`, wave32, exact LLVM commit).
- Natural input: official ROCm examples commit; no synthetic counted.
- Reproducibility: exact hashes, verifier and second replay recorded.
- Evidence honesty: no scientific support or negative inference claimed.
- Stage B: unauthorized and not started.

