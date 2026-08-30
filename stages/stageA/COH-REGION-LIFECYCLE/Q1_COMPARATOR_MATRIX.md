# COH-REGION-LIFECYCLE Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: `ASPLOS / EuroSys / HPCA systems-mechanism family; TACO/JPDC journal fallback requires scope verification`
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: 2026-08-09

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | [TPP: Transparent Page Placement for CXL-Enabled Tiered-Memory](https://doi.org/10.1145/3575693.3575755) | ASPLOS 2023 | top systems/architecture conference; quartile not applicable | 2023, publisher/arXiv metadata | abstract + Stage 0 supplied positioning | principled placement mechanism and deployment-cost bar |
| EVALUATION_ANCHOR | [Harnessing Integrated CPU-GPU System Memory for HPC](https://arxiv.org/abs/2407.07850v1) | ICPP 2024 | direct object/workload anchor, not used as Q1 label | 2024, author preprint | full HTML sections on method, first touch, pages, migration, oversubscription | exact GH200 B0/B1 mechanism and workload evidence |
| DOMAIN_NEIGHBOR | [SuperInfer](https://proceedings.mlsys.org/paper_files/paper/2026/hash/07fd64f9316f40193c6a4d87d8afa011-Abstract-Conference.html) | MLSys 2026 | top ML systems conference; quartile not applicable | 2026, official proceedings | abstract | same-platform SLO-aware KV placement/rotation; narrower object but current strong system bar |
| BOUNDARY_OR_NEGATIVE_ANCHOR | [ARIADNE: Adaptive UVM Management](https://doi.org/10.1109/HPCA68181.2026.11408564) | HPCA 2026 | top architecture conference; quartile not applicable | 2026, IEEE metadata | abstract | strong dynamic UVM/zero-copy placement subtractor under oversubscription |
| DOMAIN_NEIGHBOR | [DirectKV](https://www.usenix.org/conference/osdi26/presentation/luo) | OSDI 2026 | top systems conference; quartile not applicable | 2026, official USENIX page | abstract | current GH200 zero-copy KV mechanism and full-system evaluation bar |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | coherent CPU–GPU lifecycle choice under a changing bottleneck | TPP, Schieffer, SuperInfer, DirectKV show placement/data movement is important | general readership beyond GH200/immutable regions not established | Tier B scoped importance |
| Contribution type | N2 finite region/lifecycle optimizer over representation, initializer, materialization | TPP/ARIADNE provide mechanism-level placement algorithms | physical actions are B0–B3 union; algorithm must remain nontrivial | conditional |
| Nearest-prior delta | joint static lifecycle selection for general immutable-after-init regions | SuperInfer/DirectKV are KV-specific; ARIADNE is dynamic UVM oversubscription | latest search is bounded, not systematic; no closed-source coverage | `SEARCH_BOUNDED_OPEN_WITH_DIRECT_SUBTRACT` |
| Algorithm/mechanism substance | executable exhaustive selector + region contract + cost ledger | anchors have deployable policies and full systems | current selector is small analytical oracle-like mechanism, not scalable solver | major Stage B gap |
| Baseline strength/fairness | B0 system, B1 demand UVM, B2 advice/prefetch, B3 explicit copy, B4 union oracle | Schieffer directly motivates first four; ARIADNE strengthens UVM boundary | deployable per-region heuristic/selector not implemented | open core gap |
| Natural workload/platform | Altis Pathfinder and BFS source-locked | Schieffer uses both on GH200 | no GH200 execution; no Qiskit/SRAD orthogonal case | analytical-only |
| Full-cost coverage | normalized B0–B4 allocation/init/PTE/migration/copy/C2C/sync/planner ledger | anchors report real wall time/traffic/system behavior | coefficients uncalibrated; no cold/steady measured split | design complete, evidence open |
| Main result/statistics | 6,912-point deterministic sensitivity; counterexamples retained | top anchors use hardware measurements across workloads | frequencies are not probabilities; no timing statistics | preliminary support only |
| Ablation/mechanism evidence | per-region action, uniform absorption, oracle ceiling, planner cost | anchor bar includes mechanism isolation | no GH200 hardware counter causal chain | partial |
| Scale/generalization | two programs, wide coefficient grid | anchors cover applications/models/scales | Pathfinder residual is very thin; no larger/third workload | below Q1 parity |
| Failure boundary | explicit negative grid regions and uniform absorption | comparable papers explain no-gain regimes | hardware failure boundary unmeasured | structurally useful |
| Artifact/reproducibility | deterministic scripts, locked inputs, exact replay hashes | top papers increasingly expect artifacts | no buildable GH200 harness or public trace package | partial |

## Reviewer-shape assessment

- Editor/venue-fit view: a bounded systems N2 paper remains recognizable only if real GH200 results show a stable residual over B2/B3 and a deployable per-region selector; current evidence is not submission-ready.
- Methodology view: the analytical grid is transparent and reproducible but uncalibrated. It is a falsification probe, not performance evaluation.
- Domain-contribution view: the surviving delta is selection across existing actions, not a new primitive. That can support Tier B if the solver, cost model, and generality are nontrivial.
- Devil's-advocate view: B4 proves union absorption; a simple hand-written region selector may erase the candidate. Pathfinder's maximum residual is too small to survive real noise or omitted cost.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: exact ATS object; two locked programs; B0–B4 ledger; executable counterexample search; deterministic replay; explicit negative regions.
- Executable next gaps: scalable solver; buildable B0–B3 same-source harness; deployable simple-selector baseline; measured cold/steady ledger; mechanism counters; third orthogonal workload.
- Human/resource-dependent gaps: authorized GH200 ATS/NUMA node, driver/toolkit image, Nsight permissions, and equipment scheduling.
- Bounded near-Q1 gaps: none claimed at Stage A; current gap is core and too large for `NEAR_Q1_PLAUSIBLE_WITH_BOUNDED_GAP`.
- Gap that would invalidate the paper: tuned B2/B3 or a simple deployable region selector closes the measured full-cost residual across both natural workloads.
- Why this is calibration rather than novelty or baseline evidence: the papers define contribution/evaluation bars; they do not prove absence of collision or supply same-object measurements for this candidate.
- Why Tier B still respects hard gates: Tier B is conditional on later same-object GH200 evidence, current collision closure, fair B0–B3 plus simple selector, natural measurements, full-cost accounting, and replay; none is waived by this Stage A recommendation.

