# S6-EGRAPH-LIVEEXTRACT Revision 1 Q1/Q2 Paper Calibration

- Stage: `STAGEA_REVISION1`
- Candidate venue family: compiler optimization / programming languages / architecture systems
- Calibration status: `PARITY_NOT_PLAUSIBLE`
- Quality tier: `BELOW_Q2_STOP`
- Search/cutoff date: 2026-08-09

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Fast and Optimal Extraction for Sparse Equality Graphs | PACMPL OOPSLA | premier PL venue | 2024, DOI `10.1145/3689801` | abstract/method/evaluation claims | Exact extraction and strong algorithmic contribution anchor |
| EVALUATION_ANCHOR | SmoothE: Differentiable E-Graph Extraction | ASPLOS | premier architecture/systems venue | 2025, DOI `10.1145/3669940.3707262` | full author PDF scope relevant to baselines/evaluation | Natural multi-domain evaluation and current extraction baseline |
| DOMAIN_NEIGHBOR | Equality Saturation for Optimizing High-Level Julia IR | ACM TACO | Q1-equivalent architecture/compiler journal family | 2026, DOI `10.1145/3795883` | abstract, extraction/code-reuse and evaluation description | Compiler-level DAG extraction and reuse neighbor |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Checkmate: Breaking the Memory Wall with Optimal Tensor Rematerialization | MLSys | premier ML systems venue | 2020, official proceedings | abstract, formulation, baseline/evaluation sections | Exact fixed-DAG memory/rematerialization scheduling anchor |

Additional current extraction comparator: e-boost, ICCAD 2025, DOI `10.1109/ICCAD66269.2025.11240719`.

## Comparator matrix

| Dimension | Candidate revision | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Joint extraction and peak-live scheduling is relevant | Anchors establish extraction and memory scheduling importance | No demonstrated natural residual | Fatal |
| Contribution type | Intended N2 joint algorithm | FastOpt/Julia provide substantive extraction formulations; Checkmate provides scheduling formulation | Natural object is exactly absorbed by controls | Fatal |
| Nearest-prior delta | Same-object coupling objective | Adjacent works split extraction and fixed-DAG scheduling | Delta has no positive natural witness here | Fatal |
| Algorithm/mechanism substance | Exact oracle is implemented | Anchors provide scalable or deployable algorithms | Only small-object ceiling; no surviving mechanism | Fatal |
| Baseline strength/fairness | Two exact sequential controls, same object/B/information | Stronger than heuristic-only comparison for the probe | None | Closed for negative inference |
| Natural workload/platform | Public Diospyros compiler e-graph | Anchors use broad natural suites | Only one object, but sufficient for the frozen killer gate | Negative gate closed |
| Full-cost coverage | Target-operation costs, sizes, solver time/RSS and artifacts recorded | Anchors include runtime or deployment evidence | No measured backend latency/spills | Would be major if claim survived |
| Main result/statistics | Exact 0/29 strict witness; full B partition | Anchors show consistent improvements over suites | No positive result | Fatal |
| Ablation/mechanism evidence | Root lower bounds explain absorption; recomputation zero | Anchors isolate algorithmic components | Mechanism is absent on object | Fatal |
| Scale/generalization | 16 classes, 24 nodes, 9 extractions | Anchors evaluate much larger suites | Large gap | Fatal after negative core result |
| Failure boundary | Complete B=4..136 partition | Checkmate/FastOpt report constraints and boundaries | Object-specific only | Strong negative evidence |
| Artifact/reproducibility | Pinned source, code, double replay, hashes | Comparable artifact expectations | No gap for Stage A reproducibility | Closed |

## Reviewer-shape assessment

- Editor/venue-fit view: a relevant problem without a surviving positive contribution on the mandated natural object is not a viable submission.
- Methodology view: the negative decision is unusually clean because object, mapping, controls, and B sweep were preregistered and exact.
- Domain-contribution view: the natural frontier is already spanned by two sequential controls, eliminating the proposed residual.
- Devil's-advocate view: changing output sizes, selecting a different object after seeing results, or returning to the controlled witness would violate the frozen gate and natural-evidence requirement.

## Decision

- Quality tier: `BELOW_Q2_STOP`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed gaps: same-object fairness, exact controls, natural multi-extraction input, bounded full-cost proxy, reproducibility, negative boundary.
- Executable next gaps: none within this candidate after the one allowed revision.
- Human/resource-dependent gaps: none; this was not a resource failure.
- Bounded near-Q1 gaps: none because the core contribution residual failed.
- Gap that invalidates the paper: no strict natural joint point and no qualifying structural/theory increment.
- Why this is calibration rather than novelty evidence: comparator papers define expected contribution/evaluation shape; they do not prove or disprove novelty.
- Tier B note: Q2 cannot relax the natural positive evidence or core-contribution requirement, so downgrade to Q2 is impermissible.

