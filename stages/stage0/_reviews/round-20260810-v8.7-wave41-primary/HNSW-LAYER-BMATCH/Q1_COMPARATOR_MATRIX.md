# Q1/Q2 Comparator Matrix — HNSW-LAYER-BMATCH

## Candidate claim ceiling

Conditional Q2 N2 only: a deterministic, same-information, connected degree-bounded per-layer HNSW edge-selection algorithm with a nontrivial property and native full-cost validation. No “first global HNSW construction,” universal ANN, or current performance claim is allowed.

| Comparator / paper shape | Exact object and action | What it already subtracts | What could remain | Fairness requirement | Effect on decision |
|---|---|---|---|---|---|
| Current hnswlib HNSW | Incremental native HNSW; local heuristic neighbor selection, reciprocal updates, pruning; `M`, `efConstruction`, insertion order/seed | Default/native construction, local diversity pruning, common parameter/action surface, serialization/search contract | Whole-layer joint connected degree-bounded selection on a common `C_l` | Same vectors, metric, layers where possible, degree cap, build budget, native search and serialization | Mandatory baseline; not direct fatal |
| Current Faiss HNSW | Incremental HNSW with current local selection/pruning and default/nondefault construction/search settings | Alternative mature native implementation; pruning/headroom and level-0 choices | Same narrow residual as above | Include legal finite setting grid; do not treat query knobs as construction innovation | Mandatory baseline; not direct fatal |
| Yang et al., FastKCNA/FastHNSW, PVLDB 2025 | Global, layer-by-layer HNSW build with preassigned layers and iterative K-CNA/alpha-style graph construction | Global/offline/layerwise HNSW construction, batch claim, broad natural-corpus shape | A distinct connected degree-bounded optimizer/guarantee on a frozen common candidate graph | Same candidate budget/information, `M`, layer assignment, build-resource envelope, native output/search | `DIRECT_SUBTRACT`; invalidates broad Discovery novelty |
| Original HNSW, TPAMI | Native hierarchical graph object and standard construction/search | Object, navigation mechanism, conventional insertion and degree controls | Different edge-selection algorithm under identical object | Preserve HNSW layers/search/entry/serialization | Domain anchor |
| Liu et al., optimized graph ANN construction | Reverse-connection enhancement, degree/connectivity reasoning, query-aware optimization | Simple claim that reciprocal connectivity or low outdegree is new | Formal joint selector beyond reverse-link enhancement | Same graph/search guarantees where compared | Methodological/direct subtractor |
| Fujiwara et al., KDD 2020 b-matching graph | High-dimensional b-matching graph construction | Plain use of degree-capped matching as graph construction | HNSW-specific candidate/layer/entry connectivity coupling and native contract | Must expose which constraints and theorem are genuinely added | Method-kernel subtractor |
| b-Suitor, SISC | Fast approximate weighted b-matching with a stated approximation | Generic scalable matching and approximation | Nonproduct HNSW connectivity/reachability action | Same weights, `C_l`, capacity and resource budget | Mandatory algorithmic control where applicable |
| Generic b-matching + deterministic component repair | Matching followed by a strongest ordinary capacity-respecting repair | Product construction, wrapper repair, trivial component linking | Only an integrated action/guarantee that this control cannot express | Repair may not use noncandidate edges or hidden capacity | Decisive structural control |
| PiPNN / ParlayANN / batch graph construction | Parallel/batch candidate and graph construction, often different ANN object | “Batch/parallel/global graph construction” as broad novelty | Native HNSW-specific connected b-matching residual | Different objects or guarantees are subtractors/negative controls, not equal baselines | Adjacent; not direct fatal on reviewed evidence |
| ANN-Benchmarks, Information Systems | Reproducible multi-dataset ANN evaluation | Benchmark/evaluation methodology | Algorithmic N2 | Matched recall, full build/query cost, pinned data and code | Evaluation-shape anchor only |

## Q1/Q2 shape calibration

| Dimension | Q1-like expectation | Credible Q2 minimum | Current status |
|---|---|---|---|
| Novelty | Broadly new graph-construction principle or strong general theorem | Distinct connected degree-bounded HNSW algorithm beyond FastHNSW and product controls | Conditional; requires revision |
| Guarantee | General approximation/complexity/structural result with wide relevance | Nontrivial legality, feasibility, approximation, or complexity property | Not yet frozen |
| Same-object fidelity | Native output/search and multi-system validation | Native hnswlib/Faiss-compatible serialization/search on fixed object | Finite plan, not yet evidenced |
| Baselines | Current native, strongest global method, generic optimizer, broad competitive systems | hnswlib, Faiss, FastHNSW, generic b-matching+repair, small oracle | Defined by this review |
| Natural evidence | Broad recurring benefit across corpora and regimes | GIST plus at least one additional genealogy corpus; matched-recall/full-cost Pareto | Future Stage A route |
| Reproducibility | Public implementation, manifests, deterministic controls, complete ledger | Pinned versions/data, common `C_l` hashes, command/results ledger | Finite route, low readiness |

## Calibration conclusion

- `TIER_A_Q1_POTENTIAL`: not currently supported.
- `TIER_B_Q2_VIABLE`: conditional on the single atomic revision.
- Current decision: `REVISE_ONCE`, confirmation required.

