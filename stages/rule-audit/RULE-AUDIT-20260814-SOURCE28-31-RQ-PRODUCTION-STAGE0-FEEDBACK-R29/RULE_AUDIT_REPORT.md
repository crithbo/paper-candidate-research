# Rule Audit Report

## 中文摘要

- 发现的问题：S6 存在一个**已重复两次、但尚不足以给整个 lane 定性**的偏差：只要题目包含目标专用状态，再拼接 allocation/RA/scheduling 等通用动作，就容易被写成“joint exact/FPT/Pareto constructor”。现有字段能证明 target-specific vocabulary，却未必证明 non-product coupling。
- 对推进速度或研究质量的影响：Stage 0 正确挡住了 AMX 与 SME，没有降低科学质量；但连续把同一结构缺口后移，会消耗独立审查和 revision 容量，并让 4 个 brief 全集中于一个相关题型。
- 建议修改：Source32 先等待 MVE 与 PPC-MMA 的 PRIMARY 反馈被主线接受，然后只运行一轮 `POST_FEEDBACK_NON_PRODUCT_COUPLING_SURVIVAL_V1`。它是对现有 generic-kernel 禁令和 action-survival 要求的 assignment-local 澄清，不是新增质量门。
- 是否需要用户批准：无需新的 generic policy approval；现有持续 Discovery 授权覆盖下一安全边界的一轮、容量不变的题源/漏斗澄清。永久写入共享规则或扩大范围不在本包授权内。

## Identity

- `audit_id`: `RULE-AUDIT-20260814-SOURCE28-31-RQ-PRODUCTION-STAGE0-FEEDBACK-R29`
- `trigger`: Source28–31 的 4 个 production clean brief 全来自 S6，前 2 个独立 Stage 0 结果共享 factorisation/generic-allocation 失败核。
- `requested_by`: USER via MAINLINE
- `date`: `2026-08-14`
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260814-SOURCE28-31-RQ-PRODUCTION-STAGE0-FEEDBACK-R29/`
- `shared_files_modified: false`

## Question and scope

- User/process question: S6 是否系统偏向“target state + allocation/RA”伪联合；能否加低成本 non-product survival 检查；是否暂缓 Source32；下一安全边界如何运行一次有界策略。
- Rules inspected: `AGENTS.md`；`rules/ROLE_RULE_AUDIT.md`；`rules/ROLE_DISCOVERY.md` 中 RQ 前端、raw/closure debt、D1 survival trace、generic-kernel、prebrief 与 brief 条款；RQ/Question Card 模板。
- Candidate examples inspected: Source28 AMX、Source29 SME、Source30 MVE、Source31 PPC-MMA clean brief；AMX/SME 已接受 Stage 0 决定；MVE/PPC 只按主线登记状态处理。
- Out of scope: 改共享文件、候选状态、Stage 0 结论、检索、实验、V9、Stage A/B、下载和 lane 通信。

## Current authoritative behavior

1. `rules/ROLE_DISCOVERY.md / 第二层` 已要求一个来源支持、可推翻的 `non-generic discriminator`，并禁止只剩 generic wrapper/solver 的 family 进入 raw。
2. 同文件 `第四层` 允许完整 current union、最强碰撞和完整小 witness 作为 bounded closure debt；这是防止 Discovery 变成缩小版 Stage 0 的正确设计。
3. 同文件同时要求即将进入 D1 的卡执行低成本“单 witness/单 mode action-or-observation survival trace”。完整 action catalogue 和 Q1/Q2 仍由 Stage 0 重建。
4. `PREBRIEF_ADVERSARIAL_CHECK` 已包含 generic kernel；因此“伪联合不得进 brief”不是新增科学门。

文字政策方向正确，主要缺口是“survival”没有被模板机械定义。Source28/29 将“待 Stage 0 构造两计划”登记成可接受 debt，却没有先给出任何来自 current source/spec 的跨子动作依赖边。

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| 4 个 production brief 全来自 S6；S1–S5 同期 20 个 lane-round 为 0 brief | registry Source28–31 blocks | 4 rounds | Source concentration / correlated backlog |
| AMX 在固定 witness 上分解为 config/call obligation × ordinary RA；TMM relabel full-cost invariant | AMX Stage 0 revision | Yes, with SME | Scientific false positive caught correctly |
| SME 两个 pass/state domain 没有相互信息通道，联合 DP 是 Cartesian product | SME Stage 0 PRIMARY | Yes, with AMX | Scientific false positive caught correctly |
| AMX/SME brief 都具备 target-specific nouns、finite state 和 generic-reduction falsifier，但把决定性双计划留给 Stage 0 | Source28/29 S6 cards/deep/brief | Yes | Execution semantics / template weakness |
| MVE 有 current-source single-block boundary，结构上不同于单纯 target-state × RA；PPC 与 AMX/SME 更相似 | Source30/31 briefs | Pending | Needed discriminating feedback, no outcome inference |
| Stage 0 未因缺实现、缺结果或资源而 STOP | Accepted AMX/SME reports | 2/2 | Correct hard-gate behavior |

## Is this a systematic S6 bias?

最准确的结论是 `STRONG_CORRELATED_PROCESS_SIGNAL__NOT_YET_LANE_WIDE_STATISTICAL_VERDICT`：

- 从已完成结果看，2/2 都是同一伪联合失败，已经超过“单次偶然”；
- 但只有两个已接受 outcome，且来自同一个 S6 题源/表达机制，不能外推所有 S6；
- 四个 brief 的名称与机制显示 Source31 PPC 仍处于高相似风险，而 MVE 提供了一个重要反例可能：它从明确 current limitation 出发，不以 allocator 为唯一第二因子；
- 因此应做一次窄修正和等待反馈，不应关闭 S6、降低其权重为零或撤销 RQ production。

## The cheap check that does not become Stage 0

对任何将两个或以上动作称为 `joint / co-design / integrated / whole-constructor`，且至少一个因子属于 allocation、RA、scheduling、packing、placement 或 controller 的卡，在进入 clean brief 前补一页 `NON_PRODUCT_COUPLING_SURVIVAL_NOTE`：

1. **Factor split**：明确写出组件 A、组件 B 以及当前最强 `A→B` 或 `B→A` 顺序组合。
2. **Shared endogenous variable**：给出一个不是名称/标签的 native 决策变量、合法性谓词或 full-cost cross-term；指出 A 的某个选择如何改变 B 的合法动作集、可达动作或完整成本。
3. **One source-anchored trace**：最多使用两个已选 current source/spec locus，展示上述依赖边确实存在。可以是符号 action trace，不要求构建、运行或完整合法双计划。
4. **State-erasure attack**：删除 target 名与专用状态字段后，若剩余 recurrence/action 与通用 RA/packing/scheduling 相同，而专用字段只做事后 legality check，则 non-product 不存活。
5. **Disposition**：
   - 迹线存活：可继续现行 C0/deep/brief；
   - 公开证据尚不足但有有限路线：保留 `EVIDENCE_QUALIFIED_RAW / OPEN_BOUNDED`，标 `NOT_READY_FOR_CLEAN_BRIEF__NON_PRODUCT_UNPROVEN`，不是科学 DROP；
   - current source 已证明独立/完全分解：按现有 generic-kernel/direct-fatal 规则结构性 DROP；
   - 非 composed/joint 题：`NOT_APPLICABLE`，不得受此检查影响。

这项检查不要求完整 current union、最新论文查重、完整 action catalogue、正式 Q2、实现、性能结果或 exhaustive two-plan witness。因此不会把 Discovery 前移成 Stage 0。

## Should Source32 wait?

建议 `YES__BOUNDED_FEEDBACK_BACKPRESSURE`。Source32 应在主线接受 MVE 与 PPC-MMA 两份 PRIMARY handoff 后再冻结，理由不是等待正结果，而是：

- 已有两个相似 brief 在审查链上，新增一整轮会扩大相关 backlog；
- MVE/PPC 恰好能区分“所有 target-state constructor 都有问题”与“只有 generic allocator/product 组合有问题”；
- 等待门只依赖 handoff 被接受，不依赖 PASS/STOP 方向，不构成 outcome-aware selection。

如果其中一题进入正式 `BLOCKED_USER_ACTION_REQUIRED`，主线应按 blocker 规则处理；本包不授权用未验收草稿猜结果，也不授权无限等待之外的新替代策略。当前两题都是静态 PRIMARY/排队，预期门是有限的。

## Risk analysis

- False-negative risk: 若把完整两计划或 exhaustive coupling proof 前移，会误杀真实联合题；本建议只要一个来源锚定的依赖边，未闭合者留在 raw/debt，降低此风险。
- False-positive/weak-paper risk: 若不修改，S6 可继续用目标术语掩盖 generic product，重复消耗 Stage 0。
- Scientific-integrity risk: 低；不把“尚未证明耦合”写成 STOP，也不继承 AMX/SME STOP。
- Resource/time risk: 每个适用卡最多两个既有 source locus、一份 action trace；不增加 lane、raw/deep 容量或网络预算。
- State-migration risk: 无；只影响 Source32 新 assignment，既有题与终态不变。
- Terminal-revival risk: 无；AMX、SME 不得以新规则复活。

## Recommendation

- Decision: `CLARIFY`
- Minimum effective change: 下一安全边界运行一次 `SOURCE32_POST_FEEDBACK_NON_PRODUCT_COUPLING_SURVIVAL_V1`；先收齐 MVE/PPC PRIMARY 反馈，再在六路相同容量下，对 composed/joint 卡执行上述 note。其余 RQ production 语义不变。
- Why a smaller operational fix is sufficient: generic-kernel 禁令和 survival trace 已在权威规则中；无需新增质量门或立刻改共享模板。问题可以先通过 assignment-local 字段解释和一次可回滚轮次验证。
- Non-relaxable gates preserved: Q2、same-object、current union、最新碰撞、公平强基线、自然/canonical carrier、full-cost、可复现性、claim ceiling 全部不变；v8.7、V9 OFF、网络安全排除不变。

## Validation and rollback

- Historical cases/backtest required: 本次 assignment-local 澄清不需要新历史回测，因为不改变 raw admission 或科学门，只机械落实既有 survival/generic-kernel 语义。若未来拟把它变成永久模板硬字段、扩大到所有非联合题或提前 raw admission，则必须另立 proposal 并做时间切片回测。
- Shadow-run plan: 不另启 V9/shadow；Source32 本身是一次 prospective、assignment-local 可识别试点。
- Success criteria:
  1. 100% 适用的 composed/joint 卡在 clean brief 前有 note；
  2. note 至少具名一个 shared endogenous variable 和一个 current-source/spec dependency edge；
  3. 0 个因“尚未证明”被登记科学 DROP/STOP；
  4. 0 个非 composed/joint 卡被额外阻塞；
  5. 下游 Stage 0 若仍 STOP，必须区分 factorisation/generic-kernel 与其他原因；不设 PASS/brief 配额。
- Failure criteria: 检查被执行成完整 Stage 0、需要超过两个决定性 locus、要求实现/结果、阻止非联合题，或用 AMX/SME 结果直接淘汰新身份。
- Rollback condition: 任一 failure criterion 命中，下一 assignment 删除该 assignment-local note 要求，回到当前 RQ production；Source32 已生成的原始材料不追溯改写。

## Mainline handoff

- User approval already present: `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 覆盖容量不变、无门槛放松的下一安全边界 adaptive assignment；本包不请求新 generic approval。
- Files proposed for change: Source32 control/六路 assignment 中添加 assignment-local `NON_PRODUCT_COUPLING_SURVIVAL_NOTE` 说明；不修改共享文件。
- Registry migrations proposed: none；主线只在正常创建 Source32 时登记其 profile 和反馈门。
- Existing active/blocked/hold/terminal topics affected: none。
- Shared files modified: `false`

