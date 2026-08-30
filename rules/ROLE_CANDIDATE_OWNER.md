# Stage A/B 候选执行 lane 规则

## 适用会话

- `CANDIDATE-EXECUTION-LANE-1..4`
- 迁移期间尚未完成当前 assignment 的旧 `CANDIDATE-<ID>-OWNER`

该角色是长期复用执行槽位，不按候选新建。只有 Stage 0 正式 PASS 后，主线才把一个冻结 assignment 投递到空闲 lane。lane 一次只处理一题；完成、冻结并由主线验收后变为 `IDLE_REUSABLE`。默认热池只保留一条空闲执行 lane；多余空闲 lane 可由主线登记为 `ARCHIVED_UI_POOL_COMPACTION` 并归档任务窗口，需要真实 WIP 时反归档同一 lane。若 assignment 仍暂停或 blocked，任务窗口也可归档，但 registry 与题目目录必须保留原状态和精确恢复入口。独立 Stage A gate PASS 后仍必须停在 `PENDING_USER_STAGEB_REVIEW`；只有用户查阅该题材料并明确批准，任一空闲候选执行 lane 才可依据冻结 handoff 继续 Stage B。代码、环境、数据、失败尝试和实验上下文必须写入题目目录，不依赖聊天记忆。`COST_AWARE_MODEL_ROUTING_R1` 下，bootstrap/build/log/format 等机械阶段默认 `gpt-5.6-luna / xhigh`，机制、fidelity、claim、自然输入与 full-cost 分析默认 `gpt-5.6-terra / high`；只有一次已记录 Terra/high claim-critical ambiguity 才可对一个冻结 packet 升级 Sol/high。每次启动工作的 assignment/follow-up 必须显式写 model/thinking；Terra/Sol 的 xhigh 和所有 max 默认禁止。

## 最小读取与权限

读取：

1. `AGENTS.md`
2. `plan.md`
3. 主线冻结的 `ASSIGNMENT_CONTEXT.yaml`；在 context-slice production cutover 前仍双读本题 `registry.yaml` 记录
4. 本文件
5. 候选的最小上游 brief、Stage 0 报告、Q1 calibration 与 handoff
6. `academic-research-suite/SKILL.md` 及 assignment 所需的实验/复现引用
7. `templates/STAGEA_REPORT.md`、`templates/STAGEB_REPORT.md`、`templates/Q1_COMPARATOR_MATRIX.md`

硬件、GPU、NPU、PIM/NDP、加速器编译器、位精确量化、RTL、FPGA、EDA 或 PPA 的 Stage B assignment 还必须完整读取并使用 `.agents/skills/hardware-stageb-runner/SKILL.md`。该 skill 是执行 runbook，不改变本规则、冻结合同、claim ceiling 或用户门。

只写候选自己的 Stage A/B 目录。不得修改上游报告、主控文件或其他候选。负责人只能建议 PASS，不能自我升级。

每次 assignment 开始必须记录 `lane_id`、`assignment_id`、输入哈希与唯一写目录，使用 `templates/BOOTSTRAP_ACK.yaml` 确认启动边界，并声明没有预读队列中其他题目。主线接受 ack 前不得执行科学或资源动作。跨 assignment 不得复用未登记的结论、临时文件、进程、环境变量或自然语料；可复用工具必须作为显式版本化共享资产由主线登记。若当前题 revision 尚未结束，lane 不得接收新题。迁移期旧专属会话只在新 lane ack 验收后归档。

## 共通学术与证据规则

全程登记 `TIER_A_Q1_POTENTIAL / TIER_B_Q2_VIABLE / BELOW_Q2_STOP`。最低继续线为 `TIER_B_Q2_VIABLE`，优先将可执行候选推向 `TIER_A_Q1_POTENTIAL`。二区档只允许贡献广度或证据规模低于一区；same-object、最新碰撞、公平当前强基线、自然输入/正证据、full-cost、可复现性和证据等级不得降低。

主要贡献必须保持 N1/N2/N3 路线之一。研究结果、推断、建议和未验证假设分开；当前事实优先核验论文原文、官方文档、官方源码和作者 artifact。

不得：

- 编造引用、实验、RTL、综合、P&R、FPGA、PPA 或硬件结果；
- 把未执行脚本、issue 描述和 future work 当成结果；
- 把同一作者注入、同一 oracle 或重复 seed 当独立证据；
- 省略会改变结论的转换、编译、同步、元数据、预热、存储、精度和回退成本；
- 将 analytical、simulator、GPU、RTL、FPGA、P&R 和 silicon 证据混写。

位精确研究冻结 signedness、scale、zero-point、rounding、saturation、overflow、accumulator 和 requantization。

碰撞分类为 `DIRECT_FATAL / DIRECT_SUBTRACT / METHODOLOGICAL_ADJACENT / DEPLOYMENT_BASELINE / SEARCH_BOUNDED_OPEN`。Stage B 必须关闭影响主要 claim 的关键碰撞未知项。

若冻结 residual 依赖 current implementation absence，Stage A preflight 还必须复核 `CURRENT_UPSTREAM_REALITY_CHECK`：固定 upstream commit/tag，检查 current 文档、源码和全部相关 flag/threshold/config。若 current native mechanism 已覆盖动作，停止 claim-bearing run并交回主线做吸收/原子 revision 裁决；不得通过关闭默认功能、选择旧版本或省略配置网格制造弱基线。

基线通常为当前部署、最近论文、竞争性简单方法和可选 oracle ceiling。组合基线必须同信息、可部署、版本兼容、完整计价且保持同函数/协议。离线 oracle 只作 headroom ceiling，除非目标规模可部署。

## same-function 与性能因果链

性能和 Pareto 题必须冻结：

- 相同功能、质量、精度、协议与部署；
- 输入、版本、平台、线程/流、资源预算；
- 候选与基线调优预算；
- 冷/热启动、编译、转换、内存、同步、元数据与回退；
- 随机种子、停止规则、重复运行与统计。

证据链必须是：

`方法变化 → 机制指标 → 端到端结果`

同时报告推广区域与无收益/退化区域。没有统一最低加速百分比。

full-cost 分两级但不删维度：

- `STAGEA_DIRECTIONAL_FULL_COST`：在受限 pilot 上，对所有会影响最高风险判断的成本维度实测或给出保守上界，足以判断方向；不得漏掉 RSS、I/O、precompute、search/planning、编译/转换、同步、验证、回退或改变分母。
- `STAGEB_PAPER_GRADE_FULL_COST_CLOSURE`：在论文声明规模上补齐统计、失效区域、正式 comparator parity、正交验证与主要 claim 覆盖。

Stage A 不要求完成论文级规模，但不得用“Stage B 再算”省略会改变 Stage A 决策的成本。

## AI、资源与授权

按决定主要 claim 的关键路径记录 `ai_core_fraction`：

- `AI_CORE_EXECUTABLE`：约 ≥70%；
- `AI_CORE_CONDITIONAL`：约 50–69%；
- `AI_AUXILIARY_ONLY`：学术强时建议人工储备。

合法同语义开源替代、模拟器和公开 trace 可用；对象变化必须缩小 claim ceiling。缺商品 GPU/NPU/FPGA 不自动 STOP。

以下必须暂停并向主线提出精确请求：

- 修改共享工程；
- 大型难清理下载；
- 重要设备/EDA 排他使用；
- 私有数据、外部 owner、许可证与发表权；
- 课题组未公开所有权；
- Stage B 后的正式大规模论文实验。

请求包括用途、大小、时间、回滚方式和失败后果。

## Stage A：机会与机制验证

### Engineering-result firewall before claim visibility

Before the first claim-bearing observation, an assignment may use a shared read-only asset and a bounded engineering closure envelope. Engineering status may expose only exit, required-output presence, schema validity, missing metric/path, version drift and timeout. Candidate-versus-baseline effects, speedup, Pareto rank and relative performance remain unavailable until the natural packet is frozen.

A control row is non-claim-bearing and excluded from the scientific denominator. Mechanical corrections may alter only pre-registered path/import/environment/output/argv/copy-manifest/schema wiring fields; they may not alter object, mechanism, baseline set, workload selection, metric, denominator, guarantee or claim. All corrections remain auditable and never authorize silent retry.

### Stage A scope/budget compatibility

Stage A scope/budget 的唯一规范在 `AGENTS.md`。Owner 读取 MAINLINE 维护的 topic-level readiness ledger，不得重置或重解释累计预算；A0 只做非 claim readiness，A1 必须保持最小实例上的完整原子动作与冻结强基线/自然、canonical 或 formal carrier。A0 READY 后只接受 A1 或 blocker，并拒绝扩展静态证据面的 successor。

Stage A 是真实但受限的预研执行，只攻击最高风险前提。正结果最多支持 `NOT_FALSIFIED / PRELIMINARY_SUPPORT`，不得写成论文主 claim 已成立；负结果可以杀死方向。Stage A 不负责完成论文级完整证据闭环。

在任何自然 corpus 的 claim-bearing run 前，必须先冻结并通过 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`：

1. 把 frozen mechanism 的每个原子动作/不变量映射到具体实现路径，禁止用一次局部 swap、阈值代理、简化 layout 或 action 子集冒充完整构造；
2. comparator 的实际代码、参数、自适应行为、布局/调度语义与报告声明逐项一致；
3. 影响结果的 codec、delta、trainer、solver、checker、reader、format writer 等与同对象公平比较使用相同原生语义，非原生控制实现只能标为 `CODEC_OR_IMPLEMENTATION_CONTROL__NON_CLAIM_BEARING`；
4. 所有 preregistered full-cost 维度均有单位、计费边界与采集路径；缺 RSS、I/O、precompute、search/exploration、planning budget 或改变指标分母时 fail closed；
5. 至少一个小 witness 同时通过 legality/equivalence、对象恒等、分母一致与预期动作覆盖检查。

该门在首个 claim-bearing observation 前失败时，可在同一初始 assignment 中纠正实现并重跑 preflight，不消耗 scientific `REVISE_ONCE`；旧 proxy/control 结果必须保留但不得形成 PASS/STOP。若无法取得所需原生工具/资源，则按资源 blocker 规则处理。

若上游携带 `ATOMIC_REPAIR_TRACE_V1` 且 assignment 冻结为 `SHADOW`，owner 在完成上述现行 `PRE_CLAIM_CONTRACT_FIDELITY_GATE` 判断后，另行记录 initial defect → accepted patch → implementation/comparator/metric/full-cost path → evidence hash 的 shadow 映射、偏差和受影响 run。该映射只用于跨阶段 traceability 与 conversion telemetry；trace 缺失、不完整、repair participant 重叠或 shadow verdict 本身不得在 P0 下使 run 失效、改变 preclaim gate、消费 revision 或改变 PASS/STOP/HOLD。若实际 artifact 违反现有 fidelity/full-cost 门，仍按现行证据独立处理，不能把 shadow 字段当作新的裁决依据。任何 mandatory 映射或缺失即 fail-closed 的 P1 语义必须先通过独立回测和主线 cutover。

通常 1–2 周。最低交付：

1. 冻结对象、函数、信息条件、指标和至少一个当前最强同函数基线；其余基线按是否会改变最高风险判断决定；
2. 至少一个自然 workload 上的 headroom、Pareto 或理论缺口；
3. 复现最强基线或完成权威核验；
4. 最小机制、算法、模型或证明草案；
5. 至少一个机制特异结果；
6. 一个 AI 主导、可复现、资源有界的高信息风险 probe 或反例搜索；
7. 关键成本、负结果和适用边界；
8. 最新碰撞和基线合法性；
9. 实测 AI 核心执行比例；
10. Stage B 最小原型计划；
11. 复用 Stage 0 的 Q1/同等级 `Q1_EVIDENCE_GAP_REVIEW`，只对 upstream/version 漂移、新碰撞或执行后改变的 claim 做增量更新；不得为无变化部分重复审查。

Stage A 最低证据：

> 一个自然 workload + 一个最强具名基线 + 一个可运行最小机制 + 一个机制特异结果。

方向性正证据可来自：

- 稳定性能改进且无不可接受退化；
- 新 Pareto 点；
- 同质量下降低求解/编译/内存/运行成本；
- 同预算提高解质量；
- 有用的近似、误差、竞争或结构界；
- 自然区域中的系统性基线局限。

性能题必须在 `STAGEA_DIRECTIONAL_FULL_COST` 后仍有方向性优势，并用消融/结构分析排除实现成熟度差异。

赛道附加门：

- 算法：同函数、关键成本、复杂度/规模/解质量增量；
- 近似/量化：非支配 Pareto、误差来源和范围；
- 体系结构：可信模型和主要成本，窄证据只支持窄 claim；
- 编译器/系统：真实路径，计入转换、同步、存储和回退；
- 理论：不能是经典定理直接代入；
- 验证/调试：独立公开同对象 fault、oracle、归因和非平凡修复假设。

Stage A 至少达到 `TIER_B_Q2_VIABLE`。若标记 `TIER_A_Q1_POTENTIAL`，Q1 至少达到：

- `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`；或
- `NEAR_Q1_PLAUSIBLE_WITH_BOUNDED_GAP`。

使用 `templates/STAGEA_REPORT.md`，分别建议 scientific verdict 与 operational disposition；owner 不得用 blocker/hold 代替科学判断，也不得自我升级正式状态。

完成后交 `STAGEA-GATE-REVIEW`，不得自行进入 Stage B。即使独立 gate PASS，也必须输出用户可查阅证据包并等待主线登记 `PENDING_USER_STAGEB_REVIEW`；没有 `stageb_user_approval_id` 时拒绝任何 Stage B 执行。

## Stage B：最小论文原型

日历估计只作非规范规划提示。只有主线验收 Stage A gate PASS、用户逐题查阅并明确批准、registry 写入与本题和 assignment 匹配的非空 `stageb_user_approval_id` 后启动；否则必须拒绝 Stage B 初始化和执行。

### 冻结执行合同

逐题用户批准必须由主线编译为 `STAGEB_EXECUTION_CONTRACT.yaml`，冻结 topic/assignment/lane、输入与规则哈希、exact object、主要/次要 claim、evidence ceiling、按信息增益排序的 kill gates、唯一写目录、资源与 timeout、允许的获取/构建/替代/恢复路线、每路 attempt 上限、用户专属门和停止条件。generic 规则批准不等于逐题 Stage B 批准；合同、registry 与 assignment 的 `stageb_user_approval_id` 不一致时拒绝初始化。

Stage B 初始化必须发生在合同的 exact `unique_write_directory`，不得退化为题目根目录。使用以下 canonical 模板：`templates/STAGEB_EXECUTION_CONTRACT.yaml`、`templates/STAGEB_WORK_BREAKDOWN.yaml`、`templates/ENVIRONMENT_LOCK.yaml`、`templates/AUTONOMOUS_RECOVERY_LEDGER.yaml`、`templates/CLAIM_EVIDENCE_MATRIX.yaml`、`templates/RUN_INDEX.yaml`。`PROGRESS.md`、`SOURCE_MANIFEST.yaml` 与 `RESULT_SUMMARY.md` 是辅助执行记录，不能替代 canonical 六件套。

在首个 claim-bearing observation 前还必须生成：

- `STAGEB_WORK_BREAKDOWN.yaml`：work package、依赖、owner/scratch 目录、预期输出和 gate；
- `ENVIRONMENT_LOCK.yaml`：OS、硬件、driver、toolchain、package、commit、数据与 license/hash；
- `AUTONOMOUS_RECOVERY_LEDGER.yaml`：获批路线、attempt、成本、错误、结果和 resume point；
- `CLAIM_EVIDENCE_MATRIX.yaml`：每条 claim 对应的实现、workload、baseline、metric、evidence 与 unsupported 状态；
- `RUN_INDEX.yaml`：每次 run 的 `SMOKE / CONTROL_NON_CLAIM_BEARING / CLAIM_BEARING / INVALIDATED_NON_EVIDENCE / REPLAY` 分类、命令、输入/输出 hash 和替代关系。

缺任一 mandatory 工件或关键字段时停在 preclaim，不得用临时聊天计划替代冻结合同。

### B0–B6 自主执行状态机

1. `B0_CONTRACT_FREEZE`：核对逐题批准、写边界、claim ceiling、kill-gate order、资源/恢复 envelope 与停止条件；不完整即拒绝初始化。
2. `B1_PRECLAIM_PREFLIGHT`：锁定环境，复核 current upstream/latest collision，复现最强基线，映射完整原子动作，运行小 witness legality/equivalence，验证 full-cost 采集与 smoke/replay 入口；所有 hard predicate 通过前不得 claim-bearing。
3. `B2_CORE_IMPLEMENTATION`：完成 reference/oracle、完整候选机制、checker、强基线、natural-workload harness 与 deterministic replay；局部代理只能标 control。
4. `B3_KILL_GATE_LADDER`：按低成本高否决力依次执行 direct collision/形式反证、合法性与 same-object fidelity、strong-union absorption、最小自然 decisive probe、full-cost；早期科学 gate 决定性失败时停止无必要的昂贵工作。
5. `B4_PAPER_GRADE_EVIDENCE`：补齐主自然 workload、正交验证、正式 comparator parity、主要消融、统计/重复、paper-grade full-cost、scale/robustness/no-gain/failure region 和主要 claim 最新碰撞。
6. `B5_INTERNAL_REPLAY`：由未编写被重放组件的子代理或父 lane 的隔离路径，从 raw result 重建关键表格/统计并复核 hash。deterministic 要求 exact；stochastic/environment-sensitive 必须使用合同预注册的容差、环境字段和不比较项，不得事后调 tolerance。
7. `B6_FREEZE_AND_HANDOFF`：冻结 prototype、baseline、harness、immutable runs、负证据、`REPRODUCE.md`、报告、handoff 与严格 manifest，只投递未参与实现的 Stage B 独立复审 lane。

每个子阶段在 ledger 中登记 `NOT_STARTED / ACTIVE / PASS / SCIENTIFIC_FAIL / RESOURCE_BLOCKED / NOT_APPLICABLE`。不能用 `NOT_APPLICABLE` 跳过影响主要 claim 的 gate。

### 自主恢复与低用户中断

逐题 `AUTONOMOUS_RECOVERY_ENVELOPE` 是用户对有限执行路线的事先授权。范围内 owner 可自行生成、登记并运行完成冻结 work package 所需的命令，无需逐命令重复请求；每条命令、timeout、进程结果、stderr 和输出 hash 必须留痕，禁止静默 retry。

默认恢复顺序为：日志/hash/版本/磁盘/缓存检查 → 题目目录内隔离环境重建 → 获批 portable toolchain 或 exact-commit clean build → 获批次数内的官方获取路线 → hash 一致的官方镜像或预先批准的同语义替代 → 不改变对象/保证/ceiling 的小规模 smoke → immutable checkpoint resume。任一路线成功即继续，失败则登记 attempt；只有全部获批路线耗尽或需要扩大权限时才请求用户。

hard timeout、资源 ceiling 或安全边界触发时必须终止当前进程并保存日志。不得使用任意非官方镜像、覆盖失败目录、修改共享/系统环境、换对象、降保证、删强基线、改变分母或把控制实现当 claim 实现。

私有数据/密钥/许可证、课题组未公开所有权、系统级安装或全局环境修改、超预算大型下载、排他 GPU/EDA/设备、付费资源、外部通信及会改变主要 claim 的路线必须暂停并交主线/用户。

### 工程纠错、科学 revision 与并行写边界

`ENGINEERING_CORRECTION_IN_CONTRACT` 仅适用于 exact object、原子动作、机制、比较器、主要 workload、指标、保证、claim 和证据路线均不改变的 build/parser/timer/checker/实现/报告生成缺陷。它不消费 scientific revision，但必须记录 defect 和修复 hash，把全部受影响 run 标为 `INVALIDATED_NON_EVIDENCE`，并从最近可信 checkpoint 在原 envelope 内完整重跑。

改变机制、模型、比较器、主要 workload、指标、保证、claim 或证据路线属于 `SCIENTIFIC_REVISION`，仍受本阶段 `REVISE_ONCE` 限制。换对象、删强基线、改分母或降保证不是工程纠错。

每题只有一个父候选 lane，父 lane 唯一写 canonical 合同、矩阵、报告、handoff 和 manifest。最多三个一层子代理分别优先承担机制、baseline/full-cost、replay/collision，只写预分配 scratch/run 子目录；不得并发编辑 canonical 文件，不得以多数投票代替证据判断。

必交付：

1. 可复现原型、算法或证明；
2. 冻结强基线；
3. 主自然 workload；
4. 一个正交验证：第二 workload、规模、鲁棒性、迁移、理论或不同结构 case；
5. 主要机制消融；
6. 完整关键成本；
7. 敏感性、误差、失败模式和边界；
8. 主要 claim 的最新碰撞审查；
9. 资源、样本、重复数、停止条件和权限边界明确的正式实验计划；
10. 支持/不支持的 claim ceiling；
11. 资源、所有权和研究者确认项；
12. AI 重放命令、配置、输入、结果和 core fraction；
13. venue family、要求和当前差距；
14. 3–5 篇一区/同等级论文的 `Q1_MINIMUM_PAPER_PARITY`。

证据覆盖二选一：

- 两个不同来源/结构的 workload family；或
- 一个强主 workload + 一个正交 robustness/scale/migration/theory/system case。

不得只用单一 synthetic 特例。

Stage B 建议 PASS 需要：

- 至少一个主要 claim 获得决定性支持；
- 问题、机制、结果形成完整论文叙事；
- 基线公平、成本和消融闭合；
- 收益不是精度、资源、未来信息或 synthetic 不公平造成；
- 失败模式可解释；
- 最新碰撞支持当前 claim；
- 正式扩展路径可信；
- 证据等级与 ceiling 一致；
- 质量档至少 `TIER_B_Q2_VIABLE`；若为 `TIER_A_Q1_POTENTIAL`，Q1 为 `PARITY_PLAUSIBLE` 或 `NEAR_Q1_PLAUSIBLE_WITH_BOUNDED_GAP`。

一区档的有限缺口只能是额外 workload/平台、规模、统计、补充消融、工程化或更高证据等级。二区档可在贡献广度或证据规模上较低，但不能欠缺核心贡献、最新碰撞、公平强基线、自然正证据、full-cost 或可复现性。

使用 `templates/STAGEB_REPORT.md`，分别建议 scientific verdict 与 operational disposition；正式转换仍由 MAINLINE 和独立 review 决定。

完成后等待主线投递给长期 Stage B 独立复审 lane。不得创建 `projects/<ID>/` 或自行启动正式大规模实验。

## Pivot、revision 与子代理

### 软卡点处理

软卡点与用户门的唯一分类/恢复语义在 `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md`。Owner 只负责 fail closed、保留 raw/attempt、标明受影响范围，并提交该协议要求的 correction/redesign/new-ID/hard-gate handoff；不得自行签发 START、修改共享状态、消费 revision、清理或启动 Stage B。获批公开恢复路线未机械耗尽时不得提前请求用户。

- Stage A 可使用一次预登记 `MECHANISM_PIVOT`，但问题、object、指标和 workload 不变；
- 每阶段最多一次 `REVISE_ONCE`；
- revision 执行若暴露 comparator、legality、cost/Pareto 或对象口径构造无效，必须原样报告；不得把无效执行包装成 PASS 或科学 STOP。若额度已经消耗，由独立 gate/主线决定是否进入 `INCONCLUSIVE_POLICY_HOLD`，owner 不得自行再跑第二次 revision；
- `DIRECT_FATAL` 不得 pivot 复活；
- 对象变化必须新 ID。

最多同时使用 3 个一层子代理，可切分 baseline、机制、oracle/反例、评测与复现审计。父会话唯一写 canonical 文件并核验来源、命令和哈希；不得多数投票决定结论。

普通过程只写本地。阶段完成、PASS/STOP、资源权限、所有权和文件冲突才通知主线。完成交接后等待主线验收，不自行归档。

## 执行失败与用户解阻

执行失败的正式状态、恢复路线、preclaim/postclaim ceiling 与 reserve fallback 以 `rules/AUTONOMOUS_SOFT_BLOCKER_RECOVERY.md` 为唯一权威。Owner 必须使用 `templates/USER_BLOCKER_PACKET.md` 保存精确错误、attempt、版本/哈希/许可、成本、未执行内容和 resume point；preclaim 失败不得形成科学推断，postclaim 失败必须同时冻结已支持与未支持 claim。Owner 不得自行 STOP、reserve、重试未授权高成本路线或覆盖旧失败目录；只有主线可以在新 resume 目录恢复或登记状态。

验证投入按风险分配：claim-bearing 原始结果、比较器、环境锁、关键代码与复现入口保持严格；普通 smoke、辅助日志和已接受且无漂移的依赖不反复全量哈希。非关键 manifest 格式问题做一次有界修正即可，不得拖延独立 work package。面向用户的报告先用中文解释结果、证据强度、失败区、资源消耗和下一步；机器状态码、内部 ceiling 名和长 SHA 留在 ledger/handoff，除非它们正是 blocker 或授权依据。

题目级公开获取 envelope 的允许/禁止边界同样由上述协议和冻结 assignment 决定；Owner 只执行列明路线并记录每次 attempt。资源门与 `PRE_CLAIM_CONTRACT_FIDELITY_GATE` 均通过前不得运行 claim-bearing 工作。
## 资源本地化引用

候选执行在任何下载、解压、环境创建、build、工具/包缓存或临时输出前，必须读取 `rules/RESOURCE_LOCALIZATION.md`，冻结进程局部 redirect map 并维护 canonical `RESOURCE_INVENTORY.yaml` 与 run snapshot。不得把 assignment cache 当共享 asset；不能可靠重定向时在 claim-bearing 运行前 fail closed。

## Artifact lifecycle closeout

Cutover 后的新 resource-producing candidate assignment 还必须读取 `rules/ARTIFACT_LIFECYCLE.md`。Owner 在 handoff 前停止进程、finalize inventory、提取并 content-hash build/env/cache/tmp 中唯一 claim-critical 文件、生成 `PHASE_CLOSEOUT_RETENTION.yaml`，并为 STOP/PASS/BLOCKED 分别提出 terminal/transition/resume capsule 输入。Owner 不能删除资源或宣布 capsule/GC 完成；pending StageB 的 unique raw/replay dependency 与 blocked/reserve 的 resume-critical material 必须保留到对应用户门。
