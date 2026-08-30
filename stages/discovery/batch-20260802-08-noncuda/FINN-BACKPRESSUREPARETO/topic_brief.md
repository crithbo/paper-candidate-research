# FINN-BACKPRESSUREPARETO — Global backpressure-sensitivity co-optimization of folding and FIFO capacity

- Status: `PROPOSE_STAGE0`
- Primary lane: FPGA accelerator compiler / quantized dataflow mapping
- Discovery date: 2026-08-02

## Research question

对于 FINN 生成的固定 QONNX dataflow accelerator，在冻结 bit-exact 语义、目标 FPGA、吞吐合同和 BRAM 预算下，能否以 RTL simulation 中的 backpressure sensitivity 联合选择 layer folding 与 FIFO depths，形成优于 FINN auto FIFO sizing 与独立 folding search 的 latency—BRAM 非支配解？

## Importance and group fit

FINN 是开源量化网络 FPGA dataflow compiler，并允许 per-layer folding；官方 FAQ 指出自动 FIFO sizing 依赖输入驱动 RTL simulation 且耗时很长。研究核是在有限仿真预算下识别真正造成全图 tail stall 的边，而不是“把 FIFO 调大”或把现有 folding config 直积。

## Exact object

一个 FINN 可构建 QONNX 网络、固定 target board/part 和公开 validation inputs。动作：每层离散 folding choice 与每条 stream 的 FIFO depth；不改变算子语义、权重、量化 bit width、时钟约束或 host pre/post processing。成本含 FIFO/BRAM、LUT/FF、生成时间、RTL simulation、bit-exact output、input/output layout conversion；仅在得到综合报告时才声称资源结果。

## Strongest fair baseline

FINN 默认/自动 FIFO sizing + 合法 folding search；matched folding-only sensitivity search + FIFO-only auto sizing 的 union；uniform-depth 和 zero-extra-buffer 消融。所有方法共享同一 QONNX、target、throughput target、test vectors、seed 和 tool version。

## Mechanism hypothesis

局部最大 occupancy 不是全局最有价值的 buffer；当 folding 改变相邻 stage service-rate 时，只有会传播到 critical output tail 的边值得占用 BRAM。基于短 RTL trace 的 perturbation sensitivity 建立全图 marginal-stall/BRAM ratio，联合选择 folding/FIFO，可避免 union 的局部贪心。

## Competing mechanisms

- Mechanism A: trace perturbation 得到跨边 backpressure sensitivity，再做受 BRAM 限制的联合 folding/FIFO search；预期只在 rate mismatch chain 存在时获益。最强反例：各边 sensitivity 独立，local occupancy 排序即可。
- Mechanism B: FIFO-only sizing（FINN auto/manual）；预期消除固定 folding 下的 buffering stalls。
- Mechanism C: folding-only search，FIFO 维持 auto/default；预期只在 compute imbalance 主导时获益。
- Preferred mechanism and why: A 要在 B+C union 后仍保留 tail-latency/BRAM order inversion，防止普通组件组合。

## Candidate paper claim

在冻结 QONNX、FPGA 和 bit-exact contract 下，短 RTL trace 的 backpressure sensitivity 可预测哪些 folding/FIFO 联合改变会形成非支配 latency—BRAM 解；该预测在 held-out natural inputs 上保持，而不仅是最大 occupancy 的重述。

## Current collision subtraction

`SEARCH_BOUNDED_OPEN`。FINN 已有 folding config 和 automatic FIFO sizing，且它们是 strongest deployment components。历史 `AIE-ROBUSTFIFO` STOP 是缺真实 AIE ObjectFIFO burst trace；本题对象改为 FINN 的公开 QONNX + RTL input vectors，不能借用 AIE claim。Stage 0 需查明 FINN 或相邻 DSE 文献是否已有同等全图 sensitivity、相同 target 和完整 union；若是则 `DIRECT_FATAL`。

## Decisive falsifier

对至少一个 FINN 可复现网络，A 在 full accounting 下不能超过 B+C union，或 held-out inputs 使 sensitivity ranking 无法预测任何更优设置，则停止。

## Executable evidence path

FINN 开源，文档说明其 build_dataflow folding config 与 FIFO sizing/RTL simulation。首个证据使用 FINN example QONNX 和 CPU-side tool flow；硬件板或 P&R 缺失只限制 claim ceiling。

### 72-hour first evidence

选择一个官方 FINN 可构建的 QONNX example，冻结几十个自然 validation vectors；生成 B/C 基线与若干 single-edge/depth/folding perturbations，建立 stall ledger，比较 A/B/C 的 bit-exact outputs、estimated FIFO occupancy 和 simulation latency。若无 union order inversion，直接停止。

### AI core fraction and critical path

`ai_core_fraction: 0.72`。AI 可改配置、运行已有工具、解析 RTL traces、实现 search 和验证语义；设备 board measurement 可后置。`AI_CORE_EXECUTABLE`。

### Semantics-preserving open alternatives

RTL simulation 和公开 target reports 是与 FINN 对象一致的早期证据；没有综合/P&R 时严格只称 simulation/estimation，不称 FPGA PPA。

## Dual-axis score

- Academic value: `52/70`（重要性 10/15；headroom 11/15；机制 16/20；推广性 9/12；独立性 6/8）
- AI executability bonus: `24/30`（artifact 7；核心 6；本机路径 5；72h 3；重放 3）
- Total: `76/100`

## AI and researcher boundary

AI 可以生成 simulation 级证据；没有 board/synthesis/P&R 时不得扩大为 FPGA efficiency 或 ASIC PPA 声明。
