# Discovery 来源与测量观测会话规则

## 适用会话

六个长期来源会话：

- `DISCOVERY-S1-BOUNDARY-CONTRADICTION`
- `DISCOVERY-S2-BOTTLENECK-TRANSFER`
- `DISCOVERY-S3-NATURAL-STRUCTURE`
- `DISCOVERY-S4-OBJECTIVE-CONSTRAINT`
- `DISCOVERY-S5-SCALE-ONLINE-APPROX`
- `DISCOVERY-S6-DIRECT-ALGORITHM-SOFTWARE`

周期性横向会话：

- `DISCOVERY-M1-MEASUREMENT-OBSERVATORY`

这些会话读取同一文件，按自己的 mode 执行。`COST_AWARE_MODEL_ROUTING_R1` 下，S1–S6 广筛与 M1 默认 `gpt-5.6-terra / medium`；冻结的 selective-depth packet 才用 Terra/high。只有完成 nomination barrier 后、并有记录的复杂闭合证据时，六路周期全局最多一个 packet 可用 Sol/high。每次新 assignment/follow-up 必须显式写 model/thinking，且不改变六路数、容量、预算、配额、评分或科学门。

当前题源分布采用主线冻结的可变策略，而不是把会话标题当作领域边界。各 lane 可以在自己的来源视角内筛选测量与规律刻画、形式保证、编译器/体系结构语义、跨层联合算法和近期论文明确未解限制。重复低 query yield 或 current-union 吸收只能让具名来源族在下一冻结周期临时降权；不得把成熟项目、工具表面或 broad category 变成永久排除，`RELATED_ONLY` 也不得据此冷却。分布变化不构成录取配额，零提案仍合法。

除非用户在未来另行明确恢复，Discovery 不再选择网络安全方向：包括漏洞发现或复现、攻击与防御、协议安全、恶意流量、入侵检测、反重放、渗透、exploit 构造及其近似改名。编译器内存安全、ABI、硬件隔离或运行时正确性只有在研究问题完全属于正常程序语义、代码生成、体系结构机制或性能/形式保证，且不需要构造、运行或验证攻击输入时才可保留；边界不清时直接按题源范围排除，不作科学负面判断。

每个新 assignment 还必须冻结 `DISCOVERY_CLAIM_PACK_MODE=OFF / SHADOW / PRODUCTION`。`OFF` 沿用 assignment 冻结的 canonical 方法；`SHADOW` 生成隔离的非 canonical 对照；`PRODUCTION` 仅在协议 hash、独立校准和主线 cutover 齐全时形成 canonical claim package，缺任一项即 `OFF`。已退役 R7 不再作为模式字段出现。

它们是长期来源槽位，跨波次复用，不按 brief 或候选新建会话。按用户批准 `DISCOVERY-SIX-LANES-DIRECT-20260811`，`S1`–`S6` 六个来源同时保持 active，不再用两个热槽轮转；每个来源仍一次只处理主线投递的一个冻结 wave assignment，写入独立波次目录。冻结 handoff 并经主线验收后，主线应立即给该长期来源投递下一份不重复 assignment；等待验收期间不得预读下一波，也不得把上一波未登记的临时判断当成下一波证据。M1 仍按周期或明确触发，不计入这六个生产来源槽。

## 最小读取与权限

读取：

1. `AGENTS.md`
2. `plan.md`
3. 主线冻结的 `ASSIGNMENT_CONTEXT.yaml`；context-slice production 前双读本 assignment 的 `registry.yaml` 记录
4. 本文件
5. `.agents/skills/research-topic-discovery/SKILL.md` 及本次工作所需的 skill reference
6. `templates/TOPIC_BRIEF.md`
7. `templates/DISCOVERY_DIVERGENCE_SEED_POOL.md`
8. `templates/DISCOVERY_RQ_CANDIDATE.md`
9. `templates/DISCOVERY_QUESTION_CARD.md`
10. 当前来源回测 handoff 与本波输入包
11. 仅当 `DISCOVERY_CLAIM_PACK_MODE=SHADOW / PRODUCTION` 时读取 `rules/DISCOVERY_CLAIM_PACK.md` 与 `templates/DISCOVERY_EVIDENCE_LEDGER.yaml`

每个 assignment 必须冻结 `research-topic-discovery` skill revision 与 `SKILL.md` SHA256；缺失或不匹配时在科学工作前 fail closed。skill 是 Discovery 的规范操作 runbook；本文件继续权威规定权限、raw 字段、状态、预算、科学硬门与交接。

新会话先用 `templates/BOOTSTRAP_ACK.yaml` 确认 lane、assignment、写目录、skill/hash、禁止输入和唯一下一动作；主线接受 ack 前不得检索、下载、形成 raw/brief 或运行 queue。

只写分配的 Discovery 目录。不得修改主控文件、其他候选目录或正式状态；不得自行创建 Stage 0。

## 目标

从真实论文谱系、当前 artifact 和可量化问题中发现至少二区可行、优先一区的论文机会。不要从工具名、API、单一 issue、预设 checker/controller 或泛化技术口号反推论文。

统一质量标签为 `TIER_A_Q1_POTENTIAL / TIER_B_Q2_VIABLE / BELOW_Q2_STOP`。Discovery 只有前两档可提交 Stage 0；`TIER_B_Q2_VIABLE` 不是放宽科学门，same-object、最新碰撞、公平强基线、自然输入、full-cost、可复现路径和证据诚实性仍是硬条件。

候选至少具有一条可能成立的贡献：

- `N1` 新抽象、机制、表示或动作；
- `N2` 新算法、优化、近似、在线策略、数据结构或软件实现原理；
- `N3` 新稳定经验规律及其利用。

合法证据路线：

- `PERFORMANCE`
- `PARETO_APPROXIMATION`
- `COMPLEXITY_THEORY`
- `MEASUREMENT_MECHANISM`
- `FAULT_DEBUGGING`

只有验证/调试题默认要求真实 fault；其他题不要求异常或假设失效。

## Discovery 前端：证据门控的多视角产题

Discovery 前端的操作顺序由项目级 `$research-topic-discovery` skill 统一：有界 seed portfolio → exact public anchor → primary RQ → ordinary/selective pre-RQ source closure → 本文件不变的 raw gate → contribution-type-specific deep review → brief 或 abstention。不得采用强制 Top-N、可补偿总分或多数投票。当前项目仍以绝对科学门和独立 Stage 0 为准；同一批候选全部不合格时，零提案是正确结果。

每个新 assignment 必须冻结 `DISCOVERY_RQ_FRONTEND_MODE=OFF / SHADOW / PRODUCTION`、方法 revision、模板 hash 与回测 handoff。当前方法 revision 为 `RQ_REFINEMENT_STAGED_EVIDENCE_V1`：

- `OFF`：沿用 assignment 冻结的旧 Question Card 语义；不得用本节新状态改变 canonical 决定；
- `SHADOW`：在隔离目录运行 `RQ_CANDIDATE → EVIDENCE_QUALIFIED_RAW`，但 canonical 仍由 `OFF` 语义形成；
- `PRODUCTION`：仅在独立 PACKER→EXECUTOR→AUDITOR 时间切片回测通过且主线留下 cutover 记录后使用本节新漏斗；
- 缺模式、revision、模板 hash、回测 handoff 或 cutover 一律 fail closed 为 `OFF`。

该模式与 `DISCOVERY_CLAIM_PACK_MODE` 相互独立：RQ 前端负责生成—问题收敛—证据分层，claim-pack 负责机会族证据协议。两者均为 `PRODUCTION` 时必须分别具备独立校准，不得用一个回测替代另一个。

seed 生成、发散引擎、视角轮换、聚类、RQ 收敛、source-role allocation 与 pre-RQ nomination 的唯一操作 runbook 是项目级 `$research-topic-discovery` skill 及其 references/templates；角色规则不复制步骤。角色只强制：canonical identity 五字段预检、结果出现前冻结 RQ/来源/fallback、不得结果感知补位，以及 seed/RQ/backlog 不进入科学分母。技能输出若与下述 raw gate 或权限冲突，以本文件为准并 fail closed。

任何 locator 在进入 raw 前都查询主线冻结的全历史 canonical identity surface：只有五字段 `EXACT`、可证 `TERMINAL_CONTAINS` 或冻结 direct current collision 才排除；`RELATED_ONLY` 不得冷却，未命中不证明新颖或 absence。近期论文、future work、issue、工具特性和模型分数只能是 locator/反方/subtractor。

### 第三层：Research Question Card 分层决定能否进入 raw

每个 locator 必须先按 `templates/DISCOVERY_QUESTION_CARD.md` 写卡。以下 `RAW_REQUIRED` 字段同时明确，才计入 `EVIDENCE_QUALIFIED_RAW`：

1. exact public identity、project/dataset/benchmark/spec 与版本或日期；
2. carrier kind：`NATURAL / CANONICAL_BENCHMARK_ONLY / CANONICAL_FORMAL_ORACLE / IMPLEMENTATION_CARRIER_ONLY`；
3. exact object 与 same-object problem/estimand；
4. contribution type 与 claim endpoint：`target-native action / measurement conclusion / benchmark validity or coverage / formal guarantee / stable-law consequence`；
5. counterfactual consequence：如果问题成立，哪个同对象决策、结论、动作或保证会改变；
6. 一个来源支持、可被推翻的 non-generic discriminator：为何可能不是普通调参、selector、controller、wrapper、通用 solver/packing/scheduling；
7. 至少一个版本化 current-source/spec locus，以及截至该 locus 没有出现的已知 `DIRECT_FATAL`；
8. minimum decisive falsifier，以及不要求先得到主结果的有限 closure route；
9. full-cost 初始维度与不可改变的语义/质量合同。

以下项目允许在 raw 时登记为 `BOUNDED_CLOSURE_DEBT`：完整 current union/默认与非默认入口枚举、最强论文/实现 subtractor、完整 genealogy、完整小 witness、native checker/reader/interface、自然 corpus 实际获取、主结果和正式 Q1/Q2 校准。每项必须写 owner stage、最多三个决定性 source question、有限路线、失败后果与 claim ceiling；不得用无限搜索或“以后再看”占位。

存在已知 `DIRECT_FATAL`、闭合必然换对象/降保证、只剩 generic wrapper/solver，或没有有限可审计路线时仍不得进入 raw。`RAW_REQUIRED` 字段缺失时只记 `LOCATOR_ONLY`；若缺失来自具体公开资料/检索/工具故障，另进入非候选 `SOURCE_CLOSURE_QUEUE`，记录唯一缺件、恢复触发器和预登记 fallback，不得在管理上静默消失。卡片可以标出未知项，但不能用模型置信度、热度、论文数量或 venue 名声替代证据。

`SOURCE_CLOSURE_QUEUE` 的状态必须与路线账本机械一致：`EXHAUSTED` 只在至少一条冻结路线已实际尝试，或每条冻结路线都有逐条、可复核的 `MECHANICALLY_UNAVAILABLE` 证明时合法。`attempts=0` 且仍有可执行路线时必须写 `PENDING_UNEXECUTED`；传输、权限或工具故障写 `BLOCKED`/bounded unresolved，并保持 `NO_SCIENTIFIC_INFERENCE`。所有调用在调用前递增不可重置 attempt counter；拒绝、404、零字节和未持久化响应也计 attempt。handoff 前核对 queue 状态、attempt 数、剩余路线和 `RESOURCE_INVENTORY.yaml`，不得用“缺资料”冒充路线已耗尽。

### 第四层：按贡献类型消化 closure debt 并进入 C0/D1

- `METHOD_ALGORITHM / COMPILER_TOOL / SYSTEM_ARCHITECTURE`：需要可攻击的原子动作骨架、目标特异判别点、preliminary current-union map、小 witness 路线和 checker/oracle；不要求 Discovery 已实现两套完整程序、穷尽 action catalogue 或证明 union 外存在。
- `MEASUREMENT_CHARACTERIZATION / BENCHMARK_DATASET`：允许 `CANONICAL_BENCHMARK_ONLY` 独立入口；必须冻结估计量或结论函数、覆盖/有效性问题、混杂、full-cost、结论改变阈值和 held-out falsifier。该入口不得外推自然部署规律，也不因 benchmark canonical 就自动进入 C0 或 brief。
- `N3`：需要版本化自然载体、稳定规律假设、混杂路线、可反证阈值，以及由规律驱动的非 controller 动作或明确决策后果。
- `THEORY_FORMAL`：需要固定保证、canonical instance family、checker/oracle、非通用构造骨架和最强形式反方。

上述检查采用各贡献类型最便宜的 anti-collapse test；不得把 non-product coupling、完整 action enumeration 或单一 survival trace 设为所有类型的统一前门。完整 same-object collision、current union 与 Q1/Q2 仍由 Stage 0 独立重建。

满足其他 D1 字段、即将进入 D1 的卡继续执行 assignment 冻结的低成本单 witness/单 mode action-or-observation survival trace；完整 action catalogue、独立碰撞、Q1/Q2 和最终论文形状仍由 Stage 0 重建。

同一题的完整 current union、最近直接碰撞和 Q1/Q2 不得在 Discovery 与 Stage 0 各要求一次穷尽闭合。Discovery 只需给出 preliminary map、已查决定性 locus、相反证据、搜索边界和 debt；Stage 0 独立重建并终裁。若 action gap 以“current implementation lacks X”为核心，Discovery 在形成 clean brief 前仍须完成本文件的 `CURRENT_UPSTREAM_REALITY_CHECK`，但进入 raw 时只要求一个 current locus 和有界待查清单。

### 排序、停止与人工边界

重要性、新颖性威胁、可证伪性、来源闭合度、预计成本和 AI 可执行性可以用于安排有限 C0/deep 顺序，但只是调度信息：

- 任一 same-object、保证、current direct absorption、generic-kernel、自然/规范证据或 full-cost 硬门失败，不能被总分补偿；
- 不得因为“相对排名第一”自动形成 brief，不得强制输出 Top 3/5/10；
- 优先检查最便宜、最能改变决定的 falsifier；失败即窄化、暂不准入或结构淘汰，不为保留故事而改写对象；
- Discovery 不以多 lane 投票代替证据。用户保留政策权，独立 Stage 0 保留科学准入权。

漏斗必须逐行记录 `SEED（非证据） → RQ_CANDIDATE / RQ_BACKLOG → SELECTED_LOCATOR → EXCLUDED_BEFORE_RAW / LOCATOR_ONLY / SOURCE_CLOSURE_QUEUE / EVIDENCE_QUALIFIED_RAW → C0 → D1 → DEEP → CLEAN_BRIEF`；seed、RQ 与 source-closure debt 单独报告，不得与科学漏斗混作同一分母。禁止科学结果感知补位，但允许使用在查阅结果前冻结的 RQ 版本、transport fallback 和纯重复/终态身份后的 reserve locator。

## 来源 mode

### S1：O1 + O6

寻找假设失效、论文矛盾、源码与假设不符、真实异常或原语错配。不得把单一 issue replay 当成论文。

### S2：O2

寻找已有优化之后转移到内存、通信、metadata、编译、初始化、调度或相邻阶段的瓶颈。

### S3：O3

寻找自然输入中的局部性、偏斜、重复、稀疏、时间相关、拓扑或数值结构，并要求可利用机制。

### S4：O4

寻找吞吐、尾延迟、容量、能耗、编译时间、资源、在线适应或可靠性目标变化产生的新 Pareto 问题。

### S5：O5

寻找精确、小规模或离线方法在新规模和信息条件下失效后需要的近似、分解、层次、动态或在线方法。

### S6：O7

问题和环境可以保持不变，但提出新的算法、数据结构、搜索、近似、编译优化或实现组织，改进时间、空间、通信、能效、编译成本、解质量或扩展性。

O7 不是普通调参。必须说明 same-function/quality、非平凡算法增量、完整成本、推广假设和无收益区域。

### M1：O8

从 workload、trace、profile、benchmark 或跨平台测量中寻找未知且可复现的规律、成本拐点、排名反转、评价偏差或规模效应。

M1 可把机会路由到 S1–S6，也可以提出 `MEASUREMENT_MECHANISM` 候选。只有数据收集、dashboard 或 benchmark 扩容而没有规律、决策后果、评价修正或利用机制时必须 DROP。

不能自然分类时允许 `OTHER_EVIDENCE_BACKED_ORIGIN`。

## 回测前置门

每个长期来源 mode 和 M1 在首次生产或方法物质变化后，必须先通过 `ROLE_DISCOVERY_BACKTEST.md` 的独立 packer–executor–auditor 回测。未通过时只能准备材料，不能提交生产 Stage 0 候选。

回测只校准发现方法，不是新候选的自然 headroom、新颖性或可行性证据。

## 论文机会包

不得只使用单篇 seed。以下完整机会包在 clean brief 前通常包括；进入 raw 时只要求 Question Card 所列最小 source handles 与 bounded debt，不得把本清单整体前移为 raw 硬门：

- 1 篇当前 anchor；
- 2–4 篇关键前置工作；
- 1–3 篇后续、竞争或替代工作；
- 至少 1 份反证、不同结论、negative result 或边界材料；
- 可获得时加入源码、issue、benchmark、profile、trace、规范或专利；
- 课题组公开成果和用户确认的所有权边界。

每份材料记录版本/日期及角色。没有找到时写 `NOT_FOUND_WITHIN_SEARCH`，不得把“未发现”写成绝对首次。

## Claim-pack assignment 门

`DISCOVERY_CLAIM_PACK_MODE=SHADOW / PRODUCTION` 时，唯一权威协议是 `rules/DISCOVERY_CLAIM_PACK.md`；本角色只负责按模式读取、保持六 lane 上限与角色独立、提交协议要求的 ledger/brief。模式/cutover 属于 assignment/registry 状态，不在角色规则重复。缺合法 cutover 时不得形成 canonical claim-pack 决定。

### 筛查日志状态与漏斗计数

raw/deep-review 日志可以使用以下状态，但它们只服务可读性与遥测，不是 registry candidate state，也不替代最终 `PROPOSE_STAGE0 / DROP`：

- `STRUCTURAL_DROP`：已有同对象碰撞、对象/保证不合法、当前 union 吸收或其他结构性淘汰；
- `NOT_ADMITTED_UNFROZEN`：问题可能有价值，但完整动作、来源最小集或有限 closure 尚未冻结；不得伪装成科学 STOP；
- `RESOURCE_BLOCKED`：来源、数据、权限或工具资源阻塞；不得据此作学术负推断；
- `DEEP_DIVE_REQUIRED`：已形成具名近门槛机会，尚需候选级深审；
- `EXCLUDED`：超出本 assignment 范围、重复行或命中预登记排除边界。

每波必须分别记录 `RAW_SCREEN_ROW_EVENT`、其中的 repeat/rescreen、去重后的 `UNIQUE_OPPORTUNITY_FAMILY`、`CANDIDATE_GRADE_DEEP_REVIEW` 和最终 `STAGE0_BRIEF`；不得把这些混合单位相加后当作召回率分母。零 `STAGE0_BRIEF` 始终合法。`CLEAN_STAGE0_BRIEF`、`DECISIVE_STAGEA_OBSERVATION` 和 `STAGEA_PASS` 由下游/主线按各自定义登记，Discovery 不得自行预测或宣告。

若主线标明连续零产出诊断已经触发，Discovery 不等待审计完成；按新冻结题源分布继续 canonical 筛选。审计结果只能在下一安全 assignment 边界影响来源投入。V9 下一次评价只跟踪实际 clean brief 的 Stage 0 反馈，不要求为评价目的凑普通 family、brief 或正结果。

## 旧题失败核驱动的新 ID 重设计

当主线依据 `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md` 投递 `NEW_ID_REDESIGN_ROUTE` 时，Discovery 只能把旧题已登记失败核作为 `CONTRARY` 或 boundary evidence：

- 新候选必须在 object、action/estimand、endpoint、guarantee 或 full-cost 五字段中有可审计的实质变化，并重新冻结 exact public anchor；
- 不得继承旧题的新颖性、PASS、自然结果或未验证假设；
- 必须重新执行 current-upstream reality check、generic/direct collision 和 strongest-baseline closure；
- 如果只是改名、降门、删分母/强基线或绕过 terminal falsifier，必须 `DROP`；
- 若形成有限新机制和 72 小时 falsifier，按正常 `PROPOSE_STAGE0` 路由，不直接返回 Stage A。问题谱系、竞争机制与初步碰撞/执行入口按 skill 的 anchor→RQ→source-role→deep-review 流程生成，不在角色规则重复另一套三遍步骤。

旧 R7 collision-first 模块已退出 live surface，归档于 `rules/_archive/20260830-rule-consolidation/DISCOVERY_SUPERSEDED_RUNBOOK_AND_R7.md`。新 assignment 不读取或冻结 R7；恢复必须明确替换现行 funnel，不能作为平行模式追加。

## Discovery 保真计划与 Stage A 保真执行门

Discovery 不需要已经实现候选、修改 native checker/format、运行核心实验或证明主结论。`PRE_CLAIM_CONTRACT_FIDELITY_GATE` 在 Stage A 第一次 claim-bearing run 前才必须实际闭合；不得把该执行门提前变成 Discovery 的结果门。

Discovery 对每个 `PROPOSE_STAGE0` 只需提交可审计的 `FIDELITY_CLOSURE_PLAN`：

- 冻结拟议的完整原子动作和 action interface，而不是承诺只跑局部 proxy；
- 列出真实 comparator、native codec/solver/checker/reader/format 语义及需要补齐的接口；
- 冻结 same-object/same-function/同保证边界、指标分母和 full-cost 维度；
- 指定至少一个可在自然 corpus 前执行的小 witness；
- 给出有限闭合步骤、所需公开资源、失败条件和 claim ceiling。

状态使用：

- `READY_TO_CLOSE_IN_STAGEA`：现有 artifact 足以在 Stage A preflight 闭合；
- `FINITE_FIDELITY_GAP`：接口、format/checker、实现或 witness 尚缺，但有限闭合路线清楚；仍可送 Stage 0；
- `HUMAN_CORE_FIDELITY_GAP`：核心语义长期依赖人工/平台研究；学术强时仍可送 Stage 0，由其决定人工储备；
- `RESOURCE_BLOCKED_FIDELITY_GAP`：具体外部资源阻塞；建议用户解阻，不得学术 DROP；
- `STRUCTURALLY_UNCLOSABLE`：闭合必然换对象、降低保证、取消公平 comparator，或不存在有限可审计路线；必须 DROP。

`action-gap` 在 Discovery 是有来源支持、可被 Stage 0 攻击的结构假设，不要求已通过实现或实验“证明 union 外存在”。但必须说明拟议动作为什么没有被已知 strongest union 明显表达，以及哪一个有限观察能区分“真实 residual”与“被吸收”。已知直接吸收仍必须 DROP，不能借 `FINITE_FIDELITY_GAP` 保留。

若结构假设依赖“当前实现缺少某动作、接口、格式能力或语义”，必须先完成 `CURRENT_UPSTREAM_REALITY_CHECK`：

1. 冻结当前 upstream commit/tag 与检查日期；
2. 同时检查官方 current 文档和实际源码路径，不得只引用旧版文档、旧 release、issue 或 future-work；
3. 枚举默认与非默认 feature flag、阈值、配置和隐藏/实验入口，说明它们能否表达拟议动作；
4. 保存支持与反对 action gap 的源码符号/文档定位；
5. 若 current source 已表达冻结动作，必须 `DIRECT_SUBTRACT/DIRECT_FATAL`，只能在其外重新定义非调参 residual；若源码或官方材料因具体资源原因不可达，则标记 `RESOURCE_BLOCKED_FIDELITY_GAP` 并报告解阻，不得把“未查到”写成不存在。

这项检查只验证 current baseline reality，不要求实现候选、运行 benchmark 或取得主结论。Stage 0 仍须独立重做，不能继承 Discovery 的 absence claim。

## 新颖性与基线

碰撞分类：

- `DIRECT_FATAL`：同一 exact object、主要目标、实质相同核心方法、主要保证/结果、成本边界和主 claim；必须 DROP。
- `DIRECT_SUBTRACT`：扣除已有贡献后重写 residual。
- `METHODOLOGICAL_ADJACENT`：方法相邻，不自动 DROP。
- `DEPLOYMENT_BASELINE`：强部署基线，不等于覆盖论文贡献。
- `SEARCH_BOUNDED_OPEN`：检索范围内未找到直接覆盖，不等于全球首次。

每题通常冻结：

1. 当前部署/官方基线；
2. 最近论文基线；
3. 简单但有竞争力的默认或启发式；
4. 必要时离线 oracle ceiling。

组件组合只有在版本兼容、同信息、可部署、成本完整且保持同函数/协议时才能作为公平基线。不可部署的万能 union 不得判死候选。基线能表达同一动作也不自动覆盖新算法；仍需比较复杂度、在线信息、内存、扩展性、解质量和保证。

## 两个防同质化测试

### 去方法名测试

删掉 CUDA、Triton、ILP、TV、certificate、cache 等名词后，仍应是清楚的研究问题、决策结构和指标。

### Seed-distance

相对 anchor 或最近工作至少实质改变一项：

- 研究问题；
- 决策变量或信息条件；
- 约束结构；
- 优化目标；
- 可利用规律；
- 理论保证；
- 证据对象。

只换应用、后端、API 或组件组合必须 DROP。

## AI 与资源

AI 可执行性只用于排序：

- `AI_CORE_EXECUTABLE`：核心关键路径至少约 70% 可审计执行；
- `AI_CORE_CONDITIONAL`：约 50–69%，且缺口可闭合；
- `AI_AUXILIARY_ONLY`：学术强时仍送 Stage 0，由其判断人工储备。

合法同语义开源实现、模拟器和公开 trace 可作为执行资源。缺商品 GPU/NPU/FPGA 不自动 DROP；改变对象或语义时必须缩小 claim ceiling。

仅在 R7 `SHADOW / PRODUCTION` 的 top-k depth 调度中，可以按 source-grounded natural/formal headroom、object/action clarity、absorption risk、source-role completeness、finite Stage A killer 和 AI core fraction 排序。排序只改变深审顺序，不改变 Q2 硬门；高价值 human-core 课题仍可送 Stage 0 评估人工储备。

## Q1/Q2 质量假设

Discovery 只需提出候选 venue family、质量档和为什么可能形成完整论文。可以列 preliminary contribution-shape analogs，但它们不是候选的新颖性证据，也不替代 Stage 0 的正式 Q1/Q2 校准。

`TIER_A_Q1_POTENTIAL` 可只缺额外 workload、平台、规模、统计、补充消融或更高证据等级。`TIER_B_Q2_VIABLE` 可在贡献广度或证据规模上低于一区，但核心贡献、同对象新颖性、公平强基线、自然正证据、full-cost 和可复现路径不能缺。

## 输出与结论

使用 `templates/TOPIC_BRIEF.md`，只给：

- `PROPOSE_STAGE0`
- `DROP`

`PROPOSE_STAGE0` 最低条件：

- 问题重要且具有与贡献类型匹配的自然、canonical benchmark、canonical formal 或真实 implementation-carrier 机会路线；Discovery 不要求已取得主结果；
- 论文谱系和来源清楚；
- 至少一个来源支持的主机制，以及一个强替代解释、null hypothesis 或当前强基线；多机制不是所有贡献类型的统一硬门；
- N1/N2/N3 至少一条可能成立；
- 有定量锚点、具名基线和 72 小时 probe；
- seed-distance 不是换名；
- 没有严格 `DIRECT_FATAL`；
- 已提交 `FIDELITY_CLOSURE_PLAN`，状态至少为 `READY_TO_CLOSE_IN_STAGEA / FINITE_FIDELITY_GAP / HUMAN_CORE_FIDELITY_GAP / RESOURCE_BLOCKED_FIDELITY_GAP`，而不是 `STRUCTURALLY_UNCLOSABLE`；
- 凡 action gap 依赖 current implementation absence，已提交 `CURRENT_UPSTREAM_REALITY_CHECK`，包含 upstream 版本/commit、官方 current 文档、源码路径及 flag/threshold 表达能力；
- 至少达到 `TIER_B_Q2_VIABLE`，并说明能否上探 `TIER_A_Q1_POTENTIAL`。
- 在 claim-pack `PRODUCTION` 下，另须达到 `A3_FALSIFIABLE_CONTRIBUTION_CLAIM`、`D2_DECISION_READY_FACETS`，collision 为 `C1/C2/C3` 而非 `C0`，贡献类型合同完整，独立 prior/current audit 已完成，并随 brief 提交 `DISCOVERY_EVIDENCE_LEDGER.yaml`；E2 不是必需条件。

对新硬件/编译器开源线索必须用官方证据冻结对象、架构代号、后端、指令和 descriptor 术语；跨厂商或跨代际语义相似不得自动视为同一对象。

每波小批量交付，不逐条通知主线。普通搜索只写本地；阶段报告、PROPOSE/DROP、跨题 DIRECT_FATAL、权限/所有权问题或文件冲突才通知主线。

每个 assignment 的 canonical 交接文件名固定为 `handoff.yaml`，canonical 完整性清单文件名固定为 `HASH_MANIFEST.sha256`。清单优先列 canonical brief、handoff、证据账本和决定性审计文件，不要求为了辅助日志全收录而拖延完成；文本或 binary marker 两种常见 sha256sum 行均可，只要哈希与相对路径可无歧义解析，空格/大小写差异不构成 blocker。旧 `HANDOFF.md`、`MANIFEST.sha256` 或 `HASH_MANIFEST.yaml` 可作为历史兼容输入。handoff 必须指向 canonical 清单，清单不得哈希自身。

日常零提案批次完成时做一次本地最小校验即可：必需文件存在可读、family/结论/计数一致、canonical 先于 shadow（如适用）、没有越权写入。不得反复递归复算整棵目录或为纯 manifest 格式来回重封包。向主线与用户的摘要用中文说明筛了什么、为何未入选、是否有真正 blocker 和下一步；机器码与完整哈希留在 handoff/清单中，不在正文堆叠。

## 子代理

一个完整六路周期全局最多使用一个有记录升级证据的 `gpt-5.6-sol / high` 一层 closure packet，不是每个 lane 各一个。每个 lane 在定向结果前最多冻结一个 nomination 或明确 `NONE`；只有六路 nomination 全部冻结后，主线才按 `.agents/skills/research-topic-discovery/references/selective-depth.md` 的结果无关顺序选择。未获主线 slot 的 lane 不得自行启动 Sol；看到首包结果后不得 backfill。父 lane 负责来源核验、去重和 canonical brief；不得以多数投票决定候选。

## 禁止

- wrapper、dashboard、schema 或普通 checker；
- 普通调参、教科书算法直接套用、无新结构的组件直积；
- 单一 issue replay；
- 只换应用、API、硬件或名词；
- 从 limitation 句子直接生成题目而没有自然 headroom；
- 省略关键成本；
- 先设计工具，再硬补研究问题；
- 同一 anchor 周围反复生成 bridge、adapter 或同义题。

## 资源失败不得伪装为学术淘汰

一手来源、数据或工具暂时不可取得时，只能登记检索/资源边界并向主线提出 `BLOCKED_USER_ACTION_REQUIRED`；不得据此判断论文潜力不足、不得转人工储备、不得归档课题或制造负证据。只有直接碰撞、对象不可定义、贡献被吸收等结构性事实可以形成学术淘汰建议。

若 assignment 引用 `USER_BLOCKER_AUTONOMOUS_OPEN_SOURCE_ACQUISITION_20260814`，Discovery 可在冻结的 locator/C0 预算和唯一写目录内自主获取公开或开源的一手源码、论文、数据、trace 与规范材料，用于完成 Question Card、current-upstream reality check 或有限 closure。必须记录来源、版本、许可、响应字节和哈希；不得安装系统组件、修改全局环境、联系外部人员、进入网络安全题、执行候选实验或把下载成功本身当成新颖性证据。该授权不增加 locator/raw/C0/deep 容量，也不放宽 Question Card 与科学硬门。
## 资源本地化引用

在任何下载、复制、解压、隔离环境、构建、可配置缓存或临时文件动作前，完整读取并遵守 `rules/RESOURCE_LOCALIZATION.md`。新 assignment 只能写入其 frozen `RESOURCE_ROOT=<unique_write_directory>\resources\` 及 canonical sibling inventory；若重定向 preflight 不可靠，资源动作前 fail closed，不能形成科学负推断。

## Artifact lifecycle closeout

Cutover 后的新 resource-producing Discovery assignment 还必须读取 `rules/ARTIFACT_LIFECYCLE.md`。无论 clean brief、zero output 或 bounded abstention，handoff 前都要 finalize inventory、逐项给出 retention class/downstream/reacquire gate，并生成 `PHASE_CLOSEOUT_RETENTION.yaml`。Discovery 只提案保留/删除，不自行 GC；selected evidence/source loci/handoff/manifest 与可审计 abstention chain 为 capsule 候选，cache/tmp/nonselected downloads 只有在主线接受 closeout 后才可能删除。
