# AMX-JOINT-TILE-CONFIG-BINDING Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: CGO / CC / TACO-style compiler backend algorithm
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: 2026-08-14

## Reference set

| Role | Paper / source | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Unison: Combinatorial Register Allocation and Instruction Scheduling | peer-reviewed compiler optimization work | high-bar algorithmic codegen shape | 2018, author preprint | abstract/method framing | joint finite decision space and formal optimization are the relevant shape, not a same-object baseline |
| EVALUATION_ANCHOR | LLVM AMX current in-tree tests and source | official upstream artifact | same-object implementation anchor | current pin 2026-08-14 | full listed source paths | fixes native semantics and fair baseline rather than paper novelty |
| DOMAIN_NEIGHBOR | LLVM Compiler Infrastructure | CGO | compiler system shape | 2004 | paper-level | supports the venue/domain fit only |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Fast AMX config/RA pipeline | official current source | direct component subtractor | current pin | full listed source paths | prevents recasting existing sinking/reload/shape rewriting as a new result |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | AMX code generation on fixed LLVM backend | AMX first-class LLVM target pipeline | specialized but meaningful | conditional |
| Contribution type | target-specific bounded Pareto algorithm | Unison requires genuine joint algorithmic substance | recurrence absent | revise gate |
| Nearest-prior delta | config + TMM binding jointly | current LLVM already has each component | must isolate union-external plan | revise gate |
| Algorithm/mechanism substance | exact/FPT/certified frontier | generic CP/ILP insufficient | not yet specified | revise gate |
| Baseline strength/fairness | optimized + fast current pipelines | current LLVM source/test | complete mapping required | frozen |
| Natural workload/platform | public AMX in-tree MIR/IR, then natural AMX kernels | upstream test corpus | scale evidence absent | Stage A only |
| Full-cost coverage | config stores, spills, bytes, compile resource, runtime | no current claim supplied | ledger frozen, not measured | Stage A only |
| Main result/statistics | none claimed | N/A | intentionally absent | evidence ceiling |
| Ablation/mechanism evidence | two-plan witness | current sink-after-call test | candidate witness absent | revise gate |
| Scale/generalization | 8 TMM target-bounded class | target-specific | may be too narrow without recurrence | conditional |
| Failure boundary | union dominance / invalid native plan | source-defined legality | explicit | satisfactory |
| Artifact/reproducibility | pinned upstream blobs and static checker route | official Git source | checker unimplemented | finite gap |

## Reviewer-shape assessment

- Editor/venue-fit view: Tier-B viable only if a formal target-specific result accompanies fair LLVM evidence; a pass-order tweak is insufficient.
- Methodology view: current components are unusually strong; comparing only the optimized chain would be unfair because the fast chain handles call-adjacent config and physical shapes.
- Domain-contribution view: the finite eight-TMM resource grammar makes an FPT/certified-Pareto result plausible, but not yet demonstrated.
- Devil's-advocate view: the likely failure is that all apparent improvements are current fast-pipeline behavior or generic allocation.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` conditional on the sole revision certificate.
- Status: `PARITY_CONDITIONAL`
- Closed gaps: exact object, native semantics, strong component baselines, finite fidelity route.
- Executable next gaps: same-MF witness, complete action catalog, target-specific recurrence/guarantee.
- Human/resource-dependent gaps: none at Stage 0.
- Bounded near-Q1 gaps: natural corpus/full-cost Pareto evidence remains Stage A work.
- Gap that would invalidate the paper: no union-external plan or generic-only method.
- Why this is calibration rather than novelty or baseline evidence: comparison sets editorial bar; direct collision is adjudicated only in `SOURCE_AUDIT.md` and report.

