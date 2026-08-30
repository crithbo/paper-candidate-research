# CXL-FAISS-LISTTIER — Query-conditioned CXL/DRAM inverted-list placement and probe co-selection

- Status: `PROPOSE_STAGE0`
- Primary lane: CXL memory systems / vector-retrieval runtime
- Discovery date: 2026-08-02

## Research question

在冻结 FAISS IVF-PQ index、CXL remote-memory latency/bandwidth model和检索质量合同下，能否按 query 的候选 list、长度与 reuse 联合决定 DRAM/CXL list residency 与 `nprobe`，使 Recall@K—p99—DRAM-capacity Pareto 优于 Linux-style page tiering、固定 residency 和动态 nprobe 的强组合？

## Importance and group fit

CXL 改变了大索引的容量/访问代价边界；公开 CXL simulators 和 memory traces 使可审计的 early evidence 成为可能。向量检索中 IVF list 不等长，故将 list 放在 CXL 的额外代价随 `nprobe` 和 query 分布变化。论文核不是普通 page migration，而是对 application-visible list 及 quality knob 的联合、完整记账决策。

## Exact object

FAISS `IndexIVFPQ` 对一个公开 ANN 数据集的 fixed inverted lists；模拟或可得 CXL memory tier 为 DRAM/CXL 两层。每个 epoch 动作是将整个 list 放入 DRAM 或 CXL（有明确 migration budget），每 query 选择 `nprobe`；禁止改变 index code、PQ bit width、ground truth、K 或把 CXL 内部理论带宽当作可用带宽。成本包含 remote list reads、DRAM/CXL bandwidth contention、migration/metadata、coarse search、PQ distance、warm-up 和质量失败。

## Strongest fair baseline

固定 hot-list residency + fixed/dynamic `nprobe`，frequency/recency page-style tiering + dynamic `nprobe`，以及能访问相同 historical counters的 matched residency-only 和 nprobe-only union；另报 all-DRAM 和 all-CXL 两端点。所有方法同一 CXL model/trace、DRAM budget、migration budget、index/query split。

## Mechanism hypothesis

访问频率不足以决定 list 价值：长 list 被 probe 时的 CXL penalty 大，而为了稳定 recall 增加 `nprobe` 也会选择不同 list。以每个 query 的 expected marginal remote bytes/quality gain 与 list reuse 共同决定 residency/probe 的策略，应仅在 high-variance list length 与 budget pressure 共存时超越 union。

## Competing mechanisms

- Mechanism A: application-visible list lease + per-query probe 联合优化，明确搬迁与远程读取成本；预期在不等长 list、稀疏 reuse 下改变策略。最强反例：frequency/recency 已完整排序 list 价值。
- Mechanism B: residency-only tiering（frequency/recency/cost-aware）；预期改善固定 probe 的远程访问。
- Mechanism C: nprobe-only adaptive retrieval，固定 list tier；预期在质量—扫描量 trade-off 主导时获益。
- Preferred mechanism and why: A 必须超过 B+C union，且不允许以无代价 migration 或全知 future reuse 得益。

## Candidate paper claim

在 CXL latency/bandwidth 和迁移账本冻结的 IVF-PQ trace replay 中，list-aware tiering 与 query probe 的联合机制可提供可复现的非支配 Recall@K—p99—DRAM capacity 点；收益随 list-length skew 和 query reuse 变化，并在 all-DRAM/all-CXL 端点消失。

## Current collision subtraction

`SEARCH_BOUNDED_OPEN`。CXL memory tiering、page interleaving 和 CXL-flash trace simulation 是邻接/基线，不自动覆盖 application-visible IVF-list 与 probe 的联合决策；FAISS 的 dynamic `nprobe` 也是组件基线。Stage 0 必须核验 CXL vector DB/ANN 文献；如已含同对象、同动作、同成本和同 main claim，视为 `DIRECT_FATAL`。

## Decisive falsifier

在一个冻结 BigANN/FAISS trace + CXL model 上，A 相比 matched B+C union 没有在固定质量合同下的 p99/DRAM-budget 非支配点，或收益在加入 migration/metadata/remote bandwidth 后消失，则停止。

## Executable evidence path

FAISS 可记录 per-query probed lists；公开 MQSim_CXL 包含 trace-driven CXL-flash simulator 和 traces。早期可用 list-access trace + 固定 service model；真实 CXL 硬件只影响 evidence ceiling。

### 72-hour first evidence

构建小型 IVFPQ，记录 query-to-list accesses 和 list lengths；用公开/可审计 CXL model 对 all-DRAM/all-CXL/B/C/A 做 DRAM budget sweep，输出完整 traffic/migration ledger。第一证据是 A 对 union 的 order inversion，而非模拟器的绝对 ns 数值。

### AI core fraction and critical path

`ai_core_fraction: 0.76`。AI 可生成 list traces、实现 replay/tiering 和审计账本；CXL hardware 不是机制判断的唯一正证据。`AI_CORE_EXECUTABLE`。

### Semantics-preserving open alternatives

FAISS 访问 trace + 明确的 CXL service model 保持 exact retrieval object；必须标为 model/simulator evidence，不能声称真实 CXL application bandwidth。

## Dual-axis score

- Academic value: `53/70`（重要性 12/15；headroom 10/15；机制 16/20；推广性 9/12；独立性 6/8）
- AI executability bonus: `25/30`（artifact 6；核心 7；本机路径 6；72h 3；重放 3）
- Total: `78/100`

## AI and researcher boundary

AI 可完成 trace/model 核心路径；真实 CXL platform 的部署结论、可用带宽和最终论文 scope 仍需研究者/设备方确认。
