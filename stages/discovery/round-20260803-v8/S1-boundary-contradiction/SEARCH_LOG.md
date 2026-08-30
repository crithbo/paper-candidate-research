# S1 搜索日志

- 日期：2026-08-03
- 阶段：独立历史回测前的非生产性侦察
- 方法：academic-research-suite deep-research 的 bibliography genealogy + source verification 子流程
- 来源政策：技术主张仅以论文作者预印本、正式会议页面/论文、作者 artifact、官方产品文档为依据；搜索聚合页和二手文章只作定位，不作为 raw opportunity 证据。

## 1. 检索轨迹

| # | 查询族（代表性关键词） | 优先核查的原始来源 | 结果与去向 |
|---|---|---|---|
| 1 | `"When NPUs Are Not Always Faster" artifact GitHub` | arXiv:2605.27435 | 找到 CPU>NPU prefill、弱 decode gain、能耗反向的阶段结论；未定位作者 artifact。进入 RAW-S1-01。 |
| 2 | `"Is Your NPU Ready for LLMs" PowerBench GitHub` | arXiv:2607.05475 | 找到相反的 NPU-prefill/CPU-decode 结论和最高 10× framework gap；未定位 PowerBench repo。进入 RAW-S1-01。 |
| 3 | `"Phase Matters" mobile SoC 2606.27906` | arXiv:2606.27906 | 找到 VLM 阶段、encoder、thermal/energy 与 graph-rewrite 数据。进入 RAW-S1-01。 |
| 4 | `HeteroInfer mobile SoC heterogeneous LLM NPU SOSP 2025` | SOSP 2025 作者 PDF | 确认 tensor partition、快速同步、profiler-solver 已覆盖通用异构切分，防止把 raw 机会写成 scheduler。作为碰撞边界。 |
| 5 | `"Scaling LLM Test-Time Compute with Mobile NPU" EuroSys 2026` | EuroSys/Microsoft Research、`haozixu/llama.cpp-npu` | 确认 tile quantization/LUT 已覆盖 NPU kernel 优化，且 artifact 依赖专有 Hexagon SDK。作为谱系和资源证据。 |
| 6 | `"Tiered Memory Management Beyond Hotness" Soar Alto` | OSDI 2025、`MoatLab/SoarAlto` | 确认 AOL、SOAR/ALTO、少数负收益和公开 artifact。进入 RAW-S1-02。 |
| 7 | `Memstrata Flat Memory Mode OSDI 2024` | OSDI 2024 | 找到跨租户/租户内争用造成最高 34% outlier，支持“观测延迟含外生排队”三角证据。 |
| 8 | `SupMario CXL 265 workloads 4 devices` | arXiv:2409.14317 | 找到设备/平台/延迟配置跨度和性能模型，支持 CXL 边界不应由单一 latency 值表示。 |
| 9 | `OSDI 2026 NEMO RamRyder CXL contention` | OSDI 2026 官方页面 | NEMO 已覆盖低开销策略化 telemetry/noisy-neighbor detection；RamRyder 已覆盖 channel mapping 和隔离。RAW-S1-02 标记高碰撞。 |
| 10 | `"Non-Uniform L2 Cache Latency" L40 artifact` | arXiv:2606.22588 | 找到 52% per-SM L2 latency spread、跨架构但 per-die-specific、最高 11% map-aware gain；未定位独立 repo。进入 RAW-S1-03。 |
| 11 | `"Uncovering Real GPU NoC Characteristics" MICRO 2024` | MICRO 2024 作者 PDF/DOI | 确认 V100/A100/H100 上最高约 70% 非均匀性是同行评议前史，不把 2026 L40 结果误当作无前例。 |
| 12 | `NVIDIA MPS static SM partition chunk partition ID` | NVIDIA MPS 官方文档 | 找到 Ampere+ 静态 SM 分区、chunk 与确定性 partition-ID/creation-order 语义，为“同尺寸分区并非等价”提供当前源码/接口边界。 |
| 13 | `NVIDIA MIG isolated L2 cache banks memory controllers` | NVIDIA MIG 官方文档 | 确认每个 MIG 实例拥有隔离 crossbar/L2/controller/DRAM path，明确需要测 partition placement 而非泛化到任意共享模式。 |
| 14 | `MPS MIG spatial co-execution memory contention 2026` | arXiv:2604.22430 | 找到 MPS 柔性与 MIG 隔离的系统比较；作为 RAW-S1-03 的直接相邻碰撞。 |
| 15 | `"Inference in the Shadows" Sereno artifact` | OSDI 2026 官方页面 | 确认 NPU 固定流量高优先级的真实错配和 153% jank；未定位官方 artifact。进入 RAW-S1-04。 |
| 16 | `XSched preemptive scheduling diverse XPUs artifact` | OSDI 2025、`XpuOS/xsched-artifacts` | 确认统一 XPU command scheduling 与跨 XPU 共享资源干扰已被覆盖；RAW-S1-04 只保留更低层 memory-traffic criticality primitive。 |

## 2. 主动负搜索与未保留线索

### Filtered ANN hardness

查询：

- `filtered approximate nearest neighbor Steiner hardness artifact`
- `"Dynamically Detect and Fix Hardness" filtered ANN`
- `filtered ANN workload hardness selectivity 2025 2026`

结果：

- [FANNBench](https://github.com/lmccccc/FANNBench) 已提供统一系统比较；
- [Dynamically Detect and Fix Hardness](https://arxiv.org/abs/2510.22316) 已直接做在线 hardness detection/fixing；
- [Revisiting Filtered ANN Benchmarks](https://arxiv.org/abs/2606.14193) 已提出执行驱动的 `α-Hardness` 和 hardness-controlled generator；
- [Filtered ANN System Design and Performance Analysis](https://arxiv.org/abs/2602.11443) 已分析数据库执行计划和 selectivity/correlation。

结论：本轮没有找到不退化为 adaptive controller 或 benchmark generator 的清晰剩余对象，不计入 raw opportunity。

### HLS QoR/时序估计

查询：

- `HLS post-route QoR prediction cross device generalization`
- `HLS performance predictor distribution shift FPGA architecture`
- `HLS QoR predictor ranking error tool version`

结果：

- [HLS performance prediction with GNNs](https://arxiv.org/abs/2201.06848) 已有 40K 程序与跨真实 workload 预测；
- [Post-route QoR prediction](https://arxiv.org/abs/2205.12397) 已直接预测 area/latency/clock period；
- [HLStrans](https://arxiv.org/abs/2507.04315) 已有 124K C-to-HLS pairs；
- [TimelyHLS](https://arxiv.org/abs/2507.17962) 与 [PatternDSE](https://arxiv.org/abs/2607.15068) 已进入 architecture-specific timing 与 pattern-guided DSE。

结论：虽可能存在跨工具版本的 ranking shift，但本轮没有找到足够自然、量化且未被直接预测工作覆盖的机制对象，不计入 raw opportunity。

### 混合注意力/SSM prefix cache

查询：

- `hybrid SSM prefix caching rollback exact match`
- `vLLM hybrid cache correctness issue`
- `MLX hybrid model prompt cache broken`

结果：

- Marconi（MLSys 2025）已直接研究 hybrid/recurrent LLM prefix caching；
- 2026 年 Sparse Prefix Caching 与 HYPIC 已继续覆盖 exact output/position-independent caching；
- 多个 GitHub issue 提供真实故障，但单 issue replay 或 checker 不满足项目入口。

结论：未保留。

### GPU structured/moderate sparsity

查询覆盖 SlideSparse、SharQ、moderate unstructured sparse CUDA/Tensor Core、TEAL 等 2025–2026 工作。当前已有多种 2:4 分解、稀疏/稠密混合和 activation sparsity kernel，碰撞过密；没有把“又一种格式 union”计入 raw opportunity。

## 3. 当前搜索边界与证据缺口

1. 2026 年 5–7 月预印本更新很快，四条 raw 均保持 `SEARCH_BOUNDED_OPEN`。
2. RAW-S1-01 尚缺可统一运行的 PowerBench/OPMASK/Phase Matters 官方 artifact。
3. RAW-S1-02 尚未逐篇检查所有 2026 CXL multi-tenant tiering 预印本的公式级信号分解。
4. RAW-S1-03 的 L40 论文声称 artifact 存在，但本轮未找到仓库；也未确认 MPS r610 静态分区在具体 GPU 上选择哪些物理 SM chunk。
5. RAW-S1-04 尚未获得 Qualcomm memory-controller/NPU traffic-priority 的公开编程接口或硬件手册；Sereno 论文是当前主要实机证据。
6. 以上缺口均禁止在本阶段转写为 novelty claim；必须在回测通过后的三遍检索中补齐。

## 4. Production grounding refresh (2026-08-03; primary-source screen)

The prior raw-stage `SEARCH_BOUNDED_OPEN` label was not carried forward as a novelty conclusion. Every retained raw was re-screened after the independently accepted O1/O6 method backtest.

| Raw | Fresh primary sources inspected | Genealogy / same-object result | Artifact, natural-input, and AI result | Production decision |
|---|---|---|---|---|
| RAW-S1-01 | [When NPUs Are Not Always Faster](https://arxiv.org/abs/2605.27435); [Is Your NPU Ready for LLMs?](https://arxiv.org/abs/2607.05475); [HeteroInfer](https://ipads.se.sjtu.edu.cn/zh/publications/sosp25-chen.pdf); [mobile-NPU test-time compute](https://www.microsoft.com/en-us/research/publication/scaling-llm-test-time-compute-with-mobile-npu-on-smartphones/) | Current papers already make phase/framework/device variation the measurement object. No residual controlled mechanism beyond a benchmark/dashboard or heterogeneous scheduler was identified. | Partial author artifacts and proprietary SDK dependence; no common equal-semantic trace harness located. AI could assist measurement only, not supply causal control. | `DROP` |
| RAW-S1-02 | [PACT, ASPLOS 2026](https://huaicheng.github.io/p/asplos26-pact.pdf), DOI [10.1145/3779212.3790198](https://doi.org/10.1145/3779212.3790198); [Equilibria](https://arxiv.org/abs/2602.08800); [SoarAlto, OSDI 2025](https://www.usenix.org/conference/osdi25/presentation/liu) with [artifact](https://github.com/MoatLab/SoarAlto); [S-Tiering](https://doi.org/10.1109/tc.2026.3655315) | PACT directly embodies page-granular performance access cost, MLP-aware attribution, online placement and migration—the raw object. Equilibria and S-Tiering make the surrounding CXL contention/telemetry space denser. | SoarAlto has a public artifact, but it cannot cure the direct collision. | `DROP`, `DIRECT_FATAL` |
| RAW-S1-03 | [RealGPU-NoC, MICRO 2024](https://people.ece.ubc.ca/aamodt/publications/papers/realgpu-noc.micro2024.pdf), DOI [10.1109/MICRO61859.2024.00070](https://doi.org/10.1109/MICRO61859.2024.00070); [L40 non-uniform L2 study](https://arxiv.org/abs/2606.22588); [MPS/MIG evaluation](https://arxiv.org/abs/2604.22430); [CUDA green contexts](https://docs.nvidia.com/cuda/cuda-programming-guide/04-special-topics/green-contexts.html); [MPS documentation](https://docs.nvidia.com/deploy/mps/latest/when-to-use-mps.html) | Nonuniformity is real, but vendor APIs expose resource counts/co-scheduling rather than a verified physical-SM selector. MPS/MIG spatial co-execution is already an immediate evaluation neighbor. | No independent L40 artifact located; natural workload/platform requirement is current datacenter GPU plus driver. AI cannot resolve the absent decision variable. | `DROP` |
| RAW-S1-04 | [Sereno, OSDI 2026](https://www.usenix.org/conference/osdi26/presentation/xin); [XSched, OSDI 2025](https://www.usenix.org/conference/osdi25/presentation/shen-weihang) with [artifact](https://github.com/XpuOS/xsched-artifacts); [Layerweaver+](https://doi.org/10.1587/transinf.2021EDL8084) | Sereno is a direct subtract for yielding and XSched for generic command scheduling; no direct primary-source collision found for starvation-bounded workload-critical request-tag propagation at the shared memory arbiter. | Natural UI/LLM coexistence trace is required. No verified public Qualcomm request-QoS interface or Sereno artifact was found; an early model is only a falsifier. AI remains auxiliary. | `PROPOSE_STAGE0` |

### Decision record and source-quality notes

- PACT is the batch’s only `DIRECT_FATAL`: a proposed “queueing-debiased page criticality” paper would add a feature to an already same-object online criticality mechanism, not introduce a new decision structure.
- No claim relies on search-result snippets or secondary summaries. Author-hosted papers, official conference pages, DOIs, official NVIDIA documentation, and official repositories are linked above. arXiv sources are treated as current but unreviewed collision signals.
- The retained brief does **not** assert novelty. Its Stage 0 request is conditional on an independent search for AMBA/CHI QoS-tag and mobile-SoC memory-arbitration collisions, verification of natural traces, and the stated falsifier.
