# O4-DYNCACHE-PGM — Cache-local fully dynamic learned index with a per-update cap

- Status: `PROPOSE_STAGE0` (建议性 Discovery 输出；不是正式候选、未创建 Stage 0)
- Opportunity origins: `O4`
- Domain tags: `ALGORITHM_DATA_STRUCTURE`, `DATABASE_SYSTEM`, `LEARNED_INDEX`
- Contribution route: `N1 + N2`
- Discovery date: 2026-08-03
- Discovery method revision: `v2`

## Research question

能否为一维动态有序索引设计一个**页连续（cache/page-local）**的 learned representation：在固定误差 `ε`、固定页大小 `B` 和受限额外空间下，同时保持逐操作的重建工作上界与 output-sensitive predecessor/range semantics，避免现有 fully dynamic ε-cover 依赖随机访问的 dynamic convex-hull 结构？

本题不主张“首个 fully dynamic learned index”，也不主张只靠检测恶意更新后切换 B+tree。它的可检验主张是：若一组页面级 ε-cover 摘要和双版本 leaf 不变量成立，则在自然删除/重插流和对抗删除流上，可缩小“最坏保证实现的缓存代价—连续 PGM 的删除退化”Pareto 缺口。

## Paper genealogy

- **Anchor paper:** Gæde et al., *A Dynamic Piecewise-Linear Geometric Index with Worst-Case Guarantees*（ESA 2025）。该工作把 dynamic ε-cover 维护为 dynamic convex hull，给出 worst-case `O(log² n)` update；其结论明确报告随机访问的 cache penalty，并把 memory-access-efficient fully dynamic conversion 留为开放问题。[正式论文](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64)
- **Key predecessors:**
  - Ferragina & Vinciguerra, *The PGM-index*（PVLDB 2020）：连续布局的 fully dynamic PGM，更新为 amortized，提供开源实现与 API。[项目/论文入口](https://pgm.di.unipi.it/)
  - Ding et al., *ALEX*（SIGMOD 2020）：动态 learned index 的强实践基线，覆盖 point/range/insert/update/delete。[原论文](https://arxiv.org/abs/1905.08898)；[官方代码](https://github.com/microsoft/ALEX)
- **Follow-up / competing papers:**
  - Yang et al., *Algorithmic Complexity Attacks on Dynamic Learned Indexes*（PVLDB 2024）：对 ALEX 的 memory/time worst-case 薄弱点做直接攻击与量化。[PVLDB 论文](https://www.vldb.org/pvldb/vol17/p780-yang.pdf)
  - Zhang et al., *HIRE*（PACMMOD/SIGMOD 2026）：hybrid leaf、log-based update 与 nonblocking recalibration，主打 mixed workload 的 throughput/tail stability。[论文记录](https://arxiv.org/abs/2511.21307)
- **Counter-evidence / negative source:** ESA 2025 的实验显示其最坏保证实现通常落后于连续布局的 logarithmic PGM，原因正是 random access/cache inefficiency；这不是本题的支持性数据，而是必须反转的核心负证据。[原文结论](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64)
- **Artifact / benchmark / specification:** PGM-index 的 C++ 源码可得；ALEX 官方源码可得。HIRE 与 ESA 2025 的可复用公开实现，在本轮公开检索范围内为 `NOT_FOUND_WITHIN_SEARCH`。自然更新输入采用 OpenStreetMap 的公开 replication diffs（minutely/hourly/daily 变更流）和其文档化更新格式，而不是单一 issue 或仅合成序列。[OSM replication 文档](https://wiki.openstreetmap.org/wiki/Osmosis/Replication)
- **Search boundary:** 2026-08-03，检索 arXiv、PVLDB、Dagstuhl/LIPIcs、ACM/官方会议记录、作者/项目官方页和 GitHub 官方仓库；精确查询记录于 `SEARCH_LOG.md`。结论仅为 `SEARCH_BOUNDED_OPEN`，不是全球首次声明。

## Topic-origin card

- **Trigger:** O4 将“良性混合负载上的平均吞吐/空间”改为“每次更新可预期的工作上界 + page/cache 连续性 + 受限峰值重建空间”。动态凸包方案换来最坏保证却随机访问；logarithmic PGM 连续却在删除后的 output-sensitive range 情景出现结构性代价。
- **Measurable observation / quantitative anchor:** ESA 2025 直接观察到 dynamic convex-hull 实现因随机内存访问在较大数据集上受到严重 cache penalty，而连续 logarithmic PGM 在除 adversarial 场景外更快；PVLDB 2024 还显示 ALEX 的设计可被小比例更新诱发 memory/time 放大。[ESA 2025](https://drops.dagstuhl.de/entities/document/10.4230/LIPIcs.ESA.2025.64)；[PVLDB 2024](https://www.vldb.org/pvldb/vol17/p780-yang.pdf)
- **Baseline limitation:** 不是“没有一个快的 index”，而是四类现有动作分别牺牲了目标的一角：ALEX/HIRE 倚赖启发式重标定；logarithmic PGM 是 amortized/多层查询；ESA 2025 有 worst-case 理论但布局非连续；B+tree 无 learned ε-cover 的紧凑表示。
- **Optional inherited assumption:** 不假定 fault 或攻击必然发生；自然 OSM 更新流是首要证据，对抗删除只是 guarantee 压力测试。
- **Structural cause:** 对 global ε-cover 的动态维护使用 pointer-rich hull/rebalancing，或用多层 immutable PGM 加 tombstone；这让“单次更新触碰多少页面”和“查询是否扫描删除遗留”成为不可忽略的约束结构。
- **Decision variable:** key/rank 分区到固定大小页面、每页 ε-cover 摘要、边界 merge/split certificate、双版本 rebuild 状态、每次更新分配的重建 credit 与 delta 容量。
- **Candidate Q1 venue family:** `VLDB Journal`, `ACM TODS`, `IEEE TKDE`；系统/数据管理会议形态的校准为 SIGMOD/PVLDB/PACMMOD。

## Historical method calibration

- Source-session backtest file: `stages/discovery/_method-backtests/O4_OBJECTIVE_CONSTRAINT_SHIFT/v2/backtest_review.md`
- Backtest status: `CALIBRATED`（3/3 正例合理恢复，负对照 ABSTAIN，无污染/泄漏）
- This field calibrates the discovery method and is not candidate evidence.

## Importance and group fit

动态有序索引是数据库、地图与日志系统的基础组件。该对象适合项目的“算法/数据结构 + 系统成本”范围：理论主张由页级不变量约束，实践主张由 cache/TLB、range semantics、peak rebuild memory 与真实 chronological stream 共同计价。它不依赖私有硬件或专有模型。

## Exact object

**冻结对象：** 单机内存中的一维动态 ordered index，键为固定宽度的 lexicographic `(Hilbert-cell, OSM-element-id)`；数据状态由公开 OSM replication diffs 依时间顺序施加 create/modify/delete 形成。语义为 exact predecessor 和 output-sensitive closed range reporting；learned component 只产生包含真位置的 `ε`-bounded search interval，不改变答案。

为避免把应用改名，所有机制必须也在整数 key 的 SOSD-style 静态分布加公开 chronological OSM update stream 上运行；OSM 只提供自然 update/order 证据，不缩窄算法语义。

## Named fair baselines

- **Deployment/default baseline:** 当前开源 `pgm-index` 的 dynamic/logarithmic PGM（同一 predecessor/range 语义；官方 C++ 实现）。
- **Closest recent-paper baseline:** Gæde et al. ESA 2025 dynamic ε-cover / dynamic indexing conversion（同一 fully dynamic learned-index 对象与 worst-case 目标）。若作者实现仍不可得，Stage 0 必须明确采用论文伪码的受限复现或只将其用于理论比较，不能把不可运行组件伪作 benchmark。
- **Competitive simple baseline:** `tlx::btree` 的 in-memory B+tree 配置（同一键、更新与 range semantics）；不使用“按 workload 选 ALEX/PGM/B+tree”的万能 union。
- **Additional current deployment baseline:** ALEX 官方实现，固定同一 error/space budget；HIRE 为论文级强基线，公开源在本轮检索中未找到，须在 Stage 0 查证。
- **Optional offline ceiling:** 对固定 epoch 的 static PGM 只作为 rebuild/查询空间的 oracle ceiling，不能与在线动态结构做公平胜负基线。

## Mechanism hypothesis

提出 **Paged Deamortized ε-Cover (PDEC)**：不是运行时 selector，而是一个索引本体。全局 ε-cover 被分成连续 page-sized segment blocks；每页保留可组合的 boundary feasibility certificate 和小型 sorted delta。更新仅修改 root-to-leaf 的 page summaries；当页满/失效时，用预先分配的 credit 逐步构造相邻的新版本页。查询只看一个已发布版本和有界 delta，range reporting 从连续 leaf 链开始。

目标不是在 brief 中预先声称新定理，而是在 Stage 0 验证下列可证伪命题：PDEC 是否能在固定 peak auxiliary-space 下实现 non-amortized page-work cap，并保持 ε-search correctness 与 output-sensitive range semantics，同时相对 ESA 2025 减少随机访问、相对 logarithmic PGM 减少删除后的查询惩罚。

## Competing mechanisms

- **Mechanism A — page-local feasibility certificates:** 每个页面记录能够合并的相邻 ε-cover segment 的紧凑 hull/interval 摘要；merge/split 由相邻页面 certificate 判定，避免把完整 point set 导入 pointer-heavy dynamic hull。其特异预测是 cache/TLB miss 和重建流量下降；失败条件是 certificate 无法在 `B` 内限制 worst-case page touches。
- **Mechanism B — two-version credit rebuild:** leaf 的旧/新连续版本在固定额外页预算下短暂共存，更新贡献固定 rebuild credit；发布前所有查询读取一个版本加有界 delta。其特异预测是 p99/max update 和峰值临时空间可控；失败条件是 adversarial alternating updates 让 delta 或版本重叠无界。
- **Preferred mechanism and why:** A+B 的组合是必要的：A 处理 cache locality，B 处理非摊还重建。单独采用 A 没有 update cap，单独采用 B 不能消除 hull 的随机访问；它们不是同义的参数调节。

## Mechanism signature

若机制正确，应该同时看到：(i) 相对于 ESA 2025，缓存/TLB miss 与 p99 update 下降；(ii) 相对于 logarithmic PGM，删除后 range-query scan/latency 不再随 tombstone 历史显著放大；(iii) 相对于 ALEX/HIRE，最大单次 update 与 peak auxiliary bytes 有可审计上界。只提升平均 QPS 而无三者中的至少两项，不支持主 claim。

## Seed-distance test

- **What changes relative to the anchor:** ESA 2025 的决策变量是 dynamic convex-hull tree 的维护；本题的变量是 page partition、certificate、双版本重建与每更新 credit。新约束是 cache/page locality 与 peak auxiliary space 共同进入 guarantee，而不只是维持 ε-cover complexity。
- **What changes relative to the closest prior work:** 相对 HIRE，候选不选择 leaf 类型或以 cost-driven recalibration 改变策略；它寻求对单一页连续 ε-cover 表示施加不变量与逐操作预算。相对 log PGM，候选不只是改 rebuild threshold，而是改变更新期间可见状态与 range traversal。
- **Why this is not an application/backend rename:** OSM stream 是自然工作负载；数据结构、语义、理论不变量和基线均保持通用 ordered-index 对象。
- **Result of method-name deletion test:** 删除“learned”“PGM”“cache”等名词后，问题仍是：能否在动态有序集合中同时约束每次维护工作、额外空间和连续内存访问，同时保留 exact output-sensitive range 查询。这是明确的决策/约束结构，不是工具组合。

## Candidate paper claim

在一维动态 ordered index 中，提出带 page-local certificate 与 credit-scheduled dual version 的 ε-cover 表示；在**经验证的不变量前提下**，它提供 bounded per-update maintenance、bounded auxiliary space 与 exact predecessor/output-sensitive range semantics，并在自然删除/重插流上填补 worst-case dynamic ε-cover 与连续 logarithmic PGM 的 cache-aware Pareto 缺口。

## Evidence route

- `PERFORMANCE`
- `COMPLEXITY_THEORY`

## Software/algorithm performance admissibility, if applicable

- **Same-function contract:** 所有实现返回相同 exact predecessor/range 结果；ε 仅限制预测窗，不允许近似答案。
- **Algorithmic delta:** page-local certificate + dual-version credit rebuild 是新表示和维护算法；不是换一组 ALEX/HIRE 阈值。
- **Full-cost ledger scope:** throughput、p50/p99/max lookup/update、range output size、cache/TLB miss、bytes/key、peak auxiliary bytes、rebuild pages/bytes、构建时间、线程数、CPU/NUMA、编译 flags、错误/不变量违例。
- **Generality hypothesis:** 对 map-like chronological edits、delete-heavy 流和分布漂移均有效；不把单一 OSM city/diff 作为一般性证据。
- **Why this is not routine tuning:** page layout 与 visibility/rebuild invariant 规定可行解空间；若只改 page size 或 rebuild threshold，不能形成主 claim。
- **Expected no-gain region:** append-only、几乎无删除且 cache 足够时，连续 logarithmic PGM 或 static PGM 应更快；高度随机、极小数据时 B+tree 可能胜出。

## Nearest-prior facet matrix

| Facet | Candidate | Closest prior (ESA 2025) | Residual |
|---|---|---|---|
| Research problem | Worst-case dynamic learned indexing with cache/peak-space constraint | Worst-case dynamic ε-cover/indexing | 以 locality 作为一等约束 |
| Exact object | In-memory 1D exact predecessor/output-sensitive range index | Dynamic ε-cover + hash/list indexing conversion | 相同核心对象，需严格同语义比较 |
| Decision variables | Page partition, certificate, version, rebuild credit | Dynamic convex-hull tree and geometric segment maintenance | 新的表示与维护状态 |
| Constraints / information | ε correctness + page touches + peak auxiliary space | ε correctness + worst-case dynamic hull operations | 非同义约束结构 |
| Core algorithm or mechanism | Page summaries + two-version credit rebuild | Dynamic convex hull + separating-line construction | 不同维护原语 |
| Guarantee | 拟验证 per-operation/page-work 与 semantics | `O(log² n)` update / output-sensitive conversion | 必须由 Stage 0 证明未被弱化 |
| Evidence object | Natural OSM stream + delete stress + cache counters | Synthetic/geometric data + theory experiment | 增加自然 chronological evidence |

## Current collision classification

- **DIRECT_FATAL:** `NOT_FOUND_WITHIN_SEARCH`；本轮未找到同时具有“dynamic ε-cover + worst-case per-update + page-local continuous layout + bounded dual-version rebuild + exact output-sensitive range”的一手论文。此项是搜索边界结论，不是全球首次声明。
- **DIRECT_SUBTRACT:** ESA 2025 已占据 fully dynamic ε-cover 与 worst-case dynamic indexing；候选不得再主张这些一般结论，只能主张其 cache-local, peak-space-bounded residual。HIRE 已占据 hybrid/非阻塞重标定；候选不得用相同的 leaf selector 或 controller 叙述。
- **METHODOLOGICAL_ADJACENT:** ALEX、PGM、algorithmic complexity attacks、B-tree deamortization；它们提供设计/反例，但不自动覆盖 page-certificate 表示。
- **DEPLOYMENT_BASELINE:** PGM-index、ALEX、B+tree；HIRE 若取得代码也成为部署基线。
- **SEARCH_BOUNDED_OPEN:** 截止 2026-08-03 的上述官方/一手检索。Stage B 必须重新做最新碰撞审查。

## Decisive falsifier

先证明或反驳两个不变量：(1) 每次更新只引发有界数量的 page certificate 修改，(2) 双版本/δ-buffer 在任意交替 delete/insert 下有固定 peak-space 上界。任一不变量失败即 `DROP`。

若不变量成立，再用相同语义、相同 key stream、固定内存预算比较 PDEC、logarithmic PGM、B+tree、ALEX；若 `(p99 update, range p99, cache/TLB misses, bytes/key)` 的 Pareto 前沿被任一现有部署基线覆盖，或优势只出现在合成 ACA 而不在 OSM chronological stream，亦 `DROP`。

## Executable evidence path

### 72-hour first evidence

1. 从 PGM-index 的开源 C++ 实现抽出 ε-cover search 与动态基线接口；用 `tlx::btree` 与 ALEX 同一 driver 验证 exact predecessor/range oracle。
2. 将 7–30 天 OSM minute/hourly replication diffs 映射为 `(Hilbert-cell, element-id)` insert/delete/update 流；固定映射脚本和初始快照哈希。
3. 实现仅含 page-local certificate 的单线程原型和两个不变量断言；记录每 update 的 touched pages、cache/TLB counter、peak bytes。
4. 在 OSM stream、delete-heavy permutation、uniform/Zipf 三类受控补充序列上运行。第 1 天若不变量反例出现，第 2 天停止；第 3 天只在语义/内存一致时做小规模 Pareto。

### AI core fraction and critical path

- **AI execution class:** `AI_CORE_CONDITIONAL`，估计 0.65。
- **AI 可审计核心：** C++ prototype、oracle differential test、trace parser、benchmark harness、perf/cache counter 采集、统计与可视化。
- **研究者关键边界：** worst-case proof 的正式审计、模型/页不变量是否足以推出主 guarantee、以及 OSM key 映射是否保持研究语义。
- **Why conditional:** AI 可完成主要实现与比较，但决定论文主 claim 的最坏保证不能仅凭生成代码断言。

### Semantics-preserving open alternatives

- `pgm-index`（官方 C++ source）；
- Microsoft ALEX（官方 C++ source）；
- `tlx::btree`（开源 B+tree）；
- OSM planet/replication diffs（公开自然变更输入）。

## Q1 sufficiency hypothesis

- **Why this could support a complete Q1 paper:** 如果能同时给出可信的 non-amortized invariant/界、真正同语义的 cache-aware Pareto 和自然 chronological update 证据，它连接算法数据结构与数据库系统的真实缺口，不是单点优化。
- **What would still be required at Stage B:** 完整前向/后向 citation collision、HIRE/ESA 实现可得性核验、理论证明审计、至少两个独立自然 stream、跨 CPU/cache 层级实验、与 B+tree/PGM/ALEX 的公平消融和 no-gain 区域。
- **Preliminary contribution-shape analogs, if any:** ALEX（SIGMOD 2020）的 dynamic learned index 结构、PGM-index（PVLDB 2020）的理论/工程合一、HIRE（PACMMOD/SIGMOD 2026）的混合工作负载稳定性。它们是 venue/contribution 形态校准，不是新颖性证据。
- **Reminder:** preliminary analogs do not replace Stage 0 Q1 calibration.

## Dual-axis score

- Academic value: `58/70`
- AI executability bonus: `20/30`
- Total: `78/100`

## AI and researcher boundary

本 brief 由 AI 辅助检索和综合；所有来源链接、搜索边界和不确定性已保留。它建议独立 Stage 0 审查，不构成自审晋级，也不授权正式实验、论文项目或硬件占用。
