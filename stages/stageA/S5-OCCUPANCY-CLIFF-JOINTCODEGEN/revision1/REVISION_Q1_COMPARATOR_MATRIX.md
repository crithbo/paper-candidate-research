# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Revision Q1/Q2 Calibration

- Stage: `STAGEA_REVISION1`
- Candidate venue family: PLDI / CGO / ACM TOPLAS compiler optimization
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: conditional `TIER_B_Q2_VIABLE`; reserve recommended
- Search/cutoff date: 2026-08-09

## Reference set

| Role | Paper/source | Venue/status | Read scope | Calibration use |
|---|---|---|---|---|
| Contribution-shape anchor | [Unison: Combinatorial Register Allocation and Instruction Scheduling](https://chschulte.github.io/papers/castanedacarlssonea-toplas-2019.pdf) | ACM TOPLAS 2019 | inherited Stage 0 genealogy; not re-read end-to-end | joint code-generation artifact and evaluation shape |
| GPU backend anchor | [Register Allocation for Intel Processor Graphics](https://doi.org/10.1145/3168806) | CGO 2018 | inherited calibration summary | real GPU backend RA evaluation |
| Modern allocator neighbor | [RL4ReAl](https://doi.org/10.1145/3578360.3580273) | CC 2023 | inherited calibration summary | LLVM allocator artifact/evaluation |
| Current production boundary | [LLVM GCNSchedStrategy at frozen commit](https://github.com/llvm/llvm-project/blob/1f112d62e1fa2c4f1a04887abd72da1ed61cf791/llvm/lib/Target/AMDGPU/GCNSchedStrategy.cpp) | primary source | lines 1–240 fetched from exact blob `5816559f…` | direct subtract and mandatory baseline definition |

## Comparator matrix

| Dimension | Candidate target | Q1/Q2 anchor expectation | Revision evidence | Disposition |
|---|---|---|---|---|
| Problem importance | AMDGPU occupancy cliffs | demonstrated natural impact | no natural MIR | open |
| Mechanism | fixed-budget tier frontier | non-routine algorithm/artifact | frozen design only | fail |
| Nearest-prior delta | tier/certificate residual | collision-closed residual | bounded-open; current knobs subtract heavily | fail |
| Strong baseline | exact current LLVM+greedy | executable fair comparator | not built/run | fail |
| Natural workload | AMD official kernels | corpus-scale natural evidence | source paths frozen, not fetched | fail |
| Legal output | verifier-passing MIR | semantic equivalence | zero output | fail |
| Main result | tier/spill/compile-cost Pareto | repeatable effect and statistics | zero runs | fail |
| Full cost | compiler + fallback + memory | complete ledger | acquisition failure cost only | fail |
| Ablation | tier/tracker/frontier components | mechanism isolation | planned, not executed | fail |
| Generality | cliff/non-cliff strata | multiple workloads/targets | none | fail |
| Failure boundary | resource and no-gain regions | explained natural boundary | only truncated download | insufficient |
| Reproducibility | immutable package | commands, hashes, replay | failure reproducible; experiment unavailable | partial |

## Reviewer-shape assessment

- Editor: appropriate compiler topic, no submission-level evidence.
- Methodology: fail-closed acquisition is honest but supplies no mechanism evidence.
- Domain: current LLVM already exposes the planned knob family; a future work must exceed configuration selection.
- Devil's advocate: the frozen candidate may be routine tuning even if it eventually finds a point.

## Decision

- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: immutable source/budget design and provenance-aware failure record
- Human/resource-dependent gaps: provision an already verified exact-commit AMDGPU toolchain and complete MIR corpus outside this exhausted automated revision
- Invalidating result if later tested: current LLVM matches the ceiling on natural cliffs or the only gains come from existing knob selection
- Calibration-only caveat: this matrix neither proves novelty nor instantiates a fair baseline.

