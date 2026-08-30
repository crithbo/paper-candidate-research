# 非 CUDA Discovery 第 47 波：可证伪 separation hypothesis 前置

- 日期：2026-08-02；范围：公开可执行的 stream / graph / compiler / database systems。
- 结果：14 个完整 problem-first 对象；3 个 `PROPOSE_STAGE0`，11 个 `DROP`。本波没有建立下游目录、没有修改主控文件或运行正式实验。
- 判定口径：offline `OPT` 仅作 ceiling；公平对照须共享在线信息。候选只承诺一个可证伪的 non-product separation hypothesis，未把 theorem 或论文级 novelty closure 伪装成已证事实。

| ID | 对象与新约束域 | 结论 | 学术/AI/总分 | 决定原因 |
|---|---|---:|---:|---|
| STREAM-CEP-LATE-NEGATION | 有界迟到、带否定 CEP 的正确修复与有限 retract | PROPOSE_STAGE0 | 50/24/74 | 主流 Flink 在 watermark 后丢弃 late element；待检验 causal invalidation frontier 是否超过 replay + buffer union |
| GRAPH-TEMPORAL-TRIANGLE-DEADLINE | event-time 三角计数，分片 deadline 与 recourse 上限 | PROPOSE_STAGE0 | 49/23/72 | 待检验 deadline-aware ownership witness 是否不能由通用 dynamic-triangle batcher 精确模拟 |
| COMPILER-PGO-STALE-REPAIR | profile 漂移下有限编译预算的 selective recompilation | PROPOSE_STAGE0 | 48/25/73 | 待检验 profile-age/IR-impact 交叉状态是否给出对 fixed-refresh 与 static clustering 的新 regret/consistency 目标 |
| DB-PLAN-REGRET-REPLAY | plan regret 诊断/重放 | DROP | 44/24/68 | 与已停止 DB-PLAN-REGRET-WITNESS 同核，且退化为 probe/admit selector |
| LSM-SLA-COMPACTION | compaction 与 tail-SLO 调度 | DROP | 45/25/70 | SILK/HATS 已覆盖 read/compaction 联合调度与 tail latency |
| JIT-GC-ASSIST-BUDGET | JIT/GC 共同辅助预算 | DROP | 43/18/61 | 状态扩张后是通用 online scheduling；缺自然闭合成本模型 |
| IVM-OUTERJOIN-LATE-REPAIR | 并发 outer join 迟到修复 | DROP | 44/23/67 | 与 IVM-PRESTATE-COARSEN 的对象核重叠 |
| STREAM-QUANTILE-WATERMARK-CREDIT | watermark rank sketch credit | DROP | 44/24/68 | 与已停止 STREAM-QUANTILE-LATE-CERT 同核 |
| GRAPH-KCORE-BATCH-CERT | batch k-core certificate | DROP | 45/22/67 | exact batch maintenance/h-index worklist 已覆盖 |
| SEMJOIN-ROBUST-GUILLOTINE | semantic join robust packing | DROP | 43/23/66 | 已证退化为 generic robust rectangle packing |
| VECTOR-ANN-FILTER-ORDER | filtered ANN 验证顺序 | DROP | 43/26/69 | 只是 candidate ordering/cache admission，未定义独立 guarantee |
| RUNTIME-CACHE-ADMISSION-SLO | managed-runtime code-cache SLO | DROP | 43/22/65 | 与 JIT tier/cache 已停止核同构 |
| DB-INDEX-DRIFT-ADMISSION | drift-aware index admission | DROP | 44/25/69 | physical-design advisor 的 budgeted selection 直接覆盖 |
| COMPILER-IR-CHANGE-CACHE | IR change reuse cache | DROP | 42/24/66 | 与 COMPILER-IRHASH-CHANGEFRONTIER 同一 checksum/dependency-rebuild 核 |

## 建议给主线的动作

仅将三个 `PROPOSE_STAGE0` 作为 `SEARCH_BOUNDED_OPEN` 的建议输入 Stage 0；其首门必须先尝试用同信息的 replay/reorder、dynamic-triangle、fixed-refresh/profile-cluster union 复现候选动作。若复现，直接停止，不能改名或把 state bookkeeping 当作贡献。
