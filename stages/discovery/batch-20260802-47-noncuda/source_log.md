# 一手来源日志

| key | 来源 | 用途/结论 |
|---|---|---|
| flink-cep | [Apache Flink CEP documentation](https://apache.googlesource.com/flink/%2B/refs/heads/blink/docs/dev/libs/cep.md) | 说明 event-time CEP 在 watermark 后把 late element 视为不再处理；且支持 negative patterns。是 CEP 候选的 deployment baseline。 |
| flink-time | [Flink event-time debugging](https://nightlies.apache.org/flink/flink-docs-stable/docs/ops/debugging/debugging_event_time/) | watermark 由最慢上游主导，late-data policy 是公开可复现的成本/语义边界。 |
| flink-negation | [FLINK-26941](https://issues.apache.org/jira/browse/FLINK-26941) | 已有 terminal negation/pending state；因此候选不能把 timeout support 当贡献。 |
| llvm-pgo | [LLVM PGO build guide](https://llvm.org/docs/HowToBuildWithPGO.html) | PGO 依赖代表性 workload，并支持可重放的 profile 采集/合并，提供 compiler 候选 artifact。 |
| postgres | [PostgreSQL planner/optimizer docs](https://www.postgresql.org/docs/18/planner-optimizer.html) | 计划空间与优化选择已是部署基线；排除把 plan selection 改名为研究。 |
| silk | [SILK, USENIX ATC 2019](https://www.usenix.org/conference/atc19/presentation/balmau) | I/O scheduler 已联合处理 writes、flushes、compactions，并针对 tail latency；LSM 题直接碰撞。 |
| hats | [HATS, USENIX FAST 2026](https://www.usenix.org/conference/fast26/presentation/ren) | 已联合 co-schedule reads 与 compaction，进一步确认 LSM 题为 `DIRECT_FATAL`。 |

限制：图三角候选未将搜索空白陈述为新颖性结论；Stage 0 必须补足作者论文/开放实现的 collision matrix。
