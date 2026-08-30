# SOURCE120-S1-VHLO-SEMANTIC-COMPAT SENTRY confirmation

## 独立结论

- Disposition: `CONFIRM`
- Scientific verdict confirmed: `PASS_RECOMMENDED`
- Operational disposition: `READY`
- Quality tier: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `CONDITIONAL_CANONICAL_FORMAL_ORACLE_COMPATIBILITY_ONLY__NO_MAIN_RESULT`
- Model route: `gpt-5.6-sol/high`（本次用户命令临时覆盖）

## Heavy subtraction

第一方 current union 已覆盖候选的大部分工程机制：StableHLO compatibility contract 提供五年 backward、两年 forward compatibility 及 target-version portable-artifact APIs；`stablehlo/tests/vhlo` 为全部支持版本维护语法 round-trip compendium；reference interpreter/Python tests 已执行 input-bearing programs 并核对 expected values；IREE 与 XLA 均存在 StableHLO consumer execution loci；OpenXLA comparative benchmark 已生成 StableHLO artifacts、保存 inputs/outputs 并支持跨 runtime accuracy comparison。

因此，generic witness generation、interpreter integration、VHLO conversion、单 consumer execution、基础 cross-runtime comparison 或把现有 tests 粘合起来，均不能作为独立 N1/N2 贡献。

## Nonfatal residual

冻结对象仍是官方 compatibility APIs 产生的 StableHLO portable artifacts，在文档化版本窗口内由 reference path 与至少两个 pinned consumers 处理。允许的 residual 仅为 N3 measurement：以相同 legal witness/input、结果无关 support-intersection denominator 和 spec-typed outcome taxonomy，测量跨版本、跨 consumer 的 compatibility decision coverage、disagreement classes 与 boundary stability。

该 residual 未被当前 union 直接覆盖。官方 VHLO suite 主要判定 syntax identity；reference tests 不构成跨版本多 consumer matrix；OpenXLA benchmark 没有冻结 VHLO version window 或 spec-typed compatibility taxonomy。公开 XLA/IREE issues也说明 consumer-specific failure surface 存在，但 issue 个案不是候选结果或新颖性证明。

`DIRECT_FATAL=NO`，但 collision state 必须保持 `SEARCH_BOUNDED_OPEN__HEAVY_DIRECT_SUBTRACTION`。

## Tier-B shape

Tier-B 仅条件成立：论文必须交付 version-pinned corpus、typed oracle protocol、完整 denominator、至少两个 real consumers、现有 union 的公平基线、decision-delta/taxonomy 结果、unsupported/out-of-contract 分层、full-cost ledger 与可重放 artifact。若只是 harness glue、单 consumer 测试或已知 issue 重放，则低于 Q2。单一 IR ecosystem 与 heavy subtraction 当前限制 Q1 潜力。

## Bounded Stage A killer

在任何 claim-bearing run 前冻结 exact commits、支持交集、两个 producer versions、reference + XLA CPU + IREE CPU、四个 oracle classes（exact integer、tolerance-governed float、implementation-defined/outside-guarantee、unsupported）、分母、阈值与 generation-through-triage cost。先人工复核一个完整 artifact/input/oracle trace，再运行最小矩阵。

以下任一项直接杀死方向：合法 cross-version/consumer triples 不足；没有超出 VHLO suite + interpreter/testdata + consumer-native tests + OpenXLA benchmark union 的有效 decision coverage；所有 disagreement 都是 unsupported/out-of-contract/threshold artifacts；分类 replay 不稳定；或最终交付只剩 glue 而无稳定经验 taxonomy。正结果只构成 preliminary non-falsification。

## 限制与完整性

本次未实现候选、未下载或运行 artifact、未 build/experiment，也未启动 Stage A/B。所有结论来自第一方公开文档/源码与冻结 PRIMARY 输入；AI-assisted tools 用于检索和综合。

## Pause

完成本 SENTRY handoff 后按 reset soft-pause 停止，不派 successor；该信号不影响科学判断。
