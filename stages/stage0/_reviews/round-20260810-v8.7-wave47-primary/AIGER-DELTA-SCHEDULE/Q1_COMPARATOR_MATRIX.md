# AIGER-DELTA-SCHEDULE Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: logic synthesis / EDA / formal methods
- Calibration status: `PARITY_CONDITIONAL`
- Quality tier: `TIER_B_Q2_VIABLE`
- Search/cutoff date: 2026-08-10

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Kabiljo et al., “Compressing Graphs and Indexes with Recursive Graph Bisection” | KDD 2016, peer reviewed | top-tier data-mining conference equivalent | 2016, official KDD paper | objective, algorithm, evaluation | Shows the expected theory/algorithm/natural-scale shape for compression-friendly ordering, but not AIGER precedence or its exact object. |
| EVALUATION_ANCHOR | Gagrani et al., “Neural Topological Ordering for Computation Graphs” | NeurIPS 2022, peer reviewed | top-tier ML conference equivalent | 2022, official proceedings | problem, method, baselines, evaluation | Calibrates a topological-order optimization paper; its objective is peak memory, not AIGER bytes. |
| DOMAIN_NEIGHBOR | Mishchenko, Chatterjee, Brayton, “DAG-aware AIG rewriting: a fresh look at combinational logic synthesis” | DAC 2006, peer reviewed | top-tier EDA conference equivalent | 2006, DOI/original paper | contribution and domain evidence | Calibrates domain substance and natural AIG evaluation; it changes the graph and is not same-object competition. |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Biere, “The AIGER And-Inverter Graph (AIG) Format” | official technical report/specification | authoritative format boundary, not a Q1 comparator | 2007, JKU/FMV report | binary contract and encoding | Defines the exact reader/writer legality and delta-byte objective boundary. |

Current journal quartile labels were not used to inflate calibration; the first three are treated as established top-tier conference equivalents in their communities.

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | Standard proof/model-checking circuit artifact size and I/O | Anchors address graph compression, scheduling, and AIG optimization | narrower readership | Tier B credible; Q1 requires broader downstream relevance |
| Contribution type | N2 format-constrained topological labeling algorithm | KDD/NeurIPS pair objective with a substantive ordering method | theory not yet closed | conditional |
| Nearest-prior delta | fixed AIG + standard binary reader + ULEB128 delta objective | no anchor combines all facets | bounded-search uncertainty remains | Stage0 search closed; confirmation required |
| Algorithm/mechanism substance | bounded-frontier exact DP plus deterministic scalable method/bound | recursive bisection and learned topological ordering show expected substance | concrete recurrence/guarantee pending | Stage A risk |
| Baseline strength/fairness | AIGER/Yosys/ABC full same-object union; stable/greedy/bisection; exact ceiling | anchors use native and algorithmic controls | must implement full union | finite closure |
| Natural workload/platform | HWMCC AIGER families, CPU-only | domain anchors use natural graphs/circuits | no measured headroom | readiness gap only |
| Full-cost coverage | whole-file bytes, planner/writer/reader CPU, RSS, verification, fallback | KDD/DAC include system-scale evaluation | currently design only | Stage A closure |
| Main result/statistics | none claimed | anchors report broad quantitative effects | largest gap | cannot claim superiority yet |
| Ablation/mechanism evidence | threshold strata, width/frontier, schedule-family ablations planned | anchors dissect algorithms/objectives | not executed | finite plan |
| Scale/generalization | 20–50 family-stratified HWMCC instances proposed | anchors span graphs/workloads | natural coverage not yet shown | readiness gap |
| Failure boundary | chain-like and threshold-inert AIGs predicted null | strong papers identify regime limits | empirical boundary unmeasured | explicitly pre-registered |
| Artifact/reproducibility | pinned commits, manifests, emitted files and check ledgers planned | anchors provide formal/experimental artifacts to varying degrees | candidate artifact absent | not fatal at Stage0 |

## Reviewer-shape assessment

- Editor/venue-fit view: a clean algorithm-plus-format paper is plausible at Q2-equivalent level if it combines a formal result with stable natural effects; byte savings alone on a few circuits is too narrow.
- Methodology view: the static witness validates the decision object. The exact-object checker and full native union must precede the first claim-bearing run.
- Domain-contribution view: preserving standard AIGER and a fixed AIG is valuable, but contribution substance must reside in the scheduler/guarantee rather than serializer code.
- Devil's-advocate view: canonical DFS/isomorphic orders plus simple byte-aware greedies may capture nearly all natural headroom. The Stage A killer is designed to expose that cheaply.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE`
- Status: `PARITY_CONDITIONAL`
- Closed gaps: exact format object, legal action divergence, finite current writer action catalog, and bounded no-direct-fatal search.
- Executable next gaps: recurrence/complexity proof, native fidelity harness, natural freedom/headroom, and full-cost comparison.
- Human/resource-dependent gaps: none decisive; final theorem and venue review may benefit from human input.
- Bounded near-Q1 gaps: a strong hardness/FPT/approximation result and broad family-general natural effects could lift the shape.
- Gap that would invalidate the paper: structural absorption by current same-object action surface, or no independent algorithm/formal contribution after fair baselines.
- Why this is calibration rather than novelty or baseline evidence: the anchors set expected paper shape; source audit and current code establish novelty/baselines separately.
- Why Tier B still closes the gates: the object and fair union are finite, public HWMCC supplies natural inputs, full cost and reproducibility are pre-registered, and Stage A has explicit falsifiers. The main result remains unclaimed.
