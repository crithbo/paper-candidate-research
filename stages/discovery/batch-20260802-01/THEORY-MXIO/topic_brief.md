# THEORY-MXIO Metadata-aware communication bounds for block-scaled GEMM

- Status: `PROPOSE_STAGE0`
- Primary lane: 理论；近似/量化
- Discovery date: 2026-08-02
- Novelty state: `SEARCH_BOUNDED_OPEN`

## Research question

当 GEMM 的两个低比特 payload 矩阵之外还必须读取、广播或在线产生 block scale tensors 时，经典两层存储 I/O 下界是否仍然紧；能否给出显式依赖 scale granularity、布局、fanout 和 fast-memory 容量的通信下界及匹配调度？

## Importance and group fit

[OCP MX 1.0](https://www.opencompute.org/documents/ocp-microscaling-formats-mx-v1-0-spec-final-pdf)把 scale 与一组低精度 elements 关联；[CUTLASS block-scaled GEMM](https://docs.nvidia.com/cutlass/latest/media/docs/operators/tutorials/006_block_scaled_gemm.html) 和 [Triton block-scaled matmul tutorial](https://triton-lang.org/main/getting-started/tutorials/gluon/tcgen05-mma-scaled.html)又明确把 scale tensor 作为需要布局、装载和复用的 operand。简单 roofline 往往把 scale 当成额外字节，但这不回答 scale fanout/共驻留是否改变紧通信区间。

这是通信复杂度/匹配算法问题，不是为某一 GPU 调 scale tile 的普通调参。结论若成立，可指导 GPU/NPU/PIM 的 block-size/layout 选择；若 scale 项永远低阶，也能以严格不可行性界杀死夸大的 metadata 优化空间。

当前 registry 没有同一 block-scale communication-bound 对象；工作区未提供课题组完整公开论文表或未公开题目清单，组内理论边界须在升级前由主线/研究者确认。

## Exact object

- 计算：`C = (S_A ⊙ Q_A) × (S_B ⊙ Q_B)` 的 block-scaled GEMM；`Q_A,Q_B` 是低比特 payload，`S_A,S_B` 是按冻结 granularity/layout 广播的 scale operands。
- 模型：sequential two-level memory，fast memory 容量 `M` 以 bit/byte 计；传输同时计 payload、scale、输出和必要的 scale production/repacking。
- 参数：`m,n,k`、payload/scale bitwidth、scale block shapes、fanout、scale 是否预存或在线产生、layout feasibility。
- 主要结果：communication lower bound 与 matching/near-matching schedule；不得只给 roofline 曲线。
- 首批不含：网络拓扑、多 GPU collective 或具体 tensor-core 指令性能。

## Opportunity map

- 技术变化：MX/NVFP 等分块缩放格式把 metadata 变成硬件 GEMM 的显式 operand，并可能采用硬件要求的 swizzled layout。
- strongest baseline 边界：经典 GEMM I/O lower bound 只看算术 DAG/矩阵 operands；工程模型通常加 compulsory scale bytes。机会必须来自共驻留、fanout、在线 scale 或 layout 约束产生的新 regime。
- 自然 workload：MXFP8/MXFP4/NVFP4-like 的规范参数，以及 CUTLASS/Triton 教程中合法 scale layouts；至少覆盖两种 granularity family。
- 72 小时观察：证明 scale term 是否在所有合法参数下都被经典 payload/compute lower bound 支配。

## Strongest fair baseline

1. 经典/紧 GEMM I/O lower bound，例如 [Tight I/O lower bound for matrix multiplication](https://arxiv.org/abs/1702.02017)；
2. 简单模型 `classical GEMM bound + compulsory scale bytes + output bytes`；
3. CUTLASS/Triton 的标准 blocked/swizzled scale layout 与常规 tiling upper bound；
4. 若在线 scale production，公平基线必须计入 amax/reduction/quantize pass，而不是把 scales 视为免费。

## Mechanism hypothesis

首选假设：把 payload tile 与其所需 scale tile 作为 typed vertices，并显式约束每个 scale 的 broadcast fanout 与共同驻留，可得到一个 piecewise lower bound。在 `M` 足以复用 payload 但不足以同时容纳对应 scale working set、或 scale 在线产生/重排时，metadata 项可能形成独立主导区间。

## Competing mechanisms

- Mechanism A — typed red–blue pebble/partition bound：决策变量是 partition、payload/scale residency 与 fanout；预期特异结果是含 granularity 的闭式 piecewise bound，强反例是 metadata vertices 可被经典 DAG bound 完全吸收；最小成本是纸笔证明 + 小型枚举验证。
- Mechanism B — hypergraph communication bound：把 multiply、scale broadcast 和 output reduction 表成带权 hyperedges，通过 expansion/partition 得 bound；预期结果是能表达非矩形和双层 scale，强反例是只得到松的数值 bound；成本是 CPU 上的小型 ILP/partition oracle。
- Mechanism C — matching communication-avoiding schedule：联合选择 payload tiles、scale cache/replication 与在线 quantize/fusion；预期结果是达到 A/B 的上界，强反例是 hardware layout conversion 消除理论收益；成本是 trace-level simulator，不需 GPU。
- Preferred mechanism and why: A。闭式理论最容易检验“是否真的有新 regime”；若 A 被经典界吸收，但 B 对非矩形/double-scale DAG 给出独立 tight bound，可保持问题/指标 pivot B。C 是任何下界 claim 必须配套的构造，而不是单独调参贡献。

## Candidate paper claim

对冻结的一类 block-scaled GEMM，scale metadata 的 granularity/fanout/production 诱导经典 GEMM I/O 模型遗漏的通信区间；一个 typed communication bound 在这些区间紧，并由 metadata-aware tiling/fusion schedule 达到，同时在其他区间退化为经典 bound 加 compulsory traffic。

该 claim 尚无证明。若不存在独立区间，必须停止而不是把常数级“多几个字节”包装成论文。

## Current collision subtraction

- 经典 GEMM communication lower bounds：`DIRECT_SUBTRACT`，覆盖 payload/compute DAG 主体。
- CUTLASS/Triton block-scaled layouts：`DEPLOYMENT_BASELINE`，说明 scale traffic/layout 是真实对象，但不证明新理论。
- 在 `I/O lower bound quantized GEMM scale metadata`、`communication lower bound block quantized matrix multiplication`、`roofline block-scaled GEMM scale factors` 等记录查询中未定位同一 typed metadata bound，故 `SEARCH_BOUNDED_OPEN`，不声称首次。

## Decisive falsifier

若对所有规范合法的 scale granularity/layout，metadata 只增加 `Θ(|S_A|+|S_B|)` compulsory traffic，且该项始终被经典 tight bound 或输入读取下界支配；或找不到 matching schedule/反例使 proposed bound 紧，则题目学术门失败。A 失败但非矩形/dynamic-scale exact object 仍有可信机会时可 pivot B；若 pivot 只是换证明工具而结果仍为简单加字节，停止。

## Executable evidence path

AI 可从公开规范提取参数，形式化 DAG/存储模型，使用符号代数与小规模 exhaustive/ILP oracle 检查 conjecture，生成 trace-level schedule 计算实际 bytes，并把 theorem assumptions、scripts、cases 和 hash 一并重放。核心判断不依赖 GPU。

### 72-hour first evidence

1. 冻结一个单层 MX block-scale 与一个双层 NVFP-like scale 模型。
2. 写出经典 bound、compulsory metadata bound 和 typed partition conjecture。
3. 对 `m,n,k,M,g_A,g_B` 小规模枚举最小 I/O，寻找经典+bytes 模型的反例。
4. 构造一个 metadata-aware blocked schedule；检查 lower/upper gap 随参数是否保持非平凡。

首个决定性证据是一个明确参数区间/小规模族，其中简单基线 bound 不紧且 typed bound 与最优枚举一致；若不存在，停止或 pivot B 一次。

### AI core fraction and critical path

- 估计 `ai_core_fraction`: 86%
- Class: `AI_CORE_EXECUTABLE`
- AI 可完成：规范参数抽取、模型编码、lower-bound 推导辅助、枚举/ILP、schedule trace、符号/数值 cross-check 和可复现包。
- 形式证明的最终严谨性需研究者审阅，但决定 claim 是否有非平凡 regime 的核心路径可由 AI 完成。

### Semantics-preserving open alternatives

- 不需要特定 GPU：OCP/CUTLASS/Triton 只冻结格式和合法 layout，CPU oracle 决定理论 claim。
- 若 NVFP 文档的细节不足，可把双层 scale 明确设为抽象参数模型，不宣称特定产品。
- 若 ILP solver 不可用，可用 exhaustive search 覆盖更小实例；它只验证 conjecture，不替代理论证明。

## Dual-axis score

- Academic value: `55/70`（重要性 12/15；headroom 11/15；机制深度 16/20；推广性 10/12；独立边界 6/8）
- AI executability bonus: `26/30`（artifact 6/7；核心比例 7/8；开源路径 7/7；速度 4/5；重放 2/3）
- Total: `81/100`

## AI and researcher boundary

AI 可以完成决定机会是否存在的模型、oracle 与 matching-schedule 核心路径；研究者负责审阅最终 proof、选择投稿叙事和确认组内理论边界。任何 profiling 数字都必须另行标为 simulator/GPU 证据，不能从理论模型推断。
