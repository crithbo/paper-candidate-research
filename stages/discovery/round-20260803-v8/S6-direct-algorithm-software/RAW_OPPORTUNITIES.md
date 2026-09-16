# S6 / O7 Raw Opportunities

> **非生产性材料。** 本文件不是 `TOPIC_BRIEF`，不包含 `PROPOSE_STAGE0`，不产生候选状态、阶段分数或晋级建议。所有条目均为 `SEARCH_BOUNDED_OPEN`，只有独立历史回测通过且主线恢复生产性 Discovery 后，才可重新检索并决定是否收敛。

## RAW-S6-01：吞吐—延迟 Pareto 的异构 AllGather 调度合成

**标签：** GPU collective、异构互连、组合优化、调度合成、N2

### 固定对象与研究问题

固定一张带链路容量/方向的 GPU 互连图、固定 ranks、固定 payload 和 chunk 语义，执行 byte-identical `AllGather`。问题不是提出新 collective，也不是改网络，而是：能否在 ForestColl 的吞吐最优树流框架上，合成一组覆盖“低启动/低 hop 延迟—高稳态吞吐”的可证明 Pareto 调度，并让用户按消息规模选择而无需重新求解？

[ForestColl](https://arxiv.org/abs/2402.06787) 给出异构网络上的吞吐最优树流，并明确把吞吐置于延迟之前；其低高度边不交叠生成树子问题困难，1024-GPU 离线生成也可达数十分钟。强对手还包括 [TACCL](https://www.usenix.org/conference/nsdi23/presentation/shah) 的通信草图与 SMT 合成、[HeteCCL](https://www.usenix.org/conference/nsdi26/presentation/hei) 的 CEGIS/SMT 异构 collective 合成，以及 [TE-CCL](https://vincen.tl/files/liu24teccl.pdf) 的流量工程路线。

### same-function / quality

- 输入、ranks、payload、输出布局和字节值完全相同；先限定 `AllGather`，避免浮点归约次序引入质量歧义。
- 网络拓扑、链路容量、路由许可、最大 chunk 数和 scratch-buffer 上限在比较中固定。
- 质量不是“平均更快”即可；必须同时报告每个消息规模点的延迟、吞吐和 Pareto 支配关系。

### 可能的非平凡算法增量

候选机制 A：**高度约束树流的 Lagrangian / column generation**。master problem 分配树流权重，pricing problem 搜索违反约束且高度受控的有向生成树；用 cut separation 给出吞吐上界和 optimality gap。

候选机制 B：**拓扑分解上的 Pareto dynamic programming**。对树宽较小或分层模块化的互连，边界状态同时概括链路拥塞、传播高度和 chunk 同步，保留非支配摘要；目标是精确或带界近似。

两者的研究价值必须来自“同时求解吞吐与启动延迟的结构化调度”，而不是把 ForestColl、TACCL 和 NCCL 的结果做一个外部 selector。

### 完整成本账

- 离线：合成 wall time、CPU/GPU 时间、峰值 RAM、并行求解资源、最大实例规模。
- 制品：调度表大小、树/flow 数、chunk 数、代码生成体积。
- 在线：kernel launch 数、同步点、scratch buffer、首字节/尾字节延迟、稳态吞吐。
- 部署：拓扑测量或容量估计成本；拓扑/容量改变后的重合成成本。
- 证据要求：模拟器只能支撑机制筛查，主 claim 最终需要受控的真实 GPU/网络证据或降级 claim。

### 推广条件与无收益区

- 推广条件：固定、可观测的异构/分层互连；存在不止一个有意义的低高度—低拥塞折中；消息规模有混合分布。
- 无收益区：大消息吞吐完全主导时，ForestColl 已接近目标；小型规则拓扑上 NCCL/TACCL 已知调度足够好；高树宽、全不规则拓扑可能让 DP/定价失控；拓扑频繁变化会摊不平离线合成。

### 强基线、碰撞和止损

- 强基线：ForestColl、HeteCCL、TACCL、TE-CCL、同硬件 NCCL；小实例以 SMT/MILP 全局最优为 oracle。
- 当前碰撞状态：`SEARCH_BOUNDED_OPEN / HIGH_RISK`。HeteCCL 已覆盖“异构 + 快速合成 + 低延迟/近优”的相邻主张，必须逐算法检查其目标函数和可证明边界。
- 决定性止损：若 HeteCCL 或其他 2024–2026 工作已联合给出同一 AllGather Pareto 对象、相同完整成本账和等价/更强算法保证，则本表述直接放弃；不能退化为消息规模 controller。

---

## RAW-S6-02：峰值 live-memory 约束下的共享 e-graph DAG 提取

**标签：** compiler、e-graph、DAG extraction、recomputation、memory scheduling、N2

### 固定对象与研究问题

固定无环 e-graph、多根输出、算子语义、目标后端和代价模型，从等价表示中提取一个共享 DAG。现有工作已经表明，共享子表达式使最优 e-graph 提取成为困难的全局问题：[Tensat](https://arxiv.org/abs/2101.01332) 将 equality saturation 用于张量图优化，[Fast and Optimal Extraction for Sparse Equality Graphs](https://doi.org/10.1145/3689801) 给出 treewidth 参数化的最优提取，[e-boost](https://arxiv.org/abs/2508.13020) 直接处理 DAG cost sharing，[Hartmann 等](https://arxiv.org/abs/2410.05534) 也使用 common-subexpression-aware extraction。

raw gap 是：在保持相同 IR 语义的前提下，能否联合选择表示、共享/重计算、materialization 和 evaluation order，使生成程序满足峰值 live-temporary memory 上限，并最小化执行代价或 spill？这与“e-graph 构建过程本身占多少 RAM”不同。

### same-function / quality

- 所有输出在固定 IR 数值语义下 bit-identical；若后端本就允许 fast-math，允许集合也必须在全部方法间固定。
- 固定算子延迟/能耗、buffer 大小、别名和后端约束。
- 比较必须允许基线进行同等的 CSE、调度、register/buffer allocation；不能用“先贪心提取再失败”作为唯一弱基线。

### 可能的非平凡算法增量

候选机制 A：**live-boundary tree-decomposition DP**。在 e-graph / interaction graph 的树分解边界上记录所选 enode、共享值存活状态、重复计算决策和内存占用，求 exact 或参数化最优解。

候选机制 B：**带下界的 recompute–materialize Lagrangian search**。对内存价格松弛后分离表示选择与调度子问题，以 branch-and-bound / column generation 恢复可行解并报告 optimality gap。

非平凡点必须是“共享 DAG 表示选择和 live-set 调度不可分”的求解结构；把现有 extractor 接 register allocator 的 wrapper 不算贡献。

### 完整成本账

- 编译：e-graph 构建、提取、调度各自 wall time 和峰值 RAM，搜索节点数，超时率。
- 代码：生成 DAG/指令数、重复计算量、代码尺寸、spill/load 数。
- 运行：峰值临时内存、端到端 latency/throughput、后端实际分配，而不只报告静态估计。
- 模型误差：算子代价和 buffer lifetime 预测误差；跨 CPU/GPU/加速器时分别计价。

### 推广条件与无收益区

- 推广条件：无环 e-graph；共享子表达式显著；临时内存确为约束；interaction/treewidth 或有效前沿仍可控制。
- 无收益区：表达式是树或几乎无复用；内存充裕；后端调度器会完全重写顺序；高 treewidth 导致状态爆炸；动态形状使静态 buffer 大小失真。

### 强基线、碰撞和止损

- 强基线：egg greedy/LP extraction、FastOpt、e-boost、Hartmann 的共享感知 greedy，以及“最优 DAG 提取 + 强后端内存调度”的分阶段组合；小实例用 ILP/SMT oracle。
- 当前碰撞状态：`SEARCH_BOUNDED_OPEN / MEDIUM_HIGH_RISK`。精确短语搜索尚未找到“e-graph extraction + generated-program peak live memory”的直接论文，但编译器中的 rematerialization、register-pressure-aware instruction selection 与 tensor memory scheduling 是必须补齐的跨领域碰撞。
- 决定性止损：若联合问题在合理图类上不能优于强分阶段法，或只能借不现实的静态 lifetime 假设成立，则停止；不能改成 e-graph 内存监控器或构建策略。

---

## RAW-S6-03：布局感知逻辑重综合中的 reconvergence 冲突全局求解

**标签：** EDA、logic synthesis、technology mapping、placement-aware、reconvergent DAG、N2

### 固定对象与研究问题

固定一个已放置的组合 Boolean netlist、标准单元库、可行 cut 集、行高/合法化约束和 timing target，要求功能等价。问题是：能否把局部 cut/gate 候选在 reconvergent DAG 上的相互冲突显式建模，用结构化全局算法替换按 required-arrival-time 的局部选择？

[Lesyn](https://www.cse.cuhk.edu.hk/~byu/papers/C220-DAC2024-Lesyn.pdf) 已展示 placement-aware 逻辑重综合的价值，也明确描述 reconvergent path 会让不同局部解对共享 gate 产生冲突，随后用满足 required arrival time 的最小面积启发式完成选择；它还需要剪枝可行 cut 以控制代价。[PigMAP](https://arxiv.org/abs/2408.07886) 是 placement-aware mapping 的直接相邻基线，[EqMap](https://www.csl.cornell.edu/~zhiruz/pdfs/eqmap-iccad2025.pdf) 则说明 e-graph 等价空间和提取算法正在进入逻辑映射。

### same-function / quality

- 输入 Boolean 功能、标准单元库、placement rows、时序/面积目标和合法化规则固定。
- 所有输出通过形式等价检查；使用同一 STA、RC proxy/提取流程和 legalization。
- 若允许 buffer insertion、gate sizing 或逻辑复制，所有方法得到完全相同的动作集合和成本计量。

### 可能的非平凡算法增量

候选机制 A：**reconvergence-conflict graph 的 treewidth DP**。节点表示局部实现候选，边/超边表示共享 fanin、时序和物理不可兼容；树分解边界保存到达时间—面积—wire proxy 的 Pareto 摘要。

候选机制 B：**共享 fanin 的 branch-and-price / Lagrangian mapping**。restricted master 选择全局一致 gate/cut，pricing 在局部 cones 中产生新实现，冲突与 timing 通过对偶价格传播；小实例给 exact certificate，大实例给 gap。

算法增量必须解决全局一致性和共享成本，不能只是为 Lesyn 换排序权重或加入一个冲突 checker。

### 完整成本账

- EDA 运行：候选 cut 枚举、分解/求解、placement update、legalization、STA 的 wall time 和峰值 RAM。
- PPA：cell area、leakage/dynamic power proxy、WNS/TNS、wirelength、拥塞、displacement。
- 正确性：形式等价检查时间与失败率。
- 规模性：netlist 节点/边数、冲突图 treewidth/密度、cut 数；报告 timeout 和回退比例。

### 推广条件与无收益区

- 推广条件：reconvergence 冲突相当多但冲突图具有可利用的局部性；placement proxy 与最终布线/时序有足够相关性。
- 无收益区：tree-like netlist 几乎没有冲突；timing 很松；冲突图过密或 cut 爆炸；后续 placement/routing 完全抹平前端选择；固定布局使可行改进空间太小。

### 强基线、碰撞和止损

- 强基线：Lesyn、PigMAP、ABC/mockturtle 中对应 mapper/resynthesis flow、EqMap；小电路使用 MILP/穷举 oracle。FastOpt/e-boost 只能作为求解思想相邻项，不能替代 EDA 直接基线。
- 当前碰撞状态：`SEARCH_BOUNDED_OPEN / HIGH_RISK`。经典 DAG covering、exact technology mapping、近期 placement-aware mapping 和 timing-driven remapping 必须做跨年代 collision review。
- 决定性止损：若全局冲突求解在 post-legalization/STA 后不能稳定改善强启发式，或完整 runtime 使可扩展规模失去意义，则停止；不能收缩成局部 weight tuning。

---

## RAW-S6-04：exact join+sort 优化的状态代数与可采纳搜索

**标签：** database、query optimizer、join ordering、interesting orders、subset convolution、N2

### 固定对象与研究问题

固定 SQL join+sort 查询、基数、物理算子、cost model 和 bushy plan space，要求找到与现有 exact optimizer 相同的全局最优计划。[Li、He、Yu](https://link.springer.com/article/10.1007/s00778-025-00906-y) 的 `DPω` 已把 join 与 sort 统一到满足 Ω-condition 的 exact dynamic programming，但状态涉及 sort-order 分组并受到 Bell-number 型增长限制。

相邻机制显示可能存在结构增量：[Haffner 与 Dittrich](https://doi.org/10.1145/3588927) 把 join ordering 变为带可采纳启发式的最短路搜索；[DPconv](https://arxiv.org/abs/2409.08013) 用 min-sum subset convolution 加速 plain join-order DP。raw 问题是：Ω-conditioned interesting-order 状态是否也能形成可压缩的前缀自动机/代数，或为 exact A* 提供强可采纳下界，从而在不改变计划质量的前提下超过 `DPω`。

### same-function / quality

- 查询语义和返回结果相同；cardinality、cost model、物理算子与合法 plan space 固定。
- 主算法必须返回与 `DPω` 相同的最小 estimated cost，或提供可核验的 optimality certificate；实际执行时间只是外部有效性，不替代 exactness。
- 不允许通过删除 bushy plans、限制 sort orders 或改 cost model 偷换规模。

### 可能的非平凡算法增量

候选机制 A：**sort-free relaxation 驱动的 exact A\***。把部分 join+sort plan 作为搜索状态，用忽略/合并部分 order 约束后的 DPconv 或 relaxed DP 生成可采纳且一致的 lower bound。

候选机制 B：**有界 order-prefix automaton 上的 min-plus subset convolution**。证明 Ω-conditioned 状态的组合闭包，把等价 order-prefix 合并成有限状态，在状态维度上做卷积/快速子集变换。

这两条路线不能做“DPω、A*、DPconv 万能 union”。生产性收敛时必须选一个主要机制，并证明为什么 sort-order 结构允许它成立。

### 完整成本账

- 优化器：wall time、峰值 RAM、状态数、priority-queue / convolution 开销、预计算和缓存尺寸。
- 计划：estimated cost、实际执行时间、sort/materialization 次数和中间结果尺寸。
- 公平性：同 cardinality、同 physical-property 集、同 timeout/内存上限；分别报告完成与未完成实例。
- 规模轴：join 数、join-graph 类型、interesting-order 数、order-prefix 多样性和谓词密度。

### 推广条件与无收益区

- 推广条件：cost 可按 Ω-condition / 所需代数分解；interesting orders 有大量共享前缀或 relaxation 下界足够紧。
- 无收益区：join 很少；没有有意义的 sort/order；distinct prefixes 接近全排列；非分解成本、强相关基数误差或复杂物理属性破坏下界；卷积常数和内存大于 `DPω`。

### 强基线、碰撞和止损

- 强基线：`DPω`、其论文中的 TDEnu/GS-Sort/PYRO-Fav、Haffner–Dittrich heuristic search、plain join 的 DPconv；小实例做穷举交叉核验。
- 当前碰撞状态：`SEARCH_BOUNDED_OPEN / MEDIUM_HIGH_RISK`。需要系统检查 Selinger-style interesting properties、physical-property DP、ranked enumeration 和 subset-convolution optimizer，不能因关键词未命中而宣称新颖。
- 决定性止损：若 Ω-conditioned sort state 不满足可利用的闭包，且 A* 下界在真实 query family 上不能显著剪枝，则停止；不能退化成工程缓存或改变计划空间。

## 本批次未保留线索

动态 graph ANN 的局部更新最初看似适合“反向依赖索引 + 受界重连”。但 [Greator](https://arxiv.org/abs/2503.00402) 已用轻量拓扑和局部 patch 降低图更新成本，[IP-DiskANN](https://arxiv.org/abs/2502.13826) 处理 in-place update，[LIOS](https://arxiv.org/abs/2605.19335) 研究在线更新调度，而 2026-07-31 的 [MERIT](https://arxiv.org/abs/2607.29173) 又提出带界搜索、MST repair 和 versioned-edge invalidation。当前可见机制与 raw 表述过近，故本批次不保留；不能通过换成“dependency sketch”重新命名。

