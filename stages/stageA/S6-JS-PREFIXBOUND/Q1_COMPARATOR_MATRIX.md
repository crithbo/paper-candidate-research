# S6-JS-PREFIXBOUND Q1/Q2 Paper Calibration

- Stage: `STAGEA`
- Candidate venue family: `SIGMOD/PACMMOD`, `VLDB/PVLDB`, `ICDE`; `PODS` only if theorem depth becomes sufficient
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_A_Q1_POTENTIAL`
- Search/cutoff date: 2026-08-09

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | [Li, He, Yu, “Join optimization revisited”](https://doi.org/10.1007/s00778-025-00906-y) | The VLDB Journal 34, article 31 | Project-designated Q1/equivalent database anchor | 2025; open article, sections 2–6 | Object, Eq. 4–6, Ω-condition, Theorems 1–2, algorithms/evaluation | Mandatory exact same-object baseline and evaluation shape |
| EVALUATION_ANCHOR | [Haffner, Dittrich, “Efficiently Computing Join Orders with Heuristic Search”](https://doi.org/10.1145/3588927) | PACMMOD/SIGMOD | Top database venue equivalent | 2023; abstract, artifact/reproducibility metadata | Shortest-path/A* claim, exact plan search, star/clique evaluation | Defines strong plain-join search methodology; not a same-object baseline |
| DOMAIN_NEIGHBOR | [Stoian, Kipf, “DPconv: Super-Polynomially Faster Join Ordering”](https://doi.org/10.1145/3698809) | PACMMOD/SIGMOD | Top database venue equivalent | 2024; paper/abstract and algorithm framing | Plain-join subset convolution, cost-function scope, reported scale | Defines plain-join algorithmic-strength bar; direct subtract only |
| BOUNDARY_OR_NEGATIVE_ANCHOR | [Luo et al., “Algorithms for Optimizing Acyclic Queries”](https://doi.org/10.4230/LIPIcs.ICDT.2026.17) | ICDT 2026 | Top database-theory venue equivalent | 2026; official metadata, abstract, scope | Acyclic/Yannakakis join-tree enumeration and optimization object | Latest adjacent theory; different execution object and no Ω-prefix quotient |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Exact join+sort optimizer state and planning budget | DPomega establishes object and cost importance | None structurally | Comparable problem importance |
| Contribution type | N2 exact state quotient plus admissible search bound | DPomega: new exact DP; Haffner: exact heuristic search; DPconv: new exact framework | Full theorem absent | Conditional only |
| Nearest-prior delta | Future-demand-indexed prefix/cost quotient inside DPomega object | DPomega owns Ω-condition DP; plain works own A*/convolution | Need proof that fingerprint has nontrivial minimal/computable form | Residual survives finite probe |
| Algorithm/mechanism substance | Exact DP, independent quotient DP, counterexample search, max bound | Anchors provide full algorithms and complexity | No asymptotic analysis or scalable implementation | Below paper parity |
| Baseline strength/fairness | Exact order-state DP ceiling; DPomega authoritative definition | DPomega is mandatory same-object baseline | DPomega executable fidelity missing | Stage A acceptable; Stage B mandatory |
| Natural workload/platform | Pinned JOB 4a graph structure | DPomega uses JOB/TPC-DS/SYN-S and PostgreSQL 12.4 | Proxy costs only; one query | Major executable gap |
| Full-cost coverage | State/transition/signature/bound checks plus CPU/wall/RAM | Anchors report optimizer time/memory and/or end-to-end results | No candidate-vs-DPomega runtime/RAM; bound oracle intentionally expensive | Major executable gap |
| Main result/statistics | Complete finite family; deterministic exact replay | Anchors span larger queries/workloads and repeated empirical studies | No distributions, confidence intervals, or real cost profiles | Not paper-ready |
| Ablation/mechanism evidence | Naive Ω-only signature falsified 69,920 times | Anchors include search/pruning comparisons | Need prefix components and bound-strength ablations | Partial |
| Scale/generalization | Exhaustive n=3–4, two attributes; one five-relation JOB shape | DPomega n up to 10 in optimizer study; broad workloads | Severe scale gap | Executable Stage B gap |
| Failure boundary | 10,036/19,440 no-gain instances; transition reduction only 0.38% | Strong papers report no-gain/timeout regions | Need topology/cost causal model | Honest preliminary boundary |
| Artifact/reproducibility | Frozen contract, source, input hash, primary+replay JSON | Haffner has public artifact/reproducibility report | Independent external reproduction missing | Strong for Stage A |

## Reviewer-shape assessment

- Editor/venue-fit view: the exact Ω join+sort object and theorem-plus-optimizer shape fit top database venues, but the current evidence is only a Stage A risk pilot.
- Methodology view: finite scope is unusually explicit and reproducible; the candidate signature is partly a demand-cost fingerprint, so practical construction cost and non-tautological compactness are the next central risks.
- Domain-contribution view: the natural JOB structure result shows the quotient is not confined to generated graphs, but it is not natural performance evidence.
- Devil's-advocate view: 3.63% state and 0.38% transition reduction may be erased by signature/bound overhead; without a smaller representation and full theorem, the idea could collapse into expensive state relabeling.

## Decision

- Quality tier: `TIER_A_Q1_POTENTIAL`
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: executable formal state, falsifiable signature, exact ceiling, finite counterexample search, finite bound oracle, natural query-shape witness, full command/hash route.
- Executable next gaps: symbolic theorem; scalable signature construction; DPomega-compatible implementation; JOB/TPC-DS/SYN-S state/time/RAM ledger; bound-strength/overhead ablation; topology and no-gain model.
- Human/resource-dependent gaps: independent proof audit and faithful DPomega reconstruction review; later DBMS integration ownership if Stage B is approved.
- Bounded near-Q1 gaps: none claimed yet; the missing theorem and same-object natural performance evidence are core, not bounded finishing work.
- Gap that would invalidate the paper: a proof counterexample, bound overestimate, direct same-object collision, or full-cost zero/negative residual against DPomega.
- Why this is calibration rather than novelty or baseline evidence: the four papers define contribution and evidence scale only; they neither prove novelty nor replace a same-object executable comparison.
- Why Tier B, if applicable, still closes hard gates: not applicable; the retained conditional tier is Tier A, and no lowering of hard gates is proposed.

