# ANN-PQ-QUERYBUDGET — Query-conditioned joint probe/refinement budgeting for IVF-PQ retrieval

- Status: `PROPOSE_STAGE0`
- Primary lane: approximation algorithm / vector-retrieval systems
- Discovery date: 2026-08-02

## Research question

在固定 IVF-PQ 索引、检索质量合同和端到端 p99 延迟预算下，能否按查询的不确定性联合选择 `nprobe` 与精确 rerank 候选预算，得到严格优于“静态 PQ + 动态 nprobe”强组合基线的 Recall@K—p99 Pareto 前沿？

## Importance and group fit

ANN 是 RAG/推荐检索的自然瓶颈。FAISS 明确暴露 IVF-PQ、`nprobe` 和 IVFPQR refinement；但这些旋钮通常分开调节。论文核不是“调参”，而是用同一质量合同下可解释的双动作预算器，检验 probe 与 rerank 是否存在由 list-length、coarse-margin 和 query ambiguity 驱动的互补性。

## Exact object

FAISS `IndexIVFPQ` / `IndexIVFPQR`，冻结一个已训练索引；自然输入为 BigANN/FAISS 公共向量集及其官方 query/ground-truth split。每个查询只能选择离散 `(nprobe, r)`，其中 `r` 是从 PQ 候选中做精确距离重排的数量；索引编码、数据库、K、硬件、线程数与 quality contract 固定。成本含 coarse search、被扫描 list 的实际长度、PQ distance、精确向量读取/重排、批处理和 warm-up。

## Strongest fair baseline

固定最优 `(nprobe,r)` Pareto 扫描 + per-query `nprobe` 自适应 + per-query rerank-only 自适应的公平 union；另报 exact `IndexFlat` 上界和固定 IVFPQ/IVFPQR。union 也获得相同的测量特征与训练数据，禁止将离线 index rebuild、GPU 未计成本或 oracle future labels 给提案。

## Mechanism hypothesis

粗量化 margin 小但候选 list 短的查询应增加 `nprobe`；margin 大但 PQ distance 排名不稳定的查询应主要增加 `r`。通过保序的质量风险上界/校准预测器选取联合动作，可在同一 Recall@K 合同下回避 union 中两个单动作控制器的重复花费。

## Competing mechanisms

- Mechanism A: coarse-margin、top-list length 和 PQ score gap 驱动的联合风险控制；预期只在 probe 与 rerank 的边际收益交叉时优于 union。最强反例：风险可分解为只依赖 `nprobe` 或只依赖 `r`。
- Mechanism B: 只做动态 `nprobe`，固定 `r`；预期在真实误差主要来自错过 nearest list 时接近最优。最小实现是 FAISS 参数控制器。
- Mechanism C: 只做动态 rerank，固定 `nprobe`；预期在 list 已被覆盖、PQ ranking 噪声主导时获益。最小实现为重新排序候选。
- Preferred mechanism and why: A 是唯一能产生“两个单动作均不可替代”的可证伪 order inversion；B/C 是必须纳入的机制级消融。

## Candidate paper claim

在冻结的 IVF-PQ 对象与一个 Recall@K/失败率合同下，查询条件化的 `(nprobe,r)` 联合预算器可产生可复现的非支配 p99—质量点；收益来自对 list-selection error 和 within-list PQ ranking error 的分离，而非更宽松的质量或遗漏重排成本。

## Current collision subtraction

`SEARCH_BOUNDED_OPEN`。FAISS 已提供 IVF-PQ、`nprobe`、IVFPQR 与参数空间，故它们是 deployment baselines；检索到的公开说明未证明同一“质量校准的每查询联合 nprobe/r 预算”及对两种误差来源的机制分离。Stage 0 必须检索 adaptive ANN/PQ papers；若强 union 已做相同决策、同一合同和完整成本，则为 `DIRECT_FATAL`。

## Decisive falsifier

在至少一个 BigANN 自然 query split 上，严格质量合同下联合控制器不能超过相同特征、相同训练预算的 B+C union（bootstrap CI 含零），或其动作退化为 B/C 之一，则停止。

## Executable evidence path

FAISS 公开实现与 BigANN 数据可重放；第一阶段仅需 CPU/GPU FAISS 的同机比较，不把 GPU 特性当作 claim。输出每 query 的特征、动作、quality、分项计时、随机种子和 index hash。

### 72-hour first evidence

构建小/中型公开 ANN split 的 IVFPQ 和 IVFPQR，网格测量 `(nprobe,r)`，以校准集训练 A/B/C，并在 held-out queries 上比较质量合同下的 p50/p99。首证据是出现或不存在 A 相对 union 的 order inversion，不是 headline 加速。

### AI core fraction and critical path

`ai_core_fraction: 0.85`。AI 可完成 index build、基线/控制器、计时账本、bootstrap 和日志；研究者只裁决贡献和最终 scope。`AI_CORE_EXECUTABLE`。

### Semantics-preserving open alternatives

FAISS CPU 可先给出语义相同的 index/search 证据；GPU 仅提高测量上限，不能替代 CPU 结果。

## Dual-axis score

- Academic value: `57/70`（重要性 12/15；headroom 12/15；机制 16/20；推广性 10/12；独立性 7/8）
- AI executability bonus: `29/30`（artifact 7；核心 8；本机路径 7；72h 4；重放 3）
- Total: `86/100`

## AI and researcher boundary

AI 可实现和审计关键机制；不能把发现阶段的 search-bounded collision scan 表述为新颖性结论，也不能替研究者裁定论文作者/投稿范围。
