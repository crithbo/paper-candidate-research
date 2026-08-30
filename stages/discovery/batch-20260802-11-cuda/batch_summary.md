# CUDA/GPU Discovery 第十一波：自然输入与联合基线前置筛查

日期：2026-08-02。范围严格限定为 CUDA/GPU；所有结论是 Discovery 建议，不改变登记或阶段。

| ID | 冻结 exact object | 结论 | 核心筛查结论 |
|---|---|---|---|
| GPU-MEMPOOL-EPOCH | CUDA stream-ordered mempool 的跨 stream epoch trim/reuse | `PROPOSE_STAGE0` | API 有 trim/reuse 动作；需以真实 PyTorch allocation trace 排除通用 allocator 联合策略。 |
| GPU-CUTLASS-EVT-SPILLPARETO | CUTLASS EVT epilogue 的 register-spill/extra-read Pareto | `PROPOSE_STAGE0` | CUTLASS profiler 给出可执行 kernel/成本；机制是受限的语义等价 epilogue 切分，而非参数菜单。 |
| GPU-NVJITLINK-RELINKCUT | NVJITLINK device-LTO 的 module-boundary relink cut | `PROPOSE_STAGE0` | 模块依赖图和 re-link API 均真实；需证明 cut 不被通用 build cache 覆盖。 |
| GPU-CUPTI-CRITPATH-CAUSE | CUPTI 活动 trace 的 host-enqueue vs device-critical-path 归因 | `PROPOSE_STAGE0` | 输入来自真实 profile；可操作的反事实是保持 API 序列的合法 stream/event 重排。 |
| GPU-CUDAST-ALIASFRONTIER | CUDA sanitizers 可观察 shared-memory alias/barrier 修复前沿 | `PROPOSE_STAGE0` | 不是 checker：输出为最小语义保持 repair 的可证伪 Pareto。 |
| GPU-NCCL-CHANNEL-REMAP | DROP | nccl-tests 是合成扫描，缺可审计生产 channel-demand 输入；不能用它伪造自然机会。 |
| GPU-CUDAGRAPH-REPLAYCLASS | DROP | GraCE/历史 graph-memory 覆盖 capture/lifetime 核，剩余为 generic cache/admission。 |
| GPU-UVM-PREFETCHDEBT | DROP | 已关闭 UVM migration/prefetch scheduling 核；债务记分不产生独立动作。 |
| GPU-TMA-PROTOCOL-REPAIR | DROP | 本机无 CUDA 编译链，且无可锚定 lowered PTX 闭包；不得把源级推断冒充证据。 |
| GPU-CUTLASS-GROUPTAIL | DROP | group-size/action 空间由 CUTLASS grouped scheduler + 完整策略联合覆盖。 |
| GPU-GDS-DECODEORDER | DROP | 已实测 GDS coflow 的自然 reversal 无净收益；仅换 decode 顺序不可复活。 |
| GPU-FP8-DESCRIPTORFLOW | DROP | 与已停止 MXSCALEFLOW 的跨算子 scale/descriptor 流同对象。 |
| GPU-MOE-CACHEPLAN | DROP | 缺少同时含 deadline、bytes、VMM/copy/fragmentation 的自然 MoE trace，且 cache/VMM 联合基线覆盖。 |
| GPU-PYTORCH-GUARDPORTFOLIO | DROP | 与 torch.compile guard transition Pareto 同一对象；不得平行重提。 |

## 强基线纪律

每个保留题必须在 Stage 0 明确实现包含所有相同信息、动作、保证及完整成本的联合基线；若其能逐项重放候选行为，则 `DIRECT_FATAL`。本批未把样例、随机 problem shapes、作者生成 trace 或 API 存在本身称作自然机会。

## 推荐优先级

1. `GPU-CUPTI-CRITPATH-CAUSE`（87）：真实输入和可行动作同时存在。
2. `GPU-CUTLASS-EVT-SPILLPARETO`（84）：RTX 4070 可运行 CUTLASS 语义相同的 Ada 核。
3. `GPU-MEMPOOL-EPOCH`（81）：同样可在单卡上做 allocation-trace 重放。
4. `GPU-NVJITLINK-RELINKCUT`（77）：机制清楚但需先闭合真实依赖图语料。
5. `GPU-CUDAST-ALIASFRONTIER`（75）：高风险，须先获得非注入的 sanitizer 失败语料。

所有 novelty 判断仅为 `SEARCH_BOUNDED_OPEN`，并非“未发现即首创”。
