# O3 自然结构：非生产性 Raw Opportunities

> **阶段门：** 以下条目不是正式候选，不使用 `TOPIC_BRIEF` canonical 格式，不评分、不晋级，也不构成 Stage 0 提案。method v2 独立历史回测尚未完成；所有保留结论只是回测通过后可重新验证的侦察线索。

## 快速索引

| Raw ID | 暂定对象 | 自然结构假设 | 初步优先级 | 最大风险 |
|---|---|---|---|---|
| `RO-S3-01` | DLRM 跨表部分元组复用 | 同一请求内 embedding 行存在跨表共现 | 中高 | 被单表热度/已有 placement 完全解释 |
| `RO-S3-02` | AMR 重网格后的多重网格增量更新 | 局部 regrid 只改变层次依赖锥的一小部分 | 高 | coarse-level 传播使变更不再局部 |
| `RO-S3-03` | GPU SpGEMM 行签名与 motif 复用 | 多行产生相同或低差分的符号 union | 中 | 已有聚类重排吸收收益，预处理难摊销 |
| `RO-S3-04` | 版本化泛基因组拓扑—单倍型联合更新 | 新版本主要添加局部新颖路径片段 | 低—中 | DynamicGBWT/ODGI 已直接覆盖或更新范围过广 |
| `RO-S3-05` | 近同构张量程序的编译计划迁移 | 重复 block/动态 shape 形成小编辑图族 | 中高 | MegaCache、动态 shape 与已有迁移学习已吸收收益 |

## RO-S3-01：DLRM 跨表部分元组局部性

### 冻结对象与公开载体

对象是一次推荐请求中对 26 个 categorical embedding tables 的同时查找，特别是跨表 row-ID 的部分元组和共现子集，而不是单表行热度。

公开载体冻结为 Criteo Terabyte click logs 与 `facebookresearch/dlrm` 的数据预处理/加载语义。Criteo 官方说明该数据有超过 40 亿行、24 天记录、13 个数值特征和 26 个类别特征；按天保持记录次序并保存同一行的 26 个类别字段，才是本题需要的自然 trace。若授权或下载条件阻止保存原始数据，可用 DLRM 官方脚本产生的同语义 day shards，但不得把合成 Zipf 输入当主要证据。

### 已知事实与待测假设

- **来源支持：** RecShard 已表明 embedding table/row 访问分布不同且 skew 会影响分片；MTrainS 已利用 embedding 访问的时间局部性；TorchRec/DLRM 已提供强工程基线。
- **待测假设：** 在控制各表边际热度后，不同表的 row-ID 仍有稳定、跨日可泛化的条件共现；频繁部分元组能减少独立 cache-line 请求或远端查找。
- **不能预设：** 哈希、缺失值、OOV 或重复广告模板可能制造虚假的跨表相关。必须分别报告原字段、哈希后字段和去除常量/缺失值后的结果。

### 可检验机制

1. **共现 bundle 字典：** 对训练窗口中频繁且稳定的跨表部分元组建立精确 bundle，按 bundle 共置或批量发起查找；所有未命中走原始精确路径。
2. **带权超边预取/小集合缓存：** 以 table-row 为顶点、同请求共现为超边，按条件 lift 与字节成本选择少量相关行预取；成本模型显式计入错误预取、元数据和迁移。

二者都必须实现 lookup 等价性，不得退化成“检测相关性后调用既有 cache”的 wrapper。

### 必比基线与碰撞

- TorchRec/FBGEMM 默认 planner 与 cache；
- per-table LRU/LFU、仅按 row hotness 的理想化基线；
- RecShard、MTrainS、DreamShard；
- 使用未来 trace 的离线 oracle，仅作为收益上限。

RecShard 和 MTrainS 会直接扣除 table/row skew 与时间局部性贡献。只有“控制边际热度后的跨表相关”仍可显著降低端到端字节流量时，才存在剩余空间。

### 最早杀手实验

以若干训练日建模、后续完整日测试。若在同容量、同字节预算下，跨表 bundle/超边相对 per-table LFU/LRU 的可避免 cache-line 或远端请求下降不足 10%，或布局/元数据成本消除端到端收益，则停止。

### 当前缺口

尚未下载并冻结 Criteo trace，也没有跨日条件 lift、覆盖率和容量敏感性数据。回测通过前不执行该实验。

## RO-S3-02：局部 AMR regrid 的 delta multigrid hierarchy

### 冻结对象与公开载体

对象是 block-structured AMR 应用发生局部 regrid 后，对几何多重网格 operator、transfer、coarse/fine mask 和层次元数据的精确更新。

公开载体优先采用 AMReX 官方仓库中的动态 AMR miniapp（如 `AmrCoreAdv`/Advection 类教程）与 MLMG Poisson/heat solve。每次 regrid 冻结 `BoxArray`、`DistributionMapping`、边界条件、mask、系数和参考 full-rebuild 输出；不得手工制造“只改一格”的主 trace。

### 已知事实与待测假设

- **来源支持：** AMReX 是公开的 block-structured AMR 框架；MLMG 由 geometry、grids 和 distribution mapping 等构造，并生成可继续 coarsen 的层次。
- **待测假设：** 真实 regrid 序列中，大部分 fine boxes 和相应 coarse 依赖未变；受影响的 operator/transfer 可限制在从 changed boxes 向上的依赖锥。
- **关键反例：** 少量 fine-level 改动可能通过聚合、负载重映射或全局 coarse solve 扩散到大部分层次。

### 可检验机制

1. **持久化 region-keyed hierarchy DAG：** 以 box、coarsening relation 和 stencil dependency 为节点/边；regrid 时只失效 changed region、halo 与其祖先依赖锥，其余 operator 结构共享。
2. **结构哈希的版本化 patch delta：** 对局部 operator/transfer block 做内容寻址；以 add/remove/update patch 生成新版本，并在必要时退回完整 rebuild。更新后用残差、operator action 和迭代轨迹验证精确性。

算法贡献必须给出依赖锥、更新复杂度和 fallback 条件，不能只是缓存 AMReX 对象。

### 必比基线与碰撞

- 每次 regrid 后完整重建 AMReX MLMG；
- 无 regrid 时复用同一 solver 的理想上限；
- AMReX 的 HYPRE/MLMG 路径；
- adaptive/local multigrid 与 recent AMR GPU solver 工作。

已有 local/adaptive multigrid 会扣除“只在局部多做平滑”的宽泛贡献；剩余问题必须是 regrid 后 hierarchy/setup 的精确增量维护。

### 最早杀手实验

在至少三个官方动态 AMR 序列记录各层 changed dependency cone。若典型 regrid 的受影响 hierarchy 字节或构造工作经常超过完整层次的 40%，或 delta 更新加验证比 full setup 更慢，或 solve residual/iteration 超出预设等价容差，则停止。

### 当前缺口

尚无官方 miniapp 的 regrid delta trace、setup/solve 分解或跨层依赖传播测量；“局部”目前只是可证伪假设。

## RO-S3-03：GPU SpGEMM 的行签名与 motif union 复用

### 冻结对象与公开载体

对象是图邻接相关的 repeated SpGEMM 中，多行 `A[i,:]` 所引用的 `B` 行集合产生相同或低差分输出 column union 的情形，目标是复用 symbolic plan 并降低 numeric traversal。

公开载体为 SuiteSparse Matrix Collection 中可追溯的图矩阵及其确定性 SpGEMM 序列（如邻接矩阵平方/图算法产生的同语义乘法）。冻结矩阵来源、维度、稀疏格式、hash、乘法方向和重复次数；合成 power-law 图只可作诊断，不可作主要证据。

### 已知事实与待测假设

- **来源支持：** Ocean 报告 exact symbolic pass 平均约占运行时间的 28%，并用 HLL 估计替代精确符号阶段；2025 年的 hierarchical clustering SpGEMM 通过行重排和 cluster-wise `B` reuse 获得平均 1.39×，其预处理在约 90% 矩阵上可在 20 次 SpGEMM 内摊销。
- **待测假设：** 真实图矩阵中存在足够多的 exact-equal 或 bounded-delta row-neighborhood signatures，且可在不增加总内存流量的条件下共享精确 union plan。
- **不能预设：** 度数相同、Jaccard 相近或社区结构不等于 union plan 可复用。

### 可检验机制

1. **精确 canonical signature dictionary：** 对相同 `A` 邻域或相同被引用 `B`-row multiset 生成 canonical signature，只计算一次 symbolic union，numeric 阶段按行映射贡献。
2. **base-plus-delta motif cluster：** 选择一个 base union，对低差分行以稀疏 add/remove correction 更新；成本模型在字节、哈希、冲突和并行不均衡之间选择共享或独立执行。

### 必比基线与碰撞

- cuSPARSE、SuiteSparse/GraphBLAS 或 KokkosKernels 的相应 SpGEMM；
- Ocean 的 probabilistic symbolic sizing；
- 2025 hierarchical clustering SpGEMM；
- no-preprocessing 与 full preprocessing 两个边界。

行聚类和 `B` reuse 已是强直接相邻项。只有 exact plan reuse 或有界 delta correction 的新增算法与收益未被其吸收时才能继续；单纯换一种 clustering metric 属于改名。

### 最早杀手实验

在固定的约 110 个代表矩阵集上，以等内存编码统计 symbolic-work-weighted coverage。若 exact/low-delta signatures 覆盖不足 15%，或预处理不能在预期重复次数内摊销，或端到端性能不优于 Ocean/clustered baseline，则停止。

### 当前缺口

尚未建立矩阵清单、矩阵 hash 和 signature coverage 分布。GPU 结论的证据 ceiling 目前仅为算法侦察，不含 PPA 或体系结构 claim。

## RO-S3-04：版本化泛基因组的拓扑—单倍型联合局部更新

### 冻结对象与公开载体

对象是 HPRC 等公开泛基因组版本增加组装/单倍型路径时，同时维护 compressed graph topology 与 haplotype-path index，并让更新工作尽可能随新增/变化区域而不是全图增长。

公开载体为 `vg` 官方提供/指向的 HPRC GBZ/GFA 数据与可识别版本。先选择较小染色体，冻结 GBZ/GFA hash、path names、版本差分和 query set；不得人为把同一图切成“伪版本”作为主要证据。

### 已知事实与待测假设

- **来源支持：** GBWT 利用单倍型重复，可非常紧凑地编码人群路径；其已有 dynamic construction、merge，以及借助 reverse index 的 path deletion。GBZ 把图与 GBWT 路径压缩在同一格式，但公开说明不提供通用编辑。ODGI 提供动态图表示。近期 dynamic r-index 和 lossless pangenome indexing 继续推进动态/压缩索引。
- **待测假设：** 相邻 HPRC 发布之间的新颖拓扑和受影响 GBWT records 是局部的，足以支持 novelty-bounded 的原子联合更新。
- **高碰撞判断：** “增量插入 GBWT path”本身已被 DynamicGBWT 直接覆盖，不能作为新题。

### 可检验机制

1. **事务化 topology+path delta index：** graph chunks 与 GBWT records 都采用版本段；更新生成一致的 delta manifest，query 在 base+delta 上保持精确语义，并可原子切换版本。
2. **novelty-bounded partial rebuild：** 从新增路径映射出受影响 graph chunks、GBWT records 和辅助 locate structures，只重建闭包；给出闭包大小、查询额外层数与 fallback full rebuild 的界。

若只把 ODGI、GBWT 和文件版本工具串起来，则是 wrapper，必须停止。

### 必比基线与碰撞

- 从头构建 vg/GBZ；
- DynamicGBWT construction/merge/deletion；
- ODGI 动态图；
- dynamic r-index 与近期泛基因组 lossless index。

此项当前是 collision sentinel，优先级低于其他四项。残差必须是“拓扑与 path index 的一致联合局部更新”这一新算法对象，而不是 basic dynamic path insertion。

### 最早杀手实验

对至少两个真实 HPRC 版本增量计算 graph chunk、GBWT record 和辅助结构的触达比例。若 DynamicGBWT+ODGI 已提供同对象、同一致性和同复杂度，或真实更新闭包广泛触达全图，或 query 的 base+delta 代价抵消构建收益，则停止。

### 当前缺口

尚未冻结可比较的 HPRC 版本对，也未确认其许可证/分发载体是否足以复现实验；直接碰撞风险最高。

## RO-S3-05：近同构张量程序的证明保持式计划迁移

### 冻结对象与公开载体

对象是 TorchInductor/Triton 编译单元序列中，由重复模型 block 和动态 shape specialization 产生的近同构计算图：它们不完全相同，但常可表示为少量 shape、stride、guard 或局部 op 编辑。

公开载体为官方 TorchBench 与 TritonBench，并用 PyTorch `TORCH_TRACE` 保存可重放编译 trace。冻结 PyTorch/Triton/CUDA/GPU 版本、FX/IR hash、输入 shape 序列、guards、生成 kernel 和测量协议。

### 已知事实与待测假设

- **来源支持：** PyTorch 官方记录显示，Meta 内部 workload 的 regular Triton kernel cache 命中曾较低；MegaCache 与其他改进把一个大型模型编译时间从约 3000 秒降到 500 秒以内。PyTorch 2.7 已提供 Mega Cache 的精确 artifact reuse。DISC 处理动态 shape；AutoTVM/TLP 等已经研究 cost-model 或 schedule transfer；Gensor 等研究 graph-based schedule search。
- **待测假设：** exact cache miss 之间仍存在大量低编辑距离、合法调度可迁移的程序族；结构化迁移能明显少于 fresh search，同时达到同等 kernel 性能。
- **不能预设：** 文本相似、FX graph 相似或 shape 接近不自动保证 memory layout、race freedom、guard 和资源约束下的 schedule 合法。

### 可检验机制

1. **参数化 quotient IR：** 把一族近同构编译图归一为带 symbolic shape/stride/guard 的 quotient；以证明义务检查 schedule primitive 可否实例化，失败时回退。
2. **带合法性证书的 schedule edit transfer：** 从源程序 schedule 推导针对 IR edit script 的局部变换，只对受影响的 tile、mapping 或 fusion 决策做 repair/search。

目标必须是跨“非完全相同程序”的证明保持式复用；exact cache lookup 或仅用旧数据 warm-start cost model 不足以构成新机制。

### 必比基线与碰撞

- PyTorch MegaCache 与 TorchInductor dynamic shapes；
- fresh compile/search；
- DISC；
- AutoTVM transfer、TLP/MTL-TLP；
- Gensor/Korch 类图与 kernel 编排方法。

MegaCache 直接扣除完全相同 artifact reuse，TLP/AutoTVM 扣除 learned transfer。剩余贡献只能来自图编辑结构、合法性证明与局部 repair 的联合算法。

### 最早杀手实验

先在 TorchBench/TritonBench 的完整 trace 上测 exact-cache miss 中可 canonicalize 的 family coverage。若可复用族覆盖很低、超过 25% 的迁移仍需完整搜索，或相对 MegaCache+dynamic-shape baseline 没有显著 compile-time 收益，或 kernel 性能下降超过 2%，则停止。

### 当前缺口

尚未冻结 trace，也未测 program-edit distribution、legality rate 和真实编译时间构成。该项目前只支持 compiler algorithm claim，不支持硬件性能泛化。

## 已排除的直接碰撞侦察

1. **时序稀疏卷积的增量 rulebook。** INS-Conv（CVPR 2022）已经用 sparse residual 对在线 3D segmentation 做 incremental sparse convolution；仅迁移到另一种 LiDAR 流是换场景/换名，按 `DIRECT_FATAL` 排除。
2. **Temporal GNN 的跨 batch 邻居/数据缓存。** SlimCache（FAST 2026）已经明确组合 within-batch compression、cross-batch caching 和 topology-aware sampling；“利用时间邻域复用”这一简单命题直接碰撞。
3. **MoE 专家激活的时间/域局部性缓存。** 已有大规模 expert activation trace characterization、cache-aware routing 与 Cache-Conditional Experts；若没有新的精确算法对象，仅“预测并缓存重复专家”是拥挤的控制器式包装。
4. **相邻 attention layer 的 top-k/support 复用。** Kascade 已直接利用跨层 top-k index reuse；简单复用 attention support 不再是剩余问题。

这些排除项只用于校准搜索边界，不生成新 ID，不改名复活。

