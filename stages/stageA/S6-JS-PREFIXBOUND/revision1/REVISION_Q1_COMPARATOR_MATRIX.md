# S6-JS-PREFIXBOUND Revision Q1/Q2 Paper Calibration

- Stage: `STAGEA_REVISION1`
- Candidate venue family: `SIGMOD/PACMMOD`, `VLDB/PVLDB`, `ICDE`; `PODS` only if theorem depth becomes sufficient
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_A_Q1_POTENTIAL`（conditional）
- Source verification/cutoff inherited from independent gate: 2026-08-09

## Reference set

| Role | Paper | Venue/status | Read/verification scope | Relevance |
|---|---|---|---|---|
| SAME_OBJECT_ANCHOR | Li, He, Yu, “Join optimization revisited,” DOI `10.1007/s00778-025-00906-y` | VLDB Journal 34:31 | Independent gate verified object, Ω-condition, cost model, algorithms/evaluation | Mandatory DPomega same-object subtractor; executable fidelity still missing |
| SEARCH_EVALUATION_ANCHOR | Haffner, Dittrich, “Efficiently Computing Join Orders with Heuristic Search,” DOI `10.1145/3588927` | PACMMOD/SIGMOD 2023 | Gate verified ACM record and reproducibility report | Strong exact-search/evaluation shape; plain join, not same object |
| ALGORITHM_STRENGTH_ANCHOR | Stoian, Kipf, “DPconv,” DOI `10.1145/3698809` | PACMMOD/SIGMOD 2024 | Gate verified paper/metadata and supported cost-function scope | Plain-join algorithmic bar; not an order-property quotient |
| CURRENT_THEORY_NEIGHBOR | Luo et al., “Algorithms for Optimizing Acyclic Queries,” DOI `10.4230/LIPIcs.ICDT.2026.17` | ICDT 2026 | Gate verified official Dagstuhl scope | Different Yannakakis/acyclic object; methodological neighbor |
| HISTORICAL_ORDER_PROPERTY_SUBTRACTOR | Simmen, Shekita, Malkemus, “Fundamental Techniques for Order Optimization,” DOI `10.1145/233269.233320` | SIGMOD 1996 | Independently added and bibliographically verified by gate | Generic order-property optimization is prior art; candidate delta must be DPomega-specific |

No new novelty search was conducted in this bounded revision. This matrix is calibration, not novelty closure or an executable baseline substitution.

## Comparator matrix

| Dimension | Revision evidence | Anchor bar | Remaining gap | Disposition |
|---|---|---|---|---|
| Problem importance/readership | Exact JS optimizer state/memory on DPomega object | DPomega establishes importance | None structurally | Comparable topic |
| Contribution type | N2 future-demand quotient plus compact exact-equivalence representation and candidate bound | Anchors provide full algorithms, theory and broad evaluation | Current residual is only 2.87% canonical persistent payload | Conditional |
| Nearest-prior delta | DPomega-specific future-demand cost equivalence; generic order equivalence explicitly subtracted | DPomega + Simmen set high prior-art bar | Need theorem and nontrivial compact characterization beyond interning | Core open gap |
| Algorithm/mechanism substance | Exact/full/compact DPs, exhaustive finite counterexample and bound audit | Q1 anchors give scalable algorithms/complexity | Compact representation still performs full-vector equality construction on first use | Below parity |
| Same-object baseline | Exact order-state control executed; identical optimum | DPomega executable is mandatory | No algorithm-level DPomega executable fidelity | Stage B core gap |
| Contract fidelity | Frozen NDV formulas now exactly implemented | Reproducible studies require preregistration fidelity | Closed for finite Stage A scope | Closed locally |
| Full-cost coverage | Separate exact/full/compact/signature/bound time, peak, work and retained bytes | Anchors report optimizer/system time and memory | Logical work is unweighted; no process-RAM or scalable end-to-end win | Major gap |
| Main result | 0 mismatches/overestimates; compact +601,569 B payload residual | Q1 requires meaningful general result | No speed/work win; memory residual small and finite | Preliminary only |
| Natural workload | JOB 4a real graph/equality structure, proxy costs | DPomega uses JOB/TPC-DS/SYN-S with real statistics | No natural cost/cardinality/performance result | Core gap |
| Scale/generalization | Exhaustive n=3–4 plus one n=5 natural graph | Anchors use broader workloads and larger queries | No topology/scale law or unbounded theorem | Core gap |
| Bound utility | Admissibility not falsified in 404,479 states | Search papers require cheap, useful pruning | Exact completion oracle dominates work; bound not used for pruning | Negative readiness finding |
| Failure boundary | Full-vector absorbed; compact work/time negative | Strong papers expose no-gain regions | Need conditions predicting memory benefit and avoiding construction overhead | Honest but unresolved |
| Reproducibility | Dual full replay, all nonvolatile fields exact | Strong artifact expectation | Independent external reproduction absent | Strong Stage A artifact |

## Reviewer-shape assessment

- Editor/venue-fit: exact JS optimization remains venue-relevant, but a 2.87% canonical payload residual without speed/work gain is not yet a paper result.
- Methodology: the atomic contract/cost defect is closed; definitions of logical work and retained payload are explicit and replay-stable.
- Domain contribution: the safe equivalence survives finite attack, but class-id interning may be viewed as an implementation representation unless an unbounded compact characterization is derived.
- Devil's advocate: full-vector is decisively uneconomic here; compact only shifts the residual to persistent bytes while construction and bound work remain dominant.

## Decision

- Quality tier: `TIER_A_Q1_POTENTIAL` conditional on a nontrivial theorem/algorithm and natural same-object evidence.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`.
- Closed gaps: frozen NDV fidelity, exact/full/compact comparative accounting, complete signature operation ledger, bound-oracle ledger, dual replay, bounded same-object persistent payload non-vacuity.
- Executable next gaps: compact characterization without full-vector construction, cheap useful bound, DPomega fidelity control, natural JOB/TPC-DS/SYN-S state/time/RAM, topology and no-gain ablations.
- Human/independent gaps: proof review, DPomega fidelity review, final novelty closure.
- Gap that invalidates the paper: no scalable retained/process-memory residual after full implementation, any theorem counterexample, any direct-fatal collision, or absorption by a fair DPomega/order-property control.
- Why not STOP now: the predeclared compact pivot left a positive deterministic retained-payload residual with identical optimum and exact-equivalence classes; the specific atomic STOP trigger did not fire.
- Why not claim paper parity: work and wall time remain negative, the bound is an exact oracle, and natural performance/theory are absent.

