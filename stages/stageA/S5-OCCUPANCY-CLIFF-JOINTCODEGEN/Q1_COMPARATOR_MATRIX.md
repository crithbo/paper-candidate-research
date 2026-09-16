# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: PLDI / CGO / ACM TOPLAS compiler optimization
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `TIER_B_Q2_VIABLE` conditional structural potential
- Search/cutoff date: 2026-08-09

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | [Combinatorial Register Allocation and Instruction Scheduling (Unison)](https://chschulte.github.io/papers/castanedacarlssonea-toplas-2019.pdf) | ACM TOPLAS | established top compiler journal/equivalent anchor | 2019, author PDF | upstream genealogy and claimed scope; not re-read end-to-end in this Stage A | joint scheduling/allocation algorithm and solver artifact shape |
| EVALUATION_ANCHOR | [Register Allocation for Intel Processor Graphics](https://doi.org/10.1145/3168806) | CGO | leading compiler/code-generation venue | 2018, DOI | upstream calibration summary | GPU-backend RA evaluation and deployment relevance |
| DOMAIN_NEIGHBOR | [RL4ReAl: Reinforcement Learning for Register Allocation](https://doi.org/10.1145/3578360.3580273) | CC | peer-reviewed compiler venue | 2023, DOI/Google Research | upstream calibration summary and project page scope | modern LLVM allocator implementation/evaluation comparator shape |
| BOUNDARY_OR_NEGATIVE_ANCHOR | [Scheduling Instructions to Minimize Register Pressure](https://arxiv.org/abs/2303.06855) | public preprint | methodological boundary, not used as quartile proof | 2023, arXiv | upstream brief quantitative summary only | removes generic min-register scheduling novelty and supplies an exact/heuristic ceiling shape |

These references calibrate contribution/evaluation shape only. They are not evidence of candidate novelty or fair same-object baselines.

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | occupancy cliffs in AMDGPU backend | joint codegen and GPU RA are established compiler topics | natural frequency/impact unmeasured | open |
| Contribution type | fixed-budget tier-frontier N2 | Unison supports algorithmic joint-codegen shape | no verifier-legal algorithm yet | fail for parity |
| Nearest-prior delta | explicit multi-bank occupancy tier and anytime certificate | Unison/min-register/LLVM absorb broad joint and pressure-aware claims | collision search remains bounded-open | open |
| Algorithm/mechanism substance | deterministic tier-indexed beam frontier model | anchors implement deployable or solver-backed compiler mechanisms | current code only orders a simplified SSA DAG | fail for parity |
| Baseline strength/fairness | two proxies plus loose beam ceiling | anchors use production/competitive baselines | actual current LLVM+greedy/min-reg absent | fail |
| Natural workload/platform | two LLVM regression artifacts | anchors use benchmark suites and real compiler targets | no natural kernel-derived MIR; no AMD platform | fail |
| Full-cost coverage | expansions and host Python time | anchors account for compilation and generated-code quality | LLVM compile, memory, spills, fallback, code size, runtime absent | fail |
| Main result/statistics | two deterministic cases | anchors report corpus-scale distributions | n=2, no stochastic/performance statistics | fail |
| Ablation/mechanism evidence | candidate vs pressure proxy vs wider beam | anchors isolate solver/allocator decisions | no tier transition, bank ablation, or legality test | fail |
| Scale/generalization | 26- and 78-instruction excerpts | Unison reports much larger functions; GPU works use suites | no size/target/workload curve | fail |
| Failure boundary | no tier/spill gain observed; pressure can worsen | anchor papers describe applicability/tradeoffs | boundary is model-induced, not natural | partial |
| Artifact/reproducibility | contract, scripts, inputs, JSON, replay hashes | strong anchors provide implementation/evaluation detail | executed probe is reproducible but not LLVM-integrated | partial |

## Reviewer-shape assessment

- Editor/venue-fit view: topic fits compiler/code-generation venues, but the current evidence is far below a paper submission threshold.
- Methodology view: reproducibility and claim ceilings are good; ecological validity, baseline fairness, and legality are missing.
- Domain-contribution view: the residual tier-certificate idea remains structurally distinct, but no AMDGPU-specific empirical benefit is shown.
- Devil's-advocate view: the present cycle-proxy gain could be an artifact of omitted hazards/interference, while LLVM already contains occupancy-aware pressure scheduling.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` only as conditional structural potential
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: immutable commit/subtarget/input/script lock; deterministic replay; explicit analytical evidence ceiling.
- Executable next gaps: with a provided tool bundle, replay current LLVM/greedy and validate legal MIR on 8–16 complete natural-kernel regions under the same budget.
- Human/resource-dependent gaps: candidate-local pinned LLVM AMDGPU tools/corpus; later AMD hardware for runtime claims.
- Bounded near-Q1 gaps: none yet; core Stage A gates remain open.
- Gap that would invalidate the paper: actual current LLVM reaches the ceiling tier on nearly all natural cliffs, or no legal same-budget non-dominated candidate exists.
- Why this is calibration rather than novelty or baseline evidence: the matrix compares paper shape and evidence completeness; it does not prove absence of collisions or instantiate a fair baseline.
- Why Tier B still requires hard gates: any eventual Tier B continuation must close same-object, latest-collision, fair-current-baseline, natural-evidence, full-cost, and reproducibility gates. None is waived here.

