# CUDA/GPU Discovery 第 13 波：CUDA 13 运行时语义、异步屏障与编译器新能力

日期：2026-08-02。范围限 CUDA/GPU；所有结论都是 Discovery 建议，`SEARCH_BOUNDED_OPEN` 不等于首次提出。

| ID | 冻结 exact object | 决定 | 审计结论与 Stage 0 killer |
|---|---|---|---|
| GPU-MBARRIER-PHASECONTRACT | Hopper+ `cp.async`/`cuda::barrier` 相位、arrival-count 与 wait 的 CUDA kernel | `PROPOSE_STAGE0` | Sanitizer 能报具体 hazard，但不合成跨 phase、语义保持的最小修复；killer：公开 CUTLASS/CUDA-sample 内核中，合约应对 sanitizer/report 与小输入 oracle 同时消除真实违规，且不退化成插全局 barrier。 |
| GPU-CUDAGRAPH-CONDBODY-REUSECERT | CUDA Conditional Graph 中动态条件、body graph 和全图更新/重实例化之间的可重用边界 | `PROPOSE_STAGE0` | 不是图缓存或通用调度：输出是以 graph legality、device condition、instantiate/update 成本为账本的 reuse certificate；killer：自然迭代 workload 上存在同一输出、低 host 控制成本且全成本优于重实例化的 certificate。 |
| GPU-CUDAGRAPH-EDGE-DIFFTEST | CUDA Graph edge-data/conditional-node 与等价 stream program 的行为差分语义 | `PROPOSE_STAGE0` | 现有 API 文档与 unit samples 不给系统化 semantic differential corpus；killer：来自官方样例和真实 graph 使用点的最小 witness 在 stream oracle 与 graph oracle 之间复现，或零有效 witness 即止。 |
| GPU-PTXAS-SMEMSPILL-BOUND | CUDA 13 PTXAS shared-memory register-spill 的 launch bounds/dynamic-SMEM 约束前沿 | `PROPOSE_STAGE0` | 与现有 EVT epilogue spill 切分不同：决策是源级资源约束与 native compiler-enabled spill 的安全 Pareto；killer：真实 CUTLASS/KernelBench kernel 产生至少一个可证伪、输出相等、包含 occupancy/SMEM 全成本的非支配点。 |
| GPU-CUDASAN-HAZARD-THINNING | sanitizer hazard-buffer 保留策略 | `DROP` | 仅是监控采样/资源预算；完整预算策略可表达候选，缺独立论文机制。 |
| GPU-ASYNCALLOC-LIFETIME-REPAIR | `cudaMallocAsync` 跨 stream lifetime repair | `DROP` | 直接落入已停止 `GPU-MEMPOOL-EPOCH` 的 allocator union/逐块 use 证据缺口，禁止改名复活。 |
| GPU-CUDAGRAPH-REPLAY-TOPOLOGY | capture/replay 图拓扑缓存 | `DROP` | 与既有 `GPU-CUDAGRAPH-REPLAYCLASS` 同对象，剩余是 generic cache/admission。 |
| GPU-CUPTI-QUEUE-ATTRIBUTION | activity trace 队列延迟归因 | `DROP` | 与正在 Stage 0 的 `GPU-CUPTI-CRITPATH-CAUSE` 在 object、决策和 claim 上直接相交。 |
| GPU-CUDAST-MBARRIER-REPAIR | mbarrier 违规的 repair frontier | `DROP` | 与正在 Stage 0 的 `GPU-CUDAST-ALIASFRONTIER` 的 sanitizer-observable repair 对象/主张直接重合；本波保留的是更窄的 phase contract inference。 |
| GPU-DSM-CLUSTER-SCHED | cluster DSM 访问/同步调度 | `DROP` | 合法 cluster barrier 插入被完整 joint synchronization baseline 覆盖；无独立 action。 |
| GPU-ATOMIC-SKEW-AUTOTUNE | skew-aware atomic/privatization strategy | `DROP` | warp/block privatization及最终 merge是已知完整 action space；仅换数据集。 |
| GPU-CUDAHIP-NUMERIC-DIFF | CUDA/HIP 浮点差分测试 | `DROP` | Varity 已覆盖跨 NVIDIA/AMD CUDA/HIP 数值差异生成与差分，构成 `DIRECT_FATAL`。 |
| GPU-NVJITLINK-CACHECUT | device-LTO incremental relink cache | `DROP` | 已停止 `GPU-NVJITLINK-RELINKCUT`：绕过 LTO 退化成普通依赖缓存，跨 LTO 又不能保留同语义。 |
| GPU-TMA-DESCRIPTOR-VALIDATE | TMA descriptor/phase validation | `DROP` | 已停止 `GPU-TMAPHASE` 且本机无可审计 lowered-PTX 证据；不得以源级猜测替代。 |

## 碰撞与来源边界

- 已审计 registry 与 history 的活跃/失败核；`DIRECT_FATAL` 仅用于同 object/decision/mechanism/claim 的项。其余保留项都是 `SEARCH_BOUNDED_OPEN`，Stage 0 必须重新做 strongest-union 检查。
- 自然输入只能是公开 CUDA samples、CUTLASS/KernelBench 已有 kernel、或公开项目的真实 graph 使用点；不将随机 shape、作者注入 trace 或 API 存在本身当成机会证据。
- 没有运行 GPU、大型实验或创建 Stage 0/A/B。本波唯一写入本 batch。

## 建议 Stage 0 顺序

1. `GPU-MBARRIER-PHASECONTRACT`（87/100）：语义新、最小 verifier/repair 路径可审计。
2. `GPU-PTXAS-SMEMSPILL-BOUND`（84/100）：CUDA 13 原生新能力，有公开 kernel 语料。
3. `GPU-CUDAGRAPH-CONDBODY-REUSECERT`（81/100）：新控制语义，但必须先取自然 workload。
4. `GPU-CUDAGRAPH-EDGE-DIFFTEST`（78/100）：验证贡献清晰，需先找到非注入 witness。
