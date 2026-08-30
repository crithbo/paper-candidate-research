# S4-SLO-PAGEPACK Stage 0 PRIMARY Report

- Lane id: `STAGE0-BATCH-GATE/PRIMARY`
- Assignment id: `STAGE0-P1-20260809-S4-SLO-PAGEPACK-PRIMARY-V8.4`
- Input freeze SHA-256: discovery manifest verified; see `SOURCE_AUDIT.md`.
- Cross-assignment contamination declaration: `NONE`. 仅使用本 assignment 的冻结 Discovery 包、当前角色规则、模板和原始/官方来源；未沿用任何旧题分数、结果或机制。
- Decision: `PASS_RECOMMENDED` — `PENDING_CONFIRMATION`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.72`（对条件性论文形状；不是对性能结论）
- Evidence ceiling: `DISCOVERY_ONLY__FINITE_CPU_SOLVER_ROUTE`
- Novelty route: `N2`
- Candidate Q1 venue family: systems / data-management / memory-management；Q1 parity 仅条件性。
- Stage semantics: 本报告只审“若假设成功能否形成论文”，不建立主结论；未运行实验。

## Structural paper potential vs current readiness

- Structural paper potential if successful: `TIER_B_Q2_VIABLE`。在不改变页后端、4 KiB 粒度、GET/SET 语义、对象 lifetime 或 pointer safety 的前提下，把**对象到页槽位的组合、迁移集合和迁移成本**作为固定 SLO 下的联合决定变量，形成可比较的 constrained-packing N2。
- Current evidence-acquisition readiness/risk: `LOW_TO_MODERATE__FINITE_CPU_ROUTE`。尚无 solver、已冻结 trace slice、OBASE faithful replay 或自然 residual；但 CacheLib/CacheBench 与公开 cacheMon operations 提供有限 CPU 路线。pointer-mobility metadata 必须从同一 CacheLib object model 获取，不能由 trace 臆造。
- Why missing implementation/results/proof/hardware is or is not structurally fatal: 不是。该题是算法/运行时设计，首个 killer 可为 CPU reduced-epoch solver/replay；缺当前结果只限制 readiness 与 claim ceiling。若未来无法保持同一 pointer-safe object model，应降低证据 ceiling 或要求用户资源，而非以跨对象替代。

## Discovery provenance

- Opportunity origins: `O4_OBJECTIVE_OR_CONSTRAINT_SHIFT`；OBASE/HADES 将 object layout 引入 page tiering，MDK 将目标翻转为 SLO 下可回收内存。
- Domain tags: `ALGORITHM_DATA_STRUCTURE`, `MEMORY_SYSTEM`, `RUNTIME_SYSTEM`, `NON_CUDA`.
- Paper genealogy: HADES (DIMES 2025) → OBASE (OSDI 2026) 是 object-aware address-space engineering；MDK (OSDI 2026) 是 SLO/MPC policy framework；BRUMM (ECRTS 2026) 是不同对象的 reclamation latency accounting。
- Discovery method revision: `v2 / v8.1`。
- Backtest reference and status: `CALIBRATED`，仅校准发现法，绝不是候选证据。

## Frozen object and claim

`EPOCHAL_UNMANAGED_POINTER_BASED_OBJECT_HEAP_WITH_POINTER_SAFE_RELOCATION__4KIB_PAGE_TIERING_BACKEND__TRACE_DEFINED_GET_SET_SEMANTICS__FIXED_SLOWDOWN_OR_SLO_CAP`

函数为同一 GET/SET 键值结果、update visibility、object lifetime、并发指针有效性；后端、页大小、SLO/slowdown cap 都不变。输入为固定 epoch 的对象大小、访问、合法 relocation/mobility、页状态与 target；输出为对象页槽位分配和有界 migration set。目标是在**完整成本**下最大化可回收 fast-tier bytes。候选不得改 cache policy、弱化 consistency，或退化成 page-policy controller/meta-selector。

## Positive opportunity map

- Natural workloads: CacheLib/CacheBench-compatible object heap 与 cacheMon 的 MetaKV/Twitter operations；这只是自然输入路线，不是已经取得的候选结果。
- Observed or expected cost/headroom: HADES 的一手论文已在 pointer-based structures 报告 hotness fragmentation（例如 Redis/ Memcached/MongoDB 页使用率）并展示 object reorganization 的重要性；OBASE 与 MDK 分别证实现有 object-layout 与 SLO-policy 的强度。候选只假设：heterogeneous sizes、persistent hot objects、page slack 和 migration cost 会形成 OBASE→MDK 不能完全复现的联合布局 residual。
- Mechanism-specific prediction: 只有“选择性搬迁才使整页可回收、且不超 migration credit”的页会增益；均匀页面、heat 快速漂移或 migration unavoidable cost 超过 cap 是预注册 no-gain 区域。

## Named baselines and fairness contract

1. 原始 layout + 同一 page-tiering backend，无 object movement；
2. HADES/OBASE published hot/cold layout + 同一 backend；
3. MDK SLO target/policy，在原 layout、相同 epoch information 上 replay；
4. **强公平同信息 composition**：`OBASE-or-HADES layout → MDK SLO target/policy replay`，保持完全相同的 object trace、epoch、4 KiB 页、mobility、backend、SLO 和成本 ledger；
5. reduced epoch 的 exact ILP/branch-and-bound ceiling（仅 ceiling，不能替代部署 baseline）。

full-cost ledger 必须包括 tracing/instrumentation、object copy、pointer validation/indirection、metadata、background CPU、migration latency、TLB/huge-page effects、page-fault/I/O 与 warm-up/repacking。这个 composition 可实施且信息/版本兼容时才是公平 union；它不是“理论上可拼接”就自动 STOP。

## Collision analysis

### Nearest-prior facet matrix

| Facet | Candidate | OBASE/HADES | MDK | 结论 |
|---|---|---|---|---|
| Exact object | pointer-safe unmanaged object heap + 4 KiB backend + fixed SLO | 同类 object-layout / existing backend | data-center reclamation under performance SLO | OBASE 是 same-object subtractor；MDK 是 objective-side subtractor |
| Decision variable | page slot assignment + migration set under credit | dynamic hot/cold clustering / relocation | memory-policy / target evaluation | 未见同一 source 把 layout assignment 与 migration/SLO cost 联合优化 |
| Method | constrained packing / min-cost-flow or Lagrangian rounding | runtime temperature organization | MPC + offline policy optimum | 可能可比较，非名称差异 |
| Guarantee/result | feasible SLO frontier residual（待证） | safe relocation + tiering gains | policy bound/MPC | 尚无六 facet 全覆盖 direct fatal |
| Cost | all move/layout/backend costs | relocation/instrumentation | policy evaluation costs | composition 是唯一必要强基线 |

### Seed-distance and method-name deletion test

删除名称后仍是：在固定对象、页面、SLO 与 pointer-safe mobility 下，选择哪一些对象放入哪些页并迁移，才可在移动成本上限内释放最多整页。它不是“选择 OBASE 或 MDK”或调一个 hotness threshold。若实现最终只选阈值/策略，则会失去 N2 并停止。

`DIRECT_FATAL: none found through 2026-08-09`。OBASE/HADES、MDK 是 direct subtractors；BRUMM 是 methodological adjacent。没有将它们声称为自动 union fatal。

## Competing mechanism decision

- Selected mechanism: `migration-aware Lagrangian/min-cost-flow packing with constrained rounding`。它直接优化 slot assignment、migration credit 与 SLO dual cost。
- Registered backup: `persistence-bucket greedy packing`；仅当其仍执行相同 page-composition/migration action 且能给出不同求解结构时可作为同对象 backup。
- Pivot boundary: 任何改成 request-time admission、eviction priority、不同 page size/backend 或不含 pointer-safe migration 的方案都越界，须新 ID。

## Residual paper kernel

条件性 N2：**SLO-aware page-packing**是与 temperature-layout 和 reclamation policy 正交的联合动作；其成功标准不是更高 page utilization，而是在同信息 composition 后仍保留的、带完整成本的 SLO-feasible reclaimable-byte residual。这个 kernel 达到可信 Q2 的最低创新形状，但距 Q1 仍缺跨结构/trace 的普适性与强实测证据。

## Evidence route

`PARETO_APPROXIMATION + PERFORMANCE + MEASUREMENT_MECHANISM`。先做 trace-level CPU solver/replay，再决定能否进入真实 runtime。没有 GPU、商品硬件或当前 production implementation 不是本阶段科学门。

## Performance-optimization admissibility, if applicable

- Same-function contract: GET/SET、visibility、lifetime、pointer safety、backend interface 不变。
- Algorithmic delta: object-page packing + migration optimization，非 controller。
- Full-cost ledger: 已在 fairness contract 固定。
- Strong-implementation fairness: 强制 OBASE/HADES→MDK composition；same information、same object、same cost。
- Generality and failure boundary: 仅承诺 persistent/heterogeneous access layouts；no-gain 区域预注册。
- Why not routine tuning: 决策空间从温度 grouping/固定 layout 上 policy 变为带 capacity、mobility 与 SLO 约束的 combinatorial packing。

## Q1/Q2 paper shape

- Problem: page granularity 与 object locality 使 memory reclamation/SLO 目标相互耦合。
- Contribution: constrained-packing algorithm + feasibility/approximation characterization + same-information composition evaluation。
- Evidence plan: 自然 cache trace、faithful object model、full-cost ledger、reduced exact ceiling、无收益区与 concurrent correctness check。
- Expected paper narrative: “布局是 SLO 下 memory-reclamation frontier 的决定变量”，而不是新 controller。

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: OBASE, MDK, BRUMM, HADES。
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: Q2 N2 已清晰；与 OBASE 很近，必须以 composition residual 证明并非重命名。
- Evidence-shape gap: 尚无自然 replay、solver proof/approximation bound、runtime integration 与多 trace 统计。
- Stage A closure plan: CPU killer 先定 residual；正结果上限只是 preliminary support。

## Non-relaxable quality audit

- Same-object: PASS as design contract；future evaluator 必须复现 pointer-safe mobility，不能以 trace-only pseudo-objects替代。
- Latest collision: PASS under `SEARCH_BOUNDED_OPEN`; 原始/官方来源复核至 2026-08-09。
- Strong fair baselines: PASS only with mandatory composition and exact ceiling。
- Natural input/evidence: finite public route exists；当前尚未获得 instance，readiness risk 而非 STOP。
- Full-cost: explicitly frozen。
- Reproducibility: Stage A 前 freeze trace hash/slice, solver version, parameters, baseline configuration。
- Evidence/claim honesty: 没有实测 residual、theorem、production compatibility 或 performance claim。

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE`。
- Estimated ai_core_fraction: `0.72`；AI 可主导 trace normalization、reduced optimizer、counterexample table、ledger/replay；并发 relocation correctness 与自然 object-model interpretation 需研究者审核。
- 72-hour first evidence: 固定一个 CacheLib-compatible reduced epoch，明确 object sizes/mobility、4 KiB pages、SLO/slowdown ledger；分别 replay baseline 1–4，并以 exact reduced solver 计算 upper bound/residual table。
- Human-only items and why they are non-decisive: 对真实 C++ relocation 的 concurrency safety 解释与 production integration；它们不妨碍 CPU Stage A 的区别性单元测试，但限制后续 claim ceiling。

## Stage A highest-risk probe plan

- Risk-bearing premise: `OBASE_OR_HADES_LAYOUT_TO_MDK_SAME_INFORMATION_COMPOSITION_LEAVES_A_STRICT_FULL_COST_RECLAIMED_BYTE_RESIDUAL`。
- Cheap discriminating probe or counterexample search: 从固定 trace epoch 上建立合法移动对象图与 ILP/branch-and-bound；在同一个 SLO 下对比 candidate、OBASE/HADES、MDK、composition 和 exact ceiling。
- Negative result that kills the direction: ≥3 个自然 cache epochs 中，composition 已达到 candidate 的 feasible reclaimed bytes，或任何残差在加入 pointer-safety/trace/migration costs 后消失。
- Positive-result ceiling: 仅 `NOT_FALSIFIED / PRELIMINARY_SUPPORT`；不是论文主张证明。

## Stop conditions

1. faithful same-information composition 在自然 epoch 上结构性吸收 candidate，且 candidate 没有不同算法/保证；
2. same pointer-safe unmanaged heap 无法定义或必须改写 GET/SET/concurrency semantics；
3. candidate 退化为 OBASE parameter/policy selector；
4. 没有可冻结的同对象自然 evidence route。

目前四项均未成立；特别是“尚无实现/结果”不属于 STOP。

## Dual-axis score

- Academic value: `52/70`
- AI executability bonus: `23/30`
- Total: `75/100`

## Human research reserve, if applicable

不建议 reserve：首个风险验证与主要计算路径可由 AI 在公开 CPU artifact 上完成；需要人的并发语义审核是后续 evidence ceiling，不是长期不可替代的完整研究核心。

## User-action blocker, if applicable

`NONE`。没有执行下载/实验后失败，也没有外部资源阻断当前 Stage 0。未来若所需可合法使用的 CacheLib object-mobility artifact 无法获得，应由执行 lane 形成具体 blocker 包；不得用不同 object model 填补。
