# Rule Audit Report

## 中文摘要

- 发现的问题：R41 的一次性 anchor-first 已提供足够的流程遥测，不应因为 0 brief 而续期或叠加新规则。
- 对推进速度或研究质量的影响：S1 成功修复了“未能固定锚点”的前端问题，却在正常的 non-generic raw gate 前被淘汰；S3 仍无 exact anchor。两者说明该 profile 只能改善锚点可见性，不能证明可提高 raw 或 brief 产出。
- 建议修改：`ANCHOR_FIRST_ENTRY_REBALANCE_V1` 按冻结合同到期；下一 canonical 周期恢复普通 R40 skill，不增加任何新微规则。
- 是否需要用户批准：不需要。

## Identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE55-56-ANCHOR-FIRST-EXPIRY-R42`
- `trigger`: Source55/56 连续 0 clean brief，且 Source56 是 R41 的一次性 anchor-first 过程试验。
- `requested_by`: mainline delegation.
- `date`: 2026-08-15.
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260815-SOURCE55-56-ANCHOR-FIRST-EXPIRY-R42/`
- `shared_files_modified: false`

## Question and scope

- 问题：只从流程遥测判断 anchor-first 是否应到期，R40 ordinary skill 是否继续，以及是否需要一个新的安全边界变更。
- 审计材料：Source55/56 common control 与六 lane handoff、Source56 S1/S3 的最小 RQ/Question Card 材料、R41 包、当前 Discovery skill。
- 明确排除：Source55 S1 MIPS FCSR closure-CQ01 尚在进行；它不计入 Source55/56 漏斗，也不作为 Source56 的结果。Source57 及以后未读取。

## Current authoritative behavior

R41 只授权 Source56 在 S1/S3 运行一次 `ANCHOR_FIRST_ENTRY_REBALANCE_V1`，且控制明确写有 `expires_after_cycle: SOURCE56`。它仅改变“先锚点、再 RQ”的调查顺序；raw required fields、same-object、current union、自然/canonical carrier、full-cost、强基线、Q2 与预算均未改变。

`research-topic-discovery` 同时规定：一次 profile 到期后不得因零产出叠加新 micro-rule；应先定位失败转换，再至多测试一项有界变化。

## Evidence of correct behavior and limits

| Observation | Frozen evidence | What it supports | What it does not support |
|---|---|---|---|
| S1 从 1 个 seed cluster 推进到 Zawrs 1.01 exact anchor、primary RQ 和 ordinary closure。 | Source56 S1 handoff/log/Question Card | anchor-first 可让该 lane 的入口从无锚点变为可审计锚点。 | 不证明发现了论文题；不证明该 profile 提高质量。 |
| 固定 RISC-V 语义后，只剩 retry/wait placement 的 generic policy shell。 | Source56 S1 Question Card | raw gate 的 non-generic discriminator 正常工作。 | 不是模型、资源、实现或证据门过严。 |
| S3 考虑六个候选仍无 exact public anchor，并登记 `NO_EXACT_ANCHOR`。 | Source56 S3 handoff | 没有把抽象 seed 伪装成 RQ/raw。 | 不证明 S3 没有潜在题或需要放宽锚点。 |
| S2/S4/S5/S6 ordinary controls 都是 exact identity/current union/generic/controller/locator-only。 | Source56 S2/S4/S5/S6 handoffs | 普通 R40 仍保持健康 abstention 与身份纪律。 | 不能充当 S1/S3 的统计反事实，因为 lane 视角不同。 |
| Source55 S1 留下 MIPS FCSR 的独立 source closure，尚未完成。 | Source55 S1 handoff; closure assignment header only | Source55 正确把未闭合的具体资料路线移出 normal Discovery。 | 不能计入本审计的 raw、brief、成功或失败。 |

## Diagnosis

anchor-first 的实际作用是提高“能否把 seed 变成可审计锚点”的可见性，而不是放宽或绕过科学门。它在 S1 达成了一个很小但真实的过程闭合：从前端 anchor failure 推进到可证伪的 generic-policy rejection。S3 的 `NO_EXACT_ANCHOR` 则确认同一 profile 不会凭空制造锚点。

由于 profile 只在两个异质 lane、一个周期内使用，且两个 lane 都没有 raw，不能得出它能提高 Discovery yield 的因果结论。它已经完成预注册的诊断目的；继续运行只会把一次流程诊断变成无依据的规则常驻。R40 ordinary skill 反而应保留：其 anchor、identity、current/contrary 检查和 honest backlog 路由持续阻止了 generic、current-union 和精确历史身份被包装为 brief。

## Risk analysis

- False-negative risk：退出 anchor-first 后，S1/S3 仍可能再次出现无锚点 seed；这是未来普通 telemetry，不足以立即再开 profile。
- False-positive risk：若为提高数量而继续强制锚点、把 generic policy 当目标专属机制，弱题会增多；本结论拒绝这种做法。
- Scientific-integrity risk：将 MIPS closure 的未完成状态或 Source55/56 的 0 brief 当作科学反例是错误的。
- Resource/time risk：续期、扩大到六 lane 或重启 strong slots会违反有限试验边界；本建议不增加成本。
- State/terminal risk：无迁移、无 STOP 复活、无既有题状态改变。

## Recommendation

- Decision: `NO_CHANGE`
- Safe-boundary action: 让 `ANCHOR_FIRST_ENTRY_REBALANCE_V1` 按 Source56 合同到期；下一 canonical 筛选回到普通 `RESEARCH_TOPIC_DISCOVERY_R40_V1`，不添加新的 assignment-local profile。
- Why no further delta: 当前证据只支持该 profile 的有限诊断价值，不支持对 raw/brief yield 的提升主张。强行继续将违反“每轮最多一个变更、到期不叠加”的 R40 skill 纪律。
- Non-relaxable gates preserved: Q2、same-object、current/strong-baseline、natural/canonical、full-cost、可复现性、claim ceiling、STOP non-revival、Stage B 用户门全部不变。

## Validation and rollback

- Historical cases/backtest required: 不需要；没有新行为改动。
- Next-cycle measurement: 继续记录普通 R40 的 seed/anchor/RQ/raw/deep/brief 分母，并把 MIPS closure 作为独立任务单列，直到其完成。
- Forbidden regressions: 续用或扩展 anchor-first、增加 budget/lane/strong slot、把 `NO_EXACT_ANCHOR` 当科学淘汰、把 MIPS closure 当 Source56 结果、或以 0 brief 为由放宽 raw gate。
- Rollback: 不适用；profile 已按冻结合同自然到期。

## Mainline handoff

- User approval already present: 无新的政策动作。
- Files proposed for change: 无。
- Registry migrations proposed: 无；可记录 R42 acceptance 与 profile expiry。
- Existing active/blocked/hold/terminal topics affected: 无；MIPS closure 保持独立 active source-closure 状态。
- Shared files modified: `false`。
