# MLIR Vector Representation/Register Pressure — Q1/Q2 Calibration

- Stage: `STAGE0`
- Candidate venue family: compiler construction / code generation
- Quality tier: `TIER_B_Q2_VIABLE` conditional
- Status: `PARITY_CONDITIONAL`
- Cutoff: 2026-08-14

## Reference set

| Role | Reference | Venue/status | Read scope | Why selected |
|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | [Unison combinatorial code generation](https://arxiv.org/abs/1804.02452) | peer-reviewed compiler research / author preprint | algorithmic contribution shape | separates nontrivial bounded combinatorial codegen from tuning |
| EVALUATION_ANCHOR | [MLIR Vector dialect](https://mlir.llvm.org/docs/Dialects/Vector/) | official current source | lowering representations and constraints | same representation semantics |
| DOMAIN_NEIGHBOR | [LLVM VPlan](https://llvm.org/docs/VectorizationPlan.html) | official current source | vector plan decision boundary | strongest adjacent plan comparator |
| BOUNDARY_ANCHOR | [MLIR pass options](https://mlir.llvm.org/docs/Passes/) | official current source | conversion options and target routes | prevents a flag/pipeline claim |

## Comparator matrix

| Dimension | Candidate after revision | Evidence | Gap | Disposition |
|---|---|---|---|---|
| Contribution | bounded exact/FPT representation frontier | Unison-style algorithmic shape | target-specific narrowness | Tier B conditional |
| Same object | fixed MLIR target conversion | Vector/Pass docs | currently unpinned | revision |
| Strong baseline | option grid + VPlan/RA | current sources | complete grid unwritten | revision |
| Mechanism | cast/representation boundary only | Vector docs | cannot include VPlan VF/UF | revision |
| Full cost | compile/codegen/cast/shuffle/spill/runtime | codegen evaluation norm | unmeasured | Stage A |
| Natural evidence | MLIR tests plus CPU functions | current testable ecosystem | corpus unpinned | Stage A |
| Reproducibility | commits/patterns/commands/oracle | required pipeline fidelity | absent | revision/Stage A |

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` if atomic gate closes.
- Calibration: `PARITY_CONDITIONAL`.
- Invalidating gap: action surface collapses to existing conversion flags/VPlan choice or cannot be made target-complete.
- Calibration is not a novelty or performance result.

