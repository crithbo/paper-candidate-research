# SEARCH LOG — S4 Objective / Constraint Shift

## 可复现性说明

- 日期：2026-08-03（Asia/Shanghai）
- 搜索工具：Codex web search；优先官方会议页、出版方页面、OpenReview 和 arXiv 原始摘要/PDF
- 网络总命中数：搜索工具未提供稳定的总命中计数，因此不虚构 hit total
- 纳入边界：目标/约束变化必须改变算法、表示、布局或编译动作
- 排除边界：纯 controller、checker、wrapper、已有 selector 换权重、单 issue、没有自然 workload 的异常、仅靠产品宣传的结论
- 验证等级：
  - `OFFICIAL_PROCEEDINGS_PAGE`：会议/出版方官方页面
  - `PRIMARY_PREPRINT`：作者提交的 arXiv/OpenReview 原始记录；不等价于同行评审
  - `PRIMARY_PDF_TEXT`：通过原始 PDF 的可检索文本核对关键段落
  - `DISCOVERY_ONLY`：仅用于扩展查询，不用于支撑 raw 事实

## 查询账本

| # | 查询族 / 实际检索式 | 主要筛选结果 | 决定 |
|---|---|---|---|
| 1 | `site:usenix.org conference LLM inference energy power cap tail latency serving paper`；`site:dl.acm.org LLM inference power cap energy SLO systems paper` | Sarathi-Serve、PALS、Festina、power-capping 预印本 | 多数为 serving scheduler/controller；排除为主 |
| 2 | `site:arxiv.org tensor compiler compilation time memory budget Pareto schedule search 2025`；`site:openreview.net machine learning compiler compilation time optimization budget schedule search` | Ansor、DynaTune、Transfer-Tuning、Compiler World Models | 形成 `RAW-O4-03`；保留高碰撞标记 |
| 3 | `site:arxiv.org PIM reliability ECC bit error energy overhead 2025`；`site:ieeexplore.ieee.org PIM thermal reliability mapping accelerator` | Domain-Specific ECC、ECC alternatives、3D-CIMlet | 作为可靠性邻近谱系；未单独成题 |
| 4 | `site:usenix.org vector search tail latency memory budget dynamic index 2025`；`site:arxiv.org filtered ANN resource constraint benchmark` | Quake、DistVS、FANNS benchmark | 机制空间拥挤且易退化为 selector；未纳入 |
| 5 | `mobile NPU battery peak current compiler fusion DVFS`；`site:arxiv.org NPU battery compiler power burst fusion` | fusion-induced power-burst 预印本、μNPU | 形成高碰撞哨点 `RAW-O4-01` |
| 6 | `intermittent DNN inference energy harvesting checkpoint-free accelerator` | CAMEL、Chinchilla、energy-adaptive intermittent inference | 已有 checkpoint/runtime 主线密集；未纳入 |
| 7 | `GPU tail latency memory clock correlated deadline miss compiler fusion preemption` | tail/clock 测量、MonoNN、GPREEMPT、Event Tensor | 形成 `RAW-O4-02` |
| 8 | `quantized LLM reliability scaling bit flip fault tolerance 2025 2026` | quantized reliability scaling、逻辑/LUT fault 工作 | fault model 与量化鲁棒性工作密集；未纳入 |
| 9 | `dynamic learned index worst case guarantees adversarial updates memory blowup` | ALEX、complexity attack、PGM | 发现 O4 清晰对象 |
| 10 | `cache efficient dynamic learned index worst case guarantees ESA 2025 HIRE` | ESA 2025 fully dynamic guarantees、HIRE | 形成 `RAW-O4-04`，同时提高理论/碰撞门槛 |
| 11 | `TVM MetaSchedule tuning time budget early stop incremental compilation schedule` | TVM 官方文档、Ansor、DLight、数据库复用 | 确认不能只做 early-stop 或 budget selector |
| 12 | `GPU compiler tail latency fusion preemption safe points persistent kernel` | MonoNN、GPREEMPT、GPUOS/Event Tensor 邻近项 | 收紧 `RAW-O4-02` 到编译期粒度与状态布局 |
| 13 | `learned index deamortized rebuild cache locality worst case update` | PGM、ESA、HIRE、传统 tree 基线 | 收紧 `RAW-O4-04` 到数据结构本体 |
| 14 | `domain specific ECC AI inference HBM bit cost throughput accuracy` | IBM/预印本 Domain-Specific ECC | 作为 `RAW-O4-05` 的强普通-ECC 反基线 |
| 15 | `shared prefix KV cache reliability bit flip blast radius recovery`；`fault tolerant KV cache streaming replication` | shared-KV bit flip、DéjàVu、Residual Stream、VeriCache | 形成高碰撞 `RAW-O4-05` |
| 16 | `site:usenix.org/conference/osdi24/presentation MonoNN end-to-end model fusion`；`site:usenix.org/conference/atc25/presentation GPREEMPT GPU preemption` | USENIX 官方页面 | 核验会议元数据与核心机制 |
| 17 | `site:openreview.net "DéjàVu" "KV-cache Streaming"`；`site:arxiv.org/abs/2604.17249 "Bit-Flip Vulnerability"` | OpenReview 与 arXiv 原始记录 | 核验 KV 可靠性谱系 |

## 核心来源核验表

| 来源 | 年份/状态 | 验证等级 | 本轮用途 | 限制 |
|---|---:|---|---|---|
| [Mitigating Compiler Fusion-Induced Power Bursts...](https://arxiv.org/abs/2607.16555) | 2026 预印本 | `PRIMARY_PREPRINT` | NPU 电池/峰值电流现象与直接碰撞 | 未按正式同行评审论文处理；需全文复核 |
| [μNPU benchmark](https://arxiv.org/abs/2503.22567) | 2025 预印本 | `PRIMARY_PREPRINT` | 设备异质性与可复现实验风险 | 不是 fusion 直接工作 |
| [DSA graph scheduling](https://www.usenix.org/conference/osdi23/presentation/zhao) | OSDI 2023 | `OFFICIAL_PROCEEDINGS_PAGE` | NPU/DSA 图分割与调度强邻近 | 尚未逐算法做碰撞矩阵 |
| [Beyond CPU-GPU Frequency...](https://arxiv.org/abs/2606.16106) | 2026 预印本 | `PRIMARY_PREPRINT` | GPU 尾部、EMC 与相关 miss 现象 | 数值需独立复现 |
| [MonoNN](https://www.usenix.org/conference/osdi24/presentation/zhuang) | OSDI 2024 | `OFFICIAL_PROCEEDINGS_PAGE`、`PRIMARY_PDF_TEXT` | monolithic fusion 强基线 | 面向静态 NN，覆盖范围需分 workload |
| [GPREEMPT](https://www.usenix.org/conference/atc25/presentation/fan) | USENIX ATC 2025 | `OFFICIAL_PROCEEDINGS_PAGE` | 通用 GPU 抢占强基线 | 本题不能重复其 runtime mechanism |
| [Event Tensor](https://openreview.net/forum?id=PJqFhAbUHa) | OpenReview | `PRIMARY_PREPRINT` | 动态 GPU 表示邻近工作 | 接收状态与完整覆盖需后续核验 |
| [Ansor](https://arxiv.org/abs/2006.06762) | OSDI 2020 论文记录 | `PRIMARY_PREPRINT` | autotuning 搜索成本基线 | 本轮未重跑代码 |
| [TVM MetaSchedule](https://tvm.apache.org/docs/deep_dive/tensor_ir/tutorials/meta_schedule.html) | 持续更新文档 | `OFFICIAL_PROCEEDINGS_PAGE` 等价的官方文档级 | search-based tuning、DLight、数据库复用 | 文档会变化；本日志仅对应 2026-08-03 |
| [DynaTune](https://openreview.net/forum?id=GTGb3M_KcUl) | ICLR 2021 | `PRIMARY_PREPRINT` | 加速调优收敛邻近 | 需区分测量次数与端到端编译时间 |
| [Transfer-Tuning](https://arxiv.org/abs/2201.05587) | 2022 预印本 | `PRIMARY_PREPRINT` | 跨 workload 迁移基线 | 设备与 task 覆盖有限 |
| [Compiler World Models](https://arxiv.org/abs/2606.09312) | 2026 预印本 | `PRIMARY_PREPRINT` | 少测量短预算强碰撞 | 很新，尚未做代码复现 |
| [ALEX](https://arxiv.org/abs/1905.08898) | 2019/后续发表 | `PRIMARY_PREPRINT` | 动态 learned index 代表 | 需使用发表版数据做正式 brief |
| [Algorithmic Complexity Attacks...](https://arxiv.org/abs/2403.12433) | 2024 预印本 | `PRIMARY_PREPRINT` | 最坏时间/空间问题来源 | 对抗输入不自动等于自然 workload |
| [PGM-index](https://pgm.di.unipi.it/) | 项目/论文入口 | `OFFICIAL_PROCEEDINGS_PAGE` 等价的项目原始入口 | 有保证结构与实现基线 | 需逐版本锁定代码 |
| [Dynamic Indexing Through Learned Indices with Worst-case Guarantees](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64) | ESA 2025 | `OFFICIAL_PROCEEDINGS_PAGE`、`PRIMARY_PDF_TEXT` | 最直接理论邻近；开放问题线索 | 很可能吸收大部分理论增量 |
| [HIRE](https://arxiv.org/abs/2511.21307) | 2025 预印本 / 2026 发表线索 | `PRIMARY_PREPRINT` | 工程 tail/动态 leaf 强基线 | 正式卷期/最终版需后续核验 |
| [Bit-Flip Vulnerability of Shared KV-Cache Blocks...](https://arxiv.org/abs/2604.17249) | 2026 预印本 | `PRIMARY_PREPRINT` | 共享前缀 fault 对象和 checksum 直接碰撞 | 软件理想注入，生态发生率未证实 |
| [DéjàVu](https://openreview.net/forum?id=AbGbGZFYOD) | ICML 2024 | `OFFICIAL_PROCEEDINGS_PAGE`、`PRIMARY_PDF_TEXT` | KV streaming/replication 故障恢复基线 | 主要故障粒度是 worker/pipeline |
| [Domain-Specific ECC](https://research.ibm.com/publications/breaking-the-hbm-bit-cost-barrier-domain-specific-ecc-for-ai-inference-infrastructure) | 2025 研究页/论文 | `OFFICIAL_PROCEEDINGS_PAGE` | 应用层 repair layout 的强反基线 | 需获得最终论文与实现细节 |
| [Residual Stream](https://arxiv.org/abs/2603.19664) | 2026 预印本 | `PRIMARY_PREPRINT` | 紧凑 KV 重构直接邻近 | 很新；当前只完成摘要级核验 |
| [VeriCache](https://arxiv.org/abs/2605.17613) | 2026 预印本 | `PRIMARY_PREPRINT` | KV 验证/近似邻近 | 与 fault recovery 的边界需全文确认 |

## 排除记录

1. **LLM serving energy/power schedulers。** PALS、Festina 等主要通过调度、功率或 batch controller 选择现有动作；本轮规则禁止把通用 controller 当贡献，因此未形成 raw 条目。
2. **filtered ANN/FANNS 资源切换。** Quake、DistVS、FANNS benchmark 等已经覆盖多层索引、精度/存储层级和动态选择；没有发现不依赖 selector 的清晰新表示，暂不纳入。
3. **intermittent inference checkpoint。** CAMEL、Chinchilla 及后续 checkpoint-free/adaptive 工作谱系较密，首轮未找到目标变化后足够不同的对象级动作。
4. **量化 LLM fault tolerance。** scaling law、bit-flip 与编码/冗余方向拥挤，且容易退化为 checker 或普通 ECC 包装；只把 ECC 保留为 KV 条目的反基线。
5. **单纯 power cap/DVFS。** 只设置功率上限或频率 controller 不改变编译/算法动作，不纳入。

## 搜索不足与下一轮必做项

- 尚未对 5 条分别执行完整双向/前向引用追踪，也没有达到 production brief 的搜索饱和。
- 2026 年预印本需要检查后续版本、代码、评审状态和同时间独立工作。
- `RAW-O4-01`、`RAW-O4-05` 必须先做全文 direct-collision audit。
- `RAW-O4-02` 需要把 runtime queueing、硬件 DVFS 与 compiler granularity 的因果贡献分离。
- `RAW-O4-03` 需要核对所有“anytime compilation / incremental codegen / multi-versioning”术语变体。
- `RAW-O4-04` 需要逐条比较 ESA 2025、HIRE、PGM、ALEX 与传统 B-tree/ART 的定理和实现。
- 在 method v2 独立回测完成之前，上述不足不通过扩大成正式调研来规避 gate。

## Production convergence refresh — 2026-08-03

### Gate and protocol

O4 auditor handoff is now `CALIBRATED` (3/3 reasonable positive recoveries; negative `ABSTAIN`; no leakage). This refresh treats that result only as method calibration. It re-runs novelty/collision searches rather than inheriting the raw phase's `SEARCH_BOUNDED_OPEN` labels.

### Refresh query ledger

| Query | Primary sources retained | Finding / action |
|---|---|---|
| `"anytime" tensor compiler autotuning incremental compilation schedule search` | [AdaTune PDF](https://www.microsoft.com/en-us/research/wp-content/uploads/2020/10/nips20adatune.pdf), [Ansor](https://arxiv.org/abs/2006.06762), [TVM MetaSchedule](https://tvm.apache.org/docs/deep_dive/tensor_ir/tutorials/meta_schedule.html), [Compiler World Models](https://arxiv.org/abs/2606.09312) | AdaTune already evaluates best-found tensor schedules under equal wall-clock budgets, with adaptive evaluation and contextual search. Residual “anytime” framing lacks a distinct decision structure; `RAW-O4-03` dropped. |
| `GPU compiler tail latency kernel fusion preemption scheduling SLA p99 research paper` | [Reef / TOCS record](https://doi.org/10.1145/3768622), [GPREEMPT](https://www.usenix.org/conference/atc25/presentation/fan), [MonoNN](https://www.usenix.org/conference/osdi24/presentation/zhuang), [XSched](https://www.usenix.org/system/files/osdi25-shen-weihang.pdf) | Reef already extends TVM to generate custom kernels for real-time GPU scheduling with reset-based preemption/padding; candidate compiler-yield mechanism is not sufficiently seed-distant. `RAW-O4-02` dropped. |
| `"Dynamic Indexing Through Learned Indices with Worst-case Guarantees" cache efficient 2025`; `dynamic learned index worst-case cache locality deamortized rebuilding adversarial updates` | [ESA 2025](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64), [PGM](https://pgm.di.unipi.it/), [ALEX](https://arxiv.org/abs/1905.08898), [PVLDB attacks](https://www.vldb.org/pvldb/vol17/p780-yang.pdf), [HIRE](https://arxiv.org/abs/2511.21307) | ESA 2025 explicitly reports cache penalty and formulates a memory-access-efficient fully dynamic residual; collision is `DIRECT_SUBTRACT`, not demonstrated `DIRECT_FATAL`, for a page-local ε-cover with bounded dual-version rebuild. One grounded brief retained. |
| `GitHub Microsoft ALEX learned index official repository`; `GitHub HIRE Hybrid Learned Index Robust Efficient Performance Mixed Workloads`; `OpenStreetMap replication diffs public chronological updates documentation` | [ALEX code citation](https://jiayuasu.github.io/files/paper/alex-sigmod2020.pdf), [PGM source](https://pgm.di.unipi.it/), [OSM replication](https://wiki.openstreetmap.org/wiki/Osmosis/Replication) | PGM and ALEX source paths are public. HIRE source was not found in the searched official/preprint records. OSM replication is retained as natural chronological update input, not as a novelty claim. |

### Updated source-verification status

- `OFFICIAL_PROCEEDINGS_OR_PUBLISHER`: ESA/LIPIcs, USENIX, PVLDB, TVM documentation, OSM documentation.
- `PRIMARY_PREPRINT_OR_AUTHOR_PDF`: AdaTune author PDF, HIRE arXiv, Ansor arXiv, Compiler World Models arXiv. These are not inflated to peer-reviewed status.
- `NOT_FOUND_WITHIN_SEARCH`: public HIRE and ESA 2025 code repositories.

### Production-search limitations

- No global-first claim is made. The only retained novelty state is `SEARCH_BOUNDED_OPEN` after explicit direct-subtraction from ESA 2025 and HIRE.
- PDEC's proposed per-operation guarantee is a hypothesis, not an established theorem; a failed invariant is a decisive `DROP`.
- OSM provides natural chronological updates but not, by itself, a database-system adoption trace. Stage 0 must add a second independent real stream before treating generality as supported.
