# S1 非生产性 Raw Opportunities

> 状态声明：以下 4 条只是独立历史回测通过前的侦察线索，不是候选、不是 TOPIC_BRIEF、不是新颖性结论，也不允许提交 Stage 0。所有“剩余对象”均为待验证假设。

## RAW-S1-01：移动 NPU 的 prefill/decode 排名为何跨研究反转？

- 镜头：`O6_CONTRADICTION`，辅以 `O1_ASSUMPTION_BREAK`
- 可能贡献入口：`N3`（稳定规律及利用机制），次选 `N2`
- 当前 raw triage：`RETAIN_FOR_POST_BACKTEST_GROUNDING`

### 可见矛盾

2026 年三项移动端研究对同一表面问题给出了不同方向的阶段结论：

- [When NPUs Are Not Always Faster](https://arxiv.org/abs/2605.27435) 报告 CPU 在 prefill 最多快 `1.6×`，NPU 在 decode 只有 `1.05–1.2×`，提高 NPU offload 还可使能耗增加最多 `51%`。
- [Is Your NPU Ready for LLMs?](https://arxiv.org/abs/2607.05475) 报告相反的阶段分工：NPU 擅长 compute-bound prefill，而 CPU 在 memory-bound decode 更优；框架差距可达 `10×`，配置浪费最多 `40%`。
- [Phase Matters](https://arxiv.org/abs/2606.27906) 在 Snapdragon 8 Elite 上报告 NPU 的 prefill/decode 加速分别为 `1.64×/1.18×`，但视觉编码器为 `20–45×`，且 graph rewrite 可带来最多 `22×`。

这不应被压缩成“做一个 phase-aware scheduler”。更可能的研究对象是：**在严格锁定语义后，哪些可测因素使 CPU/NPU 排名边界翻转**。

### 待验证的剩余对象

构建“语义锁定的因果阶段图”，将以下变量分离，而不是把不同论文的端到端数字直接拼接：

- 模型与算子图；
- 权重/激活量化语义；
- NPU graph shape、context-window 预分配和动态 shape；
- CPU fallback 与 layout conversion；
- 框架线程、RPC polling、睡眠唤醒；
- prompt/decode 长度、batch/test-time scaling；
- 热稳态与设备级能量边界。

论文级结果必须是可以预测“何时排名翻转”的稳定规律，并能导出一个明确的编译/部署决策；仅做 benchmark 排行榜不够。

### 谱系与碰撞边界

- 同行评议锚点 [HeteroInfer / SOSP 2025](https://ipads.se.sjtu.edu.cn/zh/publications/sosp25-chen.pdf) 已提供 GPU–NPU tensor partition、快速同步和 profiler–solver 协作，端到端加速为 `1.34–6.02×`。因此普通异构切分器是直接拥挤区。
- [Scaling LLM Test-Time Compute with Mobile NPU / EuroSys 2026](https://www.microsoft.com/en-us/research/publication/scaling-llm-test-time-compute-with-mobile-npu-on-smartphones/) 已针对 Qualcomm Hexagon 设计 tile quantization 和 LUT 算子；其[作者 artifact](https://github.com/haozixu/llama.cpp-npu)要求 Snapdragon 8 Gen 2+ 与 Hexagon SDK 6.x。
- 当前没有找到前三项 2026 阶段测量论文全部公开且可统一运行的 artifact；PowerBench 的公开仓库在本轮搜索边界内未定位。

### 可量化 headroom 与最小杀手检验

headroom 不是单一加速数字，而是同一阶段结论从“CPU 最多快 `1.6×`”到“NPU 快 `1.64×`”的方向翻转，以及最高 `10×` 的框架差异。

若回测通过，最小杀手检验应是：

1. 选两款可获得的同代 Qualcomm 手机；
2. 锁定同一模型、量化、算子支持集、输入长度和热状态；
3. 逐项切换 fallback、shape、framework/SDK 和功耗边界；
4. 检查能否用少量因果变量复现并预测排名翻转。

若仍只能得到“每台手机各不相同”的表格，或剩余对象退化为现有 HeteroInfer 风格 solver，则该线不应进入正式 brief。

### 资源状态

`HARDWARE_AND_PROPRIETARY_SDK_REQUIRED_FOR_PRIMARY_CLAIM`。学术上可保留，但当前 AI-led 证据上限低；没有实机和 SDK 时不能用桌面 GPU 模拟替代主要 claim。

---

## RAW-S1-02：CXL tiering 的“页面性能关键性”是否被排队与邻居争用污染？

- 镜头：`O1_ASSUMPTION_BREAK`、`O6_PRIMITIVE_MISMATCH`
- 可能贡献入口：`N2` 或 `N3`
- 当前 raw triage：`HIGH_COLLISION_RETAIN_FOR_BOUNDARY_CHECK`

### 失效假设

[Tiered Memory Management Beyond Hotness / OSDI 2025](https://www.usenix.org/conference/osdi25/presentation/liu) 已证明 hotness 不等于性能关键性，并提出 amortized offcore latency（AOL）、SOAR 与 ALTO；其官方摘要报告相对四个系统最高 `12.4×`，少数场景最多落后 `3%`。

但 AOL 同时包含 offcore latency 与 MLP。当多租户争用或 CXL 控制器排队抬高观测延迟时，**队列造成的外生延迟可能被解释为该页的内生关键性**。这会让“应迁移哪一页”和“应隔离/限流哪个租户”两个不同动作共享一个被污染的信号。

### 三角证据

- [Memstrata / OSDI 2024](https://www.usenix.org/conference/osdi24/presentation/zhong-yuhong) 在 Intel Flat Memory Mode 上发现，`82%+` workload 距离本地 DRAM 不超过 `5%`，但跨租户和租户内冲突使 outlier 最多下降 `34%`；隔离后可把 `30%+` 降幅压到 `6%` 以下。
- [SupMario](https://arxiv.org/abs/2409.14317) 用 `265` 个 workload、`4` 个真实 CXL 设备、`7` 个延迟配置和 `4` 个 CPU 平台说明设备、平台与排队边界会改变性能模型。
- [Finding NEMO / OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/li-shihang) 已能在 CXL-attached FPGA 上以低开销提供策略相关 telemetry，并把 noisy-neighbor 检测开销降低 `350×`。
- [RamRyder / OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/zhou-yanbo) 已从页到 memory channel 的映射层解决 VM 带宽/容量隔离；[Equilibria](https://arxiv.org/abs/2602.08800) 也直接进入多租户公平 tiering。

这些工作使“再做一个多租户 tiering controller”不可接受，但也提供了区分排队信号与页面固有 stall contribution 的独立观测入口。

### 待验证的剩余机制

候选对象不是阈值调优，而是一个**排队去偏的页面关键性分解**：

`observed stall contribution = intrinsic page criticality + queue/interference component + migration externality`

随后只允许由该分解导出一个动作空间，例如：

- 页面放置使用 intrinsic component；
- 隔离或 admission 使用 queue component；
- 迁移门控使用 migration externality。

若三者必须靠外围 controller 拼装才能工作，或 NEMO/RamRyder/Equilibria 已给出等价分解，则本线应停止。

### Artifact 与最小杀手检验

- [SoarAlto 官方 artifact](https://github.com/MoatLab/SoarAlto) 已包含 TPP、NBT、Nomad、Colloid 集成、NUMA/CXL 类实验脚本和 perf 数据收集，可作为未来只读主线资源。
- 最小检验应构造“相同页面访问轨迹、不同外生争用”和“不同页面固有依赖链、相同总带宽”两组配对负载，测试 AOL 排名是否反转，以及去偏后页面收益排序是否恢复。

真实 CXL 设备决定最高证据上限；NUMA 远端内存只能做机制预检，不能支撑 CXL 主要 claim。

---

## RAW-S1-03：等尺寸 MPS/MIG 分区是否因物理 SM–L2 拓扑而并不等价？

- 镜头：`O1_ASSUMPTION_BREAK`、`O6_PRIMITIVE_MISMATCH`
- 可能贡献入口：`N3` + `N2`
- 当前 raw triage：`RETAIN_WITH_FRESH_PREPRINT_RISK`

### 失效假设与量化信号

[MICRO 2024 的真实 GPU NoC 研究](https://people.ece.ubc.ca/aamodt/publications/papers/realgpu-noc.micro2024.pdf) 已在 V100/A100/H100 上发现 SM 到 memory partition 的 on-chip latency 非均匀，差异最高约 `70%`。

最新预印本 [Non-Uniform L2 Cache Latency Across the SMs of an NVIDIA L40](https://arxiv.org/abs/2606.22588) 进一步报告：

- L40 的每 SM L2-hit latency 为 `222–339` cycles，跨度 `52%`；
- 结构在 RTX 5090 上也存在，但 per-die pattern 不同；
- 简单 map-aware work distribution 可将 makespan 最多降低 `11%`；
- 论文声称 artifact 含 raw data、模型和重生成脚本，但本轮没有定位到独立公开仓库 URL。

与此同时，NVIDIA 当前 [MPS 文档](https://docs.nvidia.com/deploy/mps/latest/when-to-use-mps.html) 提供 Ampere+ 静态 SM 分区：分区按固定 chunk 创建，partition ID 由大小、创建顺序与当时保留 SM 分布决定；[MIG 文档](https://docs.nvidia.com/datacenter/tesla/mig-user-guide/introduction.html)则明确每个实例拥有独立的 crossbar port、L2 bank、memory controller 和 DRAM path。

由此产生一个可检验矛盾：资源管理器把“同 profile/同 SM 数”当作等价容量，但设备内的物理 SM–L2 路径可能使同尺寸分区对 latency-bound kernel 并不等价。

### 待验证的剩余机制

剩余对象必须超出 2026 预印本已有的单 kernel map-aware 分发：

1. 识别同尺寸静态 MPS/MIG 分区的 topology equivalence class；
2. 量化分区创建顺序、profile placement 与 L2 slice 归属是否造成稳定的性能/尾延迟分层；
3. 设计**拓扑加权的 chunk formation 或 persistent work decomposition**，把 latency-bound work 映射到更短路径，同时完整计价对其他租户、带宽型 kernel 和空闲 SM 的影响。

这不是通用 GPU 调度器，也不是读取一次 profile 后做 wrapper。核心必须是“分区形成/工作分解”算法及其可推广规律。

### 直接碰撞与杀手条件

- 2026 L40 预印本已覆盖 per-SM map 和最高 `11%` 的简单负载分配；若其 artifact 已包含分区级实验或等价持久化算法，则本线可能 `DIRECT_SUBTRACT` 甚至 `DIRECT_FATAL`。
- [MPS/MIG spatial co-execution 预印本](https://arxiv.org/abs/2604.22430) 已系统比较隔离与共享，报告 MPS 最优场景约 `+30%`、内存争用场景约 `-30%`；若其分解已归因到具体 SM–L2 topology，剩余空间会显著收窄。
- 如果静态分区总是选择拓扑同构 chunk，或应用无法影响/稳定识别实际 partition placement，则机制对象不存在。
- 若收益只在单线程 pointer chase 微基准上出现，而真实 latency-bound kernel 的差异被并行度/带宽掩盖，则不能形成论文。

### 资源状态

需要支持静态 MPS/MIG 的 Ampere+ 数据中心 GPU、当前驱动，以及最好两种架构/两块同 SKU 卡；当前未授权且未发现本工作区可用设备。该限制不构成学术 STOP，但会把本线置于 `RESOURCE_GATED` 或未来的人类研究储备。

---

## RAW-S1-04：移动 SoC 中“加速器身份即流量高优先级”的 QoS 原语错配

- 镜头：`O6_PRIMITIVE_MISMATCH`，辅以 `O1_ASSUMPTION_BREAK`
- 可能贡献入口：`N1`
- 当前 raw triage：`HARDWARE_PRIMITIVE_SCOUT`

### 真实错配

[Inference in the Shadows: Sereno / OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/xin) 发现，手机硬件为了保障视频录制等关键媒体任务而优先 NPU memory traffic；best-effort 后台 LLM 继承这一优先级后：

- 前台应用 aggregate jank 增加最多 `153%`；
- LLM prefill/decode throughput 只下降 `1.01%/1.64%`；
- Sereno 通过 speculative decoding yield point 无硬件改动地缓解争用，jank 最多降低 `92.6%`，LLM throughput 最多提高 `67.9%`。

现有原语把“在哪个设备上执行”与“这笔内存流量有多关键”绑定在一起；当 NPU 从关键媒体加速器变成 best-effort LLM 执行器时，设备身份不再是 QoS 的可靠代理。

### 待验证的新抽象

原始机会是一个**与加速器身份解耦的 memory-traffic criticality primitive**：

- 每个 command/graph region 显式携带 deadline、best-effort 或 bandwidth entitlement；
- memory controller/driver 使用该标记，而不是固定 NPU > CPU/GPU；
- 优先级继承必须覆盖 NPU 发起的 DMA、host polling/fallback 和共享 LLC/DRAM 路径；
- 机制需给出 bounded interference 或最小带宽/尾延迟保证，而非只做反馈 controller。

### 谱系与碰撞

- Sereno 已是强部署基线，任何纯软件 yield/scheduling 方案都会直接撞车。
- [XSched / OSDI 2025](https://www.usenix.org/conference/osdi25/presentation/shen-weihang) 已提供跨 GPU/NPU/ASIC/FPGA 的可抢占 command queue，并在共享 SoC 资源时统一调度不同 XPU；其[官方 artifact](https://github.com/XpuOS/xsched-artifacts)覆盖 Intel NPU3720 等平台。因此“统一 XPU priority queue”也不是剩余对象。
- 剩余空间只可能位于更低层的 memory traffic class、继承语义和可证明/可测的隔离边界。若 Qualcomm 等平台已经暴露等价 per-command QoS 标记，或 XSched/Sereno 的机制已可完整控制 NPU memory priority，则该线失去新颖性。

### 最小杀手检验与资源状态

最小检验需在可控 SoC/FPGA memory-controller 模型上重放至少三类并发流量：

1. critical media NPU + foreground CPU/GPU；
2. best-effort LLM NPU + foreground UI/media；
3. 同一 NPU graph 内 critical 与 best-effort region。

检验固定“设备优先级”与显式“工作负载 criticality”在 jank、LLM throughput、带宽利用率和 starvation 上的 Pareto 差异。

商品手机通常不允许修改 memory controller 或 NPU firmware，Sereno artifact 在本轮搜索边界内也未定位。因此该线学术潜力与 AI 可执行性必须分开处理：最可能需要 FPGA/模拟器/厂商合作，若没有合法同对象平台，应进入 `HUMAN_RESEARCH_RESERVE`，不能改造成外围 controller 以规避资源限制。
