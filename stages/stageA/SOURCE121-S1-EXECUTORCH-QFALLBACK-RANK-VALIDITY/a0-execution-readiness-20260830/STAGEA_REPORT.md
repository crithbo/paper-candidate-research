# ExecuTorch QFallback Rank Validity — Stage A A1 Report

## 中文摘要

- A0 packet 已由 MAINLINE 接受，A1 获准先获取 official ExecuTorch 1.4.1 Windows wheel/dependencies，再获取 exact SmolLM2 snapshot。
- 网络进程 1 在 pip binary-only dependency resolution 阶段 fail closed：`hydra-core` 需要 `antlr4-python3-runtime==4.9.*`，但当前 Windows cp312 binary resolution 没有匹配 distribution。
- 按 0 retry 与有序门，网络进程 2、runtime import、三种 topology、quality gate、profiling、3 warmup + 10 measured reps 和 rank 结果均未启动。
- 当前没有任何性能、rank、reversal、held-out gain 或 observer-effect 结果；不能建议科学 PASS/STOP。
- Operational disposition：`EXECUTION_CONTRACT_HOLD__A1_RESOURCE_RESOLUTION_FAILED__NO_SCIENTIFIC_INFERENCE`。等待 MAINLINE 验收，不由 owner 重试。

- Lane id: `CANDIDATE_EXECUTION_LANE_3`
- Assignment id: `STAGEA-L3-20260830-EXECUTORCH-QFALLBACK-RANK-VALIDITY-A0`
- Scientific verdict: `NOT_EVALUATED`
- Operational disposition: `EXECUTION_CONTRACT_HOLD`
- Quality tier inherited from Stage 0: `TIER_B_Q2_VIABLE_UNCHANGED_NOT_READJUDICATED`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing observation: `false`
- Retry: `0`
- Current cycle usage reset confirmed: `false`
- Stage B authorized: `false`
