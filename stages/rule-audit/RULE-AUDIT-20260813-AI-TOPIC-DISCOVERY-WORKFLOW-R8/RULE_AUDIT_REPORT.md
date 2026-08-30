# AI 自主科研选题发现工作方案报告：DISCOVERY-CASCADE-R8

## Identity

- `audit_id`: `RULE-AUDIT-20260813-AI-TOPIC-DISCOVERY-WORKFLOW-R8`
- `trigger`: 用户要求把经外部研究与项目历史复盘形成的 AI 选题方案整理为正式报告。
- `requested_by`: user
- `date`: 2026-08-13（Asia/Shanghai）
- `write_directory`: `stages/rule-audit/RULE-AUDIT-20260813-AI-TOPIC-DISCOVERY-WORKFLOW-R8/`
- `decision`: `BACKTEST_REQUIRED__USER_POLICY_DECISION_REQUIRED`
- `shared_files_modified: false`
- `production_status`: `PROPOSAL_ONLY__NOT_ACTIVE`
- `report_length`: approximately 21,500 Unicode characters

## 摘要

本报告提出 `DISCOVERY-CASCADE-R8`：一个面向计算机系统、算法、编译器、体系结构与相关方向的 AI 自主科研选题发现方案。方案的目标不是提高“题目生成数量”，而是在不降低 `TIER_B_Q2_VIABLE`、same-object、最新碰撞、公平当前强基线、自然输入/证据、full-cost、可复现性与 claim ceiling 的前提下，提高送入 Stage 0 的 brief 完整度、独立审查通过概率以及进入 Stage A 后产生决定性观察的效率。

现有项目证据显示，低 raw-to-proposal 比率本身不能证明发现效率低，因为旧分母混合了重复筛查、异质来源与不同深度的 screening unit。更明确的问题是：早期六个 Stage0 brief 全部需要 Stage0 补回材料性 source/action 信息，表明 Discovery 在当前同对象论文、first-party 实现、generic kernel、原子动作和自然载体方面的闭合不稳定。与此同时，外部研究显示：LLM 能产生或检索有新颖感的研究线索，但自评、创意多样性、复杂文献检索和端到端实验执行仍是薄弱环节。由此，R8 采用“多源生成—机制去重—结构预筛—多通道检索—分面重排—决策翻转优先深读—保守停止—静态执行预检—独立 Stage0”的级联结构。

R8 必须作为全新、窄范围、可回滚的方法版本进行历史时间切片回测与两波非 canonical shadow，不能继续按旧 v8.8/R3R1 的已知答案定向修补。报告不授权修改共享规则、恢复 Discovery、启动回测、下载、实验或 Stage0/A/B。

**关键词**：AI 科研选题；Discovery；文献检索；新颖性审查；Stage0；主动学习；研究代理；可复现性

## 1. 目标、研究问题与边界

### 1.1 核心目标

本方案服务于以下控制目标：

1. AI 自主完成大部分常规检索、谱系梳理、源码现实核对、候选去重、对立证据查找、brief 编写和执行预检；
2. 用户只在政策、重要资源、Stage B、正式项目与外部行动上投入少量时间；
3. 学术潜力决定保留与否，AI 可执行性只决定排序、自动推进或 `HUMAN_RESEARCH_RESERVE`；
4. 不以提高 Stage0 proposal 数量或 PASS 率为配额，不要求每个方向、来源或 wave 产出论文；
5. 任何题目仍必须至少达到可信二区论文形状，并优先支持一区潜力。

### 1.2 本报告回答的问题

- 为什么大量筛查只产生少量 Stage0 brief，哪些部分属于健康 abstention，哪些属于低效浅筛？
- 如何通过更合理的文献工作，而不是简单增加论文数量，提高候选进入 Stage0 前的精度？
- 如何让 AI 在选题、核碰撞、可执行性预检和反馈学习中承担更多工作？
- 当前六个长期 Discovery 来源会话与运行并行数应如何组织？
- 怎样用历史回测、blind holdout 与 shadow 证明新方法有效，而不是凭主观感觉切换生产？

### 1.3 不可放松边界

R8 不改变以下硬门：

- 最低 `TIER_B_Q2_VIABLE`，优先 `TIER_A_Q1_POTENTIAL`；
- exact object / same function / same guarantee；
- cutoff 附近的最新论文、官方文档、upstream source、默认与非默认 flag/threshold；
- 公平、当前、强基线以及可部署 union 的合法边界；
- 自然输入、自然 workload、真实 trace 或形式上有效的对象；
- full-cost、分母、单位、数据移动、预处理与运行时成本；
- 可复现检索、版本、commit、read scope 与证据 ceiling；
- 缺实现、缺结果、资源失败和 AI readiness 不足不得变成科学 STOP；
- 终态 STOP 不复活；Stage B 与正式项目仍逐题由用户批准。

## 2. 方法与输入

### 2.1 项目内证据

本报告以 2026-08-13 读取的以下权威输入为准：

| 输入 | SHA-256 | 用途 |
|---|---|---|
| `AGENTS.md` | `B7122A5ACC5CF02A602988548E7464BF03362059293B083796BA1687D2CFAC73` | 核心目标、角色与科学硬门 |
| `plan.md` | `52EE4BB5EBA2D11432B36663115808C3C972346669349A438AEEEEAB543F0D42` | 当前状态与停止边界 |
| `registry.yaml` | `35691A5A0359106B05337FFB60393720D219625267A3351A493A63C7204570D2` | 漏斗、回测与任务事实 |
| `rules/ROLE_RULE_AUDIT.md` | `9D0064D8E448ECFD3761E7125E776074417F81EF7012C9C49967AB7FA7148C99` | 本报告权限边界 |
| `rules/ROLE_DISCOVERY.md` | `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3` | 现行 Discovery 语义 |
| `rules/ROLE_DISCOVERY_BACKTEST.md` | `B2295EC8C975C1327830C2C8A69B3204C74DB584446D7978F95FEBD362CB5235` | 独立回测要求 |
| `rules/ROLE_MAINLINE.md` | `E2539121ED56CED3EA7745F74F54EFBDFDE9FF58ED276723C97072603135A170` | 调度与共享单写者 |
| `templates/TOPIC_BRIEF.md` | `41D7B1977C6C467E31762B097C3F53C4314900E5C69AD8351EBB709F3963A130` | brief 输出兼容面 |

同时复核了 R5 的筛查质量审计、R6 的 v8.8 失败归因、R7 的 collision-first/dormant 实现与其 P0 报告。未遍历全部候选目录，未重裁任何候选。

### 2.2 外部研究方法

外部材料只使用论文作者页、会议论文集、ACL Anthology、ICLR proceedings、arXiv 与同行评议期刊页面。每项研究被映射到一个有限设计问题，不把跨领域 benchmark 的数值直接当成本项目的预期收益。

## 3. 现状诊断

### 3.1 当前生产事实

截至冻结输入：

- Stage0 独立 PASS 为 `20`；StageA 独立 PASS 为 `1/3`；
- Discovery 已按用户指令在完成当时在制 assignment 后停止，不能由本报告自行恢复；
- 六个长期来源身份 `S1–S6` 的生产政策是直接并行，不是两席轮转；
- R7 的 `DISCOVERY_QUALITY_MODE` 当前为 `OFF`；
- v8.8-R3 独立回测为 `NOT_CALIBRATED`；获批的 R3R1 又因 packer 未提供 control arm、无法表达批准的 control-plus-treatment 20-run 协议而被主线拒绝，EXECUTOR 与 AUDITOR 均未启动；
- 因此 R5-P1/P2、R7 blind backtest、shadow 与 production 均未获得有效校准入口。

这意味着 R8 必须是新方法提案，而不是把失败的 v8.8/R3R1 包重新命名或修改几个案例答案。

### 3.2 “238 次筛查只有 6 个提案”不能单独说明低效

R5 重构出 244 个 mixed row-events，其中至少 17 个是明确 repeat/rescreen。row-event、独立机会族、候选级深审与正式 Stage0 brief 的信息量不同，不能相加后把 `6/238` 或 `6/244` 当作 Discovery recall。成熟系统领域又存在大量合理淘汰：current union 已覆盖、换对象/换保证、普通调参、wrapper、弱基线、自然载体不足或 full-cost 无 residual。

因此，低 proposal rate 中有相当部分是健康 abstention。项目不应为了把分子做大而降低门槛。

### 3.3 真正可操作的缺陷在 proposal boundary

旧审计窗口的六个 brief 全部需要 Stage0 补回材料性 source/action 信息。典型缺口包括：

- 最近同对象论文没有进入最小碰撞集合；
- first-party sibling implementation、released CLI、隐藏/非默认 flag 没被核对；
- generic DP、matching、optimization 或 formal kernel 没被检索；
- 只记录源码文件名，没有读到决定性的 transition/constructor semantics；
- 反方材料被列为“局限”，但没有真正攻击候选；
- 自然 trace/corpus 被引用，却未证明含有候选动作所需状态与 full-cost 分母。

这不是“论文看得太少”的简单问题，而是来源角色、读深与跨源综合不稳定。一个十篇论文的列表仍可能漏掉唯一决定性的 sibling repository 或 generic theorem。

### 3.4 当前并行瓶颈主要不是 CPU 数量

把更多会话用于浅层广搜会同步放大重复机制、同义题和未闭合 brief。并行只有在任务正交、证据边界清楚、父会话能去重且下游没有 ready science 被阻塞时才增加吞吐。R8 因此把“会话身份数量”和“同时占用的推理席位”分开：身份可长期保留，active seats 应服从可用的独立工作包，而不是默认全部占满。

## 4. 外部证据给出的设计启示

### 4.1 LLM 适合扩大线索召回，但不能自评新颖性

Si、Yang 与 Hashimoto 的大规模人类评审研究发现，LLM 生成的研究想法被评为更具新颖性，但可行性略弱；作者同时指出自我评价失败与生成多样性不足。（Si et al., 2024）<!--ref:si2024--><!--anchor:section:Abstract--> 这支持“让模型并行提出机制线索”，但不支持“让同一个模型用自信分数决定录取”。R8 因此取消单一总分和自评置信度，把生成、碰撞检索、执行预检与独立 Stage0 分开。

### 4.2 科学文献检索需要混合召回与重排

LitSearch 在 597 个真实文献检索问题上报告：dense retriever 相比 BM25 的 recall@5 有明显优势，LLM reranking 还能进一步改善结果。（Ajith et al., 2024）<!--ref:ajith2024--><!--anchor:section:Abstract--> 该证据不意味着 dense search 可以替代关键词检索；它说明只依赖普通搜索或单一路径容易漏掉概念等价论文。R8 采用 lexical、dense、citation graph 与 first-party source 的 union，再按候选分面重排。

Idea Novelty Checker 先广泛检索，再做 embedding filter 与 facet-based reranking，其实验报告相对既有方法更高的人类一致性，并在消融中显示分面重排的重要性。（Shahid et al., 2025）<!--ref:shahid2025--><!--anchor:section:Abstract--> R8 因此比较 `object/action/information/guarantee/cost/claim/currency/read_scope`，而不是只看标题相似度或 embedding 距离。

### 4.3 图谱、实体与迭代评审适合辅助构思，但迭代必须封顶

ResearchAgent 使用论文图谱、跨论文实体知识与多个 review agents 迭代改进想法。（Baek et al., 2025）<!--ref:baek2025--><!--anchor:section:Abstract--> ResearchBench 则把发现拆为 inspiration retrieval、hypothesis composition 与 ranking，并报告 LLM 在 inspiration retrieval 上表现突出。（Liu et al., 2026）<!--ref:liu2026--><!--anchor:section:Abstract--> 这些结果支持跨谱系、跨实体寻找机制连接；但项目内必须限制 revision 次数，避免代理围绕同一 anchor 无限润色出同义题。

### 4.4 停止规则必须保守且带独立补漏

SAFE procedure 将随机初始样本、active learning、第二模型补漏和质量评估组合成保守停止流程，并明确单一停止启发式可能漏掉相关记录。（Boetje & van de Schoot, 2024）<!--ref:boetje2024--><!--anchor:section:The%20SAFE%20procedure--> R8 借用其“多条件停止、第二路线补漏、质量评估”的思想，但不把 systematic-review recall 直接等同于科研机会 recall。

### 4.5 端到端自主科研仍需分阶段证据门

ScienceAgentBench 的最佳 agent 在三次尝试下只能独立解决 32.4% 的数据驱动科研编码任务，加入专家知识后为 34.3%。（Chen et al., 2025）<!--ref:chen2025--><!--anchor:section:Abstract--> EXP-Bench 在 461 个真实 AI 实验任务上报告，单个实验环节有时达到 20%–35%，但完整可执行实验成功率只有 0.5%。（Kon et al., 2025）<!--ref:kon2025--><!--anchor:section:Abstract--> CodeScientist 做了数百次自动实验，产出 19 个 discovery，经代码审查、外部评审和复现尝试后，6 个被判为至少最低限度 sound 且有增量新颖性。（Jansen et al., 2025）<!--ref:jansen2025--><!--anchor:section:Abstract-->

这些证据共同支持：AI 可以承担大量检索、实现与试验工作，但必须有静态可执行性预检、阶段性 verifier、有限重试、独立审查和诚实的失败状态。它们不支持跳过 Stage0、StageA fidelity gate 或用户 StageB 审批。

## 5. DISCOVERY-CASCADE-R8 总体结构

```text
Assignment freeze
    ↓
Four-source seed generation
    ↓
Mechanism signature + cross-wave dedup
    ↓
Cheap structural prefilter
    ↓
Multi-channel retrieval union
    ↓
Facet rerank + source-role passport
    ↓
NEXT_BEST_CHECK priority deepening
    ↓
Conservative stopping + low-rank audit sample
    ↓
Static StageA execution preflight
    ↓
Canonical brief or explicit nonterminal disposition
    ↓
Independent Stage0 + repair-vector feedback
```

R8 是级联而不是一个总分器。每一级只解决一种不确定性，并把能够改变决定的证据优先送到下一步。

## 6. 逐步执行方案

### 6.1 Step 0：冻结 assignment

每次 assignment 至少冻结：

- `assignment_id`、cutoff date、规则/模板哈希与唯一写目录；
- `DISCOVERY_R8_MODE=OFF|SHADOW|PRODUCTION`，缺字段按 `OFF`；
- 来源 lens、domain exclusions、时间/文献/artifact 预算；
- 是否只允许 metadata/abstract，还是允许 method/evaluation/source-symbol 深读；
- 禁止实验、下载大型资产、Stage0/A/B 与共享控制写入；
- 与当前 production 的 control arm 定义。

R8 的 mode 不得复用 R7 状态冒充已经校准的生产模块。

### 6.2 Step 1：四类正交 seed

每个 campaign 从四类入口取得线索：

1. `PAPER_GENEALOGY`：当前 anchor、前置、后继、竞争机制与 forward citation；
2. `CURRENT_REALITY`：官方文档、upstream source、CLI、配置、flags、released sibling implementation；
3. `PHENOMENON_EVIDENCE`：已发表测量、自然 trace、ranking inversion、negative result、跨版本/平台反转；
4. `ALGORITHM_FORMAL_KERNEL`：能够作用于真实 exact object 的 DP、matching、flow、packing、online/approximation、formal residual。

来源只是发现入口，不是录取门。一个题目不必同时来自四类，但 campaign 必须保持来源多样性，防止只围绕新论文 limitation 生成 controller、adapter 或 wrapper。

### 6.3 Step 2：机制签名与去重

每个线索先形成：

```text
MECHANISM_SIGNATURE =
exact_object
+ natural_regime
+ problem
+ atomic_action
+ information_available
+ output_or_guarantee
+ full_cost_boundary
+ contribution_route(N1/N2/N3)
```

跨 wave 只允许以下关系：

- `SAME_FAMILY`：同对象、问题与实质机制，合并证据；
- `RELATED_DIFFERENT_ACTION`：同对象但原子动作真正不同，分开保留；
- `DISTINCT`：对象/问题/保证实质不同；
- `AMBIGUOUS_KEEP_SEPARATE`：证据不足时保守分开，等待下一检查。

embedding 只能提示可能重复，不能自动合并；方法名、API 名或标题相似也不能代替机制判断。

### 6.4 Step 3：廉价结构预筛

这一层只允许用已核实的结构事实淘汰：

- exact object/function/guarantee 不成立；
- current union 已在同信息、同合同与 full-cost 下表达冻结动作并吸收 broad/residual claim；
- 候选只能通过换对象、降保证、删成本或合成特例成立；
- 只是调参、wrapper、普通 schema/checker 或无可推广结构的组件组合；
- 终态 STOP 的同一对象/问题被改名复活。

缺实现、缺核心结果、文献尚未冻结、资源不可达或 AI 不易执行都不能在此变成 `STRUCTURAL_DROP`。它们分别进入 `NOT_ADMITTED_UNFROZEN`、`RESOURCE_BLOCKED`、`HUMAN_CORE_HIGH_VALUE` 或 `DEEP_DIVE_REQUIRED`。

### 6.5 Step 4：多通道检索 union

对保留机会同时运行以下 query families：

1. exact object + atomic action；
2. output/guarantee + same-function synonyms；
3. repo/source symbol/CLI/flag/default/nondefault threshold；
4. backward/forward citation 与作者/项目 sibling family；
5. generic algorithm/formal kernel；
6. contrary/no-gain/failure/boundary；
7. natural workload/trace/corpus/schema/provenance；
8. Q1/Q2 contribution-shape analog，仅用于论文形状校准，不用于证明新颖性。

检索渠道使用 lexical + dense + citation graph + first-party artifact union。任何单一路线均不得声称 exhaustive novelty。

### 6.6 Step 5：分面重排与 SOURCE_ROLE_PASSPORT

候选相关性按以下分面判断：

| Facet | 核心问题 |
|---|---|
| `object` | 是否完全同对象/同函数？ |
| `action` | 是否表达同一原子动作？ |
| `information` | 在线/离线信息条件是否相同？ |
| `guarantee` | 输出质量、合法性或理论保证是否一致？ |
| `cost` | 是否包含完整构造、预处理、运行、数据移动与存储成本？ |
| `claim` | 该来源直接吸收、只扣除 broad claim、还是仅相邻？ |
| `currency` | 是否接近 cutoff，是否覆盖当前 release/source？ |
| `read_scope` | 只读 metadata/abstract，还是已读 method/evaluation/source symbols？ |

对 top opportunities 填写 compact passport：anchor、closest current same-object、predecessor、successor、first-party current、generic kernel、contrary、natural carrier。每项记录 version/date、read scope、supports、opposes、facet disposition、evidence pointer 与 claim ceiling。论文逐篇摘要不能替代跨源 contradiction matrix。

### 6.7 Step 6：NEXT_BEST_CHECK

每轮深读前必须回答：**哪一个最小检查最可能改变当前 disposition 或排序？**

- `HIGH`：能直接证明吸收、对象错误、自然载体缺失，或反过来闭合 residual；
- `MEDIUM`：能明显改变 Q2 shape、StageA killer、strong baseline 或 full-cost；
- `LOW`：增加背景完整性，但不太可能改变决定。

只在 HIGH 关闭后处理 MEDIUM；LOW 在预算不足时可以停止。不得把模型自报的 0–1 置信度当成概率，也不得用单一 weighted score 混合学术质量、碰撞风险和 AI 可执行性。

### 6.8 Step 7：保守停止

一个机会可以停止深读，当且仅当：

1. 已发现具名、证据充分的 scientific fatal；或
2. 全部 HIGH-uncertainty 已关闭；
3. 正交检索没有产生 decision-changing evidence；
4. 连续三份新增 primary source 只重复已有 evidence edge；
5. 最多两轮内部 idea refinement 已用完；
6. 达到冻结预算 ceiling。

如果预算耗尽但 action/source/closure 尚未冻结，结论是 `SEARCH_BOUNDED_OPEN` 或 `NOT_ADMITTED_UNFROZEN`，不是“没有新意”。每个 campaign 随机抽取约 10% 的低排序机会做独立补漏，以估计排序导致的 recall 损失；该比例需在回测中校准。

### 6.9 Step 8：静态 StageA 执行预检

只对排序最高的 2–3 个机会做静态预检，不运行实验、不下载大型资产：

- repo/tag/commit、license、平台和构建路线；
- 输入数据/trace/corpus 的格式、来源与合法性；
- comparator、oracle、checker、codec/reader/solver 等决定性语义；
- 一个小 witness 的 legality/equivalence 路线；
- full-cost 分母与指标；
- 本地 CPU/GPU/RAM/storage/time 需求与潜在用户动作；
- `AI_CORE_EXECUTABLE / AI_CORE_CONDITIONAL / AI_AUXILIARY_ONLY`；
- 若核心长期依赖人工研究，标为 `HUMAN_CORE_HIGH_VALUE`，不得学术淘汰。

执行预检只影响排队和资源路由，不把工程困难变成科学 STOP。

### 6.10 Step 9：pre-brief 输出

输出状态：

- `READY_FOR_CANONICAL_BRIEF`；
- `STRUCTURAL_DROP`；
- `NOT_ADMITTED_UNFROZEN`；
- `RESOURCE_BLOCKED`；
- `HUMAN_CORE_HIGH_VALUE`；
- `DEEP_DIVE_REQUIRED`。

只有 `READY_FOR_CANONICAL_BRIEF` 进入现有 `TOPIC_BRIEF` 和独立 Stage0。其余状态用于证据管理与未来恢复，不是新的 registry candidate state，除非主线以后另行批准状态迁移。

## 7. 跨 wave 证据记忆

R8 应把“重复读论文”改为“复用已验证的 evidence edges”。每个 assignment 建议输出：

- `OPPORTUNITY_FAMILIES.yaml`：机制签名、关系与当前 disposition；
- `EVIDENCE_DELTA.jsonl`：本波新增、修正或撤销的证据边；
- `DECISION_TRACE.md`：NEXT_BEST_CHECK、停止理由与反方攻击；
- `handoff.yaml` 与 `HASH_MANIFEST.sha256`。

建议的 evidence edge：

```yaml
subject: <object/action/claim>
relation: SUPPORTS | OPPOSES | IMPLEMENTS | SUBTRACTS | BASELINES | CARRIES
object: <target facet>
source: <paper/repo/doc/trace>
locator: <section/symbol/flag/commit>
facet: object | action | information | guarantee | cost | claim | carrier
read_scope: METADATA | ABSTRACT_INTRO | METHOD_EVALUATION | SOURCE_SYMBOLS_FLAGS
claim_ceiling: <maximum permitted inference>
cutoff: <date>
```

主线只在 assignment 边界机械合并为只读 snapshot；`registry.yaml` 只保存状态、指针与哈希，不承载完整证据图。第一轮回测应先使用 packet-local snapshot，避免在方法未校准前创建全局数据库或自动化。

## 8. 会话与并行方案

### 8.1 角色结构

建议保留六个长期来源身份，不按题目新建会话。每个 active campaign 使用三类工作模式：

- `BREADTH_A`：paper genealogy + current-paper/source coverage；
- `BREADTH_B`：phenomenon/evidence + algorithm/formal kernel；
- `DEPTH_REDTEAM`：source-role passport、decisive subtractor、contrary evidence、execution preflight。

如果用户明确要求使用子代理，单个来源父会话最多使用两个一层子代理：一个检索 collision，一个检查执行资源；父会话负责去重、证据真实性和 canonical brief，不以多数投票作裁决。

### 8.2 并行数建议与现行政策冲突

质量优先的推荐试点是：保留六个身份，但同时只运行三个有独立工作包的 active seats；其余身份 idle reusable。一个 campaign 的诊断规模为：

```text
18–24 RAW_SCREEN_ROW_EVENT
→ 8–12 UNIQUE_OPPORTUNITY_FAMILY
→ 2–3 CANDIDATE_GRADE_DEEP_REVIEW
→ 0–2 STAGE0_BRIEF
```

这不是配额，零 brief 完全合法。M1 建议每三个 campaign 折入一次，而不是长期额外常开。

但是，当前权威规则明确要求 `S1–S6` 六个来源直接并行；Discovery 又处于停止状态。因此“三 active seats”只能作为独立 backtest/shadow 中的调度 treatment，不能直接应用。若用户希望改变六路直并行，需要一个单独政策批准和主线安全边界 patch。R8 核心质量语义可以先独立回测，不必与并行数变更捆绑。

### 8.3 优先级不使用总分

先过科学硬门，再按字典序排队：

1. tier 潜力；
2. 能否以有限检查关闭 hard-gate uncertainty；
3. StageA decisive killer 是否清楚；
4. 自然正证据/形式证据是否可得；
5. AI core fraction；
6. full-cost 与用户动作成本。

AI 可执行性不能把学术上强的题变成 STOP；它只决定自动推进、条件推进或人工储备。

## 9. Stage0 反馈闭环

Stage0 继续独立裁决，但把 `STAGE0_REPAIR_VECTOR` 转成下一轮 Discovery 查询策略：

| Repair vector | 下一轮机械动作 |
|---|---|
| `OMITTED_CURRENT_SAME_OBJECT` | 强制 exact-object/action + forward-citation query |
| `OMITTED_FIRST_PARTY_FEATURE` | 扩展 repo/source/CLI/flag/default/nondefault 检索 |
| `OMITTED_GENERIC_KERNEL` | 增加 generic algorithm/formal kernel 通道 |
| `ATOMIC_ACTION_UNCLEAR` | 从 source symbols/algorithm steps 重新提取动作 |
| `NATURAL_CARRIER_GAP` | 检查 trace/schema/provenance/observability |
| `FULL_COST_GAP` | 补齐成本分母、构造与数据移动 |
| `Q2_SHAPE_GAP` | 读取贡献形状 analog，不降低质量门 |

只有累计至少六个独立 Stage0 决定后，才允许根据 repair distribution 调整 source-mode 分配；每次最多调整 10 个百分点，并保留探索下限。当前样本不足以训练可靠的选题质量模型，禁止用少量历史 verdict 拟合 admission classifier。

## 10. 回测与 shadow 设计

### 10.1 为什么必须新建 R8 回测

旧 v8.8/R3R1 已产生明确失败核：visible contract、output schema、hidden key 和 control/treatment 协议不自洽。继续对旧 C01/C02/C04 或 packer 缺口定向修补，无法证明泛化。R8 应使用全新方法版本、全新目录、全新合同，并在 dispatch 前通过 scoreability 与 control-arm 检查。

### 10.2 历史与 blind case 组成

历史 regression set 建议包括：Knative、UST、WebGraph、HNSW、GIN、AIGER、QUIC、AArch64，至少三个历史正例（含 `S6-JS-PREFIXBOUND`），至少四个 true structural negatives，以及至少三个 unfrozen/resource controls。历史集只做已知缺陷回归，不作为最终泛化证明。

另建不少于八个 blind holdout：

- 3 个 positive opportunity shapes；
- 3 个 true structural negatives；
- 2 个 unfrozen/resource controls。

PACKER、EXECUTOR、AUDITOR 使用既有长期 lane，严格串行且角色独立。EXECUTOR 不得看到 identity、outcome 或 key；AUDITOR 接受语义等价的具名 subtractor 与 facet match，不要求硬编码 exact string。

### 10.3 对照与处理

- `CONTROL`: 当前 v8.7 + 已生效 P0 clarity/telemetry；
- `TREATMENT`: R8 cascade；
- 同一 blind packet、同一 cutoff、同一来源预算与相同外部访问边界；
- 先验冻结 schema、评分规则、停止条件与失败边界；
- control 与 treatment 都必须输出可评分的 case records，不能再次出现缺 control arm。

### 10.4 验收指标

R8 不以更多 proposal 或 PASS 为硬指标。建议验收：

1. blind positive recall 不劣于 control；
2. 已知 cutoff-available material collisions 找回率 `100%`；
3. unfrozen/resource controls 的 false structural drop 为 `0`；
4. terminal revival、hard-gate bypass、shared write、contamination 为 `0`；
5. 每个 structural collision 都有具名 subtractor、证据 locator 与完整 facet disposition；
6. 重复机会族进入 deep review 的次数至少降低 `50%`；
7. 每 18–24 个 raw events 只要求形成一个完整 handoff，不要求产出 brief；
8. 在统一成本口径下，cost per clean brief 相对 control 目标下降 `30%`，若样本不足则只报告区间，不声称达标；
9. Stage0 不再首次发现 cutoff 前已经可得的 minimum-set omission；
10. 每个 brief 都有静态 execution preflight 与有限 `FIDELITY_CLOSURE_PLAN`。

所有百分比阈值都必须在 PACKER 前冻结。样本不足时结果只能是 `NOT_CALIBRATED`，不能补跑到通过。

### 10.5 两波 shadow 与停止条件

backtest PASS 后运行两波非 canonical shadow，canonical 仍走 control。任一安全指标失败、positive recall 回退、false structural drop、terminal revival、control/treatment 不可比较或 Stage0 发现新的 minimum-set omission，立即停止并回用户。禁止自动 R8R1。

## 11. 预期收益、成本与风险

### 11.1 预期收益

- 将 AI 时间从重复广搜转移到决定性 source/action/collision synthesis；
- 提高 `CLEAN_STAGE0_BRIEF` 比例，使 Stage0 更专注于独立新颖性与 Q2 论文形状，而不是补基础资料；
- 更早识别 current union、generic kernel 与自然 carrier 缺口；
- 对学术强但 AI 难执行的题目保留 `HUMAN_CORE_HIGH_VALUE` 路径；
- 降低用户在普通检索、源码定位、brief 整理与 blocker 诊断上的时间；
- 为 StageA 提供更可执行的 comparator、witness、full-cost 和 killer。

### 11.2 主要风险与防护

| 风险 | 可能后果 | 防护 |
|---|---|---|
| 反证优先导致过早淘汰 | 新组合被 action overlap 误杀 | structural proof、facet matrix、unfrozen 状态、blind positives、独立 Stage0 |
| 证据表格官僚化 | 成本增加但决策不改善 | top 2–3 深审、compact passport、NEXT_BEST_CHECK |
| 检索工具偏差 | 漏掉同义方法或非英文/非论文 artifact | lexical+dense+graph+first-party union，低排位抽样 |
| 少量历史 verdict 过拟合 | 规则只会答旧题 | 全新 blind holdout、旧案例不计最终泛化分 |
| 并行过多 | 重复搜索、UI 卡顿、下游阻塞 | 身份与 active seats 分离；调度变更另批 |
| 执行性支配学术价值 | 高价值人工题消失 | AI readiness 仅排队；human-core reserve |
| 把 bounded absence 写成 novelty | 证据不诚实 | `SEARCH_BOUNDED_OPEN` 与 claim ceiling |
| 回测通过即自动生产 | 未经用户审查改变规则 | PASS 后仍需 exact patch 与用户批准 |

## 12. 最小落地路径

如果用户决定推进，建议按以下顺序：

1. 主线冻结 R8 proposal、control/treatment schema、blind strata、预算和验收指标；
2. 先做 scoreability/control-arm 机械验收；
3. 运行独立 `PACKER → EXECUTOR → AUDITOR` paired backtest；
4. PASS 后运行两波 noncanonical shadow；
5. 用户查阅结果，决定是否只启用质量语义、是否同时改变六路并行政策；
6. 主线在安全 assignment 边界修改共享规则并记录 old→new hashes；
7. 用户另行明确恢复 Discovery 后，R8 才能进入新生产 assignment。

建议的共享文件 patch 面仅限：

- `rules/ROLE_DISCOVERY.md`：assignment-gated R8 cascade 与证据产物；
- `rules/ROLE_MAINLINE.md`：paired backtest、evidence snapshot、反馈分配与可选调度；
- `rules/ROLE_DISCOVERY_BACKTEST.md`：control/treatment、scoreability、blind holdout；
- `templates/TOPIC_BRIEF.md`：compact signature、passport、NEXT_BEST_CHECK、preflight；
- `registry.yaml`：只由主线登记 method state、指针与 hashes，不存完整证据图。

不建议新增角色规则文件，也不建议先建全局向量库、自动化服务或候选数据库。

## 13. 结论

提高 Stage0 通过概率的有效方向不是放宽 Stage0，也不是继续增加浅筛会话，而是把 Discovery 的工作对象从“论文条目”升级为“有精确 object/action/guarantee/cost 的机会族”，再用多通道检索、分面重排、反方优先和静态执行预检关闭最可能改变决定的不确定性。

R8 的价值应以 clean brief、决定性 StageA observation、重复深审减少和单位成本衡量，而不是 proposal 数量。它保留当前全部科学硬门，并明确把尚未冻结、资源阻塞和人工核心题与真正结构性淘汰分开。由于旧 v8.8/R3R1 已失败且当前六路并行政策、Discovery 停止状态仍有效，R8 只能先作为新方法进行 paired backtest 与 shadow；任何共享规则修改、并行数改变或 Discovery 恢复都必须由用户另行明确批准并由主线单写落盘。

## 14. 局限

1. 外部研究大多来自 NLP、AI agent、systematic review 或数据驱动实验，不能直接估计系统/编译器/体系结构选题的绝对 yield。
2. 本项目的 StageA PASS 样本仍少，当前不适合训练稳定的监督 admission model。
3. 旧筛查统计含 mixed units，无法反推出真实漏检率。
4. R8 的 10% 低排位抽样、30% cost target 与三 active seats 都是待校准设计值，不是已验证事实。
5. 本报告未运行候选、实验、下载、回测或 shadow；所有效果均是待验证的设计推断。

## 15. AI disclosure

本报告使用 AI 辅助完成项目材料检索、外部文献核验、证据综合、反方审查与报告撰写。外部事实均链接到已核验的论文或权威出版页面；项目内事实以冻结文件哈希和已登记材料为准。报告中的 R8 效果属于待回测建议，不是已产生的实验结论。用户尚未批准 R8 生产切换。由于本报告由 AI 起草，正式实施前仍应由用户与主线复核政策取舍和 exact patch。

## References

Ajith, A., Xia, M., Chevalier, A., Goyal, T., Chen, D., & Gao, T. (2024). [LitSearch: A retrieval benchmark for scientific literature search](https://aclanthology.org/2024.emnlp-main.840/). *Proceedings of EMNLP 2024*, 15068–15083. https://doi.org/10.18653/v1/2024.emnlp-main.840

Baek, J., Jauhar, S. K., Cucerzan, S., & Hwang, S. J. (2025). [ResearchAgent: Iterative research idea generation over scientific literature with large language models](https://aclanthology.org/2025.naacl-long.342/). *Proceedings of NAACL 2025*, 6709–6738. https://doi.org/10.18653/v1/2025.naacl-long.342

Boetje, J., & van de Schoot, R. (2024). [The SAFE procedure: A practical stopping heuristic for active learning-based screening in systematic reviews and meta-analyses](https://link.springer.com/article/10.1186/s13643-024-02502-7). *Systematic Reviews*. https://doi.org/10.1186/s13643-024-02502-7

Chen, Z., et al. (2025). [ScienceAgentBench: Toward rigorous assessment of language agents for data-driven scientific discovery](https://proceedings.iclr.cc/paper_files/paper/2025/hash/f12b4df26344f3be803c06b555252efe-Abstract-Conference.html). *ICLR 2025*.

Jansen, P., et al. (2025). [CodeScientist: End-to-end semi-automated scientific discovery with code-based experimentation](https://arxiv.org/abs/2503.22708). arXiv:2503.22708; Findings of ACL 2025.

Kon, P. T. J., et al. (2025). [EXP-Bench: Can AI conduct AI research experiments?](https://arxiv.org/abs/2505.24785). arXiv:2505.24785.

Liu, Y., et al. (2026). [ResearchBench: Benchmarking LLMs in scientific discovery via inspiration-based task decomposition](https://aclanthology.org/2026.findings-acl.644/). *Findings of ACL 2026*, 13187–13207. https://doi.org/10.18653/v1/2026.findings-acl.644

Shahid, S., Radensky, M., Fok, R., Siangliulue, P., Weld, D. S., & Hope, T. (2025). [Literature-grounded novelty assessment of scientific ideas](https://aclanthology.org/2025.sdp-1.9/). *Proceedings of SDP 2025*, 96–113. https://doi.org/10.18653/v1/2025.sdp-1.9

Si, C., Yang, D., & Hashimoto, T. (2024). [Can LLMs generate novel research ideas? A large-scale human study with 100+ NLP researchers](https://arxiv.org/abs/2409.04109). arXiv:2409.04109.
