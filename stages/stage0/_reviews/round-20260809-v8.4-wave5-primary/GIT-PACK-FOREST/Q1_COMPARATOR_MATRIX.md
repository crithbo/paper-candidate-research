# GIT-PACK-FOREST Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: storage systems / software engineering / data-management systems
- Calibration status: independent PRIMARY, conditional paper-shape calibration
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: `2026-08-09`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Zacchiroli et al., *On the Compressibility of Large-scale Source Code Datasets* | Journal of Systems and Software, final article | established archival software-systems journal; used as same-level journal shape, not as a ranking claim | 2025, author final PDF/DOI 10.1016/j.jss.2025.112429 | abstract, Git/PPC/MinHash method and Git-configuration evaluation sections | closest source-code collection compression genealogy and Git calibration |
| EVALUATION_ANCHOR | Zhang et al., *Finesse* | FAST'19, official USENIX proceedings | top storage-systems conference equivalent | 2019, official USENIX page/paper | abstract, mechanism and evaluation summary | demonstrates expected mechanism isolation, real workloads and throughput/compression tradeoff |
| DOMAIN_NEIGHBOR | Zhang et al., *LoopDelta* | USENIX ATC'23, official proceedings | top systems conference equivalent | 2023, official USENIX page/paper | abstract, four mechanisms, end-to-end evaluation summary | shows locality/reconstruction costs must be treated jointly in delta-compression systems |
| BOUNDARY_OR_NEGATIVE_ANCHOR | current Git `pack-objects` documentation/source | upstream software, not a paper | deployment boundary only | Git 2.55 docs/current upstream, checked 2026-08-09 | options, path-walk, delta search/depth/write-order source | establishes the strong current action set and subtracts weak Git heuristics claims |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | ubiquitous Git storage/build/access tradeoff | JSS addresses large source datasets; FAST/ATC establish storage reduction importance | narrower one-pack scope | credible Q2 readership |
| Contribution type | Git-native constrained delta-forest and layout constructor | Finesse/LoopDelta present explicit new search/locality mechanisms | candidate mechanism not implemented | conditional N2 |
| Nearest-prior delta | global bounded-depth forest/layout outside current Git union | Git has local/path-walk window search and family-aware order; JSS has generic graphs | residual must be measured and kept narrow | open, falsifiable |
| Algorithm/mechanism substance | capped graph + global constrained forest + legal order | anchors contain identifiable algorithms/data structures | risk of collapsing to generic graph or tuning | decisive Stage-A gate |
| Baseline strength/fairness | finite current Git 2.55 union with equal semantics/budgets | JSS compares Git configurations; FAST/ATC compare strong systems | exact finite configurations not yet preregistered | executable gap |
| Natural workload/platform | 20 pinned public repositories | JSS popular repos; FAST/ATC real workloads | corpus not yet frozen | readiness gap only |
| Full-cost coverage | pack+idx, CPU, RSS, graph/solver, verify, access/fallback | Finesse and LoopDelta report throughput plus reduction/restoration | no ledger yet | executable gap |
| Main result/statistics | paired p50/p90 Pareto plus per-repo failures | anchors report multi-workload ratios/throughput | no result | cannot claim parity yet |
| Ablation/mechanism evidence | graph/forest/locality/order and exact-small gap | anchors isolate mechanism components | not run | executable gap |
| Scale/generalization | diverse repository sizes/history structure | JSS spans large source collections | one-pack scope limits breadth | Tier-B ceiling unless stronger generality emerges |
| Failure boundary | low residual edges, validation failure, no full-cost Pareto | strong systems papers report tradeoffs/limitations | preregistered but unobserved | structurally sound |
| Artifact/reproducibility | public Git, repos, CPU harness, manifests/hashes | official/open sources available | candidate artifact absent | finite route |

## Reviewer-shape assessment

- Editor/venue-fit view: a verified Git-compatible algorithm with natural full-cost gains is publishable, but the current hypothesis is narrower than a typical top storage paper and should be framed as a focused algorithm/software paper.
- Methodology view: equality, strict validation, finite same-object baselines and charged graph/solver costs create an unusually clean evaluation contract. The residual-action certificate is mandatory.
- Domain-contribution view: `--path-walk` and the current source remove naive path grouping from novelty. The surviving contribution must be genuinely global and Git-format constrained.
- Devil's-advocate view: useful cross-window edges may be rare; a sufficiently large legal Git window or path-walk may absorb benefits; reconstruction/locality or optimization cost may dominate. The planned killer can decisively expose all three cases.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: exact object and output guarantee; finite strong baseline family; non-trivial conditional N2 definition; natural public workload route; full-cost schema; decisive falsifier.
- Executable next gaps: pin current Git commit and 20 repository manifests; trace baseline actions; establish residual-edge prevalence; implement one mechanism; generate full-cost paired results and small exact ceilings.
- Human/resource-dependent gaps: maintainer audit of pack-mode semantic parity and final venue positioning; neither currently blocks the CPU route.
- Bounded near-Q1 gaps: a generally useful approximation/bound for depth/locality-constrained forest selection, wider natural coverage, strong artifact and mechanism analysis could raise the shape; these are not assumed.
- Gap that would invalidate the paper: current Git's finite fair union covers the useful residual, or all candidate points are dominated after full costs.
- Why this is calibration rather than novelty or baseline evidence: these anchors calibrate contribution/evaluation breadth; only the separate primary-source collision audit supports the novelty boundary.
- Why Tier B, if applicable, still closes same-object, latest-collision, fair-baseline, natural-evidence, full-cost and reproducibility gates: each is precisely defined with a finite public acquisition route; Stage 0 does not represent the evidence as already obtained.

