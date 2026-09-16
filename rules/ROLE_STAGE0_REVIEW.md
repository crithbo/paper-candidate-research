# Stage 0 批量审查与确认会话规则

## 适用会话

- `STAGE0-BATCH-GATE`
- `STAGE0-CONFIRMATION-SENTRY`
- 主线指定的 Stage 0 决定性复审会话

任务合同必须声明 mode：`PRIMARY / SENTRY / DECISIVE`。默认 Terra/high。DECISIVE 只有在 PRIMARY/SENTRY 对终态科学裁决存在已记录分歧时，才可对一个冻结 assignment 升级 Sol/high；Terra/Sol 的 xhigh 默认禁止，max 全局禁止。每次新 assignment/follow-up 必须显式写 model/thinking。

这些是长期复用审查槽位，不按候选或批次新建。每个槽位一次只处理一个冻结批次/assignment，使用唯一目录；冻结并经主线验收后回到 `IDLE_REUSABLE`。默认热池保留 PRIMARY 与 confirmation 各一条；额外审查槽位在空闲时可由主线登记为 `ARCHIVED_UI_POOL_COMPACTION`，需要并行时反归档原槽位，最多扩到 2–4 个，不创建每题会话。不得在当前批次结束前预读下一批。

## 最小读取与权限

读取：

1. `AGENTS.md`
2. `plan.md`
3. 主线冻结的 `ASSIGNMENT_CONTEXT.yaml`；context-slice production 前双读本题 `registry.yaml` 记录
4. 本文件与 `academic-research-suite/SKILL.md` 的检索/审稿/证据核验流程
5. 候选 `topic_brief.md`、source log、paper genealogy、facet matrix 与 handoff
6. `templates/STAGE0_REPORT.md`、`templates/Q1_COMPARATOR_MATRIX.md`
7. 若输入冻结 `DISCOVERY_CLAIM_PACK_MODE=SHADOW / PRODUCTION`，读取 `rules/DISCOVERY_CLAIM_PACK.md`、neutral claim package 与 `DISCOVERY_EVIDENCE_LEDGER.yaml`

只写分配的 Stage 0 目录或独立审查目录。不得修改 Discovery 原报告、主控文件或创建 Stage A。

新会话先生成 `BOOTSTRAP_ACK.yaml`；主线接受前不得检索、裁决或写 claim-bearing 报告。

## 目标

在一个冻结、资源有界的审查 assignment 内判断候选“若研究假设后来成立”是否至少具有可信二区论文形状、以及是否有一区潜力，值得投入 Stage A。Stage 0 是条件性论文潜力筛选，不判断主结论真假；建立正向机会后再扣除碰撞，不要求实现、证明、正结果、完整方法、穷尽文献、多个 workload 或最终硬件。日历时长只作计划提示，不是裁决条件。

## 学术路线

至少一条成立：

- `N1` 新抽象、机制、表示或动作；
- `N2` 新算法、优化、近似、在线策略、数据结构或软件实现原理；
- `N3` 新稳定规律及其利用。

可采用 `PERFORMANCE / PARETO_APPROXIMATION / COMPLEXITY_THEORY / MEASUREMENT_MECHANISM / FAULT_DEBUGGING`。只有验证/调试题默认要求真实 fault。

## PRIMARY 必做

1. 冻结 exact object、函数、目标、信息条件和关键成本。
2. 核验 paper genealogy、anchor、前置、竞争与反证材料。
3. 重算问题、对象、决策变量、约束、算法、保证和证据 facet matrix。
4. 执行 seed-distance 与去方法名测试。
5. 明确 N1/N2/N3 主路线和较窄可接受 claim。
6. 检查课题组公开及用户确认边界。
7. 冻结一个 `SOURCE_GROUNDED_NATURAL_OR_FORMAL_OPPORTUNITY_HYPOTHESIS` 与有限 falsifier：自然 workload 题说明可量化机会，理论/形式题说明 canonical real problem family 上的结构机会。已有公开结果、静态分析或低成本量化证据时必须使用；没有 candidate output 或正结果本身不得判 STOP。
8. 冻结 2–4 个有限具名基线。
9. 核验最近论文、官方实现和源码并分类碰撞。
10. 重建 Discovery 的主机制，并与强替代解释、null hypothesis 或当前强基线比较；只有贡献类型和证据确实支持多条机制路线时才要求两个非同义候选机制，不得为满足格式制造备选。
11. 给出资源、输入与停止条件有界的 Stage A killer；日历估计只作非规范规划提示。
12. 计算学术主分、AI 加分和 `ai_core_fraction`。
13. 选择 2–3 篇真实一区/二区或同等级论文完成 `Q1_Q2_SHAPE_CALIBRATION`，并给出统一质量档。
14. 在独立科学结论形成后输出非裁决性的 `STAGE0_REPAIR_VECTOR`，说明 Stage 0 是否补回 cutoff 前可获得而 Discovery 遗漏的 current same-object source、first-party feature、generic kernel、atomic action、natural carrier、full-cost 或 Q2 shape。可多选 `OMITTED_CURRENT_SAME_OBJECT / OMITTED_FIRST_PARTY_FEATURE / OMITTED_GENERIC_KERNEL / ATOMIC_ACTION_UNCLEAR / NATURAL_CARRIER_GAP / FULL_COST_GAP / Q2_SHAPE_GAP`；没有材料性修正时用 `NO_MATERIAL_REPAIR`。该向量不得改变 PASS/RESERVE/REVISE/STOP，科学 STOP 也可以是 `NO_MATERIAL_REPAIR`，并随 handoff 返回主线做聚合反馈。
15. 对 claim-pack 输入，先按贡献类型合同判断结构完整性，再映射 Q1/Q2；独立复核 opportunity-family 关系、A/C/D/E 本地坐标、八谓词 direct coverage、结构性负面理由、query/claim provenance 与 search stopping。E1/E2 只评价执行准备度，不能改变学术或碰撞判断。
16. claim-pack repair vector 还可多选 `CONTRIBUTION_TYPE_CONTRACT_MISMATCH / CLAIM_MECHANISM_UNCLEAR / EFFECT_OR_GUARANTEE_UNCLEAR / BOUNDARY_OR_FALSIFIER_GAP / EVIDENCE_LOCATOR_OR_VERSION_GAP / CONTRARY_SEARCH_GAP / OPPORTUNITY_RELATION_ERROR / DIRECT_COVERAGE_PREDICATE_ERROR / EXECUTION_ROUTE_UNREALISTIC / PRESENTATION_STYLE_BIAS`。

性能/算法题额外检查：

- same-function、精度、协议和部署边界；
- 算法、数据结构、求解或实现组织的实质变化；
- 为什么不是调参、编译开关、特例或组件替换；
- full-cost：预处理、编译、转换、初始化、内存、同步和回退；
- 推广假设与失效边界；
- 能区分方法增量与实现成熟度的 Stage A 实验。

## 新颖性与基线

对 claim-pack 输入，`DIRECT_FATAL/C0_DIRECT_COVERED` 必须逐项满足共同协议的八个 coverage 谓词并有足够 read depth；任一未闭合只能是 partial/narrowing/adjacent/unknown。标题、动作名、组件重叠或“理论上能表达”不能替代 same information、guarantee、full-cost、scale/version 和实现/全文证据。

只有 `DIRECT_FATAL` 自动停止：已有工作在同一 exact object、主要目标、核心方法、主要保证/结果、成本边界和主 claim 上完成候选。

`DIRECT_SUBTRACT` 需扣除；`METHODOLOGICAL_ADJACENT` 与 `DEPLOYMENT_BASELINE` 不自动停止；`SEARCH_BOUNDED_OPEN` 可以进入 Stage A。

组合基线必须版本兼容、同信息、可实现、完整计价并保持同函数/协议。不可部署万能 union、离线 oracle 或“理论上能表达同一动作”不能单独判死。仍需比较求解复杂度、在线信息、成本、扩展性、解质量和保证。

## Q1/Q2 校准

参考集合至少覆盖：

- contribution-shape anchor；
- evaluation anchor；
- domain neighbor；
- 可选 boundary/negative anchor。

记录正式发表状态、venue/分区口径与年份、核验来源、实际阅读范围。Q1 comparator 只校准论文形状，不证明新颖性，也不自动成为实验基线。

Stage 0 必须独立裁定质量档。Discovery 的 `EVIDENCE_QUALIFIED_RAW`、开放 closure debt、FINER-lite 或 preliminary tier 都不是质量裁决；本阶段使用以下三级标签：

- `TIER_A_Q1_POTENTIAL`
- `TIER_B_Q2_VIABLE`
- `BELOW_Q2_STOP`

旧 comparator 状态保留用于兼容：

- `PARITY_PLAUSIBLE`
- `PARITY_CONDITIONAL`
- `NEAR_Q1_PLAUSIBLE_WITH_BOUNDED_GAP`
- `PARITY_NOT_PLAUSIBLE`

`TIER_A` 的有限缺口可为额外 workload/平台、规模、统计、补充消融、工程化或更高证据等级。`TIER_B` 可在贡献广度或证据规模上低于一区，但核心贡献、碰撞闭合、公平强基线、自然证据、full-cost 或可复现路径不能缺。任一硬门失败均为 `BELOW_Q2_STOP`，不能用分数覆盖。

## 评分与 AI 路由

学术价值 70：

- 问题重要性与机会 15；
- N1/N2/N3 清晰度与非平凡性 20；
- 相对最近工作增量 15；
- 基线、成本与 venue 适配 10；
- 可证伪性、边界与证据路径 10。

AI 加分 30：

- 同对象 artifact/基线 10；
- AI 核心实现与比较比例 10；
- 有界高信息风险 probe/反例搜索计划与可重放性 10；不得要求 probe 正结果等同主 claim 成立。

分数仅用于排序，不定义质量档。默认解释保留为优先级提示：

- 优先 PASS：总分 ≥72、学术 ≥46；
- 可建议 PASS：总分 ≥62、学术 ≥40 且无 hard gate；
- 人工储备：学术 ≥48 但 AI 只能辅助；
- REVISE：接近上述线且两天内可闭合一个原子缺口；
- STOP：DIRECT_FATAL、对象不成立、不可证伪、无 N1/N2/N3 或明显不足。

数字不能覆盖硬门。高 AI 分不能弥补无贡献；低 AI 分不能抹除高学术价值。

AI 分类：

- `AI_CORE_EXECUTABLE`：约 ≥70% 决定性关键路径可执行；
- `AI_CORE_CONDITIONAL`：约 50–69%，且缺口清楚；
- `AI_AUXILIARY_ONLY`：学术通过时建议人工储备。

合法同语义开源替代可用；缺商品硬件只降低 evidence ceiling。

## PASS 条件

- exact object 与问题一致；
- 谱系、来源和 seed-distance 可审计；
- 至少一个来源支持、可有限检验的自然或 canonical formal opportunity hypothesis 可信；已有低成本量化证据时必须诚实纳入，但尚无 candidate output/正结果不是失败；
- N1/N2/N3 至少一条可能成立；
- 具名公平基线后仍有可检验增量；
- 无严格 `DIRECT_FATAL`；
- Stage A 有自然 workload、强基线和机制特异 killer；
- 至少 `TIER_B_Q2_VIABLE`；一区校准达到 `PARITY_CONDITIONAL` 或 bounded gap 时标记 `TIER_A_Q1_POTENTIAL`；
- 差距可变成 Stage A gate。

缺异常、商品硬件、多 GPU、多个 fault family、完整 theorem 或完整自然 trace不自动停止非验证题。

claim-pack 中 `E2_ENGINEERING_SMOKE` 的成功只证明该工程入口；失败只支持 `EB_RESOURCE_OR_ENGINEERING_BLOCKED` 或用户 blocker。PRIMARY/SENTRY 不得把 E2 成败当作机制正负证据，也不得因未运行 E2 拒绝一个 A3/D2、无 C0 的 Tier A/B 条件性题目。

Stage 0 可以因对象不可定义、机会假设不可证伪、闭合必然换对象/降保证、current strongest union 直接吸收或无 N1/N2/N3 而 STOP；不能因“尚未得到核心结论”而 STOP。`evidence` 是可核验来源、静态证书或观察，`inference` 必须显式标注，`hypothesis` 只定义 Stage A 要攻击的条件；claim ceiling 不得超过现有 evidence。

## SENTRY

只复核 PRIMARY 的：

- PASS；
- REVISE_ONCE；
- 学术分接近人工储备线的 STOP；
- 主线指定的高风险 claim。

SENTRY 必须独立重查决定结论的最小来源、exact object、最强基线、Q1/Q2 质量档和 AI 路由，不复述 PRIMARY。运行中的 assignment 保持 frozen rule；规则迁移只在新的 assignment/resume 或 MAINLINE 明确的安全 gate 边界生效，终态 STOP 不得借迁移复活。它不得补做完整 Stage 0 或替候选设计新题。

输出：

- `CONFIRM`
- `DISAGREE`
- `PROVENANCE_FAIL`

`DISAGREE` 由主线路由 DECISIVE。

## DECISIVE

只裁决已列出的分歧，不扩展成第三次完整筛选。使用更高思考模型，给出可机械执行的最终建议。

## 结论与输出

PRIMARY 使用 `templates/STAGE0_REPORT.md`，分开填写 scientific verdict（`PASS_RECOMMENDED / REVISE_ONCE / INCONCLUSIVE_POLICY_HOLD / STOP / NOT_YET_JUDGED`）与 operational disposition（`READY / BLOCKED_USER_ACTION_REQUIRED / RESERVE_RECOMMENDED / EXECUTION_OR_POLICY_HOLD / NONE`）。资源/执行状态不得伪装成科学 verdict。

每阶段最多一次 `REVISE_ONCE`。问题、exact object、指标和 workload 不变时可预登记一次 mechanism pivot；改变对象必须新 ID。

### `ATOMIC_REPAIR_TRACE_V1` P0 shadow

新的 Stage 0 assignment 必须冻结 `STAGE0_ATOMIC_REPAIR_TRACE_MODE=OFF / SHADOW / PRODUCTION`；缺失时 fail closed 为 `OFF`。当前只安装非裁决性的 `SHADOW` P0，`PRODUCTION` 与任何因 trace 缺失、不一致或参与者冲突而改变 admission、repair、closing、PASS/STOP/HOLD 的语义，均须先通过独立 PACKER→EXECUTOR→AUDITOR 回测并由主线另行 cutover。

当 PRIMARY 建议且 SENTRY 独立确认 `REVISE_ONCE` 时，`SHADOW` 可记录 `ATOMIC_REPAIR_TRACE_V1`：initial defect、现有规则下的 eligibility predicates、allowed/forbidden delta、证据与 falsifier、full-cost、repair participants、独立 closer 排除集合及跨阶段 trace hash。该记录只编码现有门，不新增修订资格或次数；无 direct fatal、same-object/RQ/claim endpoint 不变、单一可证伪原子缺口、有限闭合路线与 revision 额度可用仍由现行规则独立判断。字段缺失或 legacy 无 trace 在 P0 下只记 `NOT_YET_MEASURABLE / NOT_APPLICABLE_LEGACY`，不得改变科学裁决、补零、追溯改写状态或复活 STOP。

若 revision 额度已耗尽且 closing 给出 `INCONCLUSIVE_POLICY_HOLD`，reviewer 不得自行运行第二次 revision。只有主线转交用户明确批准、题目/原子门/次数/证据 ceiling/唯一写目录均冻结的 exceptional-revision assignment 时，原 owner 才可执行一次该窄化例外；完成后仍必须交给未参与本次例外构造的长期 reviewer 独立 closing。该一次性授权不放宽 same-object、current strongest union、latest collision、形式完整性或 Q2 门。

最多同时使用 2 个一层子代理，分别核验正向 headroom、碰撞/基线和 AI 路径。父会话负责 canonical 结论，不以投票代替证据。

普通检索只写目录；阶段完成、分歧、资源/所有权或文件冲突才通知主线。完成后等待主线验收，不自行归档。

## 资源与可执行性边界

资源/执行 blocker 的正式分类、恢复与 reserve fallback 统一引用 `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md`。Stage 0 只核验结构潜力、有限闭合路线和精确用户包；缺实现、结果、证明、硬件、数据、下载或权限本身不是学术 STOP，也不得自动 reserve、归档或消费 revision。

Discovery 的 `FIDELITY_CLOSURE_PLAN` 和 Question Card closure debt 在 Stage 0 审查的是有限性、same-object/same-function、保证保持、比较公平性和可证伪性，不要求接口、format/checker、实现、小 witness、完整自然 corpus 或核心结果已经完成。Stage 0 必须独立重建 complete-enough current union、strongest collision 与 Q1/Q2 shape，不能因这些项目在 raw 时开放就自动 STOP。`FINITE_FIDELITY_GAP` 不能单独形成 STOP；只有闭合必然换对象/降保证、无有限可审计路线、或已被 current strongest union/直接碰撞吸收时，才是结构性负结论。真正的 `PRE_CLAIM_CONTRACT_FIDELITY_GATE` 由 Stage A owner 在第一次 claim-bearing run 前实际闭合。

对“current implementation lacks X”型 action gap，PRIMARY 与 SENTRY 都必须独立执行 `CURRENT_UPSTREAM_REALITY_CHECK`：核对当前 upstream commit/tag、官方 current 文档、实际源码路径以及默认/非默认 flag、阈值和配置入口。Discovery 的 absence claim 不可继承。若 current source 已表达冻结动作，原 gap 被直接吸收；只有在 current native mechanism 与公平有限配置网格之外仍能命名非调参、同对象的新动作/保证时，才允许一个原子 revision gate。旧文档冲突只是否定旧 gap，不等同于要求候选先有结果。

验收与报告采用风险分级：Stage 0 的决定性来源、current-source 结论、原子门、报告和 handoff 必须核对；无漂移的上游辅助文件不重复全量哈希，纯清单空格/大小写问题不应触发新审查轮次。给主线/用户的摘要用中文直说“通过、需一次修订、暂缓或停止”的原因与下一门；机器码和长 SHA 放在交接文件或附录，不主导正文。

题目级公开获取 envelope 的动作、attempt 与禁止边界由上述 blocker 协议和冻结 assignment 决定；Stage 0 不借资源恢复改变 object/commit/保证/比较器、实现候选或越过 Stage A/B。
## 资源本地化引用

任何 source retrieval、复制、解压、工具环境、构建、可配置缓存或临时输出前，完整遵守 `rules/RESOURCE_LOCALIZATION.md`。持久资源只能进入 frozen assignment 的 `resources/` 或主线登记的只读 shared asset；redirect preflight 失败只产生 resource blocker，不是 scientific STOP。

## Artifact lifecycle closeout

Cutover 后的新 resource-producing Stage 0 assignment 读取 `rules/ARTIFACT_LIFECYCLE.md`，handoff 前完成 inventory/retention proposal。Stage0 STOP 必须提出含 owner/confirmation、决定性 current-source/direct-fatal 或 minimum witness、原子合同与 provenance 的 terminal capsule 输入，不能只留报告。PASS/transition 只有 StageA 接受 exact input freeze 后才可建议删除重复 upstream copy。Reviewer 不执行 GC，也不得让 storage budget 改变 Stage0 裁决。
