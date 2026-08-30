# ATTN-STABPARETO Stability-budgeted approximate attention and KV precision

- Status: `PROPOSE_STAGE0`
- Primary lane: approximate algorithms; quantized AI acceleration
- Discovery date: 2026-08-02

## Research question

能否用 attention score 的可计算稳定性证书，为每层、每个 request 的 KV precision/approximation 分配预算，并在固定 memory-bandwidth budget 下取得比固定 mixed precision 更可解释的质量–吞吐 Pareto？

## Importance and group fit

长上下文推理把 KV 读带宽和容量变为主瓶颈；既有 KV quantization 给出压缩方案，但常用全局或层级设置。这里的贡献只能是有失败回退的、可审计的动态分配机制，不能把近似本身重新命名。公开 group 边界未完整提供。

## Exact object

对 autoregressive decoder 的已生成 KV blocks，在每次 attention 前用 full/cheap logit statistics 估计 top-mass 或 ranking stability；选择 block/layer 的 bitwidth、refresh 或全精度 fallback。成本含 scale/metadata、dequant、certificate、fallback 和输出质量评测。

## Strongest fair baseline

KVQuant、固定 2/3/4-bit quantization、固定 layer-wise mixed precision，以及任何公开的 adaptive/resolution-adaptive KV policy；同模型、context、kernel、cache budget 与 metric 必须冻结。

## Mechanism hypothesis

相同的 quantization error bound 对不同 attention margin 的输出风险并不相同；以 margin/stability 预算触发局部高精度或 fallback，可形成固定 bitwidth 无法同时支配的 Pareto 点。

## Competing mechanisms

- Mechanism A: top-mass stability certificate（变量：margin threshold、bitwidth/fallback；预测：相同平均 bits 下更少 high-risk deviations；反例：margin 与 downstream error 无相关）。
- Mechanism B: residual-error predictor（变量：历史 quantization residual；预测：更准地召回失败；反例：预测开销/漂移抵消收益）。
- Mechanism C: static layer-wise allocation（变量：层 bitwidth；预测：已足以解释全部收益；这是强 baseline）。
- Preferred mechanism and why: A；可先在 golden attention 上检验“证书是否校准”，不需要宣称端到端保证。

## Candidate paper claim

在冻结的开源模型、long-context benchmark、KV cache budget 和完整 metadata/fallback 成本下，stability-budgeted policy 在至少一个 workload regime 形成不被固定 mixed-precision policy 支配的质量–bytes/token–attention-time 点；仅声称经验性风险控制，除非 Stage B 补足端到端保证。

## Current collision subtraction

KVQuant 是 `DIRECT_SUBTRACT`（KV quantization）；近期 TurboQuant/自适应 KV 工作需 Stage 0 核验。Softermax/ConSmax 是 softmax 运算替代，属于 `METHODOLOGICAL_ADJACENT`，对象不同。QCOMP-ERRREF 是 compiler lowering relational refinement，亦不同。当前仅 `SEARCH_BOUNDED_OPEN`。

## Decisive falsifier

若 A 的 certificate 在冻结 calibration split 上不能优于随机/固定 bitwidth 预测高-risk token，或其计算与 fallback 后没有非支配点，则停止；B 可在同一对象下作一次 pivot。

## Executable evidence path

### 72-hour first evidence

使用 HuggingFace decoder 和 LongBench/RULER 小子集，在 CPU/GPU reference attention 上记录 full-precision logits、近似误差、margin 与输出偏差；先做 calibration/reliability curve，再比较固定 2/4-bit。

### AI core fraction and critical path

`AI_CORE_EXECUTABLE`, 约 78%。AI 可执行 reference、quantizer、oracle、policy 与 logs；无需虚构 NPU/ASIC 结果。硬件加速只会提高 evidence ceiling。

### Semantics-preserving open alternatives

Transformers/PyTorch、KVQuant artifact 与公开 small LLM/benchmark；任何使用不同 attention semantics 的替代必须降 claim。

## Dual-axis score

- Academic value: `55/70`
- AI executability bonus: `25/30`
- Total: `80/100`

## AI and researcher boundary

AI 可重放 core experiment；研究者负责模型许可、最终质量标准和组内/投稿裁决。
