# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260829-STAGEA-SCOPE-CUMULATIVE-BUDGET-R1`
- `proposal_id`: `STAGEA_SCOPE_AND_TOPIC_CUMULATIVE_BUDGET_R1`
- `decision_label`: `USER_POLICY_DECISION_REQUIRED`
- `user_policy_approval_required`: true
- `backtest_required`: `SHADOW_REPLAY_ONLY__NO_SCIENTIFIC_REEXECUTION`

## Problem statement

Stage A 的规范最低证据已经是小而真实的风险 probe，但完整交付清单、preclaim fidelity、工程纠错和持续自治被叠加执行。规则只要求每条 route 有限，没有规定同一 topic 跨 assignment 的累计工程预算和到首个有效 observation 的时限。结果是 APX/PPC/RVV 多轮静态/preclaim successor 后仍为 0 valid claim rows。

## Current rule

- File/heading: `rules/ROLE_CANDIDATE_OWNER.md / Stage A：机会与机制验证`
- Current behavior: 同时写“2–4 基线、至少 3 篇 Q1 gap review”等完整清单和“一个自然 workload + 一个最强基线 + 一个最小机制 + 一个机制结果”的最低证据。
- Why insufficient: reviewer/owner 缺少明确的 risk-proportional applicability 和 Stage A/Stage B 广度分界。

- File/heading: `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md / 四类处置`
- Current behavior: 每条 correction/redesign route 有 attempt/budget，有限 route 存在时主线继续自治。
- Why insufficient: 新 assignment/route 可重新获得局部预算；没有 topic aggregate ledger。

## Proposed minimum delta

| File | Heading/field | Current semantics | Proposed semantics |
|---|---|---|---|
| `AGENTS.md` | Stage A semantics | 真实受限预研 + preclaim gate | 增加内部 A0/A1/A2 管理模式；不是新正式阶段；只有 A1 产生科学观察 |
| `rules/ROLE_MAINLINE.md` | Stage A dispatch | route-local attempt/budget | 冻结 topic-level cumulative ledger；新 assignment 不重置；A0 最多初始轮加两批 correction，READY 后下一合格动作必须是 A1 或 blocker |
| `rules/ROLE_CANDIDATE_OWNER.md` | Stage A minimum | 2–4 baseline 完整清单与 1 strongest minimum 并列 | A1 强制一个当前最强同函数基线；需要排除普通调参时再加一个简单/ablation baseline；1–4 个预冻结自然/formal case |
| `rules/ROLE_CANDIDATE_OWNER.md` | fidelity/scope | 完整动作与证据广度边界不显式 | “最小实例语义完整”强制；完整 corpus、平台、统计、全消融、完整 baseline grid 属 Stage B |
| `rules/ROLE_STAGEA_REVIEW.md` | 必查 | 2–4 baseline、3 Q1 papers 看似统一硬门 | gate 核验一个 strongest baseline；Q1 matrix 默认复用 Stage0，仅更新漂移/新碰撞；附加项仅在会翻转判断时强制 |
| `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md` | autonomy | another finite route 可继续 | finite route 不足以越过 topic cumulative budget；耗尽后只能 hold/blocker/reserve/user exceptional，不得自动 successor |
| `templates/STAGEA_REPORT.md` | status/ledger | 无 A0/A1 与 topic aggregate 字段 | 增加 mode、correction batch、redesign、first-observation cycle、valid rows 与 topic/assignment state 分离 |
| new template | readiness ledger | 无 | 新增轻量 `STAGEA_EXECUTION_READINESS_LEDGER.yaml`，只记录决定性字段，不做全树 SHA 仪式 |

## Default operational policy

### A0 — execution readiness（非科学）

进入 A1 前必须一次性冻结：

- 一个自然/canonical/formal 输入或结果无关的 1–4 case 选择规则；
- 一个当前最强同函数 baseline；
- 在最小实例上语义完整的 candidate mechanism；
- legality/equivalence/object-identity witness；
- mechanism-specific metric；
- 可能翻转方向判断的 full-cost 维度及采集路径；
- exact argv/cwd/env/output schema；
- 一个 non-claim control row。

默认题目累计预算：

- `engineering_correction_batches_max: 2`：按修复批次计，不按每行 typo 计；同一批可修复静态扫描列出的多个机械问题；
- `same_object_method_redesigns_max: 1`：沿用现行 pivot/revision 上限，不额外增加科学 revision；
- `a0_execution_rounds_max: 3`：一轮初始 packet，加至多两批 correction；队列等待和硬外部 blocker 不计为执行轮；
- `a0_ready_next_eligible_action: A1_DECISIVE_PILOT_OR_BLOCKER`：A0 READY 后不得再派新的静态/preclaim successor 扩展证据面；
- `new_assignment_resets_budget: false`；
- `claim_effect_visibility_during_A0: forbidden`。

两批 correction 的理由：一批通常只覆盖静态可见缺件，第一次 control 还可能暴露一个此前不可见的 wrapper/schema 问题；只给一批在 ECP V2 已显示过窄，给无限批则重现当前问题。

### A1 — decisive pilot（科学）

- 运行 1–4 个结果无关预冻结 natural/formal cases；
- 必须有一个当前最强同函数 baseline；
- 只要一个机制特异 metric 和 end-to-end/quality/guarantee endpoint；
- 完成会翻转本轮判断的方向性 full-cost；
- 结果上限仍是 `NOT_FALSIFIED / PRELIMINARY_SUPPORT`；
- 完整 workload matrix、多平台、正式统计、全 baseline grid、完整消融、paper-grade full-cost 留给 Stage B。

### A2 — independent gate

Gate 只判断 A1 是否形成可信的初步支持/反证及 Stage B 路径，不要求论文主 claim 闭合。若 A0 未闭合，输出 assignment substate，不得制造科学 PASS/STOP。

## Correction accounting

1. 预算按 topic ID 累计，跨 lane、resume、correction、same-object successor 继承。
2. correction batch 只能改 path/import/environment/output/argv/copy/schema/wrapper 等结果无关机械字段；affected runs 必须 invalidated。
3. 首个 claim effect 可见后，任何会影响 mechanism、baseline、workload、metric、denominator、guarantee 或 evidence route 的改变都按 scientific revision；不能伪装工程修复。
4. pre-ACK unauthorized action 使该 assignment 输出隔离，并消费该 assignment 的机械 attempt；不消费 scientific revision。是否还有 topic-level batch 取决于累计 ledger，不因新建 clean assignment自动恢复。
5. shared asset 复用继续采用轻量完整性：注册时 hash executable，冻结/科学 handoff hash claim-critical files；辅助日志只做 existence/size/count，不递归全树重算。

## Status semantics

- `topic_formal_state` 与 `assignment_execution_substate` 必须分开。
- `EXECUTION_CONTRACT_HOLD__...` 只能作为 assignment substate/reason，不能替代正式科学状态。
- 若普通 scientific revision 已消耗且构造无效：正式 `INCONCLUSIVE_POLICY_HOLD`。
- 若无科学 observation 且只是累计工程预算耗尽：题目仍在 Stage A，标记 `execution_substate=EXECUTION_CONTRACT_HOLD__NO_SCIENTIFIC_INFERENCE`，释放 lane；需要用户 exceptional continuation 或明确 reserve 决策才再开 successor。
- 若缺系统/设备/许可/私有输入：`BLOCKED_USER_ACTION_REQUIRED`。
- 只有有效自然/full-cost 科学证据才可 PASS/REVISE/STOP。

## Safety invariants

- Q2 minimum preserved: true
- Q1 priority preserved: true
- Same-object preserved: true
- Latest collision preserved: true
- Fair current strong baseline preserved: true；强制保留一个 strongest，不允许只用简单基线
- Natural input/evidence preserved: true；A1 至少一个，默认 1–4 个
- Full-cost preserved: true；所有会翻转 A1 判断的维度必须计价
- Reproducibility preserved: true
- Claim ceiling preserved: true
- STOP non-revival preserved: true
- User StageB approval preserved: true

## State and compatibility migration

- Existing states affected: 无追溯科学状态变化。
- Existing assignments affected: 已冻结 assignment 按旧规则完成；下一安全 successor 边界开始累计历史 attempts。
- Template compatibility: 新字段可 additive；旧报告缺字段写 `LEGACY_NOT_RECORDED`，不得填 0。
- Old filename compatibility: 保持现有 Stage A 报告/handoff 名称。
- One-time migration required: MAINLINE 为 active/hold Stage A topic 建一次简短 historical-attempt ledger；只用 registry/handoff，不遍历全目录。
- Rollback path: 关闭 topic cumulative budget production；保留 A0/A1 scope clarification、dashboard、firewall、shared asset 和轻量完整性。

## Validation plan

- Historical/time-slice cases: APX、PPC、RVV、S6-JS-PREFIXBOUND；另一个已有有效 Stage A observation 若可用。
- Negative controls: 资源硬阻塞、scientific revision exhausted、合法 direct scientific STOP、legacy PASS。
- Expected behavior changes: 三个 0-observation 链更早 hold；PASS case 不变；无效工程结果不进入科学分母。
- Forbidden regressions: 弱化最强基线；把 hold 当 STOP；把 1–4 case 当作 Stage B 完整结论；因预算耗尽消费 scientific revision；结果后改分母。
- Acceptance threshold: 所有历史科学结论保持；3/3 零观察链提前收口；所有可用 legacy PASS 不受阻；随后 2 个 prospective shadow topic 均在初始轮加至多两批 correction 后 READY/hold，且 READY 后下一合格动作是 A1 或正确 blocker。

## Decision request

请用户批准或否决以下政策：从下一安全 Stage A assignment 边界起，启用 A0/A1/A2 内部管理、题目累计最多三轮 A0（初始轮 + 两批工程 correction）、一个同对象方法重设计，以及“A0 READY 后下一合格动作必须是 A1 或 blocker”；先做历史只读 replay + 两题 prospective shadow，通过后才由 MAINLINE 改为 production。批准不授权 Stage B、不增加 scientific revision、不改变当前 PASS/STOP/HOLD，也不允许 RULE_AUDIT 直接修改共享文件。
