# S6-EGRAPH-LIVEEXTRACT：峰值 live-temporary 约束下的 acyclic e-graph 联合提取

- Status: `PROPOSE_STAGE0`
- Opportunity origins: `O7`
- Domain tags: `COMPILERS`, `EQUALITY_SATURATION`, `PROGRAM_OPTIMIZATION`, `ALGORITHMS`
- Contribution route: `N2`
- Discovery date: 2026-08-03
- Discovery method revision: `v2 / CALIBRATED`（仅方法校准，不是本题证据）

## Research question

给定固定的、无环的 compiler e-graph、多根输出、纯算子语义、目标 cost model 和 peak live-temporary budget `B`，能否用一个**联合**算法选择代表 enode、决定每个共享值是 materialize 一次还是重算、并给出合法 evaluation order，使生成程序在 `B` 内达到最低运行代价（或 Pareto-minimal runtime--memory）？

这不是减少 e-graph 构建 RAM，也不是在已有输出后套 register allocator。研究对象是“从等价空间中选择的共享 DAG”与“该 DAG 的 live-value schedule”相互耦合的精确/有界优化。

## Paper genealogy

- Anchor paper: [Fast and Optimal Extraction for Sparse Equality Graphs](https://doi.org/10.1145/3689801), OOPSLA 2024。它证明一般 extraction 困难、在低 treewidth e-graph 上给出 exact 参数化算法，并用 Cranelift benchmark 评估。
- Key predecessors: [Tensat](https://arxiv.org/abs/2101.01332)（张量图 EqSat）；[Equality Saturation](https://arxiv.org/abs/1012.1802)（原始框架）。
- Follow-up / competing papers: [SmoothE](https://www.csl.cornell.edu/~zhiruz/pdfs/smoothe-asplos2025.pdf)（differentiable extraction）、[e-boost](https://arxiv.org/abs/2508.13020)（共享 DAG 成本和 exact/heuristic extraction）、[Equality Saturation for Optimizing High-Level Julia IR](https://doi.org/10.1145/3795883)（2026 TACO，ILP code reuse 与 acyclic extraction）。
- Counter-evidence / negative source: [Cranelift 的 acyclic e-graph 说明](https://cfallin.org/blog/2026/04/09/aegraph/) 直接指出 shared extraction 的 NP-hard 性和多种未奏效的 sharing-aware cost 方案；它说明“只做 shared extraction”不足以自然形成新算法。
- Artifact / benchmark / specification: [egg](https://github.com/egraphs-good/egg)、[Cranelift e-graph crate](https://docs.rs/cranelift-egraph/latest/cranelift_egraph/)；FastOpt 论文使用的 Cranelift benchmark 是自然输入锚点。
- Search boundary: 以 2026-08-03 为截止，检索 `e-graph extraction peak memory rematerialization materialization`, `memory-aware e-graph extraction`, `DAG extraction peak memory compiler`，并核对 FastOpt、TACO 2026 Julia EqSat、SmoothE、e-boost、Cranelift。未发现同一 exact object 的已发表直接工作；这只支持 `SEARCH_BOUNDED_OPEN`。

## Topic-origin card

- Trigger: 现有 extraction 主要按 additive/treewidth/shared-DAG cost 选代表；编译后实际 peak live temporary 与重计算选择不在同一个 decision problem 中。
- Measurable observation / quantitative anchor: FastOpt 报告实际 Cranelift e-graphs 可具有低 treewidth，且比 ILP 更快地 exact extract；Julia EqSat 已证明 code reuse/acyclic extraction 在真实编译 IR 中是可部署对象。二者共同使“在真实 e-graph 上测试联合约束”可量化，而非工具构想。
- Baseline limitation: 先选最小 runtime DAG、再做内存调度，可能因共享造成 live ranges 过长；先以 memory 为代价选 DAG 又可能错过可通过局部重计算修复的解。
- Optional inherited assumption: 纯、无副作用的 acyclic IR；固定数值语义、buffer size 和 alias information。
- Structural cause: 一个 e-class 的代表选择改变共享关系，进而改变值的最后使用点；materialize/recompute 又反过来改变 DAG cost。因此没有可直接分离的 optimum-substructure。
- Decision variable: `eclass -> enode`、每个共享值的 `materialize | recompute`、拓扑 schedule、live interval/temporary slot。
- Candidate Q1 venue family: `OOPSLA/PACMPL`, `PLDI`, `CGO`, `ASPLOS`；是否达到该级别由 Stage 0 独立判断。

## Historical method calibration

- Source-session backtest file: `stages/discovery/_method-backtests/O7_DIRECT_ALGORITHM_SOFTWARE/v2/backtest_review.md`
- Backtest status: `CALIBRATED`（3/3 正例合理恢复、负例 ABSTAIN；不构成本题新颖性或可行性证据）。

## Importance and group fit

EqSat 已进入 Cranelift、MLIR/Julia、张量图和硬件综合等 compiler 语境。若联合算法在公开、真实 compiler e-graphs 上能以明确 memory bound 换得更低运行成本，贡献是可复现的 compilation-algorithm result，而不依赖私有硬件。

## Exact object

一个 acyclic e-graph `G`，指定根集合 `R`，每个 e-node 为纯、确定性、已知 output size 与 execution cost 的操作；输出必须在固定 IR semantics 下与 `R` 等价。目标是：在 peak temporary memory `<= B` 的全部合法 SSA/topological execution 中，最小化执行成本；可报告完整 Pareto frontier。没有 fast-math、近似或改变 rewrite set 的自由度。

## Named fair baselines

- Deployment/default baseline: egg 或 Cranelift 的标准 extractor，随后采用目标后端的正常 scheduling/allocation。
- Closest recent-paper baseline: FastOpt 的 low-treewidth exact extraction；Julia EqSat 的 ILP code-reuse extraction；e-boost 的 DAG-cost extraction。
- Competitive simple baseline: **strong sequential** pipeline：在相同 `G` 上先做 runtime-minimal shared-DAG extraction，再在固定 DAG 上做 exact/最优可用 memory scheduling；反向的 memory-first extraction 也必须报告。
- Optional offline ceiling: 小 e-graph 上的联合 MILP/SMT，变量同时编码代表选择、一次性物化与调度；只作 oracle，不作部署基线。

## Mechanism hypothesis

新约束结构是把 extraction graph 和 live frontier 的分隔边界合并为一个 state：边界 e-class 的代表、已 materialized 值、剩余 use-count 与已占 temporary slots 必须一起保持。预期在 low effective treewidth、共享显著且 `B` 紧时，这会保留 sequential pipeline 丢失的低 cost 可行解。

## Competing mechanisms

- Mechanism A: **live-boundary tree-decomposition DP**。在 e-graph/interaction-graph tree decomposition 的 bag 上维护选择、use-count、live slots 和 Pareto cost；在 bounded width/budget 下给 exactness 或明确 parameterized bound。
- Mechanism B: **Lagrangian branch-and-bound for selection--pebbling**。以临时内存价格松弛资源约束，分别产生 extraction/schedule columns，用共享-aware lower bound 剪枝并输出 optimality gap。
- Preferred mechanism and why: 先以 A 为主。它明确改变了 FastOpt 的 state（加入 live/recompute boundary），能先在小/稀疏真实 e-graph 上测试理论与效益；B 仅在 treewidth 失控时作为同对象替代，不能把两者包装成万能 union。

## Mechanism signature

相对 strong sequential baseline，收益应集中在“共享带来运行成本收益、但同时拉长 live interval”的 e-graph；在无共享的树、`B` 充裕或 backend 可无代价重排时，算法不应有优势。若收益在上述无结构输入同样出现，说明成本计量或实现不公平。

## Seed-distance test

- What changes relative to the anchor: FastOpt 的 extraction state 只需表达 term/DAG choice；本题 state 还表达 memory frontier 和 recompute policy，目标也从单一 extraction cost 变为 budgeted program execution。
- What changes relative to the closest prior work: TACO 2026 Julia EqSat 的 ILP 已扣除 code reuse / acyclic extraction；residual 是在代表选择内联合法的 materialization/recompute schedule，而不是换一套 ILP 求解器。
- Why this is not an application/backend rename: decision variable、约束和 evidence object 都改变；同一 acyclic `G` 上即可比较。
- Result of method-name deletion test: “在多个等价 DAG 中，带临时内存上限地联合选择共享、重算和执行顺序”仍是完整问题，未依赖 e-graph 名称。

## Candidate paper claim

在给定 `B` 的 acyclic EqSat extraction 中，提出一个把 representation selection 与 live-memory scheduling 联立的 parameterized/exact algorithm；在公开 compiler e-graphs 和受控合成族上，相比同语义强 sequential baseline，得到严格更优 runtime--memory Pareto points，并报告 compile-time/RAM/gap 的完整账。

## Evidence route

- `PERFORMANCE`
- `COMPLEXITY_THEORY`

## Software/algorithm performance admissibility, if applicable

- Same-function contract: 固定 pure IR、roots、rewrite closure、数值语义和后端；输出等价且全部结果可 replay/validate。
- Algorithmic delta: 联合 selection--materialization--schedule 的 state/algorithm，而非 extractor 后处理。
- Full-cost ledger scope: e-graph build、tree decomposition/solver、extract/schedule time、峰值 RAM、代码大小、重复计算、spill/load、运行时 latency/throughput、峰值 temporary memory、超时/optimality gap。
- Generality hypothesis: low/moderate effective width、显著 CSE、紧 memory budget 的 compiler e-graphs。
- Why this is not routine tuning: `B`、enode 选择和 recompute 均是被算法求解的变量；算法须与固定默认/参数 sweep 分开比较。
- Expected no-gain region: tree-like/no-sharing e-graphs、宽松 `B`、高 treewidth、动态形状无法可靠静态估计大小、backend scheduler 完全消解 lifetime。

## Nearest-prior facet matrix

| Facet | Candidate | Closest prior: Julia EqSat / FastOpt | Residual |
|---|---|---|---|
| Research problem | Budgeted generated-program execution | Extract a low-cost shared term/DAG | memory-constrained execution is first-class |
| Exact object | Acyclic e-graph + `B` + legal schedule | e-graph + extraction cost | schedule/liveness object added |
| Decision variables | enode, materialize/recompute, order | enode / code reuse | joint decisions |
| Constraints / information | live frontier, use-count, temp slots | DAG acyclicity, extraction consistency | memory feasibility |
| Core algorithm | boundary DP / B&B | treewidth DP or ILP extraction | selection--pebbling state |
| Guarantee | exact/parameterized or explicit gap under `B` | exact extraction / ILP optimum | joint-object guarantee |
| Evidence object | Cranelift e-graphs + bound sweeps | Cranelift / Julia extraction benchmarks | observed runtime-memory frontier |

## Current collision classification

- DIRECT_FATAL: `NOT_FOUND_WITHIN_SEARCH`，不作“全球首创”结论。
- DIRECT_SUBTRACT: FastOpt、e-boost、Julia EqSat 已覆盖 sparse/exact/shared-DAG extraction，不能把它们当弱基线。
- METHODOLOGICAL_ADJACENT: SmoothE、register allocation、rematerialization、tensor memory planning。
- DEPLOYMENT_BASELINE: egg、Cranelift extractor 和 backend allocator。
- SEARCH_BOUNDED_OPEN: 截止日内未见同一 acyclic e-graph 的联合 selection--materialization--schedule 论文；Stage 0 必须重查。

## Decisive falsifier

在 small exact instances 与 Cranelift-derived e-graphs 上，若联合 oracle 的每个 Pareto point 都被“最优 DAG extraction + 最优固定-DAG scheduling”支配，或者任何收益只能来自改变语义/忽略 backend 成本，则 residual 不存在，直接 `DROP`。

## Executable evidence path

### 72-hour first evidence

1. 构造可审计的 acyclic e-graph micro-suite（共享度、treewidth、`B` 可控）并实现联合小规模 oracle。
2. 复现 strong sequential baseline；枚举不超过可 oracle 的实例，验证语义、budget 和 Pareto 支配。
3. 把同一日志格式接入公开 Cranelift/egg 输入；若没有任何 non-dominated residual，停止而不是扩大 rewrite set。

### AI core fraction and critical path

`AI_CORE_CONDITIONAL`（约 50–69%）：AI 可独立实现 e-graph parser、联合 DP/MILP 小实例、基准驱动、计时/内存账和语义 replay；关键缺口是从公开 e-graph 到可信后端 peak-live measurement 的适配与验证。该缺口不影响学术资格，但会限制初期证据 ceiling。

### Semantics-preserving open alternatives

egg/Cranelift 公开实现、FastOpt 所述 Cranelift benchmark、开源 ILP/SMT solver。若无法获得可用的 FastOpt source，必须重写同一公开算法或把它仅作为论文基线，不能伪称代码级对比。

## Q1 sufficiency hypothesis

- Why this could support a complete Q1 paper: 若能给出联合问题的清晰复杂性/参数化边界、在真实 compiler e-graphs 的稳定 Pareto residual、和完整 compiler/runtime 成本，贡献形状接近 OOPSLA/PLDI/CGO 的算法型编译论文。
- What would still be required at Stage B: 独立 collision review、formal semantics/acyclicity proof、强 sequential implementation、公开复现实验、跨 e-graph source 的外部有效性。
- Preliminary contribution-shape analogs, if any: FastOpt (OOPSLA 2024)、SmoothE (ASPLOS 2025)、Julia EqSat (TACO 2026)。它们只校准论文形状和强度，不证明新颖性。
- Reminder: preliminary analogs do not replace Stage 0 Q1 calibration.

## Dual-axis score

- Academic value: `UNSCORED_AT_DISCOVERY`
- AI executability bonus: `UNSCORED_AT_DISCOVERY`
- Total: `UNSCORED_AT_DISCOVERY`

## AI and researcher boundary

AI 辅助检索、建模草案和可审计实现；研究者/Stage 0 独立核验文献、证明与公平性。没有进行 artifact execution 或正式实验。

