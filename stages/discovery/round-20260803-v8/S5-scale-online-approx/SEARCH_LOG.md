# S5 搜索日志

- 搜索日期：2026-08-03（Asia/Shanghai）
- 搜索模式：deep-research 的 bibliography + source-verification + synthesis + devil's-advocate 轻量流程
- 检索边界：公开网页、官方 proceedings、arXiv/OpenReview、官方 LLVM 文档；未使用私有数据库或用户未提供的文献库
- 结果性质：回测前 raw reconnaissance，不是系统综述或候选新颖性审计

## 预注册搜索框架

### 数据源

- USENIX conference pages / PDFs
- PMLR、MLSys、ICLR、NeurIPS 官方 proceedings
- arXiv 原始条目与论文正文页面
- OpenReview 原始 forum/PDF
- LLVM 官方文档、开发者会议与 mailing-list 工程材料

### 主关键词族

- exact / optimal / ILP / CP-SAT / min-cost flow / assignment
- scale / scalable / hierarchical / decomposition / incremental
- online / streaming / dynamic / drift / unknown future / recourse
- approximate / anytime / gap / bound / certificate
- GPU register allocation / instruction scheduling / JIT
- collective synthesis / process group / dynamic topology
- MoE token routing / capacity / load balance
- prefix KV cache / eviction / placement / distributed
- tensor rematerialization / dynamic graph
- dynamic ANN / insert / delete / maintenance

### 纳入标准

- 直接涉及 O5 的规模、在线信息或近似转换；
- 能确定 exact object、算法动作或定量结果；
- 原始论文/官方页面可访问；
- 2020–2026 为主，基础工作可更早；
- 至少保留一份削弱或覆盖 raw idea 的反证来源。

### 排除标准

- 二次聚合页面作为唯一证据；
- 只有单 issue、博客口号或产品营销；
- 与 exact object 无关的通用调度/缓存论文；
- 无法确认题名、作者或原始入口；
- 仅凭 limitation 句子生成题目。

## 查询记录

下列字符串记录了本轮主要查询族；搜索引擎会做同义扩展，故结果数不作为 PRISMA 计数。

### Q1：collective synthesis 的规模与动态性

```text
TACCL scalable collective synthesis thousands GPUs hierarchical
TACOS topology-aware collective synthesizer polynomial time
ForestColl throughput-optimal heterogeneous network fabrics
PCCL process group aware scalable generic collective synthesizer
online adaptive collective communication changing network conditions GPU
dynamic hierarchical Birkhoff von Neumann all-to-all GPU
```

关键保留：

- [TACCL, NSDI 2023](https://www.usenix.org/conference/nsdi23/presentation/shah) — 官方 proceedings，同行评审。
- [ForestColl, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/zhao-liangyu) — 官方 proceedings，同行评审。
- [HeteCCL, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/hei) — 官方 proceedings，同行评审。
- [PCCL, arXiv:2606.07019](https://arxiv.org/abs/2606.07019) — `PREPRINT_RECENT`。
- [Dynamic Hierarchical BvN, arXiv:2602.22756](https://arxiv.org/abs/2602.22756) — `PREPRINT_RECENT`。
- [TACOS, arXiv:2304.05301](https://arxiv.org/abs/2304.05301) — 预印本。

搜索结论：静态扩展性、异构拓扑、process group 和在线层次 All-to-All 均已有直接工作；一般 collective 的“增量 schedule 修复成本”仅为 `NOT_FOUND_WITHIN_SEARCH`。

### Q2：联合寄存器分配/指令调度与 GPU JIT

```text
constraint programming integrated register allocation instruction scheduling Unison
GPU min-reg scheduling optimal heuristic CP-SAT
GPU register allocation instruction scheduling JIT compile time
LLVM MLGO register allocation production
RL4ReAl reinforcement learning register allocation LLVM
```

关键保留：

- [Combinatorial Register Allocation and Instruction Scheduling](https://arxiv.org/abs/1804.02452) — 原始预印本；题名/作者/摘要核验。
- [Optimal and Heuristic Min-Reg Scheduling Algorithms for GPU Programs](https://arxiv.org/abs/2303.06855) — 原始预印本；未找到正式 proceedings 版本，记为 `PREPRINT_ONLY_WITHIN_SEARCH`。
- [RL4ReAl, CC 2023](https://research.google/pubs/rl4real-reinforcement-learning-for-register-allocation/) — 作者机构 publication page。
- [LLVM MLGO current documentation](https://www.llvm.org/docs/MLGO.html) — 官方部署/接口文档，不作新颖性证据。
- [LLVM GPU backend engineering discussion](https://lists.llvm.org/pipermail/llvm-dev/attachments/20211111/3a076e0b/attachment.html) — 灰色工程材料，只用于自然需求动机。

负向/邻接结果：MLGO/RL4ReAl 已覆盖 learned register allocation；Unison 已覆盖联合优化。没有在本轮范围内找到同时满足“GPU JIT、联合动作、anytime gap certificate、自然 large fused regions”的同对象论文，分类 `SEARCH_BOUNDED_OPEN`。

### Q3：MoE 的全批最优与在线路由

```text
BASE Layers balanced assignment experts linear assignment
mixture of experts capacity aware inference token reroute
maximum score routing minimum-cost maximum-flow MoE
online token expert assignment capacity matching inference
phi balancing online mirror descent mixture of experts
Mixture-of-Experts Serving online competitive algorithm GPU assignment
```

关键保留：

- [BASE Layers, ICML 2021](https://proceedings.mlr.press/v139/lewis21a.html) — 官方 PMLR。
- [Capacity-Aware Inference](https://arxiv.org/abs/2503.05066) — 原始预印本。
- [MaxScore](https://arxiv.org/abs/2508.12801) — 原始预印本。
- [φ-balancing, ICML 2026](https://openreview.net/forum?id=DZbzIOguz4) — OpenReview 会议页面。
- [Mixture-of-Experts Serving](https://arxiv.org/abs/2607.17880) — `PREPRINT_RECENT`，动作是 GPU replica allocation。
- [Expert activation pattern profiling](https://arxiv.org/abs/2604.23150) — `PREPRINT_RECENT`。

搜索结论：全批 flow、推理 reroute、在线 population balance 和在线 expert capacity placement 均已有。仅“streaming token b-matching + bounded recourse + communication/quality ledger”保留为窄 residual。

### Q4：prefix KV cache 的在线与分布式动作

```text
SGLang RadixAttention prefix cache
Preble distributed prompt scheduling prefix sharing
semantic-aware online eviction LLM prefix cache
hierarchical context cache Strata
distributed prefix DAG eviction placement routing unknown future
```

关键保留：

- [SGLang](https://arxiv.org/abs/2312.07104) — 原始论文与开源 artifact 入口。
- [Preble, ICLR 2025](https://proceedings.iclr.cc/paper_files/paper/2025/hash/5bc342f48de8264779952fac378f96dc-Abstract-Conference.html) — 官方 proceedings。
- [SAECache](https://arxiv.org/abs/2605.18825) — `PREPRINT_RECENT`。
- [Strata, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/xie-zhiqiang) — 官方 proceedings。
- [SYMPHONY, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/agarwal) — 官方 proceedings。
- [Sparse Prefix Caching for Hybrid and Recurrent LLM Serving](https://arxiv.org/abs/2605.05219) — `PREPRINT_RECENT`，包含 exact DP。

搜索结论：该谱系对 reuse-aware scheduling、online eviction、hierarchical cache、disaggregated memory 已高度覆盖。DAG ancestor value 与多副本迁移预算的严格在线算法为 `NOT_FOUND_WITHIN_SEARCH`，但 union 风险高。

### Q5：dynamic tensor rematerialization

```text
Checkmate optimal tensor rematerialization MILP
Dynamic Tensor Rematerialization online dynamic models
hierarchical rematerialization thousands graph nodes
online rematerialization certificate dynamic computation graph
```

关键保留：

- [Checkmate, MLSys 2020](https://proceedings.mlsys.org/paper_files/paper/2020/hash/0b816ae8f06f8dd3543dc3d9ef196cab-Abstract.html) — 官方 proceedings。
- [Dynamic Tensor Rematerialization](https://arxiv.org/abs/2006.09616) — 原始预印本。
- [HiRemate, ICML 2025](https://proceedings.mlr.press/v267/gusak25a.html) — 官方 PMLR。

搜索结论：在线入口与层次扩展入口均已直接覆盖；仅动态前缀 gap/certificate 残余未找到同对象，但可能只是一项 analysis add-on。

### Q6：动态/流式 ANN

```text
dynamic approximate nearest neighbor billion scale updates
Quake adaptive indexing dynamic skewed workload
IP-DiskANN in-place updates streaming ANN
OdinANN direct insert billion-scale
Slipstream streaming graph index construction
MERIT in-place deletion dynamic graph ANN
```

关键保留：

- [DiskANN, NeurIPS 2019](https://proceedings.neurips.cc/paper/2019/hash/09853c7fb1d3f8ee67a61b6bf4a7f8e6-Abstract.html) — 官方 proceedings。
- [Quake, OSDI 2025](https://www.usenix.org/system/files/osdi25-mohoney.pdf) — 官方论文 PDF。
- [IP-DiskANN](https://arxiv.org/abs/2502.13826) — 原始预印本。
- [OdinANN, FAST 2026](https://www.usenix.org/conference/fast26/presentation/guo) — 官方 proceedings。
- [Slipstream](https://arxiv.org/abs/2606.02992) — `PREPRINT_RECENT`。
- [MERIT](https://arxiv.org/abs/2607.29173) — `PREPRINT_VERY_RECENT`，仅核验原始条目，未做同行评审强度推断。

搜索结论：若 exact object 只是动态偏斜下的自适应维护、insert/delete 局部修复或流式构图，已有直接覆盖。本轮将其保留为负向 raw，不建议收敛。

### Q7：补充的量化与自动调优排查

```text
online post-training quantization dynamic calibration LoRA updated weights
runtime quantized layer swapping dynamic workload
GPU kernel autotuning dynamic shapes online compile time
offline-to-online compiler autotuning
```

代表性碰撞：

- [MorphServe, MLSys 2026](https://proceedings.mlsys.org/paper_files/paper/2026/hash/8144a9d62e506af0fcdeac0e456b2710-Abstract-Conference.html) 已覆盖动态 workload 下 runtime quantized layer swapping。
- [DietCode, MLSys 2022](https://proceedings.mlsys.org/paper_files/paper/2022/hash/f89b79c9a28d4cae22ef9e557d9fa191-Abstract.html) 已覆盖 dynamic-shape 的统一 auto-scheduling search space。
- [WarmTuner](https://arxiv.org/abs/2607.25831) 已直接使用 offline-to-online RL 做 compiler autotuning。
- [Tensor Language Model, OSDI 2024](https://www.usenix.org/conference/osdi24/presentation/zhai) 已显著降低 tensor program exploration 编译成本。

结论：未把“在线量化/在线 autotuning”作为独立 raw，以避免从流行技术词反推 wrapper/controller。

## 来源存在性与质量核验

| 来源类型 | 核验方式 | 本轮处理 |
|---|---|---|
| USENIX/PMLR/MLSys/ICLR/NeurIPS | 官方 proceedings 页面或官方 PDF | 题名、作者/venue、摘要与报告数值可见；作为主要来源 |
| arXiv | 原始 `arxiv.org/abs/...` | 确认条目存在；2026 新稿标记近期预印本 |
| OpenReview | 原始 forum/PDF | 确认会议状态或原始稿；页面挑战导致正文不可见时不扩写超出搜索摘要的结论 |
| LLVM | `llvm.org` 文档/会议材料/mailing list | 只作 artifact 与工程动机，不赋予同行评审权重 |

未发现疑似伪造的引用。没有对全部条目执行 DOI resolve 或 Semantic Scholar/OpenAlex/Crossref API 三索引核验；这一限制已显式记录。

## 分布偏斜提示

`DISTRIBUTIONAL_SKEW_ADVISORY`

- 维度：时间分布
- 集中：2025–2026 工作占保留碰撞材料的多数
- 原因：任务要求当前 scale/online/approx 机会，且这些领域变化很快
- 响应：为每条谱系加入至少一个 2019–2023 anchor（Unison、BASE、TACCL、Checkmate/DTR、DiskANN/SGLang），但不以历史比例推断新颖性

`DISTRIBUTIONAL_SKEW_ADVISORY`

- 维度：方法分布
- 集中：系统/算法/编译器实验与预印本为主
- 原因：项目范围与 S5 mode 所致
- 响应：在可行处加入 complexity/competitive/gap 目标；未强行补入无关的经验或硬件论文

## 生产性收敛刷新（回测 CALIBRATED 后）

本节不继承 raw 阶段的 `SEARCH_BOUNDED_OPEN`。2026-08-03 再次按三遍发现法检索，并以当前同对象竞争机制决定收敛。

### 新增查询族与一手材料

```text
GPU joint instruction scheduling register allocation occupancy tier JIT 2025 2026
AMDGPU machine scheduler register allocation occupancy LLVM
online token routing MoE inference capacity reroute 2026 Waterfill LPLB
distributed prefix cache affinity load balancing online eviction 2026 DualMap
dynamic collective reconfiguration process group schedule 2026
dynamic rematerialization hierarchical 2025
adaptive vector index maintenance recall target dynamic skewed workload
```

- GPU codegen：LLVM 当前 [GCNSchedStrategy](https://llvm.googlesource.com/llvm-project/%2B/refs/tags/llvmorg-18.1.2/llvm/lib/Target/AMDGPU/GCNSchedStrategy.cpp) 表明 scheduler 已以 occupancy/register pressure 为一等工程指标；[MLGO 文档](https://llvm.org/docs/MLGO.html) 确认其 register-allocation 入口是 greedy eviction heuristic；[RL4ReAl, CC 2023](https://research.google/pubs/rl4real-reinforcement-learning-for-register-allocation/) 仅评估 x86/AArch64。结果：只把「AMDGPU multi-bank occupancy tier + joint schedule/allocation + fixed-budget certificate」送入独立 Stage 0。
- MoE：除 Capacity-Aware Inference 与 Stable-MoE 外，NVIDIA/SGLang 的 [Waterfill + LPLB](https://www.lmsys.org/blog/2026-06-26-waterfill-lplb) 已在 dispatch-time 实现轻量负载平衡与 LP replica dispatch。结果：`S5-RAW-02` DROP，避免把 online balancing 换名。
- Prefix serving：[DualMap](https://arxiv.org/abs/2602.06502) 同时主张 cache affinity、load balance、SLO routing、hotspot rebalance 与 scale handling；结果：`S5-RAW-04` DROP，避免把 placement/eviction/routing 拼成 union。
- Collectives：[ForestColl, NSDI 2026](https://www.usenix.org/conference/nsdi26/presentation/zhao-liangyu) 已为任意拓扑生成 throughput-optimal schedule；[Dynamic hierarchical BvN](https://arxiv.org/abs/2602.22756) 已在两层 GPU All-to-All 给出 online/stability object。结果：`S5-RAW-03` DROP。
- Rematerialization：[HiRemate, ICML 2025](https://proceedings.mlr.press/v267/gusak25a.html) 已用 recursive partition/multilevel solver 扩展至数千 nodes。结果：`S5-RAW-05` DROP。
- ANN：[Quake, OSDI 2025](https://www.usenix.org/system/files/osdi25-mohoney.pdf) 直接以动态 skewed workload、cost-guided maintenance、query parameters 与 recall target 为 exact object。结果：`S5-RAW-06` `DIRECT_FATAL`/DROP。

### 生产性检索限制

1. 公共网页/论文索引不能保证全球穷尽；所有新颖性只写到 `SEARCH_BOUNDED_OPEN`。
2. 2026 arXiv/工程材料按 preprint 或 deployment baseline 处理，不抬升为同行评审结论。
3. GPU candidate 的实机 timing 仍待后续授权/资源；在此之前只主张 compiler-analysis 和同语义 software evidence。

## 搜索限制

1. 这是启动期侦察，不是 PRISMA 系统综述；没有报告搜索引擎总命中数。
2. 近期 2026 arXiv 论文可能尚未同行评审或之后发生版本变化。
3. 没有访问订阅数据库全文；同题但未被公开索引的工作可能遗漏。
4. 没有对公开代码做 build/run，所有定量锚点均为论文自报。
5. 没有 S5 历史回测 handoff；因此搜索方法尚不能生产化。
6. `NOT_FOUND_WITHIN_SEARCH` 只表示本轮给定查询与公开来源未找到，不等于首次。
