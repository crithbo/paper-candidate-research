# AARCH64-SME-JOINT-TILE-ABI-CONSTRUCTION — Q1/Q2 calibration

- Stage: `STAGE0`
- Candidate venue family: compiler backend / ABI-aware code generation
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: 2026-08-14

## Reference set

| Role | Paper / source | Venue/status | Read scope | Why selected |
|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Mössenböck & Pfeiffer, *Linear Scan Register Allocation in the Context of SSA Form and Register Constraints* | compiler allocation research | cited by current TileAllocation source | establishes that allocator-only improvement is not the proposed joint ABI contribution |
| EVALUATION_ANCHOR | current LLVM `MachineSMEABIPass.cpp` + in-tree `aarch64-sme-za-call-lowering.ll` | official upstream source/artifact | full relevant source/test sections | fixes current same-object ABI state actions |
| DOMAIN_NEIGHBOR | *Hello SME! Generating Fast Matrix Multiplication Kernels Using the Scalable Matrix Extension* | SC Workshops 2024 | paper abstract/content boundary | SME kernel generation, not same compiler/ABI object |
| BOUNDARY_OR_NEGATIVE_ANCHOR | current MLIR `TileAllocation.cpp` | official upstream source | full relevant source sections | current tile-ID action catalog and its greedy-linear-scan boundary |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Disposition |
|---|---|---|---|---|
| Problem importance | ABI-correct SME lowering | LLVM upstream has real ABI complexity | valid setting | insufficient alone |
| Contribution type | purported joint N2 | native actions factorize | no joint kernel | fatal |
| Algorithmic substance | finite FPT/Pareto DP | current ABI CFG state + generic allocation | Cartesian product only | fatal |
| Same-object baseline | LLVM/MLIR composition | complete current source paths pinned | fair union fixed | absorbed |
| Two-plan witness | two tile + one call | public carriers are separate | bridge changes representation | fatal |
| Full-cost | bytes/state/save/compiler costs | no coupling changes the terms | no residual cost coordinate | fatal |
| Natural carrier | in-tree LLVM/MLIR tests | individual component carriers available | not a joint carrier | fatal |
| Reproducibility | public source + tests | exact pin and blob hashes | source route closed | supports STOP |

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Invalidating gap: a same-object non-product action/guarantee does not exist under fixed ABI semantics.
- Why calibration is not collision evidence: literature papers only set shape/boundary; the decision rests on current official source action factorization.

