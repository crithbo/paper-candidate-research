# Rule Audit Report — Stage A Paper-Evidence Replay

## 中文摘要

- 用户问题：Stage A 回测是否可以直接使用论文已经报告的成果，而不在本机把每篇论文重新做一遍。
- 结论：可以，而且更适合回答“Stage A 审查规则是否过严”。重新实现同时测量工程能力、平台兼容性、资源和规则严格度，混杂严重；论文证据回放只测 gate 对同等证据形状的兼容性。
- 边界：回放证据只能标记为 `PAPER_REPORTED_EVIDENCE` 或 `AUTHOR_ARTIFACT_REPORTED_EVIDENCE`，不能标记为本项目 `REPRODUCED/VERIFIED`。它不测试 AI 自主实现能力，也不能把论文最终结论直接登记为项目候选结果。
- 当前切换条件：2026-08-27 检查时，三条 candidate lane 均为 idle。已产生的下载、构建、fidelity 或 probe 结果保留为 supplemental reproducibility evidence；不覆盖、不删除，也不要求剩余案例继续复做。

## Identity

- `audit_id`: `RULE-AUDIT-20260827-STAGEA-PAPER-EVIDENCE-REPLAY-R1`
- `requested_by`: `USER`
- `date`: `2026-08-27`
- `scope`: 当前 8 个预登记 `NONBLIND_STAGEA_COMPATIBILITY` 本地案例
- `shared_files_modified: false`

## Why this is the cleaner test

当前原始方案把三件不同的事混在一起：

1. 论文机制和证据是否具有 Stage A 形状；
2. 当前规则/gate 是否会接受这种证据；
3. 本机 Windows、依赖和 AI owner 是否能重新实现、构建并复现。

用户要判断的是第 2 项。直接回放论文证据，可以控制第 1 项并移除第 3 项的资源噪声。已经完成的本地 probe 仍有价值，但只用于说明 reproducibility/resource route，不应成为每案必须重跑的门。

## Evidence classes

| Label | Meaning | May support compatibility PASS? | May claim independent reproduction? |
|---|---|---:|---:|
| `PAPER_REPORTED_EVIDENCE` | 论文正文、表格、图和附录中的结果 | yes | no |
| `AUTHOR_ARTIFACT_REPORTED_EVIDENCE` | 作者 artifact/README/AE 报告声明的结果 | yes, with provenance | no |
| `PROJECT_LOCAL_SUPPLEMENT` | 当前回测已经实际运行并保存的本地结果 | yes, within its exact scope | only for the exact locally observed fact |
| `PROJECT_REPRODUCED` | 由项目按冻结命令独立重放并满足复现门 | yes | yes |

本轮不要求把前两类升级成后两类。

## Recommendation

- Decision: `PATCH_CURRENT_BACKTEST__USER_APPROVED`
- 停止继续下载、构建或运行尚未完成的 Stage A compatibility 案例。
- PACKER 为 8 案分别生成 `PAPER_EVIDENCE_CAPSULE`；Stage A gate 只对 capsule 做兼容性判断。
- 已有本地结果作为独立的 supplemental column，不改变 paper-evidence 主分母。
- 若论文证据缺失决定性构造、比较器、自然输入、full-cost 或合法性信息，则结果为 `PAPER_EVIDENCE_INSUFFICIENT_FOR_STAGEA_COMPATIBILITY`，不是科学 STOP，也不是资源 blocker。
- 论文证据回放与此前 blind/nonblind Stage 0 指标分别报告。

## Claim ceiling

本回测可以回答：

> 对已知达到 Q2+ 或同等级的工作，如果把论文当时已经公开的证据按当前 Stage A 合同提交，现行 gate 会接受、要求修订还是拒绝？

本回测不能回答：

- 本项目是否独立复现这些论文；
- AI 是否能从零实现这些机制；
- 这些论文在 2026 年 current union 下仍具新颖性；
- 当前候选是否可以进入 Stage B 或正式项目。

## Mainline handoff

- 当前 running process：未发现；candidate lanes 均 idle。
- 既有资源与结果：保留，按 lifecycle 做正常 closeout，不自动删除 claim-relevant supplemental evidence。
- 后续执行角色：Backtest PACKER → independent Stage A gate → Backtest AUDITOR。
- 不再需要 candidate owner 对剩余案例逐篇复做。
- `shared_files_modified: false`

