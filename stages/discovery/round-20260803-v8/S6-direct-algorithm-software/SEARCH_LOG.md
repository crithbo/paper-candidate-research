# S6 / O7 Search Log

- 检索日期：2026-08-03（Asia/Shanghai）
- 目的：在回测门关闭期间，侦察 4–6 个非生产性直接算法/软件改进空间
- 结果：保留 4 条 raw opportunity，淘汰 1 条近碰撞线索
- 新颖性状态：全部 `SEARCH_BOUNDED_OPEN`

## 方法

1. 先做问题/环境不变检查，再搜索算法空间；不从“换名后的机制”反推问题。
2. 每条线至少找两个命名竞争机制和一个近期直接基线。
3. 优先论文原文、DOI、会议/出版社页面、作者稿和官方 artifact；搜索摘要只用于导航。
4. 同时做正向检索和 contradiction search：搜索“exact / optimal / treewidth / peak memory / reconvergence / interesting orders”等可能直接吃掉增量的词。
5. 由于本轮不是 grounded brief，未声称 exhaustive；未完成系统化引用图、作者追踪和 2026 全量碰撞检查。

## 查询与结果

### A. 异构 collective 调度

代表性查询：

- `collective communication schedule synthesis heterogeneous topology latency throughput ForestColl`
- `TACCL SMT synthesis buffer constraints collective`
- `HeteCCL CEGIS heterogeneous collective synthesis`
- `low height edge disjoint spanning trees collective communication`

核验材料：

| 材料 | 角色 | 核验情况 |
|---|---|---|
| [ForestColl arXiv / NSDI 2026](https://arxiv.org/abs/2402.06787) | 最接近的 throughput-optimal tree-flow 基线 | 阅读论文正文；确认其吞吐优先、低高度树困难、离线生成成本和限制 |
| [TACCL, NSDI 2023](https://www.usenix.org/conference/nsdi23/presentation/shah) | sketch + SMT 合成基线 | 会议页面与论文入口 |
| [HeteCCL, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/hei) | 异构 CEGIS/SMT 近碰撞 | 会议页面与论文正文 |
| [TE-CCL, SIGCOMM 2024 author PDF](https://vincen.tl/files/liu24teccl.pdf) | traffic-engineering 竞争机制 | 作者公开论文 |
| [TACCL artifact](https://github.com/microsoft/taccl) | 可复现性线索 | 官方仓库；未执行 |

判断：只保留“固定 AllGather 的 latency–throughput Pareto 算法”，不保留 runtime selector。风险高，需在回测后查遍 HeteCCL 的目标函数与最新 low-height tree packing。

### B. e-graph 共享 DAG 与峰值内存

代表性查询：

- `e-graph optimal extraction DAG shared subexpression treewidth`
- `"e-graph extraction" "peak memory"`
- `"e-graph extraction" "memory budget"`
- `equality saturation rematerialization register pressure extraction`

核验材料：

| 材料 | 角色 | 核验情况 |
|---|---|---|
| [Tensat, MLSys 2021](https://arxiv.org/abs/2101.01332) | 张量图 equality saturation 基线 | 论文原文 |
| [Fast and Optimal Extraction for Sparse Equality Graphs, OOPSLA 2024](https://doi.org/10.1145/3689801) | NP-hardness、treewidth/FPT、exact extraction | DOI/论文原文 |
| [E-Graphs as Circuits](https://arxiv.org/abs/2408.17042) | circuit/treewidth 表示与算法 | 预印本原文 |
| [e-boost, ICCAD 2025](https://arxiv.org/abs/2508.13020) | 共享 DAG cost-aware extraction | 论文原文及作者 artifact 入口 |
| [Hartmann et al., PACT 2024](https://arxiv.org/abs/2410.05534) | common-subexpression-aware extraction | 论文原文 |
| [egg](https://github.com/egraphs-good/egg) | 标准实现基线 | 官方仓库；未执行 |

判断：没有把关键词空缺当成新颖性证据。raw gap 明确限定为“生成程序的 peak live-temporary memory”，不是 e-graph 构建 RAM。回测后必须补 instruction selection、register pressure、tensor rematerialization 和 memory scheduling 的跨领域检索。

### C. placement-aware logic resynthesis

代表性查询：

- `placement aware logic synthesis reconvergent path conflicting gate solutions`
- `exact technology mapping reconvergent DAG dynamic programming`
- `DAG covering shared nodes global technology mapping`
- `e-graph logic mapping placement aware extraction`

核验材料：

| 材料 | 角色 | 核验情况 |
|---|---|---|
| [Lesyn, DAC 2024](https://www.cse.cuhk.edu.hk/~byu/papers/C220-DAC2024-Lesyn.pdf) | 最直接的问题与启发式基线 | 阅读论文正文；确认 reconvergence 冲突、局部选择与剪枝 |
| [PigMAP](https://arxiv.org/abs/2408.07886) | placement-aware mapping 直接竞争 | 论文原文 |
| [EqMap, ICCAD 2025](https://www.csl.cornell.edu/~zhiruz/pdfs/eqmap-iccad2025.pdf) | e-graph logic mapping 相邻机制 | 作者公开论文 |
| [DAG-aware Synthesis Orchestration](https://arxiv.org/abs/2310.07846) | DAG-aware 相邻软件路线 | 论文原文 |

判断：保留“reconvergence-conflict global solver”作为 raw；不把 e-graph 方法自动并入。经典 DAG covering 文献跨度长，是此条最高碰撞风险，需后续专门做时间切片和引文追踪。

### D. exact join+sort planning

代表性查询：

- `exact join and sort optimization Omega condition dynamic programming`
- `join order optimization exact A* admissible heuristic`
- `DPconv subset convolution join ordering`
- `interesting orders physical properties subset convolution query optimizer`

核验材料：

| 材料 | 角色 | 核验情况 |
|---|---|---|
| [Li, He, Yu, VLDB Journal 2025](https://link.springer.com/article/10.1007/s00778-025-00906-y) | `DPω` exact join+sort 直接基线 | 出版社全文；确认 Ω-condition、状态增长和实验规模 |
| [Haffner & Dittrich, SIGMOD 2023](https://doi.org/10.1145/3588927) | exact heuristic-search 机制 | DOI/作者论文与 artifact 线索 |
| [DPconv, SIGMOD 2025](https://arxiv.org/abs/2409.08013) | min-sum subset convolution 加速 plain join DP | 论文原文 |

判断：保留两种待二选一机制：relaxation-driven exact A*，或 sort-prefix automaton 上的 subset convolution。若不能证明 admissibility/closure，就不能用工程加速包装为算法贡献。

### E. 动态 graph ANN（淘汰）

代表性查询：

- `dynamic graph ANN local update repair reverse edges`
- `DiskANN in-place update deletion graph repair`
- `2026 dynamic graph vector index update`

核验材料：

| 材料 | 角色 | 核验情况 |
|---|---|---|
| [Greator](https://arxiv.org/abs/2503.00402) | 轻量 topology + localized patch | 论文原文 |
| [IP-DiskANN](https://arxiv.org/abs/2502.13826) | in-place graph index updates | 论文原文 |
| [LIOS](https://arxiv.org/abs/2605.19335) | online update scheduling | 预印本原文 |
| [MERIT, 2026-07-31](https://arxiv.org/abs/2607.29173) | bounded search、MST repair、versioned-edge invalidation | 最新预印本原文 |

判断：直接竞争已覆盖本轮能写出的主要动作，线索不保留。此判断只淘汰当前“依赖索引 + 局部修复”表述，不宣称整个动态 ANN 方向无研究空间。

## 搜索边界与未决事项

- 本轮未使用付费数据库的完整引文导出，也未完成每条线的 backward/forward citation closure。
- 2026 年预印本变化快；若回测通过，必须以恢复生产当天为检索截止日重跑最新碰撞。
- arXiv 条目只证明公开时间和技术陈述，不等同于同行评审接受。
- raw 条目没有引用完整性、Q1 定位、资源可执行性或双轴评分结论。
- 未下载/运行 artifact，未占用硬件，未创建实验目录。

## AI 使用披露

检索词扩展、候选聚类、相邻机制对比和初步反方审查由 AI 辅助完成；保留/淘汰依据已尽量回到论文原文。由于本轮受 backtest gate 限制，所有“gap”均应理解为待验证假设，而不是新颖性结论。

## 生产性收敛补充（检索截止：2026-08-03）

回测审计已将 O7 设为 `CALIBRATED`，因此本节重新进行而非复用 raw 阶段结论。下表区分“已扣除的直接工作”与“仍待 Stage 0 独立复核的 residual”。

| 线索 | 新检索与一手核验 | 碰撞结论 | 本轮处置 |
|---|---|---|---|
| heterogeneous AllGather | [SyCCL, SIGCOMM 2025](https://ennanzhai.github.io/pub/sigcomm25-syccl.pdf)、[HeteCCL, NSDI 2026](https://www.usenix.org/system/files/nsdi26-hei.pdf)；检索 `AllGather latency throughput Pareto schedule synthesis heterogeneous topology` | SyCCL 已把拓扑/消息规模的延迟与吞吐调度合成做到 production scale；HeteCCL 已用异构链路与计算延迟的统一 completion-time 模型。原设想的 residual 只剩 selector/工程权重调节，属于禁止项。 | `DROP`，不以 Pareto 或树流换名复活。 |
| e-graph live memory | [FastOpt, OOPSLA 2024](https://doi.org/10.1145/3689801)、[Julia EqSat, TACO 2026](https://doi.org/10.1145/3795883)、[SmoothE, ASPLOS 2025](https://www.csl.cornell.edu/~zhiruz/pdfs/smoothe-asplos2025.pdf)；检索 `e-graph extraction peak memory rematerialization materialization` | FastOpt/Julia 已直接扣除 sparse-treewidth extraction 与 ILP code reuse；未找到在**同一 acyclic e-graph**中联立代表选择、materialize/recompute 和 peak-live bound 的同对象论文。 | 收敛为 `S6-EGRAPH-LIVEEXTRACT`；`SEARCH_BOUNDED_OPEN` 仅表示当前边界，非首创声称。 |
| placement-aware resynthesis | [Lesyn, DAC 2024](https://yibolin.com/publications/papers/LOGIC_DAC2024_Pu.pdf)、[PigMAP, ICCAD 2024](https://doi.org/10.1145/3676536.3676676)、[MLCAD ReSynthAI 2025](https://asu.elsevierpure.com/en/publications/invited-paper-mlcad-2025-contest-on-resynthai-physical-aware-logi/)；检索 `reconvergence technology mapping exact global placement aware` | Lesyn 的冲突修复确为局部启发式，但经典 exact DAG-covering、mapping 和近年物理反馈重综合使“全局冲突求解”没有足够窄且可审计的 residual；可比开源 flow/库/后端也尚未冻结。 | `DROP`，因 residual 未被可靠定义，而非宣称领域已穷尽。 |
| exact join+sort | [DPomega, VLDB Journal 2025](https://doi.org/10.1007/s00778-025-00906-y)、[Haffner--Dittrich, PACMMOD 2023](https://doi.org/10.1145/3588927)、[DPconv, SIGMOD 2025](https://arxiv.org/abs/2409.08013)；检索 `interesting orders join optimization exact dynamic programming A star subset convolution` | DPomega 是同对象 exact baseline；Haffner--Dittrich 和 DPconv 分别扣除 plain-join shortest-path 与 subset convolution。未找到将 Ω-condition order state 做 exact prefix quotient、并以 sort-free relaxed DP 为可采纳 bound 的同对象工作。 | 收敛为 `S6-JS-PREFIXBOUND`；必须先证明 quotient 和 bound，失败即停。 |

### Artifact / natural-input 核验

- FastOpt 报告其 Rust 实现并使用真实 Cranelift e-graph benchmark；Julia EqSat 的论文公开可下载，但没有找到其 extraction artifact 的明确源码链接。候选一因此以 Cranelift/egg 的开源输入为主，不把 Julia 实现当作可直接复现实验基线。
- `DPomega` 在 PostgreSQL 12.4 上报告 TPC-DS、JOB（从 113 条中抽取 76 条合取查询）和可控 SYN/SYN-S；本轮未发现其公开代码。Haffner--Dittrich 则提供 source code，并有 SIGMOD 可复现性报告。候选二必须从论文算法独立重建 DPomega，不得虚称复用其实现。
- 本轮没有下载、编译或运行上述 artifact；没有启动正式实验。

### 生产性限制

- 对两个 brief 均执行了 method-name deletion test；保留的问题仍可表述为“带资源约束的全局表示选择”或“带 order property 的 exact optimizer state reduction”。
- 未发现不等于不存在。Stage 0 仍须做独立 current-collision 和 Q1 校准。
- 所有引用、查询和否定结果均记录到此处；AI 仅辅助检索与结构化综合。
