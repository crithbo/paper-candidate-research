# PPC-MMA-JOINT-ACCUMULATOR-CONSTRUCTION Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: compiler/code-generation venues; no viable fit for this frozen object
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: 2026-08-14

## Reference set

| Role | Paper / artifact | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Pereira & Palsberg, *Register Allocation by Puzzle Solving* | PLDI | premier PL venue | 2008, LLVM publication page | abstract/metadata | generic RA is a subtractor, not MMA-specific proof |
| EVALUATION_ANCHOR | LLVM current PPC register/instruction source | upstream production compiler | strongest same-object implementation evidence | 2026 | decisive symbols | defines actual families/actions |
| DOMAIN_NEIGHBOR | *A matrix math facility for Power ISA processors* | arXiv / Power ISA technical paper | domain background, not a comparator | 2021 | abstract | establishes MMA facility context only |
| BOUNDARY_OR_NEGATIVE_ANCHOR | `getRegAllocationHints` ISAFuture branch | current LLVM source | current direct boundary | 2026 | exact source block | invalidates unified ACC/UACC/WACC grammar |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | MMA codegen could matter | MMA facility is relevant | scope exists | insufficient |
| Contribution type | joint target-specific N2 | action domains split | no common problem | fatal |
| Nearest-prior delta | claimed union frontier | current source already separates families | comparison invalid | fatal |
| Algorithm/mechanism substance | ACC/UACC/WACC+FMA+spill state | generic RA after erasure | target-specific kernel absent | fatal |
| Baseline strength/fairness | B0-B2 | not composable as one baseline | union unfair | fatal |
| Natural workload/platform | MMA kernels | cannot repair static action mismatch | irrelevant | fatal |
| Full-cost coverage | proposed | cross-target cost incomparable | denominator undefined | fatal |
| Main result/statistics | none needed at Stage0 | no valid claim to test | — | fatal |
| Ablation/mechanism evidence | two native plans | no same-object plan grammar | impossible | fatal |
| Scale/generalization | unknown | object changes with target family | undefined | fatal |
| Failure boundary | generic reduction | directly reached | decisive | stop |
| Artifact/reproducibility | source audit | source is reproducible | does not cure object | stop |

## Reviewer-shape assessment

- Editor/venue-fit view: there is no coherent compiler-algorithm claim to review under the frozen object.
- Methodology view: the baseline union is deliberately separated because joining it is an invalid cross-target comparison.
- Domain-contribution view: MMA-specific allocation remains an open *new-object* possibility, not evidence for this candidate.
- Devil's-advocate view: any reported benefit would select one target/family and thereby silently rewrite the problem.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: current action family and current configuration restrictions.
- Executable next gaps: none under this ID.
- Human/resource-dependent gaps: none.
- Bounded near-Q1 gaps: not applicable.
- Gap that would invalidate the paper: already present — no single same-object action grammar.
- Why this is calibration rather than novelty or baseline evidence: publication references calibrate paper shape; current source establishes the actual scientific negative evidence.
- Why Tier B is not applicable: Tier B cannot relax same-object, fair baseline, full-cost or reproducible native semantics.

