# LLVM-APX-PREFIX-PRESSURE-PARETODP Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: compiler/code-generation journal or conference
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE` conditional structural potential
- Search/cutoff date: `2026-08-11`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | R. Castañeda Lozano et al., “Combinatorial Register Allocation and Instruction Scheduling” | ACM TOPLAS 41(3), DOI [10.1145/3332373](https://doi.org/10.1145/3332373) | top compiler journal / Q1-shape anchor | 2019 | abstract, method and reported evaluation scope via paper/preprint metadata | Closest high-quality shape for a nontrivial integrated code-generation algorithm and solver-quality/compile-time tradeoff. |
| EVALUATION_ANCHOR | M. Panchenko et al., “BOLT: A Practical Binary Optimizer for Data Centers and Beyond” | CGO 2019, DOI [10.1109/CGO.2019.8661201](https://doi.org/10.1109/CGO.2019.8661201) | flagship compiler conference equivalent | 2019 | paper abstract, workload and end-to-end evaluation claims | Calibrates production compiler integration, natural workloads and full-cost performance evidence; not a novelty baseline. |
| DOMAIN_NEIGHBOR | S. Buchwald et al., “SSA-Based Register Allocation with PBQP” | Compiler Construction 2011, DOI [10.1007/978-3-642-19861-8_4](https://doi.org/10.1007/978-3-642-19861-8_4) | established compiler venue | 2011 | abstract/method scope | Calibrates a precise register-allocation algorithm with coalescing and target constraints. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | LLVM APX RFC and current `X86CompressEVEX` | official upstream design/source, [RFC](https://discourse.llvm.org/t/rfc-design-for-apx-feature-egpr-and-ndd-support/73031), [source](https://github.com/llvm/llvm-project/blob/a1194be1baefa99d20a09bd04b16056be0ab7225/llvm/lib/Target/X86/X86CompressEVEX.cpp) | production same-object boundary | current pin checked 2026-08-11 | relevant design text and compression implementation | Establishes the complete native method component and invalidates the EFLAGS-dead form of the Discovery witness. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | APX code density, register pressure and frontend cost in a production LLVM backend | Unison and BOLT show sustained interest in code-generation quality and production integration | APX adoption breadth is narrower | credible Q2 problem; Q1 breadth conditional |
| Contribution type | target-specific exact/bounded Pareto quotient algorithm | Unison offers a full combinatorial code-generation method; PBQP offers a defined allocator formulation | quotient and theorem are currently underdefined | revision hard gate |
| Nearest-prior delta | retain APX form/register/ABI Pareto frontier beyond sequential LLVM | current LLVM implements all actions and local conversions | must prove non-generic residual beyond current composition and Unison | conditional |
| Algorithm/mechanism substance | future-action/cost-preserving quotient DP | Unison/PBQP have explicit models and solve procedures | arbitrary bank permutation and `3^w` are unsound/unsupported as written | not PASS-ready |
| Baseline strength/fairness | complete LLVM, finite tuning grid, Unison-like same grammar, exact micro-oracle | BOLT/Unison use strong production or optimization baselines | actual fidelity closure belongs to Stage A | finite route |
| Natural workload/platform | LLVM test-suite and public x86 integer-pressure regressions | BOLT evaluates natural large applications; Unison uses real functions/benchmarks | no current incidence or gain measurement | readiness gap only |
| Full-cost coverage | compile CPU/RSS, DP cost, bytes, uops, spills, frame/CFI, fallback | anchors account for solve/optimization and runtime/code-quality tradeoffs | must prevent oracle cost from disappearing | preregistered |
| Main result/statistics | none claimed at Stage 0 | anchors report multi-workload results | major Q1 evidence gap | Stage A/B work, not Stage 0 STOP |
| Ablation/mechanism evidence | remove quotient, Pareto retention, APX grammar and compare scalar tuning | Unison separates model components; BOLT uses optimization/evaluation breakdowns | not yet executed | finite plan |
| Scale/generalization | bounded acyclic traces, multiple functions | anchors cover broader code-generation or applications | narrow target/trace scope | caps current potential at Tier B |
| Failure boundary | low pressure/no alternate form/current frontier equality | formal/optimization papers name limits | must add alias/ABI/flags counterexamples | revision can close specification |
| Artifact/reproducibility | public LLVM/binutils/corpora plus exact enumerator | anchors have implementable/public toolchains | no candidate artifact yet | readiness, not structural fatality |

## Reviewer-shape assessment

- Editor/venue-fit view: a sound APX-specific exact/FPT algorithm with production evaluation can fit a credible systems/compiler Q2 venue. A backend heuristic patch does not.
- Methodology view: the paper kernel lives or dies on a formal equivalence relation and corrected complexity. Current source must be the baseline, including LEA conversion and relocation suppression.
- Domain-contribution view: APX is timely and the action/cost conflict is real, but target specificity limits breadth unless the quotient principle generalizes to other irregular variable-length ISAs.
- Devil's-advocate view: the current proposal is a generic constraint solver disguised by APX terminology, while the claimed bank symmetry ignores exactly the irregularities that make x86 hard.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` conditional structural potential
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: exact production object, strongest current pipeline, public fidelity route, full-cost dimensions and a bounded negative test are identifiable.
- Executable next gaps: `SOUND_APX_TRACE_QUOTIENT_CERTIFICATE`, including the EFLAGS-live native witness and state-sufficiency/complexity audit.
- Human/resource-dependent gaps: none decisive at Stage 0; APX hardware is optional for raising runtime evidence.
- Bounded near-Q1 gaps: broader target/generalization, multi-workload scale and stronger empirical evidence.
- Gap that would invalidate the paper: quotienting that changes future legality/cost, or collapse to generic labeled register allocation/ILP with no new guarantee.
- Why this is calibration rather than novelty or baseline evidence: the anchors define expected contribution and evaluation shape; only the current-source and collision audits decide residual novelty.
- Why Tier B, if applicable, still closes same-object, latest-collision, fair-baseline, natural-evidence, full-cost and reproducibility gates: these are finitely definable and auditable, but Stage 0 PASS awaits the one structural quotient certificate.
