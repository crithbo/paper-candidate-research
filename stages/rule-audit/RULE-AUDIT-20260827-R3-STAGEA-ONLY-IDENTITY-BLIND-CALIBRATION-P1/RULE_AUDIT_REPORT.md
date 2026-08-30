# R3 StageA-only 身份盲校准审计报告

## 中文摘要

- 发现的问题：R3 的完整 Stage0+StageA 盲流程在 Stage 0 bootstrap 时发生两次身份污染，因而没有可用的 Stage 0 survivor，也不能把 Stage A 直接解释为完整流水线结果。
- 对推进速度或研究质量的影响：继续等待完整 R3 Stage 0 会把“Stage A 的证据门是否因已知论文成功而放宽”这个独立问题一并卡住；直接跳门又会改变完整 Stage0+StageA 的分母。
- 建议修改：只为一个独立、明示 StageA-only 的 calibration assignment 重用 R3 已封存的 12 个正控 evidence contract，并另加 4 个 Stage-A 特异负控；不复活 R3 盲测，也不改生产规则。
- 是否需要用户批准：用户已明确要求执行该 StageA-only 方案；MAINLINE 仍须冻结 assignment、选定 fresh reviewer 并验收 packet。

## Identity

- `audit_id`: `RULE-AUDIT-20260827-R3-STAGEA-ONLY-IDENTITY-BLIND-CALIBRATION-P1`
- `trigger`: 用户要求继续 R3 的 StageA-only blind calibration。
- `requested_by`: USER
- `date`: 2026-08-27
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260827-R3-STAGEA-ONLY-IDENTITY-BLIND-CALIBRATION-P1/`
- `shared_files_modified: false`

## 当前权威行为与观察

R3 协议规定 Stage A 只能接收 collision-adjusted Stage 0 survivors；其 blind phase 若污染则转非盲，且指标不可合并。实际 blind Stage 0 的 PRIMARY、SENTRY 各有一次污染，均未产生科学判断。R3 现有 Stage A packet 有 12 个匿名正控 contract，却没有可直接交付给 reviewer 的 4 个 Stage-A 特异负控。

| 观察 | 证据 | 分类 |
|---|---|---|
| Stage 0 blind 两次污染、0 判断 | `stages/stage0/_compatibility/identity-blind-r3/BLIND_PHASE_DISPOSITION.yaml` | 执行/身份可辨识事件 |
| Stage A 原 contract 依赖 collision-adjusted Stage 0 survival | R3 `BACKTEST_PROTOCOL.md` | 现行合同正确 |
| Stage A 匿名 packet 有 12 个正控 | `identity-blind-packer-l2/STAGEA_ANONYMIZED_PACKET.yaml` | 输入不足以直接形成 12+4 StageA-only 测试 |
| 原 blind reviewer context 仍冻结 `plan.md`/`registry.yaml` | `identity-blind-r3/primary/ASSIGNMENT_CONTEXT.yaml` | 严格 blind bootstrap 缺口 |

## 建议与安全边界

决定：`CLARIFY__USER_APPROVED_ASSIGNMENT_LOCAL_BLIND_BOOTSTRAP_EXCEPTION_REQUIRED`。

最小变化是新建一次 calibration assignment，而非修改生产 Stage 0/A 规则：它只回答 Stage A 的 evidence/fidelity/comparator/full-cost 兼容性。它不得报告 Stage 0 survival、collision-adjusted Stage 0 survival、完整 Stage 0 通过率或任何生产质量结论。

same-object、最新 collision、公平强基线、自然/规范证据、full-cost、可复现性与 claim ceiling 在生产流水线中完全保留；本 assignment 只不对其运行 Stage 0 collision gate，因此其结果不能替代生产 Stage 0。

## 验证和回滚

- 必须由一名未接触 R1/R2/R3 身份、gold、packet 或 reviewer output 的新 Stage A reviewer 执行。
- Reviewer 只读 blind operation card 与新封存的 16-case packet；如自动 bootstrap 注入 `AGENTS.md`、`plan.md`、`registry.yaml` 或历史目录，必须 fail closed 为 `BLIND_UNAVAILABLE`。
- 任一身份识别使该 reviewer 全部输出无效；两名独立 fresh reviewer 连续污染后停止 blind arm，回到非盲 Stage A compatibility。
- 回滚即不投递此 assignment；R3 原 blind terminal、非盲 fallback 与任何候选状态都不变。

## Mainline handoff

- 用户授权已存在：是，限于 `StageA-only identity-blind calibration`。
- 建议文件变更：仅由 MAINLINE 创建新 assignment/context/packet 目录；不得修改 `plan.md`、`registry.yaml`、`rules/` 的语义来追溯改变 R3。
- 现有题目影响：无；R3 原盲测与其非盲 fallback 保持独立。
- Shared files modified: `false`
