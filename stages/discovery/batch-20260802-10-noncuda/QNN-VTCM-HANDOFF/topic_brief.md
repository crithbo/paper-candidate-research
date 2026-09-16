# QNN-VTCM-HANDOFF VTCM spill–shared-memory handoff scheduling for QNN sessions

- Status: `https://github.com/microsoft/onnxruntime/blob/main/docs/execution_providers/QNN-ExecutionProvider.md`
- Primary lane: NPU runtime
- Discovery date: 2026-08-02

## Research question

在同一 QNN HTP 模型的多会话到达下，何时以共享内存、VTCM 预留或 spill/fill 执行子图，才能在端到端延迟、内存与隔离间产生真实的非支配解？

## Importance and group fit

该题把公开编译器、运行时、PIM 或数据系统中的一项真实资源决策提升为可证伪的算法/机制问题；不以异常或包装层为贡献。

## Exact object

QNN EP 的 HTP context；输入为同一 ONNX 模型的多会话请求及 profiling trace。动作是共享缓冲区、VTCM reservation、spill/fill 或 CPU reference fallback；计入 RPC、context prepare、拷贝、同步、预热和 fallback。

## Strongest fair baseline

QNN 默认配置、仅共享内存、仅 spill/fill、以及拥有全部动作但无会话状态的贪心联合策略。

## Mechanism hypothesis

会话状态驱动的 lease-transfer：把 VTCM 释放的未来恢复成本与共享内存冲突一并计入，且明确不会把跨会话缓冲区当作免费。

## Competing mechanisms

A: 仅 VTCM 水位；B: 仅 queue deadline；C: lease-transfer + isolation debt（首选）。

## Candidate paper claim

若 C 在公开 QNN CPU/reference 路径和可获得 HTP trace 上均无法给出与联合基线不同的合法动作，或隔离成本抵消收益，即否定。

## Current collision subtraction

58

## Decisive falsifier

ONNX Runtime QNN 文档暴露 CPU reference、VTCM、spill/fill、shared allocator 与 CSV profiling；首证可做可执行成本模型，真实 HTP 需设备。AI 关键路径约 0.45。

## Executable evidence path

### 72-hour first evidence

SEARCH_BOUNDED_OPEN；不同于 NPU-SHAPEBUDGET 的编译变体 portfolio，也不同于 CXL KV 的 KV block tiering。

### AI core fraction and critical path

`PROPOSE_STAGE0`; 仅将完成的本地/开源重放称为证据，不把模拟、分析或未获设备替代物写成硬件测量。

### Semantics-preserving open alternatives

允许公开 CPU backend、functional simulator、公开 trace 或 exact oracle；不得把语义不同的硬件/协议替代物提升为同对象结果。

## Dual-axis score

- Academic value: `12/70`
- AI executability bonus: `AI_AUXILIARY_ONLY/30`
- Total: `NaN/100`

## AI and researcher boundary

AI 可实现/重放所述最小模型、基线、日志和 oracle；研究者仍负责设备授权、最终 claim 边界、未公开 workload 与发表裁决。
