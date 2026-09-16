# 给 GPT-5.6 Pro 的完整复审提示词

请作为数据库查询优化、精确算法和系统论文的高级审稿人，对下面的研究题目做一次独立、挑错优先的 Stage B 前审批分析。不要默认接受已有结论，也不要因为题目已经通过内部 Stage A 就提高评价。你的任务不是润色，而是判断它是否仍有可信的二区论文形状、Stage B 是否值得投入，以及怎样用最少实验尽快证伪。

## 评审原则

1. 研究对象必须保持不变：同一 SQL 查询、统计信息、merge-join 物理模型、bushy plan space、最终排序要求、DPomega 的 Ω-condition 和同一估计成本模型。
2. 候选必须返回与精确基线相同的全局最优 join-and-sort 计划成本；不得通过缩小 plan space、改变统计、删除排序状态或换用近似目标获得收益。
3. 必须公平扣除 DPomega、interesting orders、plain-join A*、DPconv、通用状态压缩、memoization、哈希压缩和普通表示工程。
4. 不要把小规模穷举、代理成本或结构性状态减少写成自然数据库性能结果。
5. 任何主张都必须完整计入 signature 构造、比较、哈希、查表、队列、下界计算、内存、临时空间和失败回退。
6. 没有发现直接论文碰撞只能写“检索范围内未闭合”，不能声称全局新颖。
7. 如果现有正结果只够说明工程压缩、而不够形成非平凡 N2 算法贡献，请明确建议停止。

## 题目

`S6-JS-PREFIXBOUND`：Exact prefix quotient and admissible-bound search for join-and-sort planning。

这里的 JS 是 Join-and-Sort，不是 JavaScript。

## 精确研究问题

在 DPomega 定义的 exact merge-join join-and-sort 对象内，能否证明一个对所有合法未来 merge continuation 都安全的 order-prefix quotient，并在 quotient state space 上使用 admissible lower bound，从而在不改变查询语义、物理计划空间和全局最优估计成本的前提下，减少优化器保留状态、内存或搜索成本？

候选贡献路线是 N2：新的精确状态等价关系、紧凑表示和精确搜索结构。普通调参、阈值、缓存包装或只改变遍历顺序不算贡献。

## 最近工作与公平扣除

- DPomega（VLDB Journal 2025）拥有同对象的 exact join-and-sort DP 与 Ω-condition。
- Selinger interesting orders、Neumann–Moerkotte order optimization 和 order-enforcement cost 是经典属性状态基线。
- Haffner–Dittrich（PACMMOD/SIGMOD 2023）拥有 plain-join shortest-path/A*。
- DPconv（PACMMOD/SIGMOD 2024）拥有 plain-join subset-convolution acceleration。
- exhaustive enumeration / MILP 只作小实例 exactness oracle。
- PostgreSQL 12.4 默认优化器只作部署基线，不是同对象 exact baseline。

截至内部冻结日，没有在限定检索内发现“同一 Ω-condition join-and-sort 对象上的安全 prefix quotient + admissible relaxed search”直接吸收，但最新碰撞仍未完全关闭。

## Stage A 初始验证

内部实现了 exact order-state DP、quotient DP、future-equivalence 反例搜索和 admissible-bound 审计：

- 穷举 19,440 个冻结的小型 join-and-sort 实例；
- exact optimum mismatch：0；
- future-equivalence counterexample：0（只限冻结有限域）；
- bound overestimate：0 / 404,479；
- exact states / quotient states：404,479 / 389,774；
- exact transitions / quotient transitions：877,024 / 873,661；
- 聚合状态减少约 3.64%，转移减少约 0.38%；
- 超过一半实例没有状态减少；
- 只比较最终 Ω 的弱 signature 被 69,920 个反例否定；
- JOB 4a 只使用自然 join graph 结构和代理成本：29→24 states，44→41 transitions，最优代理成本相同。

这些结果不构成无界定理、DPomega 代码复现、PostgreSQL 集成或自然 workload 性能证据。

## 唯一修订与完整计价结果

初始 full-vector signature 被完整成本吸收：它比 exact 基线多保留约 32.75 MB payload，且工作量更差。预登记的一次 compact representation 被启用，并保持与 full-vector 完全相同的 quotient classes。

修订后的关键结果：

- exact / compact states：404,479 / 389,774；
- exact / compact transitions：877,024 / 873,661；
- compact retained payload 相对 exact 减少 601,569 bytes，即 2.8743%；
- compact work residual（含 bound oracle）为 −64,616,558 units；
- compact 在两次重放中都比 exact 更慢；
- optimum mismatches：0；
- compact-equivalence mismatches：0；
- bound overestimates：0 / 404,479；
- 非易变结果双重重放一致。

因此当前唯一正结果是“小而确定的持久表示空间减少”。没有速度提升、工作量减少、廉价启发式、自然数据库内存结果或论文主结论。

## 独立 Stage A gate 的判断

独立 gate 以 0.88 置信度建议进入用户 Stage B 审批，质量档仅为 `TIER_B_Q2_VIABLE`。理由是：完整计价后仍保留 2.87% 的同对象表示空间残余，足以证明有限非空性；但 full-vector 已失败、compact 仍先构造 full-vector、bound 只适合审计且很昂贵、缺少 DPomega executable fidelity，也没有自然 full-cost 结果。

## 拟议 Stage B 工作包

请重点审查以下分阶段方案是否足够、是否应重排，以及是否存在更快的科学否决门。

### B0：理论与表示杀手门

- 证明或独立机械验证无界 future-equivalence；
- 证明 lower bound 的 admissibility；
- 推导无需先构造 full-vector 的直接 compact characterization；
- 若做不到，证明 full-vector 构造成本在自然规模不会吞没内存收益；
- 如果只剩普通向量压缩或 hash-consing，立即停止。

### B1：同对象基线忠实度

- 从公开论文定义忠实重建 executable DPomega exact core；
- 冻结相同 statistics、Ω-condition、merge-join plan space、最终 order 与 cost model；
- 小实例以 exhaustive/MILP 交叉验证 optimum；
- 不允许以 PostgreSQL 默认优化器替代 exact baseline。

### B2：自然与规模证据

- 使用 JOB、TPC-DS、SYN/SYN-S；
- 同时报告 optimizer wall/CPU、process peak RSS、真正 retained representation bytes、states、transitions、signature/bound/precompute/queue 成本；
- 区分 estimated plan cost、optimizer cost 和执行期 query runtime；
- 预登记 star/snowflake/dense/few-join/no-interesting-order 等无收益区；
- 如果完整成本下没有稳定 retained/process-memory residual，停止。

### B3：碰撞和论文形状

- 补查最新 physical-property optimization、exact query optimization、state quotient、automata/min-plus DP、A* 和表示压缩工作；
- 判断剩余贡献是否真的是 target-specific exact optimizer algorithm，而非通用状态压缩；
- 仅在理论、忠实度、自然 full-cost 和碰撞均闭合后讨论论文定位。

## 请回答的核心问题

1. 这个题目当前是否值得批准 Stage B？请给 `批准 / 有条件批准 / 不批准` 三选一。
2. 2.8743% 的有限表示空间残余，在没有速度和工作量优势时，是否足以支持可信二区论文路线？为什么？
3. “直接 compact characterization”需要达到什么技术深度，才能避免退化成普通数据结构压缩？
4. 当前 future-equivalence 和 admissibility 的无界证明最可能在哪些边界失败？请主动构造反例方向。
5. DPomega 忠实重建最低必须覆盖哪些状态、剪枝和成本语义？
6. Stage B 的第一项不可逆杀手实验或形式检查应是什么？
7. 哪些已有工作可能直接吸收或大幅压缩贡献？请优先使用一手论文、官方 artifact 和当前可定位材料。
8. 如果最终只能得到 2–5% 内存减少、速度持平或更慢，它仍能否形成二区论文？还必须补上什么非平凡结果？
9. 是否应删除昂贵 bound，把论文缩为 exact quotient representation？这样是否仍有足够贡献？
10. 给出最小 Stage B 工作包、停止条件、资源范围和预期证据上限。

## 要求的输出格式

请按以下结构回答：

1. 一句话裁决；
2. 最强支持理由；
3. 三个最危险的科学问题；
4. 与最近工作的逐项扣除矩阵；
5. 理论/实现/实验三个层面的最早 falsifier；
6. 你建议的 Stage B 分阶段计划；
7. 每阶段的明确停止条件；
8. 完整成本清单；
9. 二区与一区证据差距；
10. 最终审批建议以及是否需要修改题目或主张。

请不要用“有潜力”“值得尝试”等泛泛措辞替代判断；所有正面评价必须说明尚未闭合的条件，所有否定评价必须区分科学反证与资源/实现缺失。

