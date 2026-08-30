# UST-SEGMENTED-FORMAT-COVER — Reuse-Aware Segmented Sparse-Format Covers for UST SpMM

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O3`
- Domain tags: sparse linear algebra, GPU systems, sparse compiler/runtime, data representation
- Contribution route: `N2` with a testable `N3` structural hypothesis
- Discovery date: `2026-08-10`
- Discovery method revision: accepted `v2/v8.1 + v8.6 + v8.7`; Wave34 algorithmic-residual correction

## Research question

For repeated same-matrix SpMM, can a bounded, same-information joint construction of contiguous row segments, per-segment UST formats, and reuse-aware execution plan improve full-cost performance over every fair **single-format whole-tensor** UST/canonical sparse baseline while preserving the same matrix product and numerical contract?

## Paper genealogy

- Anchor: NVIDIA's [UST documentation](https://docs.nvidia.com/cuda/nvmath-python/1.0.0/host-apis/sparse/index.html) (2026 current API): a runtime tensor-format DSL with library/codegen dispatch.
- Key predecessors: Kjolstad et al., [TACO](https://dl.acm.org/doi/10.1145/3133901) (format abstraction/code generation); Gao et al., [OpSparse](https://arxiv.org/abs/2206.07244) (GPU sparse GEMM implementation family).
- Competing current mechanism: NVIDIA [UST ecosystem description](https://developer.nvidia.com/blog/establishing-a-scalable-sparse-ecosystem-with-the-universal-sparse-tensor/) and [UST `Matmul`](https://docs.nvidia.com/cuda/nvmath-python/1.0.0/host-apis/sparse/generated/nvmath.sparse.Matmul-class.html) plan/execute API.
- Counter-evidence: UST's dynamic format inspection, named formats and codegen may make one global format sufficient; frequent reuse may not occur, or conversion/launch overhead may dominate.
- Natural carrier: [SuiteSparse Matrix Collection](https://sparse.tamu.edu/) matrices, frozen at Stage A by collection ID/checksum; choose 20–50 published matrices rather than generate structured matrices.
- Search boundary: primary UST docs/source-facing API, TACO, and OpSparse were reviewed through 2026-08-10. No global novelty claim is made; Stage 0 must search same-object segmented/hybrid sparse-format constructions.

## Topic-origin card

- Trigger: UST represents a tensor with one `TensorFormat`, yet natural sparse matrices may combine localized row regularities that no one global format captures.
- Measurable structural hypothesis: row-wise nnz, span, diagonal/run and block-density signatures have stable, contiguous heterogeneous regions in public matrices; this is a Stage A preclaim to test, not a measured result.
- Baseline limitation: current format inspection selects/dispatches a format for a UST tensor; it does not, in the documented public object, construct a costed heterogeneous row-interval cover.
- Decision variables: `K`, interval boundaries, format per interval, representation-directory layout, and cold/warm reuse gate.
- Candidate venue family: ACM TACO / JPDC / parallel and distributed systems venues. This is Tier B until broad cross-platform evidence or a stronger guarantee is shown.

## Exact object and named fair baselines

- Exact object: fixed sparse `A∈R^(m×k)`, dense `B_r∈R^(k×n)` for `r=1…R`, and output `C_r=A×B_r`; no altered sparsity or approximation.
- Same-function/quality contract: retain `A` coordinates and values; each row of `C_r` is produced once by its assigned segment. Stage A freezes deterministic data type/order rules and verifies against the baseline product at the corresponding numerical tolerance (or bitwise for an integer/safe witness).
- Deployment/default baseline: UST one-`Tensor` paths with all compatible single global formats, dynamic format inspection, library/codegen dispatch, conversion and `Matmul.plan/execute`.
- Strong simple baseline: whole-matrix CSR; plus each compatible global named UST format (e.g., CSR/CSC/DIA/BSR/delta) under same memory budget.
- Offline ceiling: same cost model but exhaustive bounded partitions/formats, charged identically; not a deployable baseline.

## Mechanism hypothesis and competing mechanisms

- Mechanism A — structural cover: a dynamic program chooses at most `K` contiguous row intervals and a native format per interval from an admissible set. It only admits a segment if its local structural summary and memory feasibility pass a predeclared test.
- Mechanism B — amortization gate: independently calculate conversion, directory, plan/setup and launch costs, then permit the cover only if its frozen reuse-aware full-cost objective beats the best global format at declared `R`.
- Preferred mechanism: both are required. A format chooser without a joint cover is selector-like; a cover without the amortization gate hides the principal cost.
- Mechanism signature: benefits should track mixed **contiguous** structure and reuse; homogeneous matrices, `R=1`, high boundary count or dominant global format are predicted no-gain regions.

## Seed-distance and algorithmic admissibility

- Relative to UST: change the decision variable from one tensor's format/path to a constrained representation-and-execution **cover** over a fixed tensor, with explicit reuse and boundary cost.
- Relative to TACO/OpSparse family: optimize an explicit bounded heterogeneous cover under full-cost/reuse constraints rather than lower one selected format/kernel.
- Method-name deletion test: “partition a fixed sparse matrix into a few row intervals; assign each interval a physical representation; prove the plan feasible and select it only after conversion, metadata, setup and execution are charged” remains a defined optimization problem without UST names.
- Why not routine tuning: boundaries and per-segment representations alter the data structure and executable decomposition; the algorithm has a finite constrained optimization problem and an estimator guarantee, not a grid of launch knobs.

## Nearest-prior facet matrix

| Facet | Candidate | Current UST / closest prior | Residual |
|---|---|---|---|
| Research problem | full-cost repeated SpMM on a fixed sparse matrix | flexible sparse representation and dispatch | same object, different joint decision problem |
| Exact object | one `A`, same `B_r`, same `C_r` | one UST tensor / SpMM | preserved |
| Decision variables | boundaries + per-segment formats + reuse gate | one `TensorFormat`, dispatch/path | complete cover is additional |
| Information | static structure, declared `R`, shape/dtype/budget; no timing oracle | runtime format inspection / planning | candidate uses no extra runtime timing information |
| Core mechanism | bounded DP + amortized admission | format polymorphism and library/codegen dispatch | non-synonymous construction |
| Guarantee | representation feasibility and exact/approximate optimization of frozen additive estimator | API execution semantics | performance claim remains empirical |
| Evidence object | 20–50 natural SuiteSparse matrices | official UST examples/docs | natural corpus, not synthetic patterns |

## Current collision classification

- `DIRECT_FATAL`: none established. A current native segmented mixed-format constructor or same-object prior construction is an explicit Stage 0 subtractor.
- `DIRECT_SUBTRACT`: UST's format DSL, named formats, format inspection, `convert`, dispatch/codegen and matmul planning remove every mere format-selection claim.
- `METHODOLOGICAL_ADJACENT`: TACO/OpSparse sparse-format/codegen work.
- `DEPLOYMENT_BASELINE`: the complete one-format UST union listed above.
- `SEARCH_BOUNDED_OPEN`: no affirmative direct same-object cover was located inside this bounded primary-source search; this is not a novelty conclusion.

## Current upstream reality check

- Checked current upstream facet/date: nvmath-python `1.0.0` documentation and current NVIDIA developer material, checked 2026-08-10.
- Official documentation / source-facing symbols: `nvmath.sparse.ust.Tensor(..., tensor_format=...)`, `Tensor.from_package`, `Tensor.from_file`, `Tensor.convert`, `TensorFormat`, and `nvmath.sparse.Matmul.plan/execute`.
- Default/non-default surface checked: all documented DSL level formats and properties, named formats, dynamic parsing, library/codegen dispatch, conversion, and plan/execute. No unsupported flag is assumed absent.
- Supporting evidence: the public API describes a `Tensor` as bound to a `TensorFormat`; the grammar describes one tensor-format mapping dimensions to storage levels.
- Contrary evidence: runtime flexibility, dynamic inspection and format-polymorphic dispatch are real. They absorb any “choose a format/path” story but do not by themselves demonstrate equivalent construction of a jointly optimized collection of heterogeneous row fragments.
- Required verification: Stage A must pin the package/source revision and inspect implementation symbols plus all experimental APIs. If they express the complete segment-cover action with same information/full cost, this proposal is `DIRECT_FATAL` or must be reduced.

## Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Complete atomic action: construct `≤K` contiguous row fragments of `A`, encode each as a legal UST tensor in `f_j`, create a row-offset directory, plan and execute each fragment with every `B_r`, and write its disjoint rows into the native `C_r` layout.
- Real comparator/native semantics: pin UST version, use its conversion and `Matmul.plan/execute`; compare against complete global UST paths and whole-matrix CSR under the same dtype, memory budget and output semantics.
- Common denominator/full cost: input ingestion/conversion, UST metadata/directory, temporary memory, planning, compilation/setup, launches, output placement, warm execution, and all reuse count `R`; report cold and warm separately.
- Small witness: a three-row sparse matrix containing one diagonal-like interval and one irregular interval, with an integer or order-safe product; check fragment coordinate preservation and exact output assembly before corpus runs.
- Finite closure steps: (1) pin/inspect API; (2) construct/verify witness; (3) freeze collection IDs and 20–50 natural matrices; (4) enumerate legal `K≤4` and admissible formats; (5) run same-object comparator matrix under fixed memory budget.
- Structural failure: native UST already provides equivalent heterogeneous cover; output/reuse semantics cannot be faithfully assembled; or only a synthetic proxy permits the proposal.

## 72-hour first evidence and decisive falsifier

Within 72 hours of authorized Stage A, first pin current source/API and try the witness. Then use 20 natural matrices and declared `R∈{1,8}`. Drop the claim if any of the following occurs: (a) the native API/source directly expresses the whole cover; (b) no legal faithful witness can preserve the frozen output contract; (c) the charged cover never wins the frozen estimator over the best global-format baseline on any predeclared natural structural stratum; or (d) its gains appear only after omitting conversion/setup/directory/launch costs. These are preclaim falsifiers, not existing negative results.

## Q1/Q2 sufficiency and boundaries

- Structural paper potential: `TIER_B_Q2_VIABLE` if Stage A establishes a reproducible natural heterogeneity regime, valid full-cost wins and a clear no-gain map; this is a complete representation-plus-algorithm contribution. It can approach Tier A only with a formal estimator approximation/feasibility result, broad matrices/platforms and a convincing mechanism analysis.
- Current evidence readiness: `FINITE_FIDELITY_GAP`; the natural corpus and public APIs are available in principle, but neither candidate implementation nor results are claimed.
- AI critical path: `AI_CORE_CONDITIONAL`. AI can build parser/cover/ledger and verifier scaffolding; GPU environment and numerical semantics need human-supervised validation.
- Researcher boundary: Stage 0 must independently conduct full collision review; Stage A must perform the preclaim contract gate before claim-bearing measurement.

## Non-relaxable quality audit

- Same-object: fixed SpMM and output contract; no format-specific task substitution.
- Latest collision: current 2026 UST API checked; a named current-source direct subtractor is retained.
- Strong fair baseline: all compatible global UST formats/dispatch/codegen paths, not one CSR strawman.
- Natural input: public SuiteSparse matrices only for positive evidence; synthetic witness is legality-only.
- Full-cost: conversion, metadata, plans, launches, temporary/output memory and reuse are mandatory.
- Reproducibility: pin corpus IDs/checksums, package/source revision, format set, K, budget, dtype and measurement scripts.
- Evidence honesty: no performance, novelty, or stable-structure result is claimed at Discovery.

## Dual-axis score

- Academic value: `48/70`
- AI executability bonus: `13/30`
- Total: `61/100`
