# Rule Audit Report

## 中文摘要

- 发现的问题：Source40 改善了 carrier/source-closure 的可追踪性，但没有改善规范 raw 或 clean brief 产出。唯一 reported raw 是 Source19 的历史重复并存在直接 GCC 碰撞；S6 还出现 0 次尝试却标成 queue exhausted 的状态错误。
- 对推进速度或研究质量的影响：历史身份窗口过短会制造 false raw、浪费下游审查；虚假 exhaustion 会让真正未执行的 source closure 被误当成已完成。S4 `sol/high` 提供了真实证据增量，但作用是提高 precision，而非已证明提高 recall。
- 建议修改：永久保留 stage separation、identity-only carrier commitment 和具体缺件必须入 queue；新增全历史 terminal identity 预检与 closure exhaustion 机械一致性；不永久化固定 S3/S4 强模型 slot。
- 是否需要用户批准：不需要新的政策批准。建议是现有 same-object/current collision/证据诚实门的机械落实，不改变 Source41 的 `terra/high` 用户授权，也不扩大资源或模型权限。

## Identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE39-40-CARRIER-DEPTH-RECALL-R35`
- `trigger`: Source39 与 Source40 连续 0 clean brief；Source40 完成一轮 carrier/closure 与选择性 depth pilot。
- `requested_by`: MAINLINE
- `date`: 2026-08-15
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260815-SOURCE39-40-CARRIER-DEPTH-RECALL-R35/`
- `shared_files_modified: false`

## Question and scope

- 问题：Source40 是否改善 raw/clean-brief recall；`sol/high` 是否有独立信息增益；哪些失败是健康 abstention，哪些是执行/身份漏检；哪些机制值得保留。
- 检查：AGENTS、plan、registry、ROLE_RULE_AUDIT、ROLE_MAINLINE、ROLE_DISCOVERY、Source39/40 controls 与 12 份 handoff、S4 packet/findings/canonical disposition、S1/Source19 identity evidence。
- 范围外：不修改 Source41，不运行检索/实验/Stage，不评价任何候选的 Q2 或主结果。

## Current authoritative behavior

1. `AGENTS.md` 和 `ROLE_DISCOVERY.md` 要求 RQ 在证据前冻结；完整 current union、强碰撞与主结果可留给 C0/deep/Stage0，但 direct fatal、exact/terminal identity 和 generic shell 仍应提前阻断。
2. Source40 control 要求具体公开缺件进入非空 queue，每 lane 最多 2 个 closure、每 locator 最多 3 条确定性路线；`EXHAUSTED` 不得被缺资料自动解释为科学负证据。
3. Source40 只授权最多两个预承诺 `sol/high` packet；不能改 RQ、补位、判 raw/brief/Q2 或替代 Stage0。

## Evidence of a problem or correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| Source39 0 canonical raw/0 brief | six handoffs | baseline | observed funnel |
| Source40 reported 1 raw，reconciliation 后 0 canonical raw/0 brief | S1 final handoff/reconciliation | one decisive case | identity coverage defect corrected before Stage0 |
| Source19 D01 五字段 exact/terminal contains Source40 FPMR，另有 GCC direct collision | Source19 review | decisive | healthy exclusion; late lookup |
| S4 exact carrier/metric/falsifier closed，fixed artifact 无法实例化 full-cost estimand | Depth-02 findings | n=1 | healthy abstention + information gain |
| S6 两个 queue items `attempts=0` 却 `EXHAUSTED` | S6 queue/handoff | 2 items | execution/telemetry defect |
| S2 一条路线后 bounded unresolved | S2 queue | one item | honest only if route-unavailability reason is explicit |

## Risk analysis

- False-negative risk：全历史 identity index 若只按名称匹配会过度 containment；必须按 object/action/endpoint/guarantee/full-cost 五字段，RELATED 保持 RELATED。
- False-positive risk：不修会重复产生类似 FPMR 的 false raw，占用 Stage0。
- Integrity risk：0-attempt exhaustion 会把“未执行”伪装成“已闭合”。
- Resource risk：要求诚实 attempt accounting 不增加预算；只会让未执行状态显式化。
- State risk：不迁移既有 scientific states；Source40 FPMR 已在 Stage0 前排除。
- Terminal revival risk：无；全历史 index 强化 STOP/terminal non-revival。

## Recommendation

- Decision: `PATCH_RECOMMENDED`
- Minimum effective change: 从 Source42 或以后安全边界实施 `GLOBAL_TERMINAL_IDENTITY_AND_CLOSURE_ACCOUNTABILITY_V1`。
- 永久保留：stage separation、identity-only carrier commitment、RQ 后具体资料缺口必须进入 queue。
- 新增：raw 前全历史 exact/terminal identity 机械预检；`EXHAUSTED` 必须有 route-attempt 或逐条 mechanically unavailable 证据。
- 不永久化：固定 S3/S4 `sol/high` slot。保留 packet schema 但默认 inactive，等待 Source41 `terra/high` 的实际对照反馈。
- 更小的“只提升模型”不足：它不会修复滑动 identity window 或 0-attempt 状态矛盾。
- 保持：Q2、same-object、direct fatal、current union、公平强基线、自然/canonical carrier、full-cost、falsifier、复现、claim ceiling、STOP 不复活。

## Validation and rollback

- 不需要新盲回测；需要一个 targeted regression：Source40 FPMR 必须在 raw 前命中 Source19，Arm SME/ZA 等 related-only family 不得被误判 identity。
- 下一完整周期 shadow 记录：`post-RQ concrete gap queue coverage=100%`、`zero-attempt exhausted=0`、`late historical identity reconciliation=0`。
- Source41 不暂停、不回写；指标从 Source42 安全边界起观察。
- 若全历史 index 产生 related-only false exclusion，立即回滚 containment 自动处置，仅保留 lookup warning 并交主线人工五字段核对。

## Mainline handoff

- User approval already present: `true` for Source41 terra/high；R35 不请求或改变该授权。
- New user policy approval required: `false`。
- Proposed shared files: `rules/ROLE_MAINLINE.md`、`rules/ROLE_DISCOVERY.md` 与未来 assignment control 的最小字段；本包未修改。
- Registry migration: 只登记 future control revision 和验证指标；不改既有候选状态。
- Shared files modified: `false`。
