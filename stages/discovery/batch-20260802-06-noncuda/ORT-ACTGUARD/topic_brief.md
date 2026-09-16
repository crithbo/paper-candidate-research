# ORT-ACTGUARD Risk-bounded activation-parameter fallback for ONNX Runtime

- Status: `PROPOSE_STAGE0`
- Primary lane: quantization_compiler_runtime
- Discovery date: 2026-08-02

## Research question

在 ONNX Runtime CPU Execution Provider 上，能否用冻结的校准覆盖合同选择少量 activation 保留在线量化参数计算，使完整端到端成本下的准确率–延迟 Pareto 严格优于纯 static QDQ 与纯 dynamic quantization？

## Importance and group fit

ONNX Runtime 已分别支持离线 static 与在线 dynamic quantization；前者快但会受校准覆盖影响，后者付出在线参数计算开销。对象是二者之间可执行、可审计的决策，而不是换一种量化格式。

## Exact object

固定版本的 ONNX 模型、CPU EP、INT8 QDQ 语义及公开校准/测试划分；决策变量为可动态计算 scale/zero-point 的 activation cut 集，必须计入新增 Q/DQ、参数计算与任何 FP32 回退。

## Strongest fair baseline

同一模型和同一 CPU 上的 ORT `quantize_static`（MinMax/Entropy/Percentile）、`quantize_dynamic`，以及在相同 bit-width 与测量边界下的全静态 per-channel variant。

## Mechanism hypothesis

由校准分位包络与 held-out 越界率建立每个 activation 的风险/开销比；只在风险合同被违反时保留动态参数路径，其他张量保持静态 QDQ。

## Competing mechanisms

- Mechanism A: 单张量风险/开销比贪心选择动态 activation。
- Mechanism B: 按算子子图选择，摊薄边界 Q/DQ 和同步成本。
- Optional mechanism C: 以输入轻量 range probe 触发整图静态/动态双版本。
- Preferred mechanism and why: B；它可检验“边界成本而非仅误差”是否决定 Pareto，且不把独立 tensor choice 伪装成贡献。

## Candidate paper claim

在预注册的分布漂移测试上，风险合同驱动的子图 fallback 可以在不超过纯 dynamic 的准确率损失阈值下，降低其全部在线量化开销；若无非支配点则否定该 claim。

## Current collision subtraction

`DIRECT_SUBTRACT`：现有 PTQ、mixed precision 与 ORT static/dynamic 工具覆盖端点。残差仅是带 QDQ 边界账本和 held-out 风险合同的**局部动态参数**选择；检索为 `SEARCH_BOUNDED_OPEN`。

## Decisive falsifier

在至少一个公开 Transformer 与一个 CNN/视觉模型上，所有可行 cut 集都被纯 static 或 pure dynamic 支配，或风险合同在未见数据上失效。

## Executable evidence path

ONNX Runtime 官方量化工具、ONNX Model Zoo/公开任务数据、Python 脚本和 CPU EP 可重放。首先冻结 QDQ、signedness、scale/zero-point、rounding、saturation 和 fallback 语义。

### 72-hour first evidence

对两个可下载 ONNX 模型枚举/贪心生成 cut 集，重跑准确率、P50/P99 与逐算子 profile；输出包含 Q/DQ、参数计算和回退的成本账本。

### AI core fraction and critical path

`80%`, `AI_CORE_EXECUTABLE`：AI 可实现选择器、运行 ORT baseline、做 bit-exact/边界测试及生成 ledger；研究者只裁决任务语义与最终贡献边界。

### Semantics-preserving open alternatives

无 GPU/NPU 依赖：CPU EP 是首证据对象；后续 Execution Provider 不可与 CPU 结果混作同一 claim。

## Dual-axis score

- Academic value: `54/70`
- AI executability bonus: `25/30`
- Total: `79/100`

## AI and researcher boundary

AI 可完成核心机制与比较；不得把局部实验推广为所有模型/硬件，也不得未测即声称速度或精度结果。
