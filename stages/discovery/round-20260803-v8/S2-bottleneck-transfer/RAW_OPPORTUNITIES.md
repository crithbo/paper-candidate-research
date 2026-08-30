# O2 瓶颈迁移：非生产性 raw opportunity 侦察

- 批次：`round-20260803-v8`
- 日期：`2026-08-03`
- 方法版本：`v2`
- 生产属性：`NON_PRODUCTION / PRE_BACKTEST`
- 数量：`6`
- 说明：以下 disposition 仅用于回测前筛查；不是正式 `PROPOSE_STAGE0` 或 `DROP`，也不构成新颖性结论。

## 总览

| ID | 成本迁移 | Raw disposition | 当前碰撞判断 | 若残余成立的贡献形状 |
|---|---|---|---|---|
| `RO-S2-01` | 显式 CPU–GPU copy → page-table 初始化、first-touch、page placement/migration | `SCOUT_KEEP_CONDITIONAL` | `SEARCH_BOUNDED_OPEN`，但 BLAS 与 CXL 邻近工作强 | N2/N3：阶段图上的 placement/pretouch 算法 |
| `RO-S2-02` | Tensor Core 提升 → SFU、共享内存、非矩阵运算与编译 | `SCOUT_HOLD_HIGH_COLLISION` | FA4、Twill、Tawa 已覆盖两侧动作，联合残余未证实 | N2：误差约束下代数 lowering 与 pipeline 联合优化 |
| `RO-S2-03` | chunked prefill 稳定 TBT → MoE expert 权重重复装载 | `SCOUT_REJECT_ABSORBED` | anchor 已提出 layered prefill；Gimbal/ASAP/ZeRO-Prefill 继续挤压空间 | 无安全残余 |
| `RO-S2-04` | P/D 解耦算力 → KV 网络/存储传输 | `SCOUT_REJECT_DIRECT_FATAL` | KVServe、SmartGen、SYMPHONY、Bidaw 已直接覆盖选择/压缩/预取/调度 | 泛化选择器属于禁止的万能 union |
| `RO-S2-05` | 低比特权重减少 HBM/算术 → dequantization 成为关键路径 | `SCOUT_REJECT_DIRECT_FATAL` | QFactory、MSD、MixPE、StreamDQ 已覆盖编译、代数、PE 与近内存动作 | 泛化 dequant controller 无独立贡献 |
| `RO-S2-06` | 学习型 eviction 降低 miss → 策略训练/推理 CPU 开销 | `SCOUT_REJECT_DIRECT_SUBTRACT` | 3L、GL-Cache、HALP、LAH/S4-FIFO、Merlin、CACHEUS 已覆盖主要结构 | “按开销切换策略”已是拥挤且易退化为 wrapper |

## RO-S2-01：统一地址空间后的 page-population/placement 计划

### 触发与量化锚点

Grace Hopper 的一致性互连与 integrated CPU–GPU system page table 降低了显式分配/拷贝的移植负担，但成本转移到了 first-touch、PTE 初始化、page size 与 migration。Schieffer 等人的 GH200 研究明确把这些列为测量对象；论文中的案例还报告 `cudaHostRegister` 预填页表可为 Rodinia `srad` 增加约 `300 ms` 初始化成本。Fusco 等人的跨节点刻画则表明，即使统一地址空间存在，谨慎的 memory placement 仍然重要。

主要来源：

- [Harnessing Integrated CPU-GPU System Memory for HPC: a first look into Grace Hopper](https://arxiv.org/abs/2407.07850), 2024。
- [Understanding Data Movement in Tightly Coupled Heterogeneous Systems: A Case Study with the Grace Hopper Superchip](https://arxiv.org/abs/2408.11556), 2024。

### 初始论文谱系

- 前置动作：统一虚拟地址、cache-coherent NVLink-C2C、system-allocated memory，替代或减少手工 copy。
- 邻近竞争：[SCILIB-Accel](https://arxiv.org/abs/2501.00279) 已对 level-3 BLAS 使用 Device First-Use，并在 MuST 的 LSMS 上报告相对 Grace-Grace `3×`；它限制在可拦截 BLAS 谱系。
- 强部署邻近：[TPP](https://arxiv.org/abs/2206.02878) 已为 CXL tiered memory 设计透明 hot/cold page placement，在其部署环境中距理想 local-memory baseline 小于 `1%`，优于当时 Linux `18%`。这不是 GH200 exact object，但否定“透明页迁移本身就是新贡献”。
- 反证边界：短任务或工作集能稳定留在单一内存域时，预触碰和迁移决策的固定成本可能超过收益；必须把初始化计入 end-to-end。

### 可能的 residual 决策结构

Exact object 是已知 CPU/GPU phase DAG 上的一组 allocation regions；决策变量是每个 region 的初始物理域、first-touch 执行者与顺序、page size，以及允许的 phase-boundary migration。目标是完整计价的 time/energy，而不是单独 kernel 带宽。

两个非同义机制假设：

1. **静态 phase-DAG 计划**：依据 region lifetime、访问方向与容量约束，求解带初始化和迁移固定成本的 placement/pretouch 计划。
2. **受限在线迁移**：只在访问计数器出现 phase change 时进行预算化 remapping，并对 thrashing 设显式上限。

删除 “GH200/CUDA/unified memory” 后，问题仍是“在一致地址空间的异构 phase DAG 上，联合决定初始放置、初始化与迁移，以最小化完整生命周期成本”，因此不是纯换名。

### 为什么暂不视为工程尾项

如果初始化顺序、page size 与迁移是耦合决策，简单的“GPU first-touch”或“总是本地放置”可在不同 phase/lifetime 下互相反转；这形成算法对象。反之，如果公开 workload 上一个固定 first-touch 规则已覆盖大部分收益，则该项应停止。

### 关键缺口与证伪

- `SEARCH_BOUNDED_OPEN`：尚未完成对 2025–2026 GH200/GB200 自动 placement 编译器、专利和供应商 runtime 的全量碰撞。
- 决定性证伪：在代表性多阶段公开 workload 上，`best fixed first-touch + huge page` 与离线 oracle 的 end-to-end 差距小于噪声或小于约 `5%`。
- 证据 ceiling：当前只有公开论文；没有授权 GH200 实验。AI 执行性最多暂记 `AI_CORE_CONDITIONAL`，不能用别的平台替代主要 claim。
- 回测后动作：只有收到 `CALIBRATED` 后，才可检查公开 artifact/trace 并决定是否写 grounded brief。

## RO-S2-02：SFU/共享内存瓶颈下的误差约束 lowering–schedule 联合决策

### 触发与量化锚点

Blackwell 上 Tensor Core throughput 翻倍，而 shared-memory bandwidth 与 exponential units 增长更慢或不变。FlashAttention-4 因此把瓶颈从矩阵乘转移到非 matmul 资源，并使用软件模拟 exponential、conditional softmax rescaling、tensor memory 与新 pipeline；论文在 B200 BF16 上报告相对 cuDNN 9.13 最高 `1.3×`、相对 Triton `2.7×`，最高 `1613 TFLOP/s`（`71%` utilization），且 CuTe-DSL 编译时间比传统 C++ template 快 `20–30×`。

主要来源：

- [FlashAttention-4: Algorithm and Kernel Pipelining Co-Design for Asymmetric Hardware Scaling](https://proceedings.mlsys.org/paper_files/paper/2026/hash/ae8b0b5838ba510daff1198474e7b984-Abstract-Conference.html), MLSys 2026。
- [Generalized Dot-Product Attention: Tackling Real-World Challenges in GPU Training Kernels](https://pytorch.org/blog/generalized-dot-product-attention-tackling-real-world-challenges-in-gpu-training-kernels/), PyTorch 2026；给出 GELU 也会 SFU-bound 的部署侧例子。

### 初始论文谱系与碰撞

- [Tawa](https://arxiv.org/abs/2510.14719) 已从高层 tiled program 自动生成 warp-specialized code，并在 H100 attention 上匹配手工 FlashAttention-3。
- [Twill](https://www.usenix.org/conference/osdi26/presentation/soi) 已把 SWP 与 warp specialization 表成联合约束优化，且可证明其为一类迭代程序产生最优 schedule，并重新发现 Hopper/Blackwell FlashAttention 的专家 schedule。
- PyTorch/Triton 已公开 autoWS 路线；因此“自动 warp specialization”不是 residual。
- FA4 本身已经人工联合设计代数近似与 pipeline；因此简单地把其技巧交给 autotuner 很可能只是工具化。

### 仅供回测后的 residual 假设

Exact object 不是 attention 专用调参，而是含 transcendental subexpression 的固定语义算子。决策变量包括数学等价/近似 lowering、各 lowering 的显式误差预算、SFU/CUDA/Tensor unit 映射，以及由该 lowering 改变的 pipeline schedule。目标是在 same-function/quality contract 下最小化 latency 或 energy。

两个非同义机制假设：

1. **离散联合求解**：把候选代数实现的资源占用与误差界嵌入 Twill 类 schedule 模型，一次选择 lowering 与 schedule。
2. **分层可证筛选**：先用区间/ULP 界剔除不合格 lowering，再对保留项求精确 schedule；牺牲全局最优以压低编译时间。

### 暂缓原因

联合耦合只有在“单独选最快 lowering，再单独排 schedule”显著劣于联合 oracle 时才是新决策结构。否则它只是 FA4 技巧、Twill schedule 与 fast-math 选项的万能 union。当前未查清 Tempo/precision-aware compiler、供应商 math mode 与 2026 新编译器是否已直接覆盖，故标为 `SCOUT_HOLD_HIGH_COLLISION`，不保留任何“首次”表述。

决定性证伪：

- 对 attention、normalization、activation 至少三类算子，sequential choice 与 joint oracle 的 Pareto gap 不超过约 `5%`；或
- 数值误差无法在 end-to-end 模型质量/训练稳定性上给出可部署 contract。

资源边界：主要性能 claim 需要 B200/GB200；未获硬件授权，不能以 H100 代替异构缩放 claim。

## RO-S2-03：chunked prefill 后的 MoE expert-weight reload

### 触发与定量锚点

chunked prefill 为了稳定 decode TBT，把 prompt 沿 token 维分片；在 MoE 中却使 expert 权重反复加载。[From Tokens to Layers](https://proceedings.mlsys.org/paper_files/paper/2026/hash/c0f460c6d63599ea870ba9db63dc96a9-Abstract-Conference.html) 报告额外 memory traffic 最高 `39%`，并提出 layered prefill，TTFT 最多下降 `70%`、end-to-end latency 下降 `41%`、每 token energy 最多下降 `22%`。其 [OpenReview 论文](https://openreview.net/pdf?id=yyDbI3HXco) 还给出小 chunk 下 MoE runtime 超过 prefill 的 `50%`、较大 chunk 后权重加载量与 runtime 明显下降的微测量。

### 碰撞结果

- anchor 已把调度轴从 token 改为 layer group，直接吸收最明显的新决策。
- [Gimbal](https://arxiv.org/abs/2606.15177) 已用 KV、剩余 prefill、queue 与 expert pressure 协调请求和 expert placement，报告平均 TTFT `-42.9%`、TPOT `-33.3%`。
- [ASAP](https://arxiv.org/abs/2606.22541) 已把 attention/MoE stages 解耦并异步执行，报告 SLO-compliant prefill throughput `+90%`。
- [ZeRO-Prefill](https://arxiv.org/abs/2605.02960) 已把 activation routing 改为异步 weight gathering，并对 prefill-only workload 联合前后端。

因此，“自适应选择 token/layer scheduling”“把 chunk 与 layer 两种调度拼接”或“再加 backend-pressure controller”都已被 anchor/后续工作吸收，或退化成不可公平的万能 union。当前 raw disposition 为 `SCOUT_REJECT_ABSORBED`。只有出现新的 exact object、约束或保证才可作为新 ID 重开；不能换名复活。

## RO-S2-04：P/D 解耦后的 KV 传输瓶颈

### 触发与定量锚点

Prefill/decode disaggregation 缓解算力与资源配比，但 KV 成为跨网络/存储边界的显式 payload。[P/D-Serve](https://arxiv.org/pdf/2408.08147) 在 NPU 集群中表明离散 block 传输的控制气泡降低 D2D 利用率，其 contiguous transfer/restore 使平均 transfer time 下降 `46%`。[Mooncake](https://www.usenix.org/conference/fast25/presentation/qin) 则以 KV-centric disaggregated cache 扩展到 DRAM/SSD/NIC，并在真实 traces 上报告有效 request capacity `+59%–498%`。

### DIRECT_FATAL 碰撞

- [KVServe](https://arxiv.org/abs/2605.13734) 已按 service context 自适应选择 KV compression profile，报告 PD-separated JCT 最高 `9.13×`、KV-disaggregated TTFT 最高 `32.8×` 改善。
- [SmartGen](https://arxiv.org/abs/2607.28150) 已联合 proactive selective transfer、parallel on-demand fetch 与 speculative completion，报告 time-to-second-token 最高 `4.3×`。
- [SYMPHONY](https://www.usenix.org/conference/nsdi26/presentation/agarwal) 已用 advisory prefetch、priority KV management 与 cooperative memory management 支持 compute-memory disaggregation，报告 end-to-end latency `2.4×` 改善并可服务 `4×` 请求。
- [Bidaw](https://www.usenix.org/conference/fast26/presentation/hu-shipeng) 已进行 compute/storage 双向感知的 KV-loading-aware request scheduling。

“在 recompute、compress、selective transfer、remote fetch 间自动选择”与“按网络/SLO 加 controller”都与上述核心 action set 实质重合，而且是被禁止的万能 union。该通用题形标为 `SCOUT_REJECT_DIRECT_FATAL`；后续批次应把它作为跨题去重负例，不得生产提交。

## RO-S2-05：量化后的 dequantization 关键路径

### 触发与定量锚点

低比特权重降低容量和 HBM traffic，但在缺乏原生 mixed-precision GEMM 支持时，dequantization 会转移到 vector/CUDA pipeline。[Multi-Scale Dequant](https://arxiv.org/abs/2605.13915) 明确报告在 Ascend 等 decoupled compute 架构上 dequant cycles 可超过 matmul，并给出 activation decomposition、误差界和最高 `2.5×` KV HBM traffic reduction 的分析。

### DIRECT_FATAL 碰撞

- [QFactory](https://www.usenix.org/conference/atc25/presentation/zhang-qihao) 已用 Qtile/Qgraph 进行 deferred dequant graph transformation 和 scheduling，平均 kernel speedup `1.66×`、end-to-end generation `1.23×`。
- [MixPE](https://arxiv.org/abs/2411.16158) 已把 dequant 移到 group GEMM 之后并设计 mixed-precision PE，报告 `2.6×` speedup 与 `1.4×` energy reduction。
- Multi-Scale Dequant 已用 activation decomposition 从代数层删除关键路径。
- [StreamDQ](https://arxiv.org/abs/2607.08993) 已把 dequant 移到 HBM base die，报告 mixed-precision GEMM 最高 `7.08×`、energy `-90.23%`，end-to-end latency 最多 `-54.68%`。

编译器、代数表示、专用 PE、近内存执行四条主要机制都已有直接工作。再做一个“为不同硬件选择 dequant 位置”的 wrapper/controller，既没有独立动作，又难以公平比较完整硬件成本。因此通用题形标为 `SCOUT_REJECT_DIRECT_FATAL`。

硬件证据提醒：MixPE/StreamDQ 的架构结果必须按论文的实现/仿真层级表述，不能把面积、功耗模型写成商品硅上部署事实。

## RO-S2-06：学习型 cache eviction 后的决策开销

### 触发与定量锚点

学习型 eviction 可以降低 byte/object miss ratio，但训练、特征和推理消耗 CPU。[3L-Cache](https://www.usenix.org/conference/fast25/presentation/zhou-wenbin) 在 4,855 条 traces 上相对 HALP 降低平均 CPU overhead `60.9%`、相对 LRB 降低 `94.9%`；但其开销仍是 LRU 的 `6.4×`（小 cache）或 `3.4×`（大 cache）。

### 竞争谱系

- [HALP](https://www.usenix.org/conference/nsdi23/presentation/song-zhenyu) 已将 heuristic 与 learning 结合并在 YouTube CDN 部署，byte miss 平均下降 `9.1%`、CPU overhead `1.8%`。
- [GL-Cache](https://www.usenix.org/conference/fast23/presentation/yang-juncheng) 已通过 group-level learning 摊销开销，相对当时最佳 learned cache 吞吐提高 `64%`。
- 3L 已动态调整训练频率、过滤训练数据并设计低开销 bidirectional sampling。
- [Learning-Augmented Heuristics / S4-FIFO](https://www.usenix.org/conference/osdi26/presentation/xia) 已把偶发异步学习放在 control plane，只在 data plane 使用简单高速启发式；在 1,035 条 evaluation traces 上 mean efficiency 相对 S3-FIFO `+26%`、相对 3L `+8%`。
- [Merlin](https://www.usenix.org/conference/osdi26/presentation/li-liujia) 已直接研究低开销 adaptive eviction，并指出算法切换会互相干扰。
- [CACHEUS](https://www.usenix.org/conference/fast21/presentation/rodriguez) 更早已组合轻量 experts 进行 fully adaptive cache replacement。

### 停止理由

最自然的 residual——“预计 miss 收益不足以覆盖决策成本时切换到 LRU/cheap policy”——已落在 CACHEUS/Merlin 的算法切换和 LAH 的异步控制/简单 data plane 范围内。若再加入 queue delay、CPU budget 或 byte miss 权重，当前形态只是 controller 参数扩展，不是新的 eviction algorithm；万能 union 还会破坏同信息与完整计价公平性。

因此标为 `SCOUT_REJECT_DIRECT_SUBTRACT`。这条线索的价值是方法负对照：有明确成本迁移并不自动形成论文 residual；新算法必须在删除 “cache/learning” 名词后仍有独立在线决策和可证明/可测的收益结构。

## 批次级结论

- 可在回测通过后优先重核：`RO-S2-01`。
- 仅在找到强 residual/直接碰撞结果后再决定：`RO-S2-02`。
- 不得以同义题生产提交：`RO-S2-03`、`RO-S2-04`、`RO-S2-05`、`RO-S2-06`。
- `RO-S2-04` 与 `RO-S2-05` 是跨题 `DIRECT_FATAL` 负例，应交给主线用于后续去重。
- 本文件不请求状态转换、不授权实验，也不生成 Stage 0 brief。

