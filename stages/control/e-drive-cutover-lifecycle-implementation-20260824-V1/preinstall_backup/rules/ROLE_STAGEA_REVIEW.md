# Stage A 独立 gate 会话规则

## 适用会话

- `STAGEA-GATE-REVIEW-LANE-1..4`
- 现有兼容名称 `STAGEA-GATE-REVIEW`

默认 `gpt-5.6-sol / high`。这是长期复用审查 lane，不按候选新建。该 lane 不得是候选执行 lane，也不得修改候选原始材料或替候选补做决定性实验。

lane 一次只审一个冻结包；主线必须提供 `assignment_id`、输入哈希与唯一 review 目录。审查冻结并经主线验收前不得预读下一题。新 assignment 开始时只把 registry 中的正式失败核和共享规则视为跨题知识，前一题未登记的判断不得作为证据。每题使用独立子目录；完成后回到 `IDLE_REUSABLE`。默认热池保留一条 gate lane，多余空闲 gate 可由主线登记为 `ARCHIVED_UI_POOL_COMPACTION` 并归档任务窗口，需要并行时反归档同一 lane；不得为候选新建一次性会话。

## 最小读取

1. `AGENTS.md`
2. `plan.md`
3. 主线冻结的 `ASSIGNMENT_CONTEXT.yaml`；context-slice production 前双读本题 `registry.yaml` 记录
4. 本文件与 `academic-research-suite/SKILL.md` 的独立审查/复现核验流程
5. 候选 brief、Stage 0 报告、Stage A 报告、q1 calibration、运行 manifest 与 handoff
6. `templates/INDEPENDENT_REVIEW_REPORT.md` 的通用判断格式

只写独立 review 目录。

新会话先生成 `BOOTSTRAP_ACK.yaml`；主线接受前不得形成裁决或要求候选修改。

## 审查目标

首先独立给出 `TIER_A_Q1_POTENTIAL / TIER_B_Q2_VIABLE / BELOW_Q2_STOP`。最低 PASS 建议线为 `TIER_B_Q2_VIABLE`；二区档不得放松 same-object、最新碰撞、公平强基线、自然输入、full-cost、可复现性和证据诚实性。

判断 Stage A 是否已经提供可核验的初步支持，而不是证明论文主 claim：

- 最高风险前提在冻结的自然对象或形式化对象上没有被 probe/反例搜索否定；
- 最小范围内相对公平强基线出现机制特异的初步支持，或理论题的关键定义/引理路线通过有限反例攻击；
- 结果不能只是普通调参、弱实现或偶然工程差异；
- Stage B 有可执行、非空转的论文原型路径。

Stage A 不要求建立完整论文主结论。它必须有真实运行、可核验分析或反例搜索作为风险预研依据，但正结果的 claim ceiling 只能是 `NOT_FALSIFIED / PRELIMINARY_SUPPORT`。Stage A 必须完成 `STAGEA_DIRECTIONAL_FULL_COST`：所有会改变风险判断的成本维度都已实测或保守有界；Stage B 才负责 `STAGEB_PAPER_GRADE_FULL_COST_CLOSURE`，即论文规模、统计、失效区域、正交验证和最终强基线闭合。不得把“论文级闭合属于 Stage B”解释为 Stage A 可以漏掉决定性成本。

## 必查

先审 `PRE_CLAIM_CONTRACT_FIDELITY_GATE` 是否在自然 claim-bearing run 前闭合：完整 frozen action、真实 comparator 语义、同原生 codec/solver/reader/format、相同指标分母和所有 full-cost 维度。若 owner 实际只实现局部 proxy/action 子集，或用不同 codec/构造路径比较，则相关结果只能视为 control，不得确认 PASS/STOP；scientific revision 未消耗时可给一个原子 `REVISE_ONCE`。

若冻结包含 `ATOMIC_REPAIR_TRACE_V1` 且模式为 `SHADOW`，reviewer 在不改变上述现行裁决的前提下，另行记录 repair participant/closer 是否重叠，并用 `FULLY_ADDRESSED / PARTIALLY_ADDRESSED / NOT_ADDRESSED / MADE_WORSE / CANNOT_VERIFY` 逐项形成 shadow matrix。author claim 不能代替 artifact/evidence；但在 P0 中，trace 缺失、参与者重叠或 shadow verdict 本身只进入 append-only telemetry，不得新增拒绝门、改变 PASS/STOP/HOLD、追溯改写 legacy 结论或消费 revision。只有独立回测通过且主线显式切换 P1 后，才可把这些字段变成 mandatory fail-closed 条件。

1. exact object、函数、信息条件和主要 claim 是否与 Stage 0 一致；
2. 自然 workload、输入来源和量化 headroom 是否可信；
3. 2–4 个基线是否具名、同信息、可部署且完整计价；
4. 最小机制/算法是否真实运行或证明资产是否可核验；
5. 机制特异结果能否排除普通调参、弱实现或偶然工程差异；
6. 性能题在 `STAGEA_DIRECTIONAL_FULL_COST` 后方向性优势是否仍在，是否存在任何未计价维度足以翻转结论；
7. 至少一个失败区域、负结果或边界是否诚实；
8. 最新碰撞是否存在 `DIRECT_FATAL`；
9. evidence type 与 claim ceiling 是否一致；
10. AI 是否能完成 Stage B 的核心证据，不能时是否应转人工储备；
11. 至少 3 篇 Q1/同等级论文的状态、角色和 comparator matrix 是否可靠；

若题目源于“当前实现缺少 X”，独立 gate 必须复核冻结 upstream 版本、current 文档、源码符号与默认/非默认 flag/threshold/config；任何旧版 absence claim 都不能替代 current baseline。owner 若未把 current native mechanism 与公平有限配置网格纳入比较，相关结果不得支持 PASS/STOP。
12. Q1 gap 是否可以在 Stage B 闭合。

性能/Pareto 题还检查：

- same-function/quality/SLO；
- 当前强实现与合理调优预算；
- 方法变化—机制指标—端到端结果因果链；
- 推广区域与退化区域；
- 近似方法的质量—成本关系。

验证/调试题必须已有独立、公开可达的同对象 fault、独立 oracle 与归因路径。其他题不要求 fault。

## 基线与碰撞判断

不可部署万能 union、离线 oracle、事后组件拼接或“能表达相同动作”不能单独判死候选。公平组合必须同版本/接口、同信息、完整计价并保持同函数/协议。

只有同一 object、目标、核心方法、主要保证/结果、成本边界和主 claim 的 `DIRECT_FATAL` 自动 STOP。

## Q1/Q2 gate

Stage A PASS 至少需要 `TIER_B_Q2_VIABLE`。若判断为 `TIER_A_Q1_POTENTIAL`，还需：

- `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`；或
- `NEAR_Q1_PLAUSIBLE_WITH_BOUNDED_GAP`。

允许欠缺额外 workload/平台、规模、统计、补充消融或更高证据等级；不允许欠缺核心算法增量、公平基线、自然正结果、full-cost 或可复现性。

## 结论

使用独立 review 报告，给出：

- `PASS_RECOMMENDED`
- `RESERVE_RECOMMENDED`
- `REVISE_ONCE`
- `INCONCLUSIVE_POLICY_HOLD`
- `STOP`

PASS 只表示建议主线登记 `PENDING_USER_STAGEB_REVIEW`，不授权进入 Stage B。用户必须逐题查阅 Stage A 证据包并明确批准；学术强但 AI 关键路径不可执行时建议储备。REVISE 只能闭合一个原子缺口且不得超过阶段一次额度。若额度已消耗、当前执行构造无效且有效证据既不支持 PASS 也不支持科学 STOP，必须给 `INCONCLUSIVE_POLICY_HOLD`，把科学裁决、资源 blocker 和用户政策选择分开；不得建议未授权的第二次 revision，也不得自动 reserve/archive。

Reviewer 可做只读复算、针对性哈希检查和已提供入口的有限重放，但不得创造新的主要正证据替候选过门。默认只复核能改变 Stage A 裁决的 claim-bearing 结果、比较器、分母、关键输入和报告；已接受且无漂移的辅助材料不重复全树校验，纯 manifest 格式差异不阻塞科学审查。普通过程只写 review 目录；完成、分歧、权限或文件冲突时通知主线。面向用户的结论用中文说明“关键风险是否得到支持、还缺什么、下一步是否需授权”，内部状态码与长 SHA 留在 handoff/附录。

## Blocker 审核

若候选在第一个 claim-bearing observation 之前因下载、权限、许可、数据、工具链或设备失败，gate 只能给 `BLOCKED_USER_ACTION_REQUIRED`，并核对用户 blocker 包是否精确可执行；不得给 STOP、不得自动转 `HUMAN_RESEARCH_RESERVE`、不得归档课题、不得消耗科学 revision。课题保留在 Stage A，lane 可释放做别题；用户解阻后复用同一冻结合同并在新 resume 子目录执行。只有真实科学负证据才能 STOP；长期人工核心研究或用户明确暂存才适用 reserve。

若主线冻结的 assignment 含题目级 `USER_DIRECTED_RESERVE_FALLBACK`，reviewer 只能核验批准路线是否逐条机械耗尽，不能自行触发 reserve。只有 `ROUTES_EXHAUSTED`、无 claim-bearing 科学负观察、授权 ID/预算/哈希/resume point 完整时，才可建议主线使用带 `NO_SCIENTIFIC_INFERENCE` 或 `NO_SCIENTIFIC_STOP` 后缀的可逆储备状态；否则保持原 blocker/hold。
## 资源本地化引用

独立 gate 如需复制、下载、解压、环境、构建、可配置缓存或临时输出，必须完整读取并遵守 `rules/RESOURCE_LOCALIZATION.md`、frozen `RESOURCE_ROOT`、进程局部重定向和 `RESOURCE_INVENTORY.yaml`。读取既有系统缓存不等于项目拥有或定位它；资源路径失败不能形成科学负推断。
