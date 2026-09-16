# S6-EGRAPH-LIVEEXTRACT Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: `OOPSLA/PACMPL`, `PLDI`, `CGO`, `ASPLOS`
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_A_Q1_POTENTIAL` as a structural ceiling, not evidence readiness
- Search/cutoff date: 2026-08-09

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | [Fast and Optimal Extraction for Sparse Equality Graphs](https://doi.org/10.1145/3689801) | OOPSLA/PACMPL, Distinguished Paper | top PL venue equivalent; no journal-quartile inference needed | 2024, author/ACM pages | abstract, algorithm/guarantee and Cranelift evaluation description | Exact low-treewidth extraction and real Cranelift evidence bar |
| EVALUATION_ANCHOR | [SmoothE: Differentiable E-Graph Extraction](https://doi.org/10.1145/3669940.3707262) | ASPLOS 2025 | top architecture/systems venue equivalent | 2025, author PDF/NVIDIA page | abstract, method and evaluation overview | Extraction quality, scale, and end-to-end evaluation bar |
| DOMAIN_NEIGHBOR | [Equality Saturation for Optimizing High-Level Julia IR](https://doi.org/10.1145/3795883) | ACM TACO 23(1) | journal article; this matrix does not assert a live JCR quartile | 2026, published open version | abstract, ILP/code-reuse formulation and evaluation scope | Current shared-DAG/acyclic extraction subtractor on deployed compiler IR |
| BOUNDARY_OR_NEGATIVE_ANCHOR | [Checkmate: Breaking the Memory Wall with Optimal Tensor Rematerialization](https://proceedings.mlsys.org/paper_files/paper/2020/hash/0b816ae8f06f8dd3543dc3d9ef196cab-Abstract.html) | MLSys 2020 | selective systems/ML conference equivalent | 2020, official proceedings | abstract, formal problem, MILP/approximation and real-system evaluation | Exact fixed-DAG rematerialization/full-cost boundary |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Joint extraction and generated-program memory under hard `B` | FastOpt/SmoothE show extraction relevance; Checkmate shows memory/remat relevance | Combined natural incidence unknown | Conditional |
| Contribution type | N2 joint selection/materialization/recompute/schedule algorithm | FastOpt parameterized exact algorithm; Julia EqSat ILP code reuse | No deployable algorithm or theorem yet | Executable gap |
| Nearest-prior delta | Generated-program peak-live is first-class during e-graph extraction | Current papers cover extraction cost, pattern coverage, or fixed-DAG rematerialization | Same-object latest-collision closure incomplete | Search-bounded open |
| Algorithm/mechanism substance | Exact small oracle and one strict ordering-separation witness | Anchors provide scalable method/guarantee | Oracle is exponential and small only | Major Stage B gap |
| Baseline strength/fairness | Both exact sequential orders, all ties retained | Stronger than greedy for locked small instances | FastOpt/e-boost/Julia executable parity absent | Partial |
| Natural workload/platform | One pinned eggcc-bril subgraph projection | FastOpt Cranelift, Julia IR, SmoothE multi-domain workloads | Projection has one extraction and synthetic unit sizes | Not closed |
| Full-cost coverage | Solver time/RSS/input/result sizes; execution proxy/peak | Anchors report compile/extract and end-to-end effects | No backend, spill, codegen or real runtime cost | Not closed |
| Main result/statistics | Exact 30 vs 32/34 at `B=15`; 1/400 witness instances | Anchors use broad benchmark suites | No prevalence/statistical/generalization evidence | Preliminary only |
| Ablation/mechanism evidence | Representative choice removes one recomputation | Anchors include method component evaluation | Only one controlled witness | Narrow |
| Scale/generalization | 5–8 e-classes, 400 controlled trials | FastOpt/e-boost/SmoothE scale much further | Orders-of-magnitude scale gap | Major gap |
| Failure boundary | 399/400 no witness; public projection no alternatives | Comparable papers report applicability limits | Structural predictors not learned | Partial |
| Artifact/reproducibility | Standard-library oracle, locked JSON, two exact replays, hashes | Anchor artifacts/implementations | No independent external artifact replay | Strong for probe, incomplete for paper |

## Reviewer-shape assessment

- Editor/venue-fit view: The joint-object story remains potentially suitable for PL/compilers venues only if a real compiler corpus shows nontrivial alternatives and natural allocation costs.
- Methodology view: Exact controls and deterministic replay are strong; randomly declared equivalence and unit-size public projection cannot support an empirical compiler claim.
- Domain-contribution view: The witness isolates an actual representative/schedule coupling, but no parameterized algorithm or backend integration exists.
- Devil's-advocate view: A reviewer can currently dismiss the result as a rare synthetic pebbling instance until natural incidence and full-cost end-to-end effects are shown.

## Decision

- Quality tier: `TIER_A_Q1_POTENTIAL` structural ceiling retained.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`.
- Closed gaps: exact formal object, two strong sequential controls, small exact oracle, one mechanism-specific witness, deterministic reproduction.
- Executable next gaps: import natural e-graphs with multiple alternatives; derive backend-valid output sizes/costs; reproduce FastOpt/Julia/e-boost-compatible extraction; test structural predictors and full-cost frontier.
- Human/resource-dependent gaps: authoritative backend allocation convention review and publication-level novelty judgment.
- Bounded near-Q1 gaps: none yet; current gaps are core, so `NEAR_Q1_PLAUSIBLE_WITH_BOUNDED_GAP` is not justified.
- Gap that would invalidate the paper: all natural same-object joint points are sequentially dominated after backend-valid cost accounting, or a current source already solves the same object.
- Why this is calibration rather than novelty or baseline evidence: the anchors define contribution/evaluation scale; they do not establish the candidate's novelty or serve as executed same-object baselines here.

