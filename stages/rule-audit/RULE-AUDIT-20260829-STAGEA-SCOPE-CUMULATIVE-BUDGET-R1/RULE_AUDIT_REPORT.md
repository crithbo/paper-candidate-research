# Rule Audit Report

## 中文摘要

- 发现的问题：Stage A 的科学最低证据本身并不过宽，但执行规则把“最低门”和“完整交付清单”同时呈现为必须项；工程纠错只在单个 assignment/route 内有界，换 assignment 后缺少题目级累计预算；`EXECUTION_CONTRACT_HOLD` 又被当作事实状态使用，却未与正式题目状态分层。
- 对推进速度或研究质量的影响：APX、PPC、RVV 均形成多轮 preclaim/static successor，而有效自然 claim row 仍为 0。规则没有降低科学标准，但把 Stage A 运行成接近 Stage B 的基础设施闭合，产生大量无科学信息的重试。
- 建议修改：保留正式 `Stage 0 → Stage A → Stage B`，只增加 Stage A 内部管理模式 `A0_EXECUTION_READINESS / A1_DECISIVE_PILOT / A2_INDEPENDENT_GATE`；建立跨 assignment 的题目累计执行预算；A0 最多三轮（初始轮 + 两批工程纠错），一旦 READY，下一项合格动作必须是 A1 或明确 blocker；把 A1 收敛为一个最强基线、1–4 个结果无关自然 case、完整最小机制、机制指标与方向性 full-cost；把完整矩阵、额外平台、统计和大规模消融明确留给 Stage B。
- 是否需要用户批准：需要。科学硬门不变，但题目级累计预算会改变何时自动停止派发 successor，属于调度与 exceptional continuation 政策。

## Identity

- `audit_id`: `RULE-AUDIT-20260829-STAGEA-SCOPE-CUMULATIVE-BUDGET-R1`
- `trigger`: 用户要求详细分析 Stage A 执行规则并优化
- `requested_by`: USER
- `date`: 2026-08-29
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260829-STAGEA-SCOPE-CUMULATIVE-BUDGET-R1`
- `shared_files_modified: false`

## Question and scope

- User/process question: Stage A 是否把过多实际执行工作纳入题目筛选，为什么反复重试，以及怎样在不降低 Q2/Q1 科学门的前提下缩短到第一个有效观察的时间。
- Rules inspected: `AGENTS.md`; `rules/ROLE_MAINLINE.md`; `rules/ROLE_CANDIDATE_OWNER.md`; `rules/ROLE_STAGEA_REVIEW.md`; `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md`; `templates/STAGEA_REPORT.md`.
- Candidate examples inspected: APX R10 final gate；PPC R12 correction3 disposition；ECP V2 pilot disposition；registry 中 RVV R6A hold。
- Out of scope: 修改候选科学结论；运行新实验；放宽 same-object、latest collision、强基线、自然证据、full-cost、复现或 claim ceiling；Stage B 授权。

## Current authoritative behavior

1. `rules/ROLE_CANDIDATE_OWNER.md` 的 Stage A 最低证据是“一个自然 workload + 一个最强具名基线 + 一个可运行最小机制 + 一个机制特异结果”，并只要求方向性 full-cost；这一定义合理。
2. 同一文件的“通常 1–2 周、最低交付”又要求 2–4 个基线、Q1 evidence-gap review、headroom、强基线复现、probe、失败区等；`rules/ROLE_STAGEA_REVIEW.md` 的必查清单同样写 2–4 个基线和至少 3 篇 Q1 论文。它们与“最低证据”并列，容易被执行为完整门，而非风险相关的条件清单。
3. `PRE_CLAIM_CONTRACT_FIDELITY_GATE` 正确要求完整原子动作、真实 comparator、原生构造路径、分母、full-cost 与小 witness；但“可在同一初始 assignment 中纠正”没有题目累计次数或时间边界。
4. `AUTONOMOUS_SOFT_BLOCKER_RECOVERY` 要求每条路线有 attempt/budget，但只约束单条路线；`ROLE_MAINLINE` 又允许工程 correction、同对象 redesign 和新 assignment。新 assignment 因而可能重置工程预算，而没有增加科学信息。
5. 现行 dashboard 已正确突出 `executable_packet_ready / control_row_pass / valid_claim_rows/planned / decisive_stagea_observation / independent_gate_decision`，shared asset、轻量完整性和结果防火墙也应保留。

## Evidence of a problem or of correct behavior

| Observation | Source/artifact | Repeated? | Classification |
|---|---|---:|---|
| ECP V2 中 APX/PPC 在一次 correction 后均为 0 valid claim rows，RVV 未运行；2/3 阈值已不可达 | `stages/stageA/_pilot/20260829-executable-claim-packet-v2/MAINLINE_V2_PILOT_DISPOSITION.yaml` | yes | rule-design signal + packet incompleteness |
| APX 最终为 revision 已消耗、S04 prepare 失败、冻结分母不完整，仍无可裁决科学结果 | `stages/stageA/_reviews/20260829-apx-r10-final/LLVM-APX-PREFIX-PRESSURE-PARETODP/handoff.yaml` | yes | cumulative scope/route exhaustion |
| PPC R12 在 ACK 前写 packet/DAG，被隔离；无 tool/control/claim，静态预算耗尽 | `stages/stageA/LLVM-PPC-PREFIX-PRESSURE-PARETODP/r12-integrated-cost-ledger-redesign-20260829/MAINLINE_CORRECTION3_FINAL_DISPOSITION.yaml` | yes | execution violation + cumulative budget ambiguity |
| RVV R6A 为 static budget exhausted、无科学推断 | `registry.yaml` entry `stagea_rvv_r6a_integrated_natural_packet_redesign_20260829` | yes | cumulative scope/route exhaustion |
| 三题均没有因为 invalid construction 被误判科学 STOP | 同上及现行 gate 规则 | yes | current scientific integrity works and must be retained |
| shared assets、轻量完整性、结果防火墙、决定性观察看板已安装 | `rules/ROLE_MAINLINE.md`; `rules/ROLE_CANDIDATE_OWNER.md` | yes | correct behavior |

## Root-cause analysis

### 1. 不是科学门过严，而是执行入口欠定义

Stage A 必须真实执行一个最小机制，否则无法区分论文形状与机制事实；这一点不能删除。问题在于进入 Stage A 时，包经常只有研究合同，没有达到“可运行的最小自然 probe”就绪度，于是候选 lane 同时承担工具链闭合、测试数据构造、wrapper/debug、原子动作实现、full-cost collector 和科学试验。

### 2. “完整原子动作”被误解为“完整论文实现”

fidelity gate 应要求最小实例上所有决定 claim 的原子动作都真实存在，不能用 proxy；但不要求 Stage B 规模、完整 corpus、完整基线网格、全面消融或统计。现行文字没有把“语义完整”和“证据广度”明确拆开。

### 3. 局部有界、全局无界

单次 correction、pivot、revision 都有边界；但题目经历 r3、r4、r5……或 V2、r9、r10 时，工程预算没有在 topic 层累计。主线只要发现另一个有限 same-object route，就会继续自治派发，导致每一步合法、总链条失控。

### 4. 结果防火墙正确，但没有 A0→A1 的强制转换

隐藏相对效果能防止结果后调参，但当前没有规定 A0 允许多少轮，也没有规定 A0 READY 后下一步必须是 A1。于是工程状态可长期改善，却没有决策信息。

### 5. 状态层级混用

`INCONCLUSIVE_POLICY_HOLD` 是正式题目级状态；`EXECUTION_CONTRACT_HOLD__...` 实际更像 assignment 子状态。若二者不分层，主线容易把一次包失败误当成题目终局，或反过来用新包无限重置 hold。

## Risk analysis

- False-negative risk: 过小的工程预算可能把真实高价值题过早停在 hold。缓解方式是 hold 不等于 STOP，保留一次用户明确 exceptional continuation 或转人工储备的入口。
- False-positive/weak-paper risk: 若把 Stage A 简化为弱基线或 proxy，会虚假 PASS。提案明确保留完整原子机制、一个当前最强同函数基线、自然输入和决定性 full-cost。
- Scientific-integrity risk: 低。新规则强化结果无关冻结与无效 run 隔离，不允许用工程失败推断科学负结果。
- Resource/time risk: 显著下降。题目不会因新 assignment 自动重置工程纠错预算。
- State-migration risk: 中等。需把 assignment substate 与 topic formal state 分开，但不改已有科学结论。
- Terminal-revival risk: 无。STOP 不复活；旧 PASS/STOP/HOLD 不追溯改判。

## Recommendation

- Decision: `USER_POLICY_DECISION_REQUIRED`
- Supporting labels: `PATCH_RECOMMENDED`; `SHADOW_REPLAY_REQUIRED`
- Minimum effective change: 六个共享规则/模板的窄 patch，加一个题目级 `STAGEA_EXECUTION_READINESS_LEDGER`；不创建新正式阶段、不安装新 skill。
- Why a smaller operational fix is insufficient: 单纯要求“更快”或继续看板无法阻止新 assignment 重置预算；必须有 topic-level aggregate ledger 和 first-observation stop rule。
- Non-relaxable gates preserved: Q2 minimum、Q1 priority、same-object、current collision、一个最强公平基线、自然/formal object、完整最小机制、方向性 full-cost、复现、claim ceiling、独立 gate、Stage B 用户门。

## Validation and rollback

- Historical cases/backtest required: APX、PPC、RVV 三个零观察链 + `S6-JS-PREFIXBOUND` 既有独立 Stage A PASS；如果另有已登记有效 Stage A observation，再加入一个。
- Shadow-run plan: 只读按历史时间顺序重放调度决策，不重跑实验，不改变既有状态；随后对两个新 Stage A 包做 shadow ledger。
- Success criteria:
  1. APX/PPC/RVV 会更早进入非科学 hold，且原科学结论不变；
  2. 已有 PASS 案例仍可进入 A1 并保持 PASS；
  3. 0 个 valid claim row 被预算规则误标无效；
  4. 新 prospective 包在初始轮加至多两批 A0 correction 后 READY/hold，且 READY 后下一项合格动作即 A1 或明确 blocker；
  5. 无弱基线、proxy、漏成本或结果后修改。
- Failure criteria: 已有 PASS 被纯范围上限阻断；最强基线被降级；A0 修复需要经常超过两个 correction batch；hold 被错误解释为 STOP。
- Rollback condition: 任一 failure criterion 成立即关闭 cumulative-budget production，只保留 dashboard/firewall/shared asset 与 scope clarification。

## Mainline handoff

- User approval already present: 否；本报告是供用户审核的政策提案。
- Files proposed for change: `AGENTS.md`; `rules/ROLE_MAINLINE.md`; `rules/ROLE_CANDIDATE_OWNER.md`; `rules/ROLE_STAGEA_REVIEW.md`; `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md`; `templates/STAGEA_REPORT.md`; new `templates/STAGEA_EXECUTION_READINESS_LEDGER.yaml`.
- Registry migrations proposed: 仅未来 assignment 增加 topic-level ledger 引用；旧记录不改判。当前 assignment 在冻结规则下完成，到下一安全边界才累计既有 attempts。
- Existing active/blocked/hold/terminal topics affected: APX/PPC/RVV 不追溯改判；下一 successor 派发时应用累计预算。CauseCase Linux blocker、S6 StageB user gate、所有 STOP/PASS 均不变。
- Shared files modified: `false`
