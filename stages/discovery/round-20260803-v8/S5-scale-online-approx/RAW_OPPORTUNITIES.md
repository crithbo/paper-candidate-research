# S5 非生产性 Raw Opportunities

> 本文件不是 `TOPIC_BRIEF`，不含 `PROPOSE_STAGE0`，不得据此创建 Stage 0/A/B。所有方向均等待 discovery method v2 独立历史回测通过后再决定是否收敛。

## 批次概览

| Raw ID | 简称 | 主要域 | 初步优先级 | 当前碰撞判断 |
|---|---|---|---|---|
| `S5-RAW-01` | JIT-GAP-SCHEDREG | CUDA/GPU、编译器 | 高 | `SEARCH_BOUNDED_OPEN`，但 MLGO/RL4ReAl 相邻 |
| `S5-RAW-02` | MOE-ONLINE-BMATCH | 算法、MoE 系统 | 中 | `DIRECT_SUBTRACT`，残余需与 2025–2026 路由工作切开 |
| `S5-RAW-03` | DYN-PGROUP-COLL | GPU 集体通信 | 中低 | 高碰撞；ForestColl/PCCL/动态 BvN 大幅收窄 |
| `S5-RAW-04` | PREFIX-DAG-ONLINE | LLM serving、缓存 | 低 | 高碰撞；Preble/SAECache/Strata 已覆盖多条自然动作 |
| `S5-RAW-05` | DYN-REMAT-CERT | 训练内存、编译器 | 低 | `DIRECT_SUBTRACT`；DTR 与 HiRemate 已占据在线/层次入口 |
| `S5-RAW-06` | STREAM-ANN-MAINT | ANN、数据结构 | 终止收敛优先 | 谱系拥挤；Quake/IP-DiskANN/OdinANN/Slipstream/MERIT 连续覆盖 |

## S5-RAW-01：编译预算内、带 gap 证书的 GPU 联合指令调度与寄存器分配

### 触发与定量锚点

Unison 把寄存器分配与指令调度做组合优化，可处理约 1,000 条指令的中等函数并在固定时限内求最优或改进代码，但其公开评估集中于 Hexagon/ARM/MIPS，定位本身也是以更高编译时间换代码质量。[Unison/Combinatorial Register Allocation and Instruction Scheduling](https://arxiv.org/abs/1804.02452)

GPU min-register 调度的 2023 研究表明，组合启发式的平均寄存器压力仍比最优值高约 17%，且约 6% 的案例高出最优值 50% 以上；这给出了“快速启发式与精确 ceiling 之间仍有重尾 gap”的初始锚点。[Optimal and Heuristic Min-Reg Scheduling Algorithms for GPU Programs](https://arxiv.org/abs/2303.06855)

LLVM 社区材料还明确把 GPU 后端的严格 JIT 时间预算，以及 occupancy/resource 权衡所需的调度–寄存器分配协同列为实际问题；该材料仅作工程动机，不作论文新颖性证据。[LLVM GPU backend discussion, 2021](https://lists.llvm.org/pipermail/llvm-dev/attachments/20211111/3a076e0b/attachment.html)

### Exact object 与信息条件

- 输入：单个已合法化的 GPU Machine-IR basic block 或受限 region、依赖 DAG、目标 GPU 的寄存器/latency/resource 模型、毫秒级或十毫秒级编译预算。
- 输出：保持语义的指令顺序、寄存器/溢出决策，以及相对可计算 lower bound 的 incumbent gap。
- 目标：在给定编译预算内联合最小化估计执行周期、spill 成本与 occupancy 损失。
- 信息条件：只使用当前 region 与静态目标模型；运行 profile 若使用，必须同样提供给部署基线。

### 两个非同义机制

**机制 A：可分隔 frontier 的 anytime 分解。** 按依赖 DAG 的 separator/frontier 分块，用小规模 CP-SAT 求局部精确解，并用跨 frontier 的活跃值与资源状态组合；持续给出 lower bound 与 incumbent，预算到期即可返回。

**机制 B：精确样本引导但可审计的决策策略。** 用小块最优解训练轻量策略选择 list-scheduling 次序与 spill 候选，同时由合法性投影和可计算 bound 约束；目标不是黑盒 RL 替代整个后端，而是降低最坏尾部 gap。

两者不是同义：A 依赖图分解和求解界，B 依赖离线最优样本迁移与快速在线决策。

### 公平基线与 offline ceiling

- 部署基线：LLVM/目标后端现有 list scheduler + greedy/fast register allocator。
- 最近论文基线：GPU min-reg 启发式；若可移植则加入 RL4ReAl/MLGO 的寄存器分配策略。[RL4ReAl](https://research.google/pubs/rl4real-reinforcement-learning-for-register-allocation/)；[LLVM MLGO 文档](https://www.llvm.org/docs/MLGO.html)
- 竞争简单基线：仅做 register-pressure-aware list scheduling，再运行原寄存器分配器。
- offline ceiling：CP-SAT/Unison 风格联合求解器在宽松时限下的最优或最佳已知解；不得把它计作同信息部署基线。

### 初步碰撞与残余

- Unison 覆盖“联合组合优化”，但公开对象、目标 ISA 和编译窗口与 GPU JIT residual 不同。
- GPU min-reg 工作只优化寄存器压力子问题，未给出联合执行延迟/spill/occupancy 的 anytime gap-certified 路线。
- MLGO/RL4ReAl 覆盖学习型寄存器分配，构成强邻接与部署基线；若它们在 GPU 后端同预算下已覆盖联合动作，残余将消失。
- 当前分类：`SEARCH_BOUNDED_OPEN`；没有声称首次。

### 72 小时探针

1. 从公开 LLVM AMDGPU/NVPTX 或可合法获取的 GPU MIR 测试中抽取 50–100 个 basic blocks。
2. 用 CP-SAT 建立 min-reg + 简化 latency 的小对象 ceiling，记录规模–求解时间曲线。
3. 实现一个 separator/frontier 分块原型，与 LLVM list schedule 和单目标 min-reg 启发式比较：编译时间、peak live、spill proxy、估计周期、optimality gap。
4. 专门检查最坏 5% block，而非只报平均值。

### 决定性 falsifier

- 在自然 GPU blocks 上，现有 list scheduler 与 greedy allocator 已在相同预算内距 ceiling 小于 2%，且不存在稳定重尾；
- 或 DAG separator 状态爆炸使分解在 1,000–10,000 指令 region 上既无时间优势也无 gap 界；
- 或真正性能由后续隐藏后端/硬件调度吸收，静态目标与实机性能不相关。

### 非平凡性与成本账本

需要计入编译时间、模型/solver 常驻内存、训练精确样本成本、失败回退、代码尺寸、spill、occupancy 与实机 kernel time。若最终只是在 LLVM 中换一组 heuristic 权重，则必须放弃。

## S5-RAW-02：未知未来 microbatch 下的 MoE 容量约束在线 b-matching

### 触发与定量锚点

BASE Layers 把 token–expert 路由写成线性 assignment，并得到每个 expert 等量 token 的最优批内分配，但该形式天然观察整个 batch。[BASE Layers, ICML 2021](https://proceedings.mlr.press/v139/lewis21a.html)

2025 的 Capacity-Aware Inference 报告某些推理场景中最忙 expert 的负载超过期望均值 7 倍，并以 token drop/reroute 得到最高 1.94× 推理加速，说明推理期不平衡是自然而非假设问题。[Capacity-Aware Inference](https://arxiv.org/abs/2503.05066)

MaxScore 已把容量约束路由表述为 minimum-cost maximum-flow；2026 的 φ-balancing 进一步给出基于 mirror descent 的在线 population-balance 调整。二者对“再做一个 flow/online router”构成强碰撞。[MaxScore](https://arxiv.org/abs/2508.12801)；[φ-balancing, ICML 2026](https://openreview.net/forum?id=DZbzIOguz4)

### Exact object 与信息条件

- 输入：decode 阶段按时间到达的 token–expert affinity、每 expert 当前可用容量、通信位置和 microbatch 截止时间；未来 token 不可见。
- 输出：每 token 的 top-k expert 指派或有界 reroute，保持固定 FLOPs/容量合同，并显式计量语义质量代理损失。
- 目标：最小化最大 expert completion time + affinity loss + reroute/communication cost。
- offline 全批 min-cost flow/BASE assignment 仅为 ceiling。

### 两个非同义机制

**机制 A：带有界 recourse 的在线原始–对偶 b-matching。** 每次 microbatch 到达后更新 expert shadow prices，只允许少量尚未执行 token 改派，追求 latency/affinity 的 competitive 或 regret bound。

**机制 B：预测增强的分层 matching。** 利用 prefill→decode expert activation 相关和 domain-local popularity 先做 expert-group 分配，再在组内做 exact/auction matching；预测失败时退化到最坏情况安全算法。2026 profiling 工作报告了 domain-specific popularity shift 与 prefill/decode 相关性，可作为待复现结构锚点。[Scaling Multi-Node MoE Inference Using Expert Activation Patterns](https://arxiv.org/abs/2604.23150)

### 公平基线与 offline ceiling

- 部署基线：模型原生 top-k router，固定同样 capacity/FLOPs。
- 最近论文基线：Capacity-Aware Token Reroute、MaxScore；训练问题还需 φ-balancing，但不得把训练与推理对象混为一谈。
- 竞争简单基线：按 affinity 排序的 greedy capacity fill + 一轮 reroute。
- offline ceiling：观察完整时间窗的 min-cost max-flow/b-matching。

### 初步碰撞与残余

- MaxScore 已覆盖全批 flow formulation，候选不能再以“flow routing”作为贡献。
- Capacity-Aware Inference 已覆盖推理期 drop/reroute。
- φ-balancing 已覆盖一个在线平衡框架。
- 2026 的 Mixture-of-Experts Serving 已给出 expert replica/GPU 重新分配的在线 competitive algorithm，但其动作是 GPU-to-expert capacity allocation，不是 token-to-expert assignment；它仍是相邻理论基线。[Mixture-of-Experts Serving](https://arxiv.org/abs/2607.17880)
- 仅剩的 residual 是“流式 token assignment + 有界 recourse + 通信/质量同计价”；当前为 `DIRECT_SUBTRACT`，风险高。

### 72 小时探针

1. 使用开源 OLMoE/DeepSeek-V2-Lite 路由 trace 或小模型生成 trace。
2. 固定原 router logits，不训练模型；比较 greedy、Capacity-Aware reroute、全窗 flow ceiling 与一个 shadow-price 在线原型。
3. 报 latency proxy、affinity regret、reroute 数、跨节点 token bytes、掉 token 数与真实模型困惑度/任务质量变化。
4. 对 burst、domain shift 和短 microbatch 单独评估。

### 决定性 falsifier

- 在同容量、同 FLOPs 与同通信成本下，现有一轮 reroute 已稳定达到全窗 flow ceiling；
- 在线改派带来的 affinity/质量损失抵消全部尾延迟收益；
- prefill/decode 或时间相关性在开放模型和自然 trace 上不稳定；
- 需要重新训练 router 才能成立，从而改变 exact object。

## S5-RAW-03：动态 process group 与带宽漂移下的可增量 collective schedule 修复

### 触发与定量锚点

TACCL 通过 communication sketch 和新编码把综合扩展到多节点，并曾报告相对 NCCL 最高 6.7×；但仍以给定拓扑与 collective 做离线综合。[TACCL, NSDI 2023](https://www.usenix.org/conference/nsdi23/presentation/shah)

2026 年的 ForestColl 已对任意异构网络拓扑构造 throughput-optimal schedule，并以强多项式时间扩展到大拓扑；PCCL 又把 process group 和任意 collective pattern 纳入可扩展综合。这直接削弱“层次化即可扩规模”的简单主张。[ForestColl, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/zhao-liangyu)；[PCCL](https://arxiv.org/abs/2606.07019)

更强的反证是 2026 年 Dynamic Hierarchical BvN 已对两层 GPU All-to-All 给出在线、层次化和稳定性保证。[Dynamic Hierarchical BvN](https://arxiv.org/abs/2602.22756)

### Exact object 与信息条件

- 输入：已经部署的 process-group collectives、当前测得的 link/service rates、局部故障或慢链路变化、有限重规划预算。
- 输出：从旧合法 schedule 到新合法 schedule 的增量修改序列，显式限制 chunk remap、同步和 warmup 成本。
- 目标：最小化性能损失与修复成本，而不是从零生成静态最优 schedule。

### 两个非同义机制

**机制 A：forest/cut certificate 的局部增量修复。** 保留未受影响的 tree packing，只对违反 capacity cut 的局部做增广，给出相对新静态 optimum 的 gap。

**机制 B：process-group 模板库 + 在线组合。** 预计算局部子拓扑 primitive，在运行时按 group overlap 和带宽区间组合；需要证明组合合法性和性能界，不能只是缓存已有 schedule。

### 公平基线与 offline ceiling

- 部署基线：NCCL/RCCL 当前算法选择或既有 schedule 不变。
- 最近论文基线：ForestColl、PCCL、HeteCCL；All-to-All 场景加入 Dynamic Hierarchical BvN。
- 竞争简单基线：变化后重新 profile，并从零运行 ForestColl/PCCL。
- offline ceiling：完整知道变化后的拓扑和未来稳定区间时重新综合的最佳 schedule。

### 初步碰撞与残余

静态扩展性、异构性、process group、任意 collective、在线分层 All-to-All 均已有强工作。只有“增量修复成本作为一等目标、一般 collective/process group、未知稳定时长”的组合残余尚为 `NOT_FOUND_WITHIN_SEARCH`。该 residual 极易退化成万能 union 或 controller，因此优先级中低。

### 72 小时探针

在 TACCL/ForestColl 可公开拓扑上模拟单链路降速、group resize 和局部故障；比较从零重综合与局部 tree/cut 修复的求解时间、schedule makespan、修改边数和切换开销。若无法得到可执行 collective，只能主张算法/仿真层证据。

### 决定性 falsifier

- ForestColl/PCCL 从零重算已远快于实际允许的重配置窗口；
- 局部变化常导致全局 tree packing 重构，增量修改无稳定局部性；
- Dynamic Hierarchical BvN 或 HeteCCL 已覆盖相同信息条件和修复动作；
- 运行时网络测量噪声导致 schedule 切换收益不可复现。

## S5-RAW-04：未知未来请求下的分布式 prefix-DAG 缓存放置、驱逐与路由

### 触发与定量锚点

SGLang 的 RadixAttention 建立了前缀复用的部署基线；Preble 已在分布式环境联合考虑 KV reuse 与负载均衡，并报告平均延迟 1.5–14.5×、p99 2–10× 改进。[SGLang](https://arxiv.org/abs/2312.07104)；[Preble, ICLR 2025](https://proceedings.iclr.cc/paper_files/paper/2025/hash/5bc342f48de8264779952fac378f96dc-Abstract-Conference.html)

2026 年 SAECache 报告不同 token 类型的复用率最高相差 756×，并通过在线学习驱逐取得 1.4–2.7× TTFT 改进；Strata 又覆盖 GPU/host 层次 context cache 和 cache-aware scheduling。[SAECache](https://arxiv.org/abs/2605.18825)；[Strata, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/xie-zhiqiang)

### Exact object 与信息条件

- 输入：多副本上的 prefix radix/DAG、当前 GPU/host/remote cache 容量、在线请求到达、每节点 queue、cache transfer cost；未来请求未知。
- 输出：prefix block 的保留/驱逐/复制/迁移与请求路由。
- 目标：在固定语义下最小化 TTFT/p99 与迁移 bytes，并满足显存和 load constraints。

### 两个非同义机制

**机制 A：prefix-DAG 的在线租赁/缓存算法。** 利用祖先依赖和共享子树，将保留价值表示成有向闭包，设计带迁移预算的 primal-dual eviction/replication。

**机制 B：多时间尺度分解。** 慢时间尺度决定副本/层次 placement，快时间尺度只做 request routing 和局部 eviction；给出何时分解近似全局 optimum 的边界。

### 公平基线与 offline ceiling

- 部署基线：SGLang RadixAttention + LRU/默认 router。
- 最近论文基线：Preble、SAECache、Strata；若使用 disaggregated memory 还需 SYMPHONY。[SYMPHONY, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/agarwal)
- 竞争简单基线：reuse-value/byte greedy + queue-length routing。
- offline ceiling：知道完整请求序列的 placement/routing ILP，仅作为 ceiling。

### 初步碰撞与残余

该空间已非常拥挤：分布式 reuse-aware scheduling、语义在线驱逐、层次缓存、可靠/不可靠 prefetch 均有 2025–2026 工作。只有“DAG ancestor value + 多副本迁移预算 + 同信息在线保证”的狭窄 residual 尚为 `NOT_FOUND_WITHIN_SEARCH`。若不能证明结构性算法增量，这只是现有系统的 union，应停止。

### 72 小时探针

用公开 ShareGPT/BurstGPT 或 SGLang prefix-sharing trace 构造 replay；实现 DAG-closure greedy 和小窗 offline ILP ceiling，与 LRU、Preble 风格路由、reuse-value greedy 比较。完整计入 metadata、迁移、cache loading、queueing 和 radix traversal CPU 成本。

### 决定性 falsifier

- prefix 结构在自然 trace 上接近链或复用窗口极短，DAG 动作没有额外 headroom；
- 现有 Preble + SAECache 风格基线在同信息下达到 ceiling；
- placement/migration 决策的传输成本大于节省的 prefill；
- 收益只来自调权或 workload-specific 参数。

## S5-RAW-05：数据依赖动态图上的在线 rematerialization 与可计算质量界

### 触发与定量锚点

Checkmate 用 MILP 求静态 tensor rematerialization，公开描述为在一小时内求解、随后复用于数百万训练迭代。[Checkmate, MLSys 2020](https://proceedings.mlsys.org/paper_files/paper/2020/hash/0b816ae8f06f8dd3543dc3d9ef196cab-Abstract.html)

DTR 已明确提出支持 dynamic models 的 greedy online rematerialization，并在仿真中接近静态最优；HiRemate 又以递归分区和多层 solver 扩展到数千图节点，报告 50–70% 内存下降、10–15% overhead。[DTR](https://arxiv.org/abs/2006.09616)；[HiRemate, ICML 2025](https://proceedings.mlr.press/v267/gusak25a.html)

### Exact object 与信息条件

- 输入：按执行暴露的数据依赖图、张量大小/重算成本、硬内存预算；未来控制流不可见。
- 输出：在线 evict/rematerialize 决策，以及相对已见前缀或受限-lookahead lower bound 的 gap/风险信号。
- 目标：降低重算开销和 OOM 风险，不改变数值语义。

### 两个非同义机制

**机制 A：在线可认证 frontier DP。** 对已见图维护 bounded-width frontier 的 exact state，对远端历史做压缩，给出前缀最优界。

**机制 B：结构变化检测后的层次增量重规划。** 复用重复 subgraph 的 HiRemate 分区，只在动态分支改变局部计划；动作是增量计划修复，不是全局重求解。

### 公平基线与 offline ceiling

- 部署基线：PyTorch/框架默认 checkpoint 或简单 eviction。
- 最近论文基线：DTR、HiRemate、Checkmate 近似/精确配置。
- 竞争简单基线：DTR 的 size×staleness×cost greedy。
- offline ceiling：完整动态图实例已知后的 Checkmate/DP/ILP。

### 初步碰撞与残余

“在线”已被 DTR 覆盖，“层次化扩规模”已被 HiRemate 覆盖；把二者相加不是论文。唯一可能 residual 是动态前缀上的可计算 gap 与增量复用，但这可能只是 analysis add-on。当前分类为 `DIRECT_SUBTRACT`，不建议在回测前扩展。

### 72 小时探针

用公开动态控制流模型或合成重复子图生成 execution trace；测 DTR 与小窗 exact ceiling 的 gap 分布，先确认是否存在稳定、可预测的重尾。如果没有自然 headroom，立即终止。

### 决定性 falsifier

- DTR 在自然动态图上已接近完整 hindsight ceiling；
- frontier width 无界导致 certificate 比决策本身更昂贵；
- 动态图缺少重复分区，增量复用命中率低；
- HiRemate 已能在允许窗口内对实际图重算。

## S5-RAW-06：持续更新 ANN 的维护预算与 search-recall 稳定性

### 触发与定量锚点

DiskANN 证明了单机十亿点高召回 ANN 的静态可行性。[DiskANN, NeurIPS 2019](https://proceedings.neurips.cc/paper/2019/hash/09853c7fb1d3f8ee67a61b6bf4a7f8e6-Abstract.html)

但 2025–2026 谱系已密集覆盖动态入口：

- Quake 针对动态、偏斜 workload 自适应 partition、query 参数和维护，并报告 query latency 1.5–38×、update latency 4.5–126× 改进。[Quake, OSDI 2025](https://www.usenix.org/system/files/osdi25-mohoney.pdf)
- IP-DiskANN 避免 batch consolidation，做 insertion/deletion in-place。[IP-DiskANN](https://arxiv.org/abs/2502.13826)
- OdinANN 在十亿规模做 direct insert，追求稳定在线性能。[OdinANN, FAST 2026](https://www.usenix.org/conference/fast26/presentation/guo)
- Slipstream 利用向量流连续性加速 streaming insertion；MERIT 处理图索引 in-place deletion 与局部 repair。[Slipstream](https://arxiv.org/abs/2606.02992)；[MERIT](https://arxiv.org/abs/2607.29173)

### Exact object 与可能 residual

原始想法是：在未知 read/write drift 下，在线分配 graph repair、partition split/merge 和 query effort 的维护预算，以最小化 recall shortfall + p99 + update pause。

可能机制一是 bandit/online convex budget allocation；机制二是多层 index 的局部 potential repair。然而 Quake 已把 query-aware continuous maintenance 与 recall target 作为核心，IP-DiskANN/OdinANN/MERIT 又覆盖具体更新动作。

### 公平基线与 offline ceiling

部署/论文基线至少需 Quake、IP-DiskANN、OdinANN、Slipstream/MERIT；offline ceiling 是知道完整 drift trace 后的维护计划。如此宽的基线集合本身说明 exact object 尚未收窄。

### 初步碰撞结论

当前没有发现一个不依赖万能 union、且能从上述工作中清楚扣除的稳定 residual。分类为 `COLLISION_SATURATED / NOT_FOR_CONVERGENCE`。保留此条仅作为负向侦察，避免回测后重复进入“动态 ANN controller”包装。

### 决定性 falsifier

已由当前检索满足：若研究问题只是“动态偏斜 workload 下自适应维护并保持 recall/latency”，Quake 已直接覆盖；若只是 insert/delete 局部修复，IP-DiskANN/OdinANN/MERIT 已直接覆盖。只有出现新的 exact object、信息约束或理论保证才可另立新 raw ID，不能改名复活本条。

## 横向 Devil's-Advocate 检查

1. **最强反方意见**：本批多数方向只是把 offline exact、online heuristic 和 hierarchy 三个流行词重新组合；2026 文献已分别覆盖这些动作，残余可能不足以形成完整论文。
2. **去方法名测试**：`S5-RAW-01` 和 `S5-RAW-02` 删除 GPU/MoE 名称后仍分别是“编译预算内的联合组合优化与可计算 gap”和“未知未来、容量约束、有限 recourse 的在线 b-matching”；其余方向删除领域名后容易退化为普通在线资源控制，风险更高。
3. **移除最强单篇来源**：`S5-RAW-01` 仍有 Unison + GPU min-reg + LLVM 部署材料三条链；`S5-RAW-02` 仍有 BASE + Capacity-Aware + MaxScore。其余方向高度依赖最新相邻工作对 residual 的定义，暂不稳固。
4. **信息公平性**：所有方向都把 offline OPT 放在 ceiling，并要求部署基线与候选看到相同 trace 前缀、profile 和 future information。
5. **不能包装的 union**：Preble+SAECache+Strata、DTR+HiRemate、Quake+IP-DiskANN 都不得直接当作新贡献。

## 回测通过后的建议收敛顺序

1. 先对 `S5-RAW-01` 做 exact-object 与自然 headroom 核验。
2. 再对 `S5-RAW-02` 做 2025–2026 最新碰撞审查，尤其区分 token assignment 与 expert replica allocation。
3. `S5-RAW-03` 只有在增量修复成本形成独立算法对象时继续。
4. `S5-RAW-04`、`S5-RAW-05` 暂不收敛。
5. `S5-RAW-06` 作为碰撞负样本，不进入 grounded brief。

