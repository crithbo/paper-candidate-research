# Rule Audit Report

## 中文摘要

- 发现的问题：Source56/57 均为 0 clean brief，但并非同一种失败。多数已锚定路线被精确身份、current union 或 generic kernel 合理淘汰；另有两条 Wasmtime 路线停在具体、可恢复的 source closure 队列；S3/S4 则持续停在 anchor 前。
- 对推进速度或研究质量的影响：现有 R40 规则成功防止了把不完整资料、泛化构造和已吸收动作伪装成 raw。它尚未改善 S3/S4 的锚点召回，但连续零 brief 不能自动成为加新规则的理由。
- 建议修改：不改共享规则，也不新增 Discovery profile。下一安全边界继续普通 R40；仅按既有 queue 合同分别推进 Wasmtime Threads/GC 的独立 source closure，不将 closure 结果回填或混入下一 Discovery 周期。
- 是否需要用户批准：不需要；这是现有 queue 合同与持续 Discovery 授权内的正常推进，不新增预算、lane 或模型能力。

## Identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE56-57-QUEUE-SEPARATION-R43`
- `trigger`: Source56 与 Source57 连续完整六路均为 0 `CLEAN_STAGE0_BRIEF`。
- `requested_by`: mainline delegation.
- `date`: 2026-08-15.
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260815-SOURCE56-57-QUEUE-SEPARATION-R43/`
- `shared_files_modified: false`

## Question and scope

- 问题：区分健康结构淘汰、锚点/closure 召回损失、两条 Wasmtime queue，并给出唯一最小下一边界建议。
- 范围：Source56/57 及当前共享规则。Source58 outcome、任何新检索、实验和控制动作均不在范围。
- MIPS：Source55 MIPS FCSR 仅作“unresolved 仍不是科学结论”的历史对照，绝不计入本次漏斗或建议效果。

## Current authoritative behavior

`ROLE_DISCOVERY.md` 要求 exact/current/generic 的已知结构性反例在 raw 前诚实淘汰；缺少具体公开材料时应进入 `SOURCE_CLOSURE_QUEUE`。`PENDING_UNEXECUTED`、`OPEN_BOUNDED` 与 `UNRESOLVED_BACKLOG` 不是 exhausted、STOP 或 absence/newness 结论。

R40 skill 要求记录 seed、anchor、RQ、closure、raw、deep、brief 的不同分母，且在连续零 brief 后只能诊断第一个失败转换并至多测试一项有界变化。Source56 的 anchor-first 已到期；Source57 已恢复 ordinary R40。

## Evidence classification

| Category | Evidence | Assessment |
|---|---|---|
| Healthy identity/current/generic abstention | Source56 S1 generic Zawrs policy, S2 exact identities, S5 current/controller, S6 current/generic; Source57 S5 current build actions/exact Bazel and S6 current GlobalISel/generic; Source57 S2 exact SPIR-V/Vulkan controls | 健康。它们是在 raw 前发现了决定性 subtractor 或非通用判别失败，不是模型、资源或下游门过严。 |
| Pre-anchor recall loss | Source56 S3/S4 与 Source57 S3/S4 均为 `SEED → EXACT_PUBLIC_ANCHOR` 停止 | 真实前端召回限制，但 R41 anchor-first 已完成单轮试验并按 R42 到期；证据不足以再次启用或叠加新 profile。 |
| Wasmtime Threads queue | Source57 S1：exact project/object/bundle，0 attempts，`PENDING_UNEXECUTED` | 具体闭合债务，不能因未执行而被视为失败；应由已分配的独立 closure lane 按原合同处理。 |
| Wasmtime GC queue | Source57 S2：v45.0.0，1 次 route，`OPEN_BOUNDED`、非 exhausted | 具体且可恢复的资料闭合债务；不能变为 raw、负结论或下一波补位。 |
| MIPS historical control | Source55 closure 已返回 unresolved | 说明 source closure 可保持 bounded/unresolved 而不污染 Discovery；不是 Source56/57 的比较组或结果。 |

## Diagnosis

这两轮的 0 brief 由三个独立瓶颈构成。第一类是科学上健康的“已有当前实现吸收或只剩通用内核”；这部分不应该被优化掉。第二类是 S3/S4 的 anchor 前损失；它值得持续遥测，但刚刚完成的 anchor-first 单轮没有证据支持续期。第三类是 Wasmtime 的两条有明确项目、对象、问题和有限来源路线的 closure debt；它们不是 Discovery recall loss，也不应通过把 Discovery 变成 Stage 0 来处理。

因此最小正确动作不是追加 profile，而是保持分离：canonical Discovery 按 ordinary R40 前进；独立 closure lane 只为 queue 冻结的字段闭合，返回 `CLOSED_TO_TYPED_RQ / STRUCTURAL_FATAL / UNRESOLVED_BACKLOG`，不自行生成 brief，也不把新结果带回已经完成的 Source57。

## Risk analysis

- False-negative risk：S3/S4 的前端锚点不足可能继续隐藏可行问题；但连续 profile 叠加会降低可归因性。
- False-positive risk：把 Wasmtime queue 直接升级 raw，或把 current/generic 路线重新包装为“未被探索”，会削弱 same-object/current-union 门。
- Integrity risk：将 0 attempts 的 Threads queue 标作 exhausted，或将一次 GC route 未闭合作为科学否定，均违反现有规则。
- Resource/time risk：本建议不提高任何预算、强模型 slots 或并行度；closure 仅按已冻结任务推进。
- State/terminal risk：不改变 STOP、active、hold 或 queue 状态。

## Recommendation

- Decision: `NO_CHANGE`
- Unique next-safe-boundary recommendation: `RETAIN_ORDINARY_R40__QUEUE_SEPARATION_ONLY`。下一 canonical Discovery 周期保持普通 R40；将 Source57 S1 Threads CQ01 和 S2 GC SCQ-S57-01 仅作为各自 parent 的独立 bounded closure 处理，且在未得到其规定的 closure 输出前，绝不计入 raw/brief、绝不作为下一波题源证据。
- Why no smaller/larger delta: 这不改变任何语义，是当前规则的直接执行。新 Discovery profile、强模型重启、source budget 增加或 broad de-weight 都与观察到的三类原因不匹配，并会形成被禁止的 micro-rule stacking。
- Non-relaxable gates preserved: Q2、same-object、current collision、强基线、自然/canonical carrier、full-cost、可复现性、claim ceiling、STOP 非复活与 Stage B 用户门均保持。

## Validation and rollback

- Backtest or user policy: 不需要。
- Acceptance: 主线机械确认 Source58 或更晚周期没有把这两条 queue 作为 raw/brief 或结果感知 seed；queue handoff 必须写 attempt、剩余 route、carrier/action/estimand 闭合状态与 `NO_SCIENTIFIC_INFERENCE`（若仍未闭合）。
- Failure condition: queue 被跨题回填、被记作 exhausted 而没有满足 attempt 规则、被直接提升为 brief，或借机改变总预算/slot，即 fail closed 并恢复 parent queue 原状态。
- Rollback: 不适用；无新 profile 或规则变更。

## Mainline handoff

- User approval already present: 无新增政策请求。
- Files proposed for change: 无。
- Registry migrations proposed: 无；仅可登记本审计 acceptance。
- Existing active/blocked/hold/terminal topics affected: 无；Wasmtime/MIPS queues 保持既有 owner 和状态。
- Shared files modified: `false`。
