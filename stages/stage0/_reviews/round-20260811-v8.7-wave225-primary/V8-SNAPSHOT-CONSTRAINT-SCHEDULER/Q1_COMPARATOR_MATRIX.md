# V8-SNAPSHOT-CONSTRAINT-SCHEDULER Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: software systems / managed runtimes / VM implementation
- Calibration status: `PARITY_NOT_PLAUSIBLE` for Q1; Q2 is conditional on the atomic static revision
- Quality tier: `TIER_B_Q2_VIABLE` conditional
- Search/cutoff date: `2026-08-11`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | Basso et al., “Heap-Snapshot Matching and Ordering using CAHPs” | PACMPL OOPSLA2, published | top PL venue / Q1-equivalent | 2025, author preprint + artifact statement | problem, algorithm, ordering, evaluation, limitations, related work | Closest current paper-level heap-snapshot ordering contribution and strongest broad-claim subtractor |
| EVALUATION_ANCHOR | Basso et al., “Improving Native-Image Startup Performance” | CGO, published | top code-generation venue | 2025, author paper/slides and DOI | objective, end-to-end pipeline, ordering property, startup/page-fault results, artifact route | Calibrates full startup/layout evaluation and profile-guided baseline strength |
| DOMAIN_NEIGHBOR | Shuf et al., “Creating and Preserving Locality of Java Applications at Allocation and Garbage Collection Times” | OOPSLA, published | top PL venue | 2002, DOI/official metadata | abstract/contribution boundary | Long genealogy anchor for heap-object locality; not same snapshot object |
| BOUNDARY_OR_NEGATIVE_ANCHOR | Current V8 snapshot serializer/docs | official upstream source/docs | authoritative implementation boundary | pinned commit and current docs, checked 2026-08-11 | serializer/deferred/forward-ref/hot-list/partitions/compression/flags | Establishes same-object action grammar and complete native baseline, not paper novelty |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | V8 startup snapshot size/locality under stock reader | CAHPs/CGO show snapshot object order materially affects page faults/startup | Candidate is narrower and V8-internal | Q2 plausible, Q1 breadth not established |
| Contribution type | Target-specific constrained N2 scheduler | CAHPs supplies matching + profile-guided ordering; CGO supplies profile-guided heap/code ordering | Candidate state/guarantee not yet defined | Atomic revision required |
| Nearest-prior delta | Static-only V8 native-bytecode action under pending/hot/backref constraints | Prior work uses GraalVM Native Image, profile input and complete object reordering | Broad ordering/locality novelty is occupied | Claims must be V8-specific |
| Algorithm/mechanism substance | Intended exact/FPT/certified Pareto scheduler | CAHPs has CAHP trie matching and explicit ordering integration | Current proposal is only bounded scoring prose | Hard Q2 gap, revisable statically |
| Baseline strength/fairness | Complete V8 union + same-information local policies + tiny oracle | CGO/CAHPs compare complete Native Image pipelines and related work | Needs exact action mapping | Finite route |
| Natural workload/platform | 20–50 official V8/Node carriers | CAHPs uses FaaS/framework workloads | No candidate carrier results yet | Readiness gap only |
| Full-cost coverage | build/scheduler/RSS/temp/raw+compressed/startup/RSS/locality/fallback | CAHPs reports page faults/startup and artifact; CGO measures full AOT path | Candidate ledger not measured | Stage A/B evidence gap |
| Main result/statistics | None at Stage 0 | Published papers report multi-workload speedup/page-fault statistics | Large evidence gap | Does not alone stop Stage 0 |
| Ablation/mechanism evidence | Planned state/feature degenerations and tiny exact oracle | CAHPs includes matching/ordering analyses | Not yet executable | Stage A route |
| Scale/generalization | Multiple snapshots and choice-density strata planned | CAHPs spans FaaS/frameworks | V8 carrier breadth unknown | Q2 conditional |
| Failure boundary | No-choice graphs, illegal deferral, union dominance, compression nonadditivity | CAHPs states matching/profile limitations | Candidate boundaries are pre-registered | Strong design point |
| Artifact/reproducibility | Open V8 and pinned scripts/carriers planned | CAHPs publishes a Docker artifact and pre-collected data | No candidate artifact | Readiness gap |

## Reviewer-shape assessment

- Editor/venue-fit view: a narrow but complete V8-format algorithm plus convincing natural evaluation can fit a credible Q2 systems/VM venue. It does not yet match the breadth or mature evidence of OOPSLA/CGO anchors.
- Methodology view: same-object and full-cost contracts are unusually crisp, but zlib size must remain a measured objective unless compressor state is modeled. The candidate cannot call an arbitrary score or generic solver a new algorithm.
- Domain-contribution view: the native pending-forward-reference/hot-list/allocation-stream coupling is a plausible target-specific residual. Its formal state/guarantee is presently missing.
- Devil's-advocate view: CAHPs and CGO already establish heap-snapshot ordering for startup; without the atomic certificate, this is merely a V8 emitter patch using familiar locality heuristics.

## Decision

- Quality tier: conditional `TIER_B_Q2_VIABLE`
- Status: `PARITY_NOT_PLAUSIBLE` for Q1
- Closed gaps: exact object, stock-reader contract, current native union, natural/full-cost route, recent broad collision boundary.
- Executable next gaps: one static target-specific state/guarantee/action-divergence certificate; then native fidelity and natural evaluation.
- Human/resource-dependent gaps: none decisive.
- Bounded near-Q1 gaps: not applicable at current maturity.
- Gap that would invalidate the paper: inability to distinguish the scheduler from generic/list scheduling or current/single-score actions under the fixed V8 grammar.
- Why this is calibration rather than novelty/baseline evidence: anchors define expected paper substance and evaluation breadth; the separate source audit establishes current actions and collision boundaries.
- Why Tier B remains conditionally possible: all hard scientific contracts have finite closure routes, and no same-object direct fatal was found; however the N2 mechanism itself must be statically made nontrivial before PASS.

