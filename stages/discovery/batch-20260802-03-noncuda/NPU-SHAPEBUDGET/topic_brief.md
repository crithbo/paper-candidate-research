# NPU-SHAPEBUDGET Compile-budgeted dynamic-shape specialization for heterogeneous NPU execution

- Status: `PROPOSE_STAGE0`
- Primary lane: NPU compiler/runtime; dynamic shapes
- Discovery date: 2026-08-02

## Research question

对动态 shape 图，能否在固定在线编译预算与 NPU buffer-reservation 约束下，选择少量 region-specialized variants、guard 和 CPU fallback，使端到端 latency/energy Pareto 优于“全泛化”或“每 shape 编译”？

## Importance and group fit

动态 shape 已使 fusion、memory planning 和部署复杂化；实际 NPU 又常由静态 buffer/partition 与 CPU fallback 限制。题目研究的是 portfolio 决策和资源预留，而非再实现一个 guard cache；公开 group 边界仍待确认。

## Exact object

在可获得的 MLIR/PRIVATE_TOOLCHAIN/XLA-like graph compiler 加轻量 NPU cost model 中，为 shape distribution 选择 region cut、variant set、guard 以及 NPU/CPU partition；指标为 compile latency、peak reserved buffer、fallback/transfer 和 end-to-end latency。

## Strongest fair baseline

DISC 的动态 shape 编译/shape propagation，通用 dynamic-shape fusion/shape-polymorphic execution，以及固定 generic graph、per-shape JIT 和 LRU specialization cache 的公平组合。

## Mechanism hypothesis

shape specialization 的收益受限于“可复用的 buffer reservation envelope”，不是仅由 kernel speedup 决定；按 reservation slack 选择 variant 可避免把少见 shape 的加速转化为常驻内存或 compile burst。

## Competing mechanisms

- Mechanism A: reservation-aware variant portfolio（变量：shape cluster、variant、buffer envelope；预测：同 compile budget 下更低 P95 end-to-end；反例：buffer reservation 与 shape 无关）。
- Mechanism B: region cut optimization（变量：specialize region boundary；预测：减少 dynamic boundary materialization；反例：全图或单 op 总是支配）。
- Mechanism C: fallback-aware guard selection（变量：guard threshold/CPU fallback；预测：避免 compile thrash；反例：JIT 编译始终可隐藏）。
- Preferred mechanism and why: A；其决策和可证伪成本模型最清楚，B/C 是同对象 pivot。

## Candidate paper claim

对至少一个公开动态-shape workload family，在同等 code-cache、compile budget、NPU buffer 和 transfer accounting 下，reservation-aware specialization portfolio 给出 generic/JIT/cache baseline 不支配的 latency–memory–compile Pareto 点。

## Current collision subtraction

DISC 为 `DIRECT_SUBTRACT`（dynamic shape compilation/fusion）；它要求 Stage 0 精确比较所管理的 runtime variant/cache 与本题的 reservation envelope。CGPU-DECSLICE 是 GPU codegen 决策 slice，object、平台和目标不同；本题不能借其 residual。当前为 `SEARCH_BOUNDED_OPEN`。

## Decisive falsifier

若 DISC/现有 shape-polymorphic compiler 加普通 LRU cache 在相同 budget 下已等价选择 region/variant/envelope，或 reserved buffer 不构成独立成本，停止；若 A 失败而 B/C 有不等价决策空间，可 pivot 一次。

## Executable evidence path

### 72-hour first evidence

收集 HuggingFace/ONNX 动态 shape 图，执行 MLIR/PRIVATE_TOOLCHAIN 编译或以公开 compiler log 建立 variant cost table；在冻结 trace 上搜索 A 并输出 Pareto 与完整 fallback/transfer ledger。

### AI core fraction and critical path

`AI_CORE_EXECUTABLE`, 约 72%。AI 可完成 graph extraction、optimizer、baseline 和 simulator；真实商业 NPU 只提高 evidence ceiling。不得将 cost model 结果称为 device measurement。

### Semantics-preserving open alternatives

MLIR/PRIVATE_TOOLCHAIN/XLA compatible graph lowering、ONNX Runtime profiling、公开 dynamic-shape models；若 NPU backend 不可得，明确缩小为 compiler/model-level claim。

## Dual-axis score

- Academic value: `58/70`
- AI executability bonus: `23/30`
- Total: `81/100`

## AI and researcher boundary

AI 重建和验证 compiler-level claim；研究者决定商用 NPU 实测、组内归属与最终论文方向。
