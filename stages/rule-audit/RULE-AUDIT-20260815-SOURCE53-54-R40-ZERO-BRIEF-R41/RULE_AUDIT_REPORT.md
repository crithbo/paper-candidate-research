# Rule Audit Report

## 中文摘要

- 发现的问题：R40 后连续两轮仍为 0 clean brief，但失败主要发生在前端的 `seed → exact anchor` 与 `anchor/RQ → source-supported non-generic residual`；没有证据表明 Stage 0、Q2 或 raw 科学门错误地拒绝了本应进入下游的题目。
- 对推进速度或研究质量的影响：R40 增加了责任可追溯性，避免了将不完整 RQ、泛化构造或网络失败伪装成 raw；但在这两个周期中没有提高 raw 召回。
- 建议修改：不改共享规则。建议仅在下一安全边界做一次、到期即失效的 `ANCHOR_FIRST_ENTRY_REBALANCE`：S1/S3 从既有 seed/检索预算中先固定可公开核验的锚点，再产生主 RQ；这是题源调度，不是录取门或配额。
- 是否需要用户批准：不需要。现有持续 Discovery 授权覆盖这一不增加 lane、预算、强模型槽位或科学门的 assignment-local 调度试验。

## Identity

- `audit_id`: `RULE-AUDIT-20260815-SOURCE53-54-R40-ZERO-BRIEF-R41`
- `trigger`: R40 skill 上线后的 Source53 与 Source54 连续完整六路周期均为 0 clean brief。
- `requested_by`: mainline delegation.
- `date`: 2026-08-15.
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260815-SOURCE53-54-R40-ZERO-BRIEF-R41/`
- `shared_files_modified: false`

## Question and scope

- 问题：R40 是否改善了前端责任/精度；Source53 的强模型闭合与 Source54 的 ordinary rollback 是否正确；是否有一个安全、有限的下一周期调整。
- 规则与材料：`AGENTS.md`、`ROLE_RULE_AUDIT.md`、安装后的 `$research-topic-discovery`、R40 实施包、Source53/54 的 common control、strong-slot ledger、六个 lane handoff 与必要的 Source54 S4 transport 记录。
- 不在范围：Source55 及以后、任何候选的科学结论、Stage 0、实验、下载、Discovery 的运行控制。

## Current authoritative behavior

`AGENTS.md` 与 `research-topic-discovery` 要求顺序为 seed、exact anchor、一个 primary RQ、ordinary/selected pre-RQ closure、未改变的 raw gate、类型化 deep review。它允许 zero brief，禁止把相关性、缺实现、无结果或资源异常变成科学淘汰。

Source53 允许六路声明后结果无关地分配最多两个强模型 packet；其控制明确规定：若没有 source-backed typed-RQ closure，则下一周期关闭 selective depth。Source54 因此只运行 ordinary breadth，未改变 raw 或下游科学门。

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| S1、S3 没有从 seed 固定 exact anchor，因此没有 primary RQ、closure 或 raw。 | Source53 S1/S3 handoff | 2 lanes | Source-entry recall limitation；不是 raw gate 问题。 |
| S3 再次停在 seed→anchor。 | Source54 S3 handoff | Yes, with Source53 S3 | 足以支持一次 S1/S3 的题源入口调度试验。 |
| 有 anchor/RQ 的路径多在 raw 前被 exact identity、direct current union、changed reader 或 generic kernel 合理淘汰。 | Source53 S2/S5/S6；Source54 S1/S2/S5/S6 | 多次 | 健康结构性 abstention；硬门工作正常。 |
| S4 唯一强 slot 从两项一手官方资料闭合 carrier/action 的一部分，但无法同对象闭合 v5.0 full-cost validity estimand；返回 `UNRESOLVED_BACKLOG`。 | Source53 S4 selective-depth handoff/report | 1 packet | 强模型产生可审计的负向闭合信息，未越权决定 raw/brief。 |
| Source54 正确关闭 strong slot：没有把 Source53 的未闭合 packet 继续补位或用满第二 slot。 | Source54 control；Source53 ledger | 1 rollback | 正确执行；避免了结果后重写或无界成本。 |
| S4 SMT-COMP 路线在两个预登记 official URL 的 TLS 建连前失败，无返回内容、无持久资源。 | Source54 S4 log/queue/inventory | 1 mechanical event | `OPEN_BOUNDED__TRANSPORT_FAILURE__NO_SCIENTIFIC_INFERENCE`；不能用来评价 skill、题目或规则。 |

## Diagnosis

### 1. First failing transitions

这不是单一漏斗分母的问题。Source53 的两个 lane 与 Source54 S3 都在 `seed → exact anchor` 停止；这说明 S1/S3 的当前 seed 入口在本观察窗内没有稳定地产生可被一手资料固定的对象。另一些路径成功到达 anchor/RQ，却在 raw 前因当前 union 或 generic residual 消失。这是不同的失败转换，不能合并成“模型不够强”或“质量门过严”。

Source53 的强 slot 位于第三种情况：已有锚点和范围，但 carrier/action/estimand 的同对象资料闭合不足。它严格保持 `UNRESOLVED_BACKLOG`，没有借由强模型制造 raw。Source54 S4 又是第四种情况：已到 ordinary closure，但传输失败，因此完全没有科学分类基础。

### 2. R40 的效果

R40 在这两个周期中改善的是责任和精度：所有 six lanes 都有 seed/anchor/RQ/closure/raw 分母，五个 Source53 lane 如实声明 `NONE`，强 slot 在六路 barrier 后才选择；Source54 也没有把关闭的强 slot 伪装成失败或用不同题替换。R40 尚未证明提升 recall，因为 Source53/54 的 raw 都为 0；这不是 R40 无效的证明，只是当前样本没有正向 yield。

### 3. 强 slot rollback 判断

正确。唯一 strong packet 没有形成 source-backed typed RQ，第二 slot 没有合格提名，且规则禁止 backfill。继续强审、把暂存项改写为新问题、或用 Source54 新题替补都会违反冻结的结果无关选择与成本上限。关闭 Source54 selective depth 是预注册 rollback，不是降低模型能力或科学门。

## Risk analysis

- False-negative risk：S1/S3 若长期只从抽象 seed 进入，可能错过本可由公开 project/spec/paper anchor 固定的题源；该风险在三次 lane-observation 出现，但还不足以修改 admission gate。
- False-positive/weak-paper risk：若为了 raw 数量放宽 generic/current union 或把 TLS 失败当作未吸收，会立即产生弱题；本提案不这样做。
- Scientific-integrity risk：把 Source54 S4 的无内容传输失败解释为 endpoint/newness/scientific negative 是不允许的。
- Resource/time risk：强模型目前仅使用一 slot；建议不重启、不补位、不增加检索、lane 或 strong budget。
- State-migration risk：无。所有旧 handoff、OPEN backlog、terminal identity 和 STOP 不改变。
- Terminal-revival risk：无。没有提出复活任何终态对象。

## Recommendation

- Decision: `CLARIFY`
- Minimum effective change: 在**下一安全 assignment 边界且仅一轮**启用 `ANCHOR_FIRST_ENTRY_REBALANCE`。仅对 S1 与 S3，将既有非证据 seed 的初始调度改为“每个保留 seed 必须先有一个候选 exact public anchor（paper/project/spec/dataset/benchmark/source locus）及版本/日期；无法固定时记为 `NO_EXACT_ANCHOR` 并保留为 backlog”。随后才写 primary RQ。S2/S4/S5/S6 保持 Source54 ordinary 行为。
- Why smaller operational fix is sufficient: 核心损失发生在 raw 之前；改变 raw gate、strong slots、检索总量或 Stage 0 都不能修复没有 anchor 的 seed。该调度只改变 investigation order，不改变 admission。
- Non-relaxable gates preserved: Q2、same-object、最新/直接碰撞、公平强基线、natural/canonical carrier、full-cost、可复现性、claim ceiling、STOP 非复活及 Stage B 用户门均不变。

## Validation and rollback

- Historical cases/backtest required: 不需要；这是单轮、无行为录取变化的 source-entry allocation clarification，不更改 raw 或淘汰语义。
- Shadow-run plan: 不设 shadow，不接触当前运行的 cycle；在下一安全边界对 S1/S3 的 source role ledger 记录 `anchor-fixed / no-exact-anchor / raw` 三个分母。
- Success/failure criteria: 仅评估 S1/S3 是否从当前的 0/3 anchor-fix observation 改善为至少一个可核验 anchor，而不以产 raw/brief 作为目标。若仍为 0，或出现把 related family、survey、generic theme 当 anchor 的漂移，则该 profile 到期，下一周期回到普通 R40 skill；不叠加新微规则。
- Rollback condition: 出现对象漂移、预算/查询数量增加、把 `NO_EXACT_ANCHOR` 当排除或新颖性结论，或一轮无 anchor 固定改善，均撤销该 assignment-local profile。

## Mainline handoff

- User approval already present: `USER_ADAPTIVE_DISCOVERY_CONTINUE_UNTIL_FIVE_STAGEA_PASS_20260814` 覆盖有限题源调度；本提案不请求新的政策权力。
- Files proposed for change: 无共享文件。仅下一安全 assignment control 可声明 profile 与到期条件。
- Registry migrations proposed: 无；主线可追加普通 audit acceptance 记录。
- Existing active/blocked/hold/terminal topics affected: 无。
- Shared files modified: `false`。
