# Rule Audit Report

## 中文摘要

- 发现的问题：Source37 的 stage separation 改善了 RQ 可见性并得到一个诚实 raw，但没有提高 clean brief 数；S3 仍在 seed→RQ 之间要求 exact carrier/version，S4 则形成抽象 RQ 后因卡不完整而不启动 source closure，形成循环等待。
- 对推进速度或研究质量的影响：继续只换题源会反复产生抽象 seed/RQ；直接放宽 raw 门会降低 Stage0 精度。真正缺的是 RQ→raw 之间已有 `SOURCE_CLOSURE_QUEUE` 的有界调度。
- 建议修改：Source38 已完成且 Source39 正在运行，均不回写；Source40 只运行一轮 `SOURCE40_CARRIER_COMMITMENT_AND_SELECTIVE_DEPTH_CLOSURE_V1`，使用现有每 lane 最多 2 个 source closure 和现有检索预算；六路 breadth 继续 `terra/medium`，全周期最多 2 个预承诺 closure packet 升级到 `sol/high`。不增加 lane、容量或配额，现阶段不改共享模板。
- 是否需要用户批准：不需要新的政策批准。现有持续 Discovery 与有界公开资料获取授权覆盖该单轮 assignment-local 调度；任何预算扩大、OFST 例外追加或共享规则永久 patch 仍不在本提案授权内。

## Identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE36-37-CONSECUTIVE-ZERO-BRIEF-R34`
- `trigger`: Source36/37 连续两个完整六路周期零 clean brief；Source37 有一个 raw
- `requested_by`: `MAINLINE`
- `date`: `2026-08-15`
- `write_directory`: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\rule-audit\RULE-AUDIT-20260815-SOURCE36-37-CONSECUTIVE-ZERO-BRIEF-R34\`
- `shared_files_modified: false`

## Question and scope

- User/process question: stage separation 是否只是提高 raw recall，S3/S4 为什么仍缺精确载体/动作/估计量，OFST raw 是否健康，以及下一轮应改题源、source closure 还是模板。
- Rules inspected: `AGENTS.md`、`ROLE_RULE_AUDIT.md`、`ROLE_DISCOVERY.md`、RQ/Question Card 模板、资源本地化规则。
- Instances inspected: Source36/37 六路 canonical handoff；Source37 S3/S4/S5 决定性材料；R33；OFST 独立 prebrief closure 全包。
- Out of scope: Source38/39 行为、OFST 再获取、完整 Stage0、实验、共享规则写入和候选状态变更。

## Current authoritative behavior

现行 `ROLE_DISCOVERY.md` 和模板已明确：

1. 被选 seed 应先形成 2–3 个同对象 RQ，再看定向证据；证据/版本/current union 未知不能作为 seed 排除理由。
2. RQ 只需 tentative public object/source origin、可回答问题和预登记 evidence route；exact identity/version/current locus/full-cost 属于 Question Card/raw 层。
3. 若 raw 缺少来自具体公开资料或检索的字段，应进入 `SOURCE_CLOSURE_QUEUE`；漏斗顺序明确包含 `RQ_CANDIDATE → SOURCE_CLOSURE_QUEUE → EVIDENCE_QUALIFIED_RAW`。
4. 完整 current union、最强碰撞、完整 witness、实现和 Q2 仍是 bounded downstream debt，不得全部前移到 Discovery source closure。

所以现行科学门和模板骨架基本正确；主要问题是 assignment 执行没有真正调度已存在的中间队列。

## Evidence of the problem

| Observation | Evidence | Classification |
|---|---|---|
| Source36 为 42 seed→10 RQ family→0 raw→0 brief | Six canonical handoffs | Baseline funnel |
| Source37 为 42 seed→11 RQ family/30 variants→1 raw→0 brief | Six canonical handoffs | Recall/trace improvement, no brief-yield evidence |
| S3 以缺 exact carrier/version 为由形成 0 RQ，且 source ledger/queue 为空 | S3 RQ/queue/handoff | Pre-RQ gate leakage; selected-seed-only telemetry loophole |
| S4 形成 9 RQ versions，但没有具体 artifact，source ledger 和 queue 仍为空 | S4 RQ/card/queue | Source-closure scheduling loop |
| S5 OFST raw 冻结了合法 raw 字段，独立 closure 后仍 bounded-unresolved | S5 card + OFST review | Healthy raw recall with unresolved precision |
| OFST 16 acquisition calls 超过 cap 8 | OFST handoff/inventory | Resource execution violation; no scientific inference |

## Findings by requested question

### 1. Stage separation 是否只提高 raw recall，是否值得永久化？

它至少提高了流程可见性：S4 从 0 RQ 恢复到 3 family/9 variants，并产生了一个合规 raw。它尚未证明 clean-brief 或 Stage0 yield 增益，且 Source36/37 不是同一 seed 的配对重放，不能作因果估计。

stage separation 的**语义本来就是现行权威规则，应继续遵守**；无需把它当作一条全新的共享方法再次“永久化”。Source37 新增的证书、全套 telemetry 和 source-role 实现是否永久写入模板，证据不足，先不 patch。

### 2. S3/S4 为什么仍缺 exact carrier/action/estimand？

- S3：七个 seed 都是类别级提示，source ledger 为空；执行者要求 seed 先拥有 exact public carrier/version 才允许形成 RQ。这把 raw 字段泄漏到了 selected-seed 决策，因 `selected_seed=0` 而躲过了 stage-order certificate。
- S4：三类 RQ 仍使用“one fixed versioned artifact”占位，没有实际 artifact/版本；之后又以卡不完整为由不检索、不入 source-closure queue。缺件永远不会自行闭合。

问题不是 S3/S4 需要更多随机 seed，而是需要一个不读取科学结果的 identity-only carrier commitment，以及随后实际执行的 bounded source closure。

### 3. Source37 S5 raw 是健康 recall 还是泛化图算法/current-union 风险？

两者并存：它是健康 raw recall，因为 exact object、自然载体、同对象 endpoint、current locus、falsifier、full-cost 初界和有限路线都已冻结；同时 generic dynamic-graph/动态 WFST/current-main union 风险很高。独立 prebrief 没有发现直接 same-object absorption，却因 current-main、两版 carrier 和 oracle 未闭合而诚实停在 `NOT_ADMITTED_UNFROZEN`。因此不能把它算作 clean brief，也不能倒推 stage separation 无效。

### 4. 下一轮改什么？

以 **source-closure 调度修复为主体，并只在深审点选择性升级模型**；不再额外改题源配比，也不改共享模板。Source38 已完成、Source39 已在运行，故从 Source40 单轮生效。六路仍按现有角色找题，但每个预登记 selected RQ 可使用现有 closure capacity 把 tentative carrier 实例化，并用一个 current-source locus、一个明显 generic/current adversary 和一个 finite oracle/falsifier route 完成最低卡片判断。

Source40 期间冻结这一个改动，不再叠加新的题源、模板或门槛实验。此前多轮方案难以归因的一个原因正是每轮同时改变多个因素；这次必须让“source closure + selective depth model”成为唯一可识别变量。

### 5. 是否需要整体提升 Discovery 模型？

不建议六路全量升级。当前主要缺陷是没有给模型来源和 closure 工作，而不是 seed 生成能力不足。建议维持六路 `gpt-5.6-terra / medium` 的快速 breadth，只把全周期最多两个、在证据结果前已冻结的 carrier-closure packet 交给 `gpt-5.6-sol / high`，专门核验 exact action/estimand、generic/current absorption 和 finite oracle。这样把额外模型成本集中到决定 raw precision 的位置，同时不增加顶层会话和并行数。

## Recommendation

- Decision: `CLARIFY`
- Minimum effective change: `SOURCE40_CARRIER_COMMITMENT_AND_SELECTIVE_DEPTH_CLOSURE_V1`，仅一个六路周期。
- Source rebalance: `NO_ADDITIONAL_CHANGE`
- Shared template patch: `DEFERRED`
- Model route: breadth=`gpt-5.6-terra/medium`; selective depth=`gpt-5.6-sol/high`, global max 2 packets
- Historical backtest: `false` for this one-cycle execution clarification
- Source38/39 affected: `false`
- Non-relaxable gates: Q2、same-object、direct fatal、current union、强基线、自然/canonical 载体、full-cost、falsifier、复现与 claim ceiling 全部不变。

## Resource-compliance correction

Source40 的 source-closure 调度必须使用一个 assignment/lane 全局 attempt counter：每次网络 acquisition 在调用前原子加一；auth reject、404、零字节和未持久化响应都计数；不同工具、URL、fallback 或 retry 不能重置。达到 cap 即 fail closed，不得启动 replacement batch。handoff 前必须最终测量资源根、更新 inventory 的 bytes/attempts/finalized_at/validation；越界只能记录资源异常和 `NO_SCIENTIFIC_INFERENCE`。

这项机械控制不授权 OFST 继续获取。OFST 若恢复，仍需主线另行冻结一个符合现有用户公开资源授权、且不扩大本提案预算的题目级 resource assignment。

## Risk analysis

- False-negative risk: 下降；S3 不再因 exact version 未知而阻止 RQ，S4 的具体公开缺件不再静默消失。
- False-positive risk: raw 数可能增加，但明显 generic/current adversary 会在 source closure 中提前检查；完整 union 与 Q2 仍由后续独立阶段完成。
- Scientific-integrity risk: 低；不得把 source closure 结果用于改 RQ 或 backfill。
- Resource risk: 通过 pre-call 全局计数和 inventory finalization 降低；预算不增加。
- State risk: 无迁移；OFST、所有 STOP/HOLD/PASS 状态均不改变。

## Validation and rollback

- Success is process compliance, not nonzero yield: selected=0 的理由不得包含 raw-level missing fields；每个具体公开缺件要么完成有限 lookup、要么进入非空 queue/有界未闭合；所有 calls 在 cap 内；Sol depth packet 不超过 2 且不改 RQ；无结果感知回填；无科学门下降。
- Observe raw→brief and any independent Stage0 feedback, but do not set a minimum count.
- Roll back after Source40 if evidence outcomes influence queue selection/RQ wording, attempt count exceeds cap, generic/current-union objections are bypassed, or the added queue merely creates unbounded retrieval.
- A permanent shared-template clarification may be reconsidered only after Source40 real telemetry and any relevant independent closure feedback are available.

## Mainline handoff

- User approval already present: `true`
- Fresh user approval required: `false`
- Files proposed for change: Source40 assignment contract only
- Shared files proposed now: `none`
- Registry migrations: `none`
- Existing topics affected: `none`
- Shared files modified: `false`
