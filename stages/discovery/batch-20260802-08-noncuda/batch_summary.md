# 非 CUDA Discovery 第八波：批次总结

日期：2026-08-02  
范围：非 CUDA；算法/近似、LLM serving、FPGA 编译和 CXL memory tiering。  
结论：4 个 `PROPOSE_STAGE0`；无 `DROP`。所有新颖性判断均为 `SEARCH_BOUNDED_OPEN`，不是首次性声明。

## 建议排序

| 排名 | ID | 方向 | 学术 /70 | AI /30 | 总分 | 执行类 | 建议 |
|---:|---|---|---:|---:|---:|---|---|
| 1 | ANN-PQ-QUERYBUDGET | 检索近似 Pareto | 57 | 29 | 86 | AI_CORE_EXECUTABLE | PROPOSE_STAGE0 |
| 2 | SGLANG-PREFIXFLIGHT | LLM prefix-cache 调度 | 55 | 26 | 81 | AI_CORE_EXECUTABLE | PROPOSE_STAGE0 |
| 3 | CXL-FAISS-LISTTIER | CXL 上的向量检索分层 | 53 | 25 | 78 | AI_CORE_EXECUTABLE | PROPOSE_STAGE0 |
| 4 | FINN-BACKPRESSUREPARETO | FPGA dataflow 编译 | 52 | 24 | 76 | AI_CORE_EXECUTABLE | PROPOSE_STAGE0 |

## 去重与边界

- 与 `NPU-SHAPEBUDGET` 不同：没有动态形状的 NPU 编译 variant portfolio；ANN 和 CXL 题的对象分别是 IVF-PQ 查询与 CXL 中的倒排列表驻留，SGLang 是 KV prefix cache，FINN 是静态数据流图的 FIFO/folding。
- 与 `CXL-KVADMIT` 不同：后者是 LLM KV tier 的 tail-risk/recompute admission；`CXL-FAISS-LISTTIER` 不含 KV、recompute 或请求准入，动作是每个 IVF list 的 CXL/DRAM placement 与 probe 联合选择。
- 与 `UPMEM-RANKBATCH`、`PIM-PRACCREDIT` 不同：本批没有 host/PIM 共同调度。
- 与 `QCOMP-ERRREF`、`ORT-ACTGUARD` 和 `GPU-MXSCALEFLOW` 不同：本批不提出量化 lowering 的误差合同、ONNX activation quantization 或 block-scale metadata 流。
- 与 `ADL-SLACKCAUSE` 不同：FINN 候选的目标是全局 BRAM—p99 latency Pareto，不是回归归因/调试；只将仿真 backpressure 作为优化信号。
- 历史 STOP 核未被复活：没有 IREE 自然图测量、AIE ObjectFIFO trace、PIM row-stride，或普通组件直积作为主要 claim。

## 共同 Stage 0 要求

逐题先复现冻结 workload 与 strongest union，再检查“联合动作”是否产生机制特异的 order inversion。若 union 与提案等价，或在自然 workload 上无非支配点，应 STOP，而不是更换名称或增加包装。没有执行过的结果在本批均标为计划。

各题材料：各自目录中的 `topic_brief.md`、`source_log.md`、`handoff.yaml`。
