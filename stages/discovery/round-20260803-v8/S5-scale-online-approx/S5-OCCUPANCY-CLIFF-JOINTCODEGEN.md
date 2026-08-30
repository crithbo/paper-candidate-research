# S5-OCCUPANCY-CLIFF-JOINTCODEGEN 面向 occupancy 阈值的预算内 GPU 联合 code generation

- Status: `PROPOSE_STAGE0`
- Opportunity origins: `O5_SCALE_ONLINE_OR_APPROXIMATION`
- Domain tags: `CUDA_GPU`, `COMPILER_RUNTIME_SYSTEM`, `ALGORITHM_DATA_STRUCTURE`
- Contribution route: `N2_NEW_ALGORITHM_OR_OPTIMIZATION`
- Discovery date: 2026-08-03
- Discovery method revision: `v2`

## Research question

给定一个 AMDGPU Machine-IR scheduling region、其依赖 DAG、寄存器 bank/alias 约束与固定的 JIT 编译预算，能否在**不改变程序语义、目标 ISA 或输入 profile 信息**的条件下，构造一个 anytime 联合 schedule–allocation 算法：优先保持一个离散 occupancy tier，或在其无法保持时给出带可计算界的最优降阶选择，从而在同预算下改善实际 kernel time 或系统地缩小相对 ceiling 的 tail gap？

## Paper genealogy

- Anchor paper: [Combinatorial Register Allocation and Instruction Scheduling / Unison, TOPLAS 2019](https://chschulte.github.io/papers/castanedacarlssonea-toplas-2019.pdf)；在完整函数级 CFG 上联合 register allocation 与 instruction scheduling，以约束规划换取代码质量，已展示至约 1,000 instructions 的可扩展性。
- Key predecessors:
  - [GPU 最小寄存器需求调度](https://arxiv.org/abs/2303.06855)：精确与启发式的 GPU min-register scheduling；只覆盖 register-pressure 子目标。
  - [MLGO](https://research.google/pubs/mlgo-a-machine-learning-guided-compiler-optimizations-framework/) 与其[当前 LLVM 文档](https://llvm.org/docs/MLGO.html)：以学习替换 LLVM 单个 heuristic；regalloc 入口是 greedy eviction heuristic。
  - [RL4ReAl, CC 2023](https://research.google/pubs/rl4real-reinforcement-learning-for-register-allocation/)：LLVM 内的学习型 regalloc，x86/AArch64 评估。
- Follow-up / competing papers:
  - [LLVM AMDGPU machine scheduler](https://llvm.googlesource.com/llvm-project/%2B/refs/tags/llvmorg-18.1.2/llvm/lib/Target/AMDGPU/GCNSchedStrategy.cpp)：当前 scheduler 已把 register-pressure 和 target occupancy 纳入调度策略。
  - [AMDGPU 2025 occupancy-aware allocation change](https://lists.llvm.org/pipermail/llvm-branch-commits/2025-December/080779.html)：现有 allocator 层也显式考虑 occupancy，构成最强同栈工程基线。
- Counter-evidence / negative source: Unison 已联合了 allocation 与 scheduling；如果 AMDGPU 现有 scheduler + allocator 在相同预算内已处于每个自然 region 的同一个 occupancy tier，或 ceiling gap 无稳定尾部，则该题必须失败。
- Artifact / benchmark / specification: [LLVM AMDGPU developer guideline](https://www.llvm.org/docs/AMDGPU/DeveloperGuideline.html) 明确支持 MIR pass replay；[AMDGPU backend guide](https://llvm.org/docs/AMDGPUUsage.html) 与当前 LLVM 测试 corpus 可提供同语义的 MIR/IR 输入。
- Search boundary: 2026-08-03 前公开的 LLVM/Google/作者页、arXiv、ACM/PDF 及关键词 `GPU joint scheduling register allocation occupancy JIT`, `anytime regalloc`, `AMDGPU occupancy scheduler`。未发现同一 exact object 的论文；该结论仅为 `SEARCH_BOUNDED_OPEN`，不作首次主张。

## Topic-origin card

- Trigger: Unison 的完整联合优化以较长编译时间换代码质量；实际 AMDGPU backend 已分别在 scheduler 与 allocator 中处理 occupancy，表明 resource coupling 是自然对象，但没有看到它们在一个固定预算内对 occupancy **tier** 做联合可行性/质量决策。
- Measurable observation / quantitative anchor: Unison 在固定时限下可对最多 946 instructions 求最优；GPU min-register scheduling 报告启发式相对最优解的平均 register-pressure gap 约 17%、约 6% 事例超过 50%（均为文献报告值，非本项目复现）。
- Baseline limitation: staged scheduling/allocating 对“某一额外 live value 导致 occupancy 从 k 降至 k−1”的阈值耦合缺少共同决策变量；单独 ML regalloc 或单目标 min-reg scheduling 都不以该 cliff 的编译预算内规避为目标。
- Structural cause: occupancy 是由 SGPR/VGPR/AGPR 等离散资源共同决定的阶梯函数；调度改变 live interval overlap，allocation/spill 决策又改变未来 schedule 的可行域。
- Decision variable: (i) 每个 DAG node 的 schedule position，(ii) live-range split/spill/physical-register assignment，(iii) region 要保持或允许下降的 target occupancy tier，(iv) 在预算耗尽时的 incumbent/证明界。
- Candidate Q1 venue family: PLDI / CGO / ACM TOPLAS 的 compiler-optimization 轨道；是否达到该标准由 Stage 0 独立判断。

## Historical method calibration

- Source-session backtest file: `stages/discovery/_method-backtests/O5_SCALE_ONLINE_APPROXIMATION/v2/backtest_review.md`
- Backtest status: `CALIBRATED`（3/3 正例合理恢复，负对照 ABSTAIN，无泄漏）。
- This field calibrates the discovery method and is not candidate evidence.

## Importance and group fit

该题定位为 compiler N2，而非硬件论文：主 claim 限于算法、LLVM 后端实现与可复现 software evidence。它利用公开 LLVM AMDGPU 的真实 codegen 对象，不要求专有模型、硅片或改变任何程序数值语义。

## Exact object

一个已 legalize 的 AMDGPU Machine-IR basic block 或结构受限 scheduling region。输入为 dependences、latency/resource model、SGPR/VGPR/AGPR bank constraints、当前 machine function occupancy metadata 和固定 wall-clock budget；算法不得查看未来 region 或使用基线不可得的 profile。输出为可通过 LLVM verifier 的 schedule 与 allocation/spill plan，以及对预注册 target tier 的 feasible/infeasible certificate 或 incumbent gap。对象排除 whole-program profile-guided reoptimization、变更 ISA、改变 wave size/精度、或 GPU runtime scheduling。

## Named fair baselines

- Deployment/default baseline: LLVM 当前 AMDGPU `GCNSchedStrategy` + 默认 greedy register allocator；固定相同 LLVM commit、target, optimization level 与 wall-clock budget。
- Closest recent-paper baseline: GPU min-register scheduler；若其 artifact 无法复现，以其精确定式的小实例复建，并明确标为同语义 reimplementation。
- Competitive simple baseline: register-pressure-aware list scheduling，随后运行未改动的 LLVM allocator；以及固定 target-occupancy 的 staged scheduler。
- Optional offline ceiling: 对同一 region 的完整联合 CP-SAT/Unison-style model，使用比部署预算长 100× 的时限；仅为 hindsight ceiling，绝不充作部署基线。

## Mechanism hypothesis

将目标从连续的“少用一点 register”改为离散的 “tier-feasibility + tier-conditioned code quality”。这引入一个可剪枝的约束结构：对每个 tier τ，SGPR/VGPR/AGPR 上界是硬约束；任何 schedule prefix 都可导出跨 boundary live-set 的下界。当当前 τ 已不可行时，算法只能降至 τ−1，并比较该降阶的显式性能/溢出代价。

## Competing mechanisms

- Mechanism A: **tier-frontier anytime decomposition（首选）**。按 DAG separator 切 region；每个 boundary state 记录 live-set 的 bank summary、最低可达 tier 与局部 lower bound。best-first 合并在预算内维护每个 tier 的 Pareto frontier，并返回最好的可验证 incumbent。
- Mechanism B: **tier-indexed Lagrangian repair**。先用现有 scheduler/allocation 得到 plan；对触发 tier cliff 的 critical live ranges 施加动态价格，局部重排或 split/spill，并以 dual lower bound 决定是否继续修复。
- Optional mechanism C: MLGO-style policy 仅可作为 A 的 branching/order advisor；它不能成为单独 claim，且必须在无模型推理时可退化为 A。
- Preferred mechanism and why: A 改变的是可行性状态与搜索复杂度，而非仅替换 heuristic；可在小 region 上提供精确比较/界，并在大 region 保留 anytime 行为。

## Mechanism signature

若机制成立，收益应集中在：(1) baseline 恰落在或跨越 occupancy cliff 的 region，(2) live-set separator 小而 critical pressure 高的 region，(3) 预算增加时 candidate 的 tier-feasible rate 与 ceiling-gap 单调改善。对远离阈值、memory-bound 或无 register-pressure 的 region 应没有系统收益；这也是反 cherry-picking 分层报告的必要条件。

## Seed-distance test

- What changes relative to the anchor: Unison 的 general function-level joint combinatorial optimization变为 budgeted AMDGPU region-level **tier-feasibility** problem，新增 target tier 与 boundary live-state 的约束结构，并把 anytime certificate 置为部署输出。
- What changes relative to the closest prior work: LLVM 当前 scheduler 使用 occupancy 作为调度 metric、MLGO/RL4ReAl 作用于单一 regalloc heuristic；候选联合改变 schedule、allocation/split/spill 与 tier，并以同预算 tail gap/actual tier 为证据对象。
- Why this is not an application/backend rename: GPU 的关键不是把 CPU Unison 移植到 AMDGPU，而是离散多 register-bank occupancy tier 进入 exact feasibility object；若将该 tier/多 bank 约束拿掉，候选算法退化为已有 joint codegen，因而没有 claim。
- Result of method-name deletion test: “在有限计算预算下，为资源阈值型 DAG code generation 决定可行质量层级并输出可认证 anytime 解”，仍保留清楚的变量、约束和指标。

## Candidate paper claim

提出 `TierFrontier`：面向多 bank GPU code generation 的 budgeted joint scheduler–allocator。它枚举并剪枝 occupancy-tier feasible boundary states，在固定编译预算内返回合法 code，优先维持较高 occupancy，并在小实例给出可计算 lower bound；在自然 AMDGPU corpus 中，相对同预算 LLVM staged codegen 与单目标 min-reg baseline 改善 cliff-region 的 tier retention、spill/estimated cycle Pareto 与实际 kernel time。

## Evidence route

- `PERFORMANCE`
- `PARETO_APPROXIMATION`

## Software/algorithm performance admissibility, if applicable

- Same-function contract: 输入 LLVM MIR 与原 backend 保持相同 machine semantics、ABI、target、wave size、numerics；输出须通过 LLVM verifier 和差分 codegen/运行测试。
- Algorithmic delta: tier-indexed boundary-state DP / branch-and-bound，而非调 schedule weight 或替换模型参数。
- Full-cost ledger scope: compile wall time、peak solver memory、model inference/训练成本、fallback rate、code size、spill/reload、SGPR/VGPR/AGPR usage、occupancy、estimated cycles 与实机 kernel time；不得只报 compile 后静态 pressure。
- Generality hypothesis: 适用于存在离散 register-resource tier 的 GPU scheduling regions；不外推到任意 CPU/IR。
- Why this is not routine tuning: 目标、状态表示、可行域与可输出的界均改变；LLVM 的 metric bias 调参不是等价实现。
- Expected no-gain region: 远离 tier cliff、region separator width 过大、memory/wave-limited kernels、后端实际 allocation 已保持最大 tier 的情况。

## Nearest-prior facet matrix

| Facet | Candidate | Closest prior | Residual |
|---|---|---|---|
| Research problem | budgeted tier-feasible GPU joint codegen | Unison: general code quality with longer compilation | deployment-time occupancy cliff |
| Exact object | AMDGPU MIR region, multiple bank/tier constraints | CFG/function, CPU ISAs | GPU tiered resource object |
| Decision variables | schedule + allocation/split/spill + tier | schedule + allocation | tier as explicit feasibility decision |
| Constraints / information | fixed JIT budget, no future/profile advantage | fixed solver time but no GPU tier deployment condition | anytime tier certificate |
| Core algorithm or mechanism | tier-frontier boundary-state decomposition | constraint programming joint solve | state-space pruning by tier bounds |
| Guarantee | legal code plus small-instance gap/lower bound | optimality under solver time | budgeted tier-conditioned certificate |
| Evidence object | natural AMDGPU MIR and cliff-stratified results | CPU benchmarks / estimated quality | same-stack fair backend evidence |

## Current collision classification

- DIRECT_FATAL: `false` within the stated search boundary; no located work simultaneously has AMDGPU tier-feasible joint object, bounded JIT output, and tier-conditioned certificate. This is not a global-first claim.
- DIRECT_SUBTRACT: Unison removes any claim to generic joint RA+scheduling; MLGO/RL4ReAl remove any claim to learned allocator; LLVM removes any claim to merely occupancy-aware scheduling.
- METHODOLOGICAL_ADJACENT: Unison, GPU min-reg scheduling, MLGO, RL4ReAl.
- DEPLOYMENT_BASELINE: current LLVM AMDGPU scheduler + greedy allocator; 2025 occupancy-aware allocator change.
- SEARCH_BOUNDED_OPEN: only for the residual above, after the refreshed 2026-08-03 search; it is not inherited from the raw phase and must be rechecked by Stage 0.

## Decisive falsifier

在至少两个公开 AMDGPU corpus、同一 LLVM commit 和预注册 compile budget 下，若：(a) current LLVM staged pipeline 在 ≥90% 的 cliff-labelled region 已保留与 100× ceiling 相同的 tier，或 (b) candidate 不能在 ≥80% region 内于 baseline budget 内完成并产生 nontrivial lower bound，或 (c) tier preservation 与实机/validated cost proxy 无正相关，则 DROP。另若发现同对象近期论文，立即按 `DIRECT_FATAL` DROP。

## Executable evidence path

### 72-hour first evidence

1. 从 LLVM `llvm/test/CodeGen/AMDGPU` 和公开 rocMLIR/LLVM-compatible kernels 采样 50–100 个 regions，冻结 commit、target 和 extraction script。
2. 实现只含 schedule/live-range/tier cap 的 CP-SAT ceiling，验证 small-region legality 与 solver-time curve。
3. 实现 mechanism A 的 boundary-state prototype，与 LLVM staged、pressure-aware list schedule 以及 min-reg reconstruction 比较：compile time、tier retention、spills、estimated cycles、gap；分层报告 cliff/non-cliff。
4. 若可获得公开 AMD GPU 或合法 CI runner，对少数 kernels测 kernel time；否则结论严格限于 compiler-analysis/Pareto evidence。

### AI core fraction and critical path

- Classification: `AI_CORE_CONDITIONAL`。
- Estimated AI core fraction: `0.65`。AI 可完成 MIR extraction、constraint model、prototype、differential/legality harness 与公开 trace 分析；关键缺口是跨 GPU 的实机 timing 与 backend-maintainer interpretation。该缺口不会变更学术对象，但限制 performance claim ceiling。

### Semantics-preserving open alternatives

LLVM mainline AMDGPU backend/MIR tests、公开 Unison model/reimplementation、OR-Tools/CP-SAT 或开源 solver，以及公开 GPU kernel suites。无需私有模型或专有 profiling trace。

## Q1 sufficiency hypothesis

- Why this could support a complete Q1 paper: 只有在同时证明自然 cliff headroom、同预算合法可部署算法、完整成本账本、strongest same-object baselines、跨 target/workload 分层和清晰 no-gain boundary时，才可能构成 compiler N2 论文。
- What would still be required at Stage B: 近期碰撞审查、真实 kernel-time validation、模型与代码开源、ablation/scale curve、reproducible corpus、至少一个独立 target/architecture。
- Preliminary contribution-shape analogs, if any: Unison / [ACM TOPLAS 2019](https://chschulte.github.io/papers/castanedacarlssonea-toplas-2019.pdf)（联合 codegen）、[Intel Processor Graphics Register Allocation, CGO 2018](https://doi.org/10.1145/3168806)（GPU backend RA）、[RL4ReAl, CC 2023](https://doi.org/10.1145/3578360.3580273)（现实 LLVM allocator）。这些只是 venue/contribution-shape 校准，不是新颖性证据。
- Reminder: preliminary analogs do not replace Stage 0 Q1 calibration.

## Dual-axis score

- Academic value: `48/70`
- AI executability bonus: `18/30`
- Total: `66/100`

## AI and researcher boundary

AI 可实施和审计原型及公开语义检查；研究者须在 Stage A/B 决定实机硬件代表性、性能计数器解释、主张强度和投稿定位。此 brief 仅建议独立 Stage 0 审查，不是候选录取、Stage A/B 或实验授权。
