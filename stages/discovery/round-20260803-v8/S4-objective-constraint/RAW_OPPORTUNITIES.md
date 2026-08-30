# O4 Raw Opportunities

> 本文件不是候选提名，也不是 Stage 0 输入。条目编号仅用于本批次内部追踪。discovery method v2 尚未通过独立历史回测，因此所有结论均为非生产性侦察假说。

## 快速排序

| Raw ID | 暂定对象 | 领域 | 目标/约束变化 | raw 判断 |
|---|---|---|---|---|
| `RAW-O4-01` | 峰值电流有证书的 NPU fusion/tiling | NPU / 编译器 | 平均时延 → 电池衰减下瞬态电流上界 | 高碰撞哨点；仅保留窄残差 |
| `RAW-O4-02` | 面向相关尾风险的 GPU 内核粒度合成 | CUDA/GPU / 编译器 | 均值吞吐 → p99.9 与服务时间上界 | 本轮最值得继续核验 |
| `RAW-O4-03` | 结构化 anytime 张量编译 | 编译器 | 最终最佳性能 → 硬墙钟期限下随时可部署 | 有潜力；必须击败 early-stop |
| `RAW-O4-04` | 兼顾缓存局部性与最坏保证的动态 learned index | 算法 / 数据结构 | 良性平均性能 → 对抗更新下时间/空间上界 | 有潜力；理论增量门槛高 |
| `RAW-O4-05` | 影响半径有界、可修复的共享前缀 KV 布局 | LLM 系统 / 可靠性 | 命中率/容量 → 故障影响半径与恢复成本 | 高碰撞、但对象明确 |

---

## RAW-O4-01：峰值电流有证书的 NPU fusion/tiling

**状态：** `RAW_COLLISION_HIGH`；不建议在完成全文碰撞审查前收敛。

**自然目标变化。** 移动 NPU 编译通常以延迟、能量和片外流量为核心，因而倾向扩大 fusion。电池衰减或低电量时，约束会从“平均功耗/总能量”转成“任意短时间窗的峰值电流不得跨过 PMIC/DVFS 边界”。2026 年预印本已经报告 compiler fusion 诱发的电流突发，并用测量引导的图改写插入 barrier；其 MobileNetV4 案例把测得峰值从 3.12 A 降至 1.94 A，代价约为 3.76% 延迟，说明现象真实但也说明直接空间已经拥挤（[原始预印本](https://arxiv.org/abs/2607.16555)）。

**为什么新目标改变动作。** 对总延迟最优的“大 fusion”会把高并行计算集中在同一短窗；在峰值约束下，最优动作不再只是选择 fusion 候选，而是改变图分割、tile 的时间排列和中间值驻留方式，使每个时间窗满足电流包络。简单改变 cost-model 权重无法表达前缀窗口约束，也不能给出跨电池状态的安全证书。

**机制草图。**

1. **包络可证明的 fusion partition。** 为候选 fused region 建立按 micro-op/tile 累积的瞬态电流上界，分割算法同时维护 SRAM live range、额外 DRAM traffic 和最长高电流连续段；输出带约束证书的 fusion DAG，而非运行时 controller。
2. **电流整形 temporal tiling。** 编译器在同一 fused region 内交错 compute-heavy tile 与 DMA/低切换活动 tile，改变流水次序以削峰，避免只靠插 barrier 丢失全部跨算子复用。

**可能贡献路线。** N2：受窗口约束的图分割/时序 tiling 算法；若能证明可行性或近似界，贡献会强于经验 barrier。

**完整计价。** p50/p99 延迟、峰值与窗口积分电流、总能量、额外 DRAM bytes、SRAM 峰值、编译时间、不同电池内阻/电压下的可行率。

**直接/邻近碰撞。**

- 直接现象和 barrier 改写已被上述 2026 预印本占据；这是当前最大风险。
- μNPU 工作说明微型 NPU 的软硬件配置与性能差异很大，单设备结论不够（[预印本](https://arxiv.org/abs/2503.22567)）。
- DSA 图调度已有大量 fusion、分割与内存调度空间，必须证明峰值窗口约束确实产生新算法，而非添加一项 cost（[OSDI 2023 页面](https://www.usenix.org/conference/osdi23/presentation/zhao)）。

**最快证伪。** 在一个公开 NPU/功耗代理模型或可用移动 SoC 上，对 10–20 个图比较：原始 fusion、直接 barrier、受约束分割、temporal tiling。若简单 barrier 在相同峰值下的延迟/流量 Pareto 包络覆盖两个新机制，立即停止。

**最强反对意见。** 现有预印本可能已经把“目标变化—图改写—收益”主线完整占据；剩余的 certificate/tiling 若没有跨设备规律或算法保证，只是工程细化。

---

## RAW-O4-02：面向相关尾风险的 GPU 内核粒度合成

**状态：** `RAW_PROMISING_NEEDS_DIRECT_SEARCH`

**自然目标变化。** 常见 GPU 编译以平均吞吐或单次 kernel latency 优化 fusion 和 tile。在线推理/混部服务需要约束 p99/p99.9、deadline miss burst，以及抢占请求到真正释放 SM 的服务时间。近期测量预印本报告 GPU/内存频率与 tail 行为并非独立平稳：在给定实验中，EMC 变化可使中位时延移动 11–48%，而历史 miss 后下一周期 miss 概率可远高于独立模型；这些数值仍需同行评审和复现实验（[预印本](https://arxiv.org/abs/2606.16106)）。另一方面，MonoNN 展示了大范围 monolithic fusion 对均值性能的价值（[OSDI 2024](https://www.usenix.org/conference/osdi24/presentation/zhuang)），GPREEMPT 则把通用 GPU 抢占降到 40 μs 以内量级（[USENIX ATC 2025](https://www.usenix.org/conference/atc25/presentation/fan)）。

**为什么新目标改变动作。** 均值最优倾向更大的 fused/persistent kernel；尾部和抢占上界会偏好可中断的短服务量子。目标变化因此改变 fusion cut、CTA/tile 大小、持久化迭代次数以及可安全让出的位置，而不是把同一组 kernel 的优先级重新排序。

**机制草图。**

1. **尾风险约束的 fusion-cut 合成。** 编译器为候选 region 组合执行时间分布、资源驻留和抢占安全点成本，在给定 deadline-miss 预算下求 fusion cuts 与 tile 大小；生成的内核保留状态最小化的 yield boundary。
2. **有界服务量子的 persistent schedule。** 将 persistent kernel 的 work queue 划成编译期有上界的 quanta，通过寄存器/共享内存状态压缩，使长尾输入或同机干扰时仍能在规定时间释放资源。

**可能贡献路线。** N2：均值—尾风险—抢占开销联合的编译调度算法；若跨 workload 出现稳定的“最佳安全量子随资源占用变化”规律，也可能形成 N3。

**完整计价。** 平均吞吐、p95/p99/p99.9、连续 miss 长度、抢占响应、额外 global traffic、寄存器/SMEM、代码大小、编译时间、对 CPU contention 与 EMC/GPU 频率变化的鲁棒性。

**直接/邻近碰撞。**

- MonoNN 的 monolithic fusion 是旧目标下必须击败的强基线。
- GPREEMPT 已占据通用抢占机制；本题只能主张“编译器如何合成可抢占且低尾风险的 kernel 结构”，不能重做抢占 runtime。
- 频率/尾部测量预印本提供现象，但尚未证明 compiler action 的因果收益。
- Event Tensor 已探索对动态事件/稀疏计算改变 GPU 执行表示，需排除其可直接覆盖本题 schedule 表示（[OpenReview](https://openreview.net/forum?id=PJqFhAbUHa)）。

**最快证伪。** 选择 fused inference、persistent queue、图/稀疏 kernel 各两项，在注入 CPU/内存干扰和突发负载时比较 MonoNN/常规 fusion、GPREEMPT 默认粒度、简单固定 timeslice 与两个草图。若固定 yield 间隔或已有 GPREEMPT hint 在完整计价下覆盖新合成器，停止。

**资源风险。** 需要可控 GPU 与频率/混部测量才能支撑主 claim；缺少商品硬件不会形成学术 STOP，但会限制证据上限。本轮未申请或占用设备。

**最强反对意见。** 尾风险可能主要由 runtime queueing、CPU 或硬件 DVFS 决定，compiler cut 对端到端 p99.9 的边际影响可能太小。

---

## RAW-O4-03：结构化 anytime 张量编译

**状态：** `RAW_PROMISING_NEEDS_COLLISION_AUDIT`

**自然目标变化。** 传统 autotuning 追求足够长预算后的最佳 kernel；弹性部署、交互式模型更新和边缘设备需要“在硬墙钟期限到来时，已经有一个可部署版本，而且继续等待应单调改善”。Ansor 的搜索流程可使用大量测量试验（[OSDI 2020 论文](https://arxiv.org/abs/2006.06762)）；TVM MetaSchedule 明确提供 search-based tuning、数据库记录与零搜索 DLight 路径（[官方文档](https://tvm.apache.org/docs/deep_dive/tensor_ir/tutorials/meta_schedule.html)）。Transfer-Tuning、DynaTune 和 2026 年 compiler world model 都在减少搜索/测量成本，但它们不自动等价于“端到端编译墙钟内，任意中断点都有结构化可执行解”（[Transfer-Tuning](https://arxiv.org/abs/2201.05587)、[DynaTune](https://openreview.net/forum?id=GTGb3M_KcUl)、[Compiler World Models](https://arxiv.org/abs/2606.09312)）。

**为什么新目标改变动作。** 固定预算下可以生成许多彼此无关的 schedule、完整 lowering 后再比较；硬期限下，编译器应选择可复用中间产物的嵌套 refinement，每一步都保持可执行，并把 codegen/链接/加载也计入预算。单纯缩短现有 tuner 或更改 trial 数不会改变“搜索样本之间没有结构共享”的动作。

**机制草图。**

1. **嵌套可执行 schedule 链。** 定义一组保持语义和可执行性的局部 refinement，后继 schedule 复用前驱 lowering 与编译产物；搜索目标是最大化单位剩余墙钟的可保证收益，而非只预测最终 runtime。
2. **可拼接的多版本片段。** 把 tile、layout、vectorization 的候选限制为拥有稳定 ABI 的 fragment，增量编译变更片段并在期限前原子拼接；任何时刻保留最近的完整版本。

**可能贡献路线。** N1：面向增量编译的 schedule/IR 表示；N2：联合 kernel runtime 与 compilation critical path 的 anytime refinement 算法。

**完整计价。** 从冷启动开始的端到端 wall time、各时间截点的 kernel latency、AUC/time-to-X、代码缓存大小、编译峰值内存、测量次数、最终性能损失、跨 shape/设备迁移成本。

**直接/邻近碰撞。**

- MetaSchedule 的数据库复用和 DLight 是必须比较的“立即可用”基线。
- DynaTune、Transfer-Tuning、coreset/pass-order 和 world-model 方法可能在短预算区间强于结构化 refinement。
- 如果 compiler world model 的少量试验已经连同真实 codegen 时间占优，本题只剩实现复杂度，没有学术空间。

**最快证伪。** 在 TVM 中对 10–20 个代表算子/融合子图记录 1 s、5 s、30 s、2 min 截点。比较 DLight、MetaSchedule early-stop、数据库迁移、world-model/公开近似复现和嵌套 refinement。若“普通 early-stop + 保留 best-so-far”在 AUC、最终性能和缓存成本三者上覆盖新表示，停止。

**最强反对意见。** 许多 schedule 变换不具性能单调性，编译产物也很难细粒度复用；所谓 anytime 可能退化成对现有 tuner 的包装。

---

## RAW-O4-04：兼顾缓存局部性与最坏保证的动态 learned index

**状态：** `RAW_PROMISING_THEORY_BAR_HIGH`

**自然目标变化。** ALEX 一类动态 learned index 以常见数据分布下的吞吐、空间和局部适应为重点（[原论文](https://arxiv.org/abs/1905.08898)）。复杂度攻击研究显示，少量精心选择的更新可以对某些动态 learned index 造成严重时间或空间退化（[原论文](https://arxiv.org/abs/2403.12433)）。PGM-index 提供有证明的误差/空间结构（[项目与论文入口](https://pgm.di.unipi.it/)）；ESA 2025 的 fully dynamic learned index 已给出最坏更新保证，但论文同时指出其凸包维护的随机内存访问使良性场景性能受损，并把 memory-access-efficient 的最坏保证动态方法列为开放问题（[正式论文](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64)）。HIRE 又从工程侧大幅改善动态尾延迟，进一步抬高新工作的基线（[预印本](https://arxiv.org/abs/2511.21307)）。

**为什么新目标改变动作。** 只优化平均访问会容许稀疏 gap、昂贵局部重训练和摊还 rebuild；最坏时间/空间上界要求数据结构本身改变 leaf 表示、slack 分配和 rebuild 调度。这里不能通过检测“恶意 workload”后切换到 B-tree 来获得贡献，因为那只是 wrapper/selector。

**机制草图。**

1. **缓存连续的分层 ε-cover leaf。** 用分块、packed 的局部模型与有界 overflow 区替代逐点动态凸包；每次更新只触碰 O(1) 或对数个连续块，并保持显式误差/空间不变量。
2. **信用驱动的局部 shadow rebuild。** 把 rebuild 工作按更新信用增量执行，旧/新 leaf 在固定额外空间内共存；查询沿单一路径读取，更新 worst-case 有界而非仅摊还。

**可能贡献路线。** N1：新动态 learned-index leaf/重建表示；N2：同时给出 cache miss、更新时间、查询时间与空间的非平凡界。

**完整计价。** p50/p99/max lookup/update、cache/DRAM misses、bytes/key、rebuild work、峰值临时空间、良性/漂移/突发/对抗更新序列、与 B-tree/ART/PGM/ALEX/HIRE/ESA 结构的比较。

**直接/邻近碰撞。**

- ESA 2025 已经占据“fully dynamic + worst-case guarantees”；新题必须在 memory access 与实际吞吐上形成算法性增量。
- HIRE 已占据 hybrid leaf、log update 与低尾延迟的工程机制，shadow rebuild 不能只是换名。
- PGM-index 和传统 B-tree/ART 可能在完整计价下直接胜出。

**最快证伪。** 先做纸面不变量和 I/O/cache complexity 检查，再实现单 leaf 原型。若无法同时给出非摊还更新界和固定峰值额外空间，或 packed 实现仍被 ESA/PGM/B-tree 在良性与对抗两侧覆盖，停止。

**最强反对意见。** ESA 2025 可能已经留下的只是常数优化；若没有新的表示和可证明界，这会降格为 cache engineering。

---

## RAW-O4-05：影响半径有界、可修复的共享前缀 KV 布局

**状态：** `RAW_COLLISION_HIGH_BUT_OBJECT_CLEAR`

**自然目标变化。** LLM prefix caching 为容量和命中率把热门前缀保存为单份共享物理块；可靠性目标则关心单块损坏会影响多少请求、持续多久、修复需要多少带宽。2026 年 fault-injection 预印本直接研究了 vLLM 共享 KV block 的 bit flip，报告 silent divergence、只传播到共享该前缀的请求以及随缓存寿命累积，并提出 checksum 以限制损害（[原始预印本](https://arxiv.org/abs/2604.17249)）。这已经占据“检测单 bit flip”的直接空间，但也暴露了“共享 fanout 是可靠性成本”的自然对象。

**为什么新目标改变动作。** 命中率/容量最优倾向单副本、长寿命和最大共享 fanout；影响半径约束会改变块的放置、编码粒度和 lineage 信息，使高 fanout 前缀可以局部修复。仅添加 checksum 是 checker，运行时发现错误后清空 cache 也没有改变最优存储动作，均不作为本题机制。

**机制草图。**

1. **fanout 有界的编码前缀块。** prefix block 以可独立放置的 data/parity fragments 存储；分配不变量把同一热门前缀的请求分散到若干故障域，并使任一 fragment 损坏可由其余 fragment 局部恢复，显式优化冗余 bytes 与最大受影响请求数。
2. **lineage-repairable block format。** 每个共享块携带足以从邻接边界状态增量重构的紧凑 recovery basis，而不是完整复制；恢复只重算受损 tile/head 范围，并保持与 paged KV 管理相容。

**可能贡献路线。** N1：共享状态的可修复缓存布局；N2：在固定冗余预算下最小化 fanout blast radius 与恢复流量的放置/编码算法。

**完整计价。** token throughput、TTFT/TPOT、cache hit、额外 HBM/主存 bytes、正常流量、单/多块故障恢复时延、错误影响请求数、故障域相关性、模型输出正确性。

**直接/邻近碰撞。**

- bit-flip 预印本已提出 checksum；本题不能以校验检测为 claim。
- DéjàVu 已通过 KV streaming/replication 支持分布式故障恢复（[ICML 2024](https://openreview.net/forum?id=AbGbGZFYOD)），必须区分 worker failure 与共享块细粒度损坏。
- Domain-Specific ECC 已针对 AI inference 的 HBM 可靠性/带宽成本设计编码（[IBM 研究页](https://research.ibm.com/publications/breaking-the-hbm-bit-cost-barrier-domain-specific-ecc-for-ai-inference-infrastructure)）；若普通 ECC 已覆盖性价比，应用层布局无空间。
- residual-stream 重构和 VeriCache 等近期预印本可能吸收“紧凑恢复 basis”机制，需做全文碰撞（[Residual Stream](https://arxiv.org/abs/2603.19664)、[VeriCache](https://arxiv.org/abs/2605.17613)）。

**最快证伪。** 在 vLLM/PagedAttention 的隔离原型中注入块丢失/bit corruption，比较 flush-and-recompute、双副本、ECC/校验后重算、erasure layout 和 lineage repair。若在相同额外内存下，普通复制或全块重算同时覆盖恢复时延、正常吞吐与影响半径，停止。

**最强反对意见。** 真实 GPU HBM 已有 ECC，应用层 silent block corruption 的发生率和故障模型可能不足以支撑系统论文；2026 bit-flip 工作又使用理想化软件注入，生态有效性仍待验证。

---

## 批次反方总结

- `RAW-O4-01` 的现象与 barrier 动作已有直接预印本，最可能在下一轮因碰撞被淘汰。
- `RAW-O4-02` 的关键不确定性是 compiler action 对端到端相关尾部是否有足够因果份额。
- `RAW-O4-03` 必须证明新 schedule/IR 表示，而不是 early-stop wrapper。
- `RAW-O4-04` 必须同时形成理论界和实际 cache locality；只有其一不足以越过 ESA 2025 与 HIRE。
- `RAW-O4-05` 必须先证明故障模型真实且普通 ECC/复制不能覆盖；checksum/checker 本身明确不计贡献。

本轮不选择“赢家”，不把 raw 排序解释为晋级，不生成正式候选 ID。
