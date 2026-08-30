# O3 自然结构检索日志

- 检索日期：`2026-08-03`
- 截止认知日期：检索当日
- 语言：英文为主
- 来源策略：论文原文/预印本、官方项目仓库、官方框架文档、官方数据发布
- 本轮目的：startup raw scouting；不是系统综述，也不是 novelty clearance

## 可复现策略

### Pass 1：先找可冻结的自然载体

查询式族：

```text
Criteo Terabyte dataset 26 categorical features 24 days official
DLRM public dataset embedding access trace temporal locality
AMReX dynamic regridding MLMG rebuild hierarchy
AMReX multigrid regrid setup incremental
SuiteSparse graph matrices repeated SpGEMM row similarity
SpGEMM symbolic phase row clustering B reuse
HPRC GBZ version graph haplotype update dynamic GBWT
TorchInductor compilation trace TorchBench TritonBench compile cache
```

要求先找到公开 workload、官方 loader 或可重放 trace。只有能保存对象版本、输入次序、软件版本和 hash 的载体才进入保留集；合成输入只能作为诊断。

### Pass 2：从结构到至少两个非同义机制

```text
embedding cross table co-access correlation cache
embedding tuple locality recommendation system
adaptive mesh refinement incremental multigrid hierarchy update
dynamic AMR local regrid solver setup reuse
SpGEMM identical rows shared symbolic computation
SpGEMM motif reuse symbolic union
pangenome graph incremental topology haplotype index
tensor program near isomorphic schedule transfer dynamic shapes
compiler graph edit schedule reuse legality
```

本 pass 的保留条件不是“能加一个 cache”，而是能写出明确数据结构、更新动作、成本项、精确语义和 fallback。

### Pass 3：反向碰撞和反例

```text
RecShard MTrainS DreamShard embedding placement cache
adaptive local multigrid regridding reuse
Ocean SpGEMM symbolic HLL hierarchical clustering GPU
DynamicGBWT merge deletion ODGI dynamic graph GBZ edits
PyTorch MegaCache dynamic shapes DISC TLP AutoTVM Gensor
incremental sparse convolution temporal point cloud INS-Conv
temporal graph neural network cross batch cache SlimCache
MoE expert activation trace cache aware routing
attention top-k index reuse across layers Kascade
```

检索同时寻找“已有工作已经做了什么”和“哪种自然结构可能不存在”。任何只靠改应用名维持的新意都直接排除。

## 来源账本

### RO-S3-01 / DLRM

| 类型 | 来源 | 用途 |
|---|---|---|
| 官方数据 | [Criteo Terabyte dataset release](https://www.criteo.com/news/press-releases/2015/07/criteo-releases-industrys-largest-ever-dataset/) | 冻结真实 24 天、40 亿级点击记录与字段语义 |
| 官方实现 | [facebookresearch/dlrm](https://github.com/facebookresearch/dlrm) | 数据预处理、DLRM 参考语义 |
| 官方实现 | [TorchRec](https://github.com/meta-pytorch/torchrec) | 强工程 planner/cache baseline |
| 论文 | [RecShard](https://arxiv.org/abs/2201.10095) | table/row skew、分片与内存层次碰撞 |
| 论文 | [MTrainS](https://arxiv.org/abs/2305.01515) | embedding 时间局部性与训练系统碰撞 |
| 论文 | [DreamShard](https://arxiv.org/abs/2210.02023) | learned table placement 碰撞 |

结论边界：来源支持单表 skew 和时间局部性，但未直接证明控制边际热度后的跨表 row-ID 相关；该结构仍需 trace 测量。

### RO-S3-02 / AMR

| 类型 | 来源 | 用途 |
|---|---|---|
| 官方实现 | [AMReX repository](https://github.com/amrex-codes/amrex) | 动态 AMR miniapp 与可执行载体 |
| 框架论文 | [AMReX: Block-Structured AMR Software Framework](https://arxiv.org/abs/2009.12009) | workload 与软件模型 |
| 官方文档 | [AMReX Linear Solvers / MLMG](https://amrex-codes.github.io/amrex/docs_html/LinearSolvers.html) | hierarchy 构造输入与 solver 语义 |
| 官方文档 | [AMReX documentation](https://amrex-codes.github.io/amrex/docs_html/) | regrid、BoxArray 与 DistributionMapping 语义 |
| 论文 | [Adaptive geometric multigrid](https://arxiv.org/abs/1904.03317) | adaptive/local multigrid 邻域碰撞 |
| 论文 | [Parthenon](https://arxiv.org/abs/2202.12309) | 另一公开 block-structured AMR 载体 |
| 近期预印本 | [cuRAMSES](https://arxiv.org/abs/2604.06035) | GPU AMR 执行与当前系统边界 |
| 近期预印本 | [RAMSES-GPU](https://arxiv.org/abs/2607.20704) | 最新 AMR/GPU 碰撞检查 |

结论边界：框架支持“regrid 后层次随 grids 改变”，但“影响锥通常很小”尚无数据，不能写成已知规律。

### RO-S3-03 / SpGEMM

| 类型 | 来源 | 用途 |
|---|---|---|
| 官方实现 | [SuiteSparse](https://github.com/DrTimothyAldenDavis/SuiteSparse) | 公开矩阵工具、GraphBLAS/SpGEMM baseline |
| 近期预印本 | [Ocean](https://arxiv.org/abs/2604.19004) | symbolic pass 成本与 probabilistic sizing 强碰撞 |
| 近期预印本 | [Hierarchical clustering SpGEMM](https://arxiv.org/abs/2507.21253) | row reordering、cluster-wise B reuse 直接碰撞 |
| 论文 | [SpArch](https://arxiv.org/abs/2002.08947) | SpGEMM 数据流/体系结构基线 |
| 综述 | [GPU SpGEMM systematic review](https://arxiv.org/abs/2002.11273) | 算法分类与 baseline 覆盖 |
| 论文 | [GE-SpMM](https://arxiv.org/abs/2007.03179) | 相邻图稀疏乘内存优化，防止把 SpMM 收益混入 |

结论边界：已有工作证明聚类/复用可以有效，但 exact-equal 或 low-delta symbolic signature 在指定自然矩阵上的覆盖率未知。

### RO-S3-04 / Pangenome

| 类型 | 来源 | 用途 |
|---|---|---|
| 官方实现 | [vg](https://github.com/vgteam/vg) | GBZ/GFA 处理、HPRC 公开载体 |
| 论文 | [GBWT](https://pmc.ncbi.nlm.nih.gov/articles/PMC7223266/) | 动态构建、merge、path deletion 与压缩路径基线 |
| 论文 | [Haplotype matching with GBWT](https://pmc.ncbi.nlm.nih.gov/articles/PMC11838520/) | 当前 GBWT 查询/结构能力 |
| 论文 | [GBZ file format](https://academic.oup.com/bioinformatics/article/38/22/5012/6731924) | graph+haplotype 联合压缩对象 |
| 官方说明 | [vg HPRC/Giraffe wiki](https://github.com/vgteam/vg/wiki/Mapping-long-reads-with-Giraffe) | HPRC GBZ 实际数据入口 |
| 论文 | [ODGI](https://academic.oup.com/bioinformatics/article/38/13/3319/6585331) | 动态图表示直接相邻项 |
| 近期预印本 | [Dynamic r-index](https://arxiv.org/abs/2504.19482) | 动态压缩文本索引碰撞 |
| 近期论文 | [Lossless pangenome indexing with tag arrays](https://drops.dagstuhl.de/storage/00lipics/lipics-vol344-wabi2025/LIPIcs.WABI.2025.8/LIPIcs.WABI.2025.8.pdf) | 最新压缩泛基因组索引碰撞 |

结论边界：basic incremental GBWT 已直接存在；只有 topology 与 haplotype index 的一致联合更新可能有残差，而且尚未通过版本差分验证。

### RO-S3-05 / Tensor compiler

| 类型 | 来源 | 用途 |
|---|---|---|
| 官方发布 | [PyTorch 2.7 / Mega Cache](https://pytorch.org/blog/pytorch-2-7/) | exact artifact reuse 强基线 |
| 官方经验 | [Reducing PyTorch 2 compilation time](https://pytorch.org/blog/experience-in-reducing-pt2-compilation-time-for-meta-internal-workloads/) | 真实编译时间构成与 cache 命中证据 |
| 官方教程 | [torch.compile caching tutorial](https://docs.pytorch.org/tutorials/recipes/torch_compile_caching_tutorial.html) | cache 语义与可重放协议 |
| 官方基准 | [TorchBench](https://github.com/pytorch/benchmark) | 模型与编译 trace 载体 |
| 官方基准 | [TritonBench](https://github.com/meta-pytorch/tritonbench) | Triton kernel 载体 |
| 论文 | [DISC](https://arxiv.org/abs/2103.05288) | 动态 shape 编译碰撞 |
| 论文 | [Learning to Optimize Tensor Programs / AutoTVM](https://arxiv.org/abs/1805.08166) | learned cost-model transfer 基线 |
| 论文 | [TLP](https://arxiv.org/abs/2211.03578) | schedule performance model transfer 碰撞 |
| 近期预印本 | [Gensor](https://arxiv.org/abs/2502.11407) | graph-based schedule search 碰撞 |
| 论文 | [Korch](https://arxiv.org/abs/2406.09465) | kernel orchestration 相邻项 |
| 近期预印本 | [Event Tensor](https://arxiv.org/abs/2604.13327) | 最新 tensor compiler 表示碰撞检查 |

结论边界：官方来源证明 compile cache 与 compile-time 问题真实存在，但 near-isomorphic cache misses 的数量和可迁移合法性尚未测量。

## 排除账本

| 被排除的简单命题 | 直接相邻来源 | 处理 |
|---|---|---|
| 在线点云中只更新变化的 sparse convolution | [INS-Conv, CVPR 2022](https://openaccess.thecvf.com/content/CVPR2022/html/Liu_INS-Conv_Incremental_Sparse_Convolution_for_Online_3D_Segmentation_CVPR_2022_paper.html) | 已有 exact incremental sparse convolution；换到类似传感器流是改名，`DIRECT_FATAL` |
| TGNN 跨 batch 缓存重复邻居/数据 | [SlimCache, FAST 2026](https://arxiv.org/abs/2607.05095), [TGL](https://arxiv.org/abs/2203.14883) | cross-batch caching 与 topology-aware sampling 已明确出现，`DIRECT_FATAL` |
| 按激活局部性缓存/放置 MoE 专家 | [MoE activation pattern study](https://arxiv.org/abs/2604.23150), [Cache-Conditional Experts](https://arxiv.org/abs/2412.00099) | 单纯 characterization+controller 过于拥挤，不保留 |
| 跨 attention layer 复用 top-k support | [Kascade](https://arxiv.org/abs/2512.16391) | 直接使用跨层 top-k index reuse，`DIRECT_FATAL` |

另检索过 [CacheBlend](https://arxiv.org/abs/2405.16444) 和 [AzurePublicDataset](https://github.com/Azure/AzurePublicDataset)。前者说明 KV reuse 已高度拥挤；后者目前公开的 LLM trace 主要是长度等统计，无法恢复 prompt 内容结构，因此不能作为“自然 prompt 片段重复”的同语义载体。

## 检索局限与下一轮要求

1. 本轮为 method v2 回测前的 bounded scouting，没有进行穷尽式引用追踪、作者/专利检索或逐篇复现实验。
2. 搜索引擎返回数量随时间变化，因此没有把不稳定的命中总数当复现依据；保留了 query family、实际使用来源和结论边界。
3. 2025–2026 预印本只用于当前碰撞预警，正式 brief 前必须检查后续版本、发表状态、代码和引用链。
4. 回测通过后应先测结构，而不是先实现机制。顺序为：冻结载体与 hash → 测结构强度/稳定性 → 运行最早杀手基线 → 再决定是否写 grounded brief。
5. RO-S3-04 的碰撞风险最高；若版本载体或剩余算法对象无法在一次 bounded search 内确认，应优先丢弃，不延伸成万能动态索引。

## 生产性收敛检索（2026-08-03）

本节在 O3 回测 `CALIBRATED` 后执行。此前 raw 阶段的 `SEARCH_BOUNDED_OPEN` 没有被继承为新颖性结论；以下检索专门用于按同一 exact object、目标、决策变量、成本边界和证据对象重新检查碰撞。

### 当前检索式

```text
"regridding" "multigrid" "reuse" adaptive mesh refinement
"incremental" "multigrid" "adaptive mesh refinement" hierarchy update
"embedding" "co-access" cache recommendation DLRM
"correlated embedding" caching recommender systems
"schedule transfer" tensor compiler dynamic shape compilation reuse
TVM MetaSchedule workload similarity reuse tuning results dynamic shapes
Triton compiler autotuning cache similar shapes schedule transfer
"hierarchical clustering" SpGEMM row reuse 2025
"Ocean" SpGEMM symbolic phase HLL 2026
DynamicGBWT graph update pangenome topology path index ODGI
GBWT dynamic construction merge deletion pangenome index paper
```

### 生产性来源增补与裁决作用

| 对象 | 当前来源 | 作用 |
|---|---|---|
| DLRM | [UGache, ACM TOCS](https://doi.org/10.1145/3767725) | 直接显示 correlated embeddings 的 affinity placement 与 request dispatch 协同；`RO-S3-01` 的同对象机制碰撞 |
| AMR/MLMG | [Implicit adaptive mesh refinement for reduced MHD](https://www.sciencedirect.com/science/article/abs/pii/S0021999108003598) | 明确把 regrid 后仅对 newly created patches 进行 solver setup 作为已有策略；扣除 `RO-S3-02` 的基本动作 |
| AMR/MLMG | [AMReX MLMG documentation](https://amrex-codes.github.io/amrex/docs_html/LinearSolvers.html) | 核验 hierarchy 的 constructor、coarsening 与 recursive agglomeration/consolidation 成本范围 |
| SpGEMM | [Hierarchical clustering SpGEMM](https://arxiv.org/abs/2507.21253) | 2025 论文已以 row reordering + cluster-wise computation 改善 B reuse，并在 110 matrices 上给出预处理摊销证据 |
| SpGEMM | [Ocean](https://arxiv.org/abs/2604.19004) | 2026 论文直接攻击 symbolic pass，报告其平均约 28% runtime；扣除“共享 exact symbolic plan”单一主张 |
| Pangenome | [ODGI paper](https://pmc.ncbi.nlm.nih.gov/articles/PMC9237687/), [ODGI documentation](https://pangenome.github.io/odgi.github.io/) | 核验动态、node-local graph/path update 和 path index 工具能力，形成同对象直接碰撞 |
| Pangenome | [GBWT](https://academic.oup.com/bioinformatics/article/36/2/400/5538990) | 核验 GBWT merge/index construction 的动态基础能力 |
| Tensor compiler | [TVM MetaSchedule](https://tvm.apache.org/docs/deep_dive/tensor_ir/tutorials/meta_schedule.html) | 明确已有 cross-model database reuse 与 `anchor-block` equality（忽略外围 fusion boundary） |
| Tensor compiler | [AutoTVM](https://arxiv.org/abs/1805.08166), [TLP](https://arxiv.org/abs/2211.03578) | 核验 transfer-guided tensor-program tuning 的前置谱系 |
| Tensor compiler | [PyTorch Inductor configuration](https://github.com/pytorch/pytorch/blob/main/torch/_inductor/config.py), [Triton autotune docs](https://triton-lang.org/main/python-api/generated/triton.autotune.html) | 核验 production cache/autotuning 基线的实际存在与成本语义 |

### 生产性结论

检索没有留下能通过 seed-distance 且可冻结自然正证据的 residual。因此不以“检索范围未发现”为由提交任何新颖性结论；本批结论是 5 个 raw 项 `DROP`、0 个 grounded brief、0 个 `PROPOSE_STAGE0`。详见 `PROGRESS.md`。
