# S6-JS-PREFIXBOUND：Ω-condition join+sort 的 prefix quotient exact search

- Status: `PROPOSE_STAGE0`
- Opportunity origins: `O7`
- Domain tags: `DATABASE_SYSTEMS`, `QUERY_OPTIMIZATION`, `EXACT_ALGORITHMS`
- Contribution route: `N2`
- Discovery date: 2026-08-03
- Discovery method revision: `v2 / CALIBRATED`（仅方法校准，不是本题证据）

## Research question

在 [DPomega](https://doi.org/10.1007/s00778-025-00906-y) 定义的 join&sort object 内：固定合取 equi-join SQL query、关系/属性统计、merge-join 物理模型、bushy plan space、最终 sort order 和 Ω-condition，能否证明一个 exact **order-prefix quotient**，并用 sort-free relaxation 的可采纳 lower bound 驱动 A*，在保持 DPomega 相同 optimal estimated cost 的条件下减少 optimizer time/memory？

固定对象先限于 DPomega 的 merge-join exact core；hash-join post-pass、改变统计模型、删除 plan space、限制 orders 都不属于候选动作。

## Paper genealogy

- Anchor paper: [Li, He, Yu: Join optimization revisited](https://doi.org/10.1007/s00778-025-00906-y), VLDB Journal 2025。它给出 Ω-condition 下任意 join query 的 exact bushy/linear DP，实作在 PostgreSQL 12.4，并测量 optimizer CPU/RAM 与 query runtime。
- Key predecessors: [Selinger et al.](https://doi.org/10.1145/582095.582099) 的 interesting orders；[Neumann--Moerkotte order optimization](https://doi.org/10.1109/ICDE.2004.1320019)；[Guravannavar et al.](https://arxiv.org/abs/cs/0611094) 的 order-enforcement cost。
- Follow-up / competing papers: [Haffner--Dittrich](https://doi.org/10.1145/3588927), PACMMOD/SIGMOD 2023（plain join shortest-path/A*，公开 artifact）；[DPconv](https://doi.org/10.1145/3698809), PACMMOD/SIGMOD 2024（plain join subset convolution，突破 `O(3^n)` barrier）；[Algorithms for Optimizing Acyclic Queries](https://doi.org/10.4230/LIPIcs.ICDT.2026.17)（2026 query optimization 相邻理论）。
- Counter-evidence / negative source: DPomega 已指出 order property 会破坏普通 DP 的 optimal substructure，且其现有状态增长涉及 Bell-number 型分组。任何 prefix quotient 若忽略未来 merge key 的 distinguisher，就会失去 exactness。
- Artifact / benchmark / specification: DPomega 的论文明确使用 PostgreSQL 12.4、TPC-DS、JOB（76 条合取查询）和 SYN/SYN-S；[Haffner--Dittrich source](https://gitlab.cs.uni-saarland.de/bigdata/mutable/qopt-as-shortest-path) 及其 [SIGMOD reproducibility report](https://reproducibility.sigmod.org/rep_rep/2023/SIGMOD23ARIReport-36.pdf) 是可审计的 A* reference。
- Search boundary: 截止 2026-08-03，检索 `interesting orders join optimization exact dynamic programming A star subset convolution`, `join and sort optimization exact`, `physical properties join enumeration`. 未找到同一 Ω-condition join+sort object 的 prefix quotient + admissible relaxed-DP search；这只为 `SEARCH_BOUNDED_OPEN`。

## Topic-origin card

- Trigger: `DPomega` 恢复了 join&sort 的 exact DP，但代价来自处理 order-dependent states；plain join 已显示 exact heuristic search 和 subset convolution 可显著改变 optimizer complexity。
- Measurable observation / quantitative anchor: DPomega 在 TPC-DS、JOB、SYN/SYN-S 上明确记录 optimizer CPU/RAM 与 runtime；Haffner--Dittrich 在 star/clique plain joins 上报告 optimal plan 可比既有方法快一个数量级；DPconv 已实证 plain join 的 super-polynomial acceleration。三者共同定义了可证伪的“将 plain-join acceleration lifting 到 Ω-state”的问题。
- Baseline limitation: DPomega 保留足够的 order structure以保证 exactness；plain A*/convolution 不能直接沿用，因为它们未处理 Ω-condition 的 future order effect。
- Optional inherited assumption: 精确 cardinalities/cost model 和 merge-join property 按 DPomega 固定；这是 optimizer-algorithm object，而非 PostgreSQL 估计准确性论文。
- Structural cause: 很多 partial plans 可能只因未来不可区分的 order suffix 而重复；但错误合并会失去 optimality。关键是找出能证明 future-equivalence 的最小 prefix/partition state。
- Decision variable: relation subset、已产出 order 的 Ω-prefix equivalence class、当前 plan cost，以及 A* frontier；不是选择一个 runtime policy。
- Candidate Q1 venue family: `SIGMOD/PACMMOD`, `VLDB/PVLDB`, `ICDE`, `PODS`（算法深度足够时）；仅为强度校准。

## Historical method calibration

- Source-session backtest file: `stages/discovery/_method-backtests/O7_DIRECT_ALGORITHM_SOFTWARE/v2/backtest_review.md`
- Backtest status: `CALIBRATED`（不为本题提供 novelty、exactness 或 feasibility 证据）。

## Importance and group fit

查询优化器的 planning budget 本身是部署成本；若 exact join+sort plan 可在同一 plan space 更快被求得，就能把性能贡献写成完整的 optimizer algorithm，而不是 PostgreSQL 参数调整。TPC-DS/JOB/SYN-S 为自然与受控输入提供了直接证据入口。

## Exact object

固定 `JS` query：合取 equi-joins、最终 ordered output、relation cardinalities、join predicates、allowed merge-join operations、external sort cost、bushy join trees 与 DPomega 的 Ω-condition。所有算法返回的 plan 必须有相同 query result，并在相同 cost model/plan space 下等于 global minimal join+sort cost；其 optimality certificate 由 exact DP/ILP/穷举小实例交叉验证。

## Named fair baselines

- Deployment/default baseline: PostgreSQL 12.4 built-in optimizer，允许其原有 physical choices；它只报告部署表现，不是 same-object exact baseline。
- Closest recent-paper baseline: DPomega bushy exact DP，按其完整 Ω-condition/pruning 复现。
- Competitive simple baseline: Haffner--Dittrich 的 plain-join A*（在同一 stripped order-free object 上比较 search machinery）；DPconv（同一 plain join relaxation 上比较 lower-bound/DP cost）。
- Optional offline ceiling: 固定小 query 的 exhaustive enumeration 或 MILP，含 interesting-order variables；只验证 exactness。

## Mechanism hypothesis

对固定 relation subset `S`，定义能决定任意合法 future merge-join continuation 的最小 `Ω-prefix` signature；只有 signature 相同且当前 cost/lower-envelope 支配时才可合并。对每个 quotient state，用“去掉/放松 sort property 但保留 relation subset 和 join-cost”的 exact DP lower bound；A* 以 `max(join-relaxation, unavoidable-sort-relaxation)` 做 admissible `h`，避免不安全相加。

## Competing mechanisms

- Mechanism A: **Ω-prefix quotient A\***。先证明 future-equivalence，再在 quotient graph 上做 exact A*；dominance 只使用同 signature 的 g-cost 与可证明下界。
- Mechanism B: **bounded order-automaton min-plus DP**。若 Ω-state 的组合在有限 automaton 上闭合，用 automaton-state subset convolution 加速 bottom-up DP。
- Preferred mechanism and why: A。它的最早 falsifier 是一个具体 counterexample（两 partial orders 同 prefix 但 future cost 不同），能够快速判死；B 只有在 A 的 state characterization 成立且显示卷积闭包时才值得研究。二者不是联合系统。

## Mechanism signature

如果 candidate 正确，state/node reduction 应集中在含多个可共享 Ω-prefix 的 star/snowflake/query family，并在 optimizer cost 上出现；对 few-join、无 useful order 或所有 prefixes 都不同的查询应没有收益。若收益只出现在改 cardinality 或删 order 的版本，算法无效。

## Seed-distance test

- What changes relative to the anchor: DPomega 的 bottom-up full order-state enumeration 被替换为经证明的 future-equivalence quotient 和 shortest-path expansion order。
- What changes relative to the closest prior work: Haffner--Dittrich 只处理 plain join；candidate 的 decision state 增加 Ω-order signature，启发式必须对 sort effect 保持 admissibility。
- Why this is not an application/backend rename: 同一 JS cost model 和 plan space；改变的是 exact optimizer state/algorithm 与其 correctness proof。
- Result of method-name deletion test: “在带 interesting order 的 exact plan space 中证明何时可合并 partial plans，并以可采纳代价下界搜索”独立于 A* 名称仍是明确问题。

## Candidate paper claim

提出并证明一个 Ω-prefix state quotient 和 admissible relaxed lower bound，使 exact join+sort optimizer 在不改变 query semantics、physical plan space 或 global optimum 的条件下少枚举 states；在 DPomega 的 TPC-DS/JOB/SYN-S 对象与可控 join graphs 上给出 optimizer time/RAM 的稳定改善，并报告所有无收益区。

## Evidence route

- `COMPLEXITY_THEORY`
- `PERFORMANCE`

## Software/algorithm performance admissibility, if applicable

- Same-function contract: SQL result、统计、cost model、merge-join plan space和最终 order 不变；必须返回 same optimum，不以 observed runtime 替代 optimizer exactness。
- Algorithmic delta: quotient proof + admissible bound + exact search，不是 memoization/cache 或 PostgreSQL GUC 调参。
- Full-cost ledger scope: optimizer wall time、CPU、peak RAM、states/transitions、priority queue、bound precompute/cache、timeout；选择计划的 estimated cost、sort/materialization 与实际 execution time 分开报告。
- Generality hypothesis: Ω prefixes 共享多、join graph 有星状/雪花/相关 structure、sort relaxation 足够紧的 join&sort instances。
- Why this is not routine tuning: state relation和 `h` 从 correctness theorem导出；阈值不以 benchmark 调参获得。
- Expected no-gain region: few joins、无 interesting order、prefix almost all distinct、relaxation 松、强相关 cardinality 导致 cost model失真、dense query 上 frontier 比 DPomega 大。

## Nearest-prior facet matrix

| Facet | Candidate | Closest prior: DPomega | Residual |
|---|---|---|---|
| Research problem | exact join+sort optimization | exact join+sort optimization | same object, lower optimizer cost |
| Exact object | DPomega JS object | DPomega JS object | no object substitution |
| Decision variables | subset + future-equivalent Ω prefix state | subset + DPomega order state | quotient state |
| Constraints / information | proven future-equivalence; admissible `h` | Ω-condition/pruning | new safe state reduction |
| Core algorithm | exact A* on quotient graph | bottom-up DP | expansion/lower-bound structure |
| Guarantee | identical optimal cost | optimal under Ω-condition | exactness preserved |
| Evidence object | TPC-DS/JOB/SYN-S + oracle | same benchmark family | time/RAM residual |

## Current collision classification

- DIRECT_FATAL: `NOT_FOUND_WITHIN_SEARCH` for the stated Ω-prefix quotient plus admissible relaxation; not a global novelty claim.
- DIRECT_SUBTRACT: DPomega owns exact join+sort DP; Haffner--Dittrich owns plain join shortest-path/A*; DPconv owns plain join subset convolution.
- METHODOLOGICAL_ADJACENT: Selinger interesting properties, transformation-based optimizers, generic MILP, acyclic-query algorithms.
- DEPLOYMENT_BASELINE: PostgreSQL optimizer.
- SEARCH_BOUNDED_OPEN: as of cutoff; independent Stage 0 must examine physical-property optimization and 2026 literature.

## Decisive falsifier

先用 exhaustive small instances 反证 proposed future-equivalence：若存在相同 quotient signature 的 two partial plans 在任何合法 continuation 下需要不同 order information 才能判优，则 quotient 不安全，直接 `DROP`。若 theorem 成立但在 DPomega 的 controlled/SYN and natural traces 上没有减少 exact states/time/RAM，相比完整 DP 也没有 Pareto residual，仍 `DROP`。

## Executable evidence path

### 72-hour first evidence

1. 从 DPomega 的公开定义独立实现 tiny exact enumerator，自动枚举小 query、join attributes 和 final orders；与 ILP/穷举核对 optimal cost。
2. 写 counterexample search，穷举两个相同候选 signature 的 partial plans及 continuation，试图推翻 quotient；这是第一优先级，不先做 PostgreSQL integration。
3. 仅在 theorem 未被推翻后，把 A* prototype 与 DPomega reimplementation、Haffner artifact 的 plain join mode在 SYN 小实例和 JOB/TPC-DS query shapes上比 states/time/RAM。

### AI core fraction and critical path

`AI_CORE_CONDITIONAL`（约 50–69%）：AI 可实现 enumerator、proof-obligation counterexample search、A* prototype、oracle tests和开源 artifact adaptation。关键缺口是忠实重建未公开源码的 DPomega details并由研究者核验，以及将 cost-model exactness 与 PostgreSQL execution脱钩审计。

### Semantics-preserving open alternatives

Haffner--Dittrich 的公开 artifact、PostgreSQL 12.4、JOB/TPC-DS 公共数据、独立 DPomega reimplementation和小实例 MILP。没有 DPomega source 的情况下，只能声明 algorithm-level reproduction，不能报代码复现。

## Q1 sufficiency hypothesis

- Why this could support a complete Q1 paper: 需要一个 nontrivial exactness theorem、比 DPomega 更强的 state/complexity accounting、natural benchmark 上的 optimizer-budget residual，以及完整 artifact。该形状与 query-optimizer algorithms 的 SIGMOD/PACMMOD/VLDB/ICDE 论文一致。
- What would still be required at Stage B: 完整 proof、DPomega fidelity audit、独立 collision search、真实 PostgreSQL integration、跨 query topology和估计误差的边界实验、artifact release。
- Preliminary contribution-shape analogs, if any: DPomega (VLDB Journal 2025)、Haffner--Dittrich (PACMMOD 2023)、DPconv (PACMMOD/SIGMOD 2024)。它们只作 Q1/近Q1 强度参照。
- Reminder: preliminary analogs do not replace Stage 0 Q1 calibration.

## Dual-axis score

- Academic value: `UNSCORED_AT_DISCOVERY`
- AI executability bonus: `UNSCORED_AT_DISCOVERY`
- Total: `UNSCORED_AT_DISCOVERY`

## AI and researcher boundary

AI 协助检索、枚举器和原型；研究者/Stage 0 必须独立核验 quotient proof、DPomega fidelity 与当前碰撞。没有下载或运行数据库/artifact，也没有启动正式实验。
