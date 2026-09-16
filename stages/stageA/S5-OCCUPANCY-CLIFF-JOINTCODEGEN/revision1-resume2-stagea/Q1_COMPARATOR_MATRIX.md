# S5-OCCUPANCY-CLIFF-JOINTCODEGEN Q1/Q2 Comparator Matrix — R2A

- Stage: `STAGEA_RESUME_FROM_BLOCKER`
- Candidate venue family: PLDI / CGO / ACM TOPLAS compiler optimization
- Quality tier: frozen `TIER_B_Q2_VIABLE`, not rescored
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Search/cutoff: frozen upstream review; no new literature claim in this resource-blocked run

## Reference set

| Role | Reference | Use here |
|---|---|---|
| Contribution anchor | Unison, ACM TOPLAS 2019 | required joint code-generation algorithm/evaluation shape |
| GPU backend anchor | Register Allocation for Intel Processor Graphics, CGO 2018 | production GPU RA baseline/evidence shape |
| Modern allocator neighbor | RL4ReAl, CC 2023 | LLVM allocator artifact/evaluation calibration |
| Production boundary | frozen LLVM `GCNSchedStrategy` source | direct subtract and mandatory same-object baseline |

## Comparator matrix

| Dimension | Candidate requirement | R2A evidence | Gap/disposition |
|---|---|---|---|
| Exact object | frozen LLVM/AMDGPU MIR | commit metadata only | executable gap |
| Algorithmic substance | non-routine joint frontier/certificate | frozen proposal; no execution | open |
| Strong baseline | real GCNSchedStrategy + greedy | 0 runs | blocked |
| Natural workload | 8–16 public complete MIR | 0 | blocked |
| Legality | MachineVerifier | no output | blocked |
| Main result | tier/spill/full-cost Pareto residual | none | not observed |
| Full cost | build, methods, selection, verification, fallback | resource attempt only | scientific ledger unavailable |
| Reproducibility | exact tools and double replay | blocker reproducible; science absent | partial |
| Generality/failure boundary | cliff/non-cliff natural regions | no natural regions | open |

## Reviewer-shape assessment

- Editor: potentially relevant compiler problem, but no scientific Stage A evidence from this assignment.
- Methodology: correct fail-closed behavior; bootstrap LLVM was not substituted for exact LLVM.
- Domain: current LLVM remains a strong direct subtractor; no residual was tested.
- Devil's advocate: the frozen existing-knob frontier may be routine tuning even if a resource-resumed probe later finds a point.

## Decision

This is calibration, not novelty or performance evidence. Tier B potential remains conditional and unchanged. The executable gap is bounded but currently user-action blocked; the run cannot justify Q1 parity, scientific STOP, or Stage B.
