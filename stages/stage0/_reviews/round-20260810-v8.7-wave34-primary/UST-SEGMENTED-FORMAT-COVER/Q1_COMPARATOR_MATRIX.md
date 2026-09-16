# UST-SEGMENTED-FORMAT-COVER Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: ACM TACO / JPDC / equivalent sparse-systems venues
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE` conditional on the unique revision gate
- Search/cutoff date: `2026-08-10`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | GeneralSparse: Bridging the Gap in SpMM for Pruned LLM Inference on GPUs | USENIX ATC 2025, published | selective top systems conference / Q1-equivalent systems shape | 2025, official USENIX paper and page | abstract, design overview, memory/reduction action space, evaluation summary | Shows the expected abstraction + cost-model + codegen + end-to-end contribution shape for adaptable SpMM. |
| EVALUATION_ANCHOR | HR-SpMM: Adaptive Row Partitioning and Hybrid Kernel Design for SpMM | ACM ICS 2025, published | selective HPC conference / field-equivalent high bar | 2025, official proceedings PDF, DOI 10.1145/3721145.3725770 | full abstract, design, preprocessing, corpus, baseline and timing-accounting sections | Same-operation row partition and hybrid execution with SuiteSparse; exposes both evaluation breadth and the danger of kernel-only timing. |
| DOMAIN_NEIGHBOR | The Tensor Algebra Compiler | OOPSLA 2017, published | top PL venue / Q1-equivalent | 2017, ACM DOI 10.1145/3133901 | format-abstraction and code-generation contribution scope | Calibrates the level of reusable representation/compiler substance expected from a format-system paper. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | On Optimal Partitioning for Sparse Matrices in Variable Block Row Format | author preprint / arXiv, not used as venue parity | no quartile claim; method/collision anchor only | 2021 revision, arXiv 2005.12414 | abstract, contiguous-partition model, DP, cost/amortization and SuiteSparse evaluation | Directly subtracts generic contiguous-row additive DP and reuse-amortization novelty. |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | General-purpose repeated sparse-dense multiplication through a new NVIDIA sparse API | GeneralSparse and HR-SpMM establish broad SpMM importance | UST is experimental and young; readership depends on a reusable result rather than API-specific tuning | Q2 plausible, Q1 not yet |
| Contribution type | Bounded heterogeneous UST cover and execution plan | GeneralSparse has an abstraction/cost model/codegen; TACO has a reusable format/compiler abstraction | Current proposal is a labelled segmentation DP plus existing plans unless revision isolates a stronger property | revision hard gate |
| Nearest-prior delta | Multiple contiguous UST fragments with distinct formats and reuse accounting | Ahrens: contiguous DP and amortization; HR: hybrid SpMM; GeneralSparse: division + format adjustment + model | Combination is narrow and potentially obvious | underfrozen |
| Algorithm/mechanism substance | Proposed bounded DP | Ahrens already gives linear-time DP for a more specific representation; GeneralSparse has broader code generation | Need non-product coupling/theorem/algorithm | not yet parity |
| Baseline strength/fairness | Complete global UST grid plus labelled-DP and hybrid SpMM controls | Anchors compare multiple current kernels/systems | Discovery's whole-format-only baseline is insufficient | corrected in PRIMARY |
| Natural workload/platform | SuiteSparse, fixed IDs/checksums and preregistered strata | HR-SpMM and GeneralSparse already use SuiteSparse; Ahrens evaluates natural matrices | Must avoid selecting only known heterogeneous winners | finite Stage A route |
| Full-cost coverage | Cold/warm conversion, plan/JIT, launches, metadata, memory and output assembly | Ahrens explicitly studies amortization; HR reports principal speedup with preprocessing excluded | Candidate must exceed kernel-only practice | mandatory |
| Main result/statistics | Not yet obtained or required at Stage 0 | Anchors report broad speedups and distributions | Future p50/p90 and no-gain map required | readiness gap only |
| Ablation/mechanism evidence | Non-product action vs additive labelled DP | GeneralSparse/HR provide mechanism components | Exact action-divergence ablation is not yet frozen | revision item |
| Scale/generalization | 20+ SuiteSparse matrices, `R={1,8}`, declared dense widths | Anchors use hundreds of matrices or end-to-end models | Q2 can accept smaller but stratified natural scope; Q1 needs broader platforms/widths | Tier B ceiling |
| Failure boundary | Homogeneous rows, `R=1`, dominant global format, high segment count | Ahrens and hybrid-format work identify conversion/structure boundaries | Must preregister thresholds and report no-gain cases | credible route |
| Artifact/reproducibility | Open nvmath-python and SuiteSparse; future scripts pin version/action catalog | GeneralSparse artifact status was not relied on; UST source is open | No present candidate artifact, which is not a Stage 0 stop | readiness risk |

## Reviewer-shape assessment

- Editor/venue-fit view: a UST integration alone is too narrow; a reusable cover algorithm and a natural no-gain map can fit a Q2 sparse-systems venue.
- Methodology view: current additive estimator risks circularity and standard-DP absorption. The labelled-DP comparator and full-cost ledger are mandatory.
- Domain-contribution view: row partition and hybrid sparse formats are mature. Novelty must arise from a coupled UST action/guarantee, not the availability of more format labels.
- Devil's-advocate view: the likely outcome is that the candidate is Ahrens-style segmentation over UST cost labels, with multiple native plans adding overhead. The one revision must make this attack falsifiable before any execution effort.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` only if the unique revision gate closes; otherwise `BELOW_Q2_STOP`
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: exact SpMM object; current UST source/action catalog; natural corpus availability; finite same-output/full-cost route.
- Executable next gaps: one non-product mechanism/guarantee certificate and its Stage A action-divergence killer.
- Human/resource-dependent gaps: later GPU measurement affects evidence ceiling but is not the current decision basis.
- Bounded near-Q1 gaps: broader format/platform scope, formal guarantee and larger stratified evaluation.
- Gap that would invalidate the paper: the complete action reduces to additive labelled segmentation or a wrapper around multiple native plans.
- Why this is calibration rather than novelty or baseline evidence: the anchor set defines expected paper substance and evaluation breadth; novelty is assessed separately in the source audit and claim matrix.
- Why Tier B remains conditional: same-object, source reality and reproducibility paths close, but the N2 hard gate is not yet separated from finite strong priors.
