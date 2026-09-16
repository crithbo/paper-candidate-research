# TORCHDYNAMO-GUARD-COVER-CACHE-REV0 Q1/Q2 Paper Calibration

- Stage: `STAGE0`
- Candidate venue family: compiler/runtime systems and performance engineering
- Calibration status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Quality tier: `TIER_B_Q2_VIABLE` only after bounded revision
- Search/cutoff date: `2026-08-30`

## Reference set

| Role | Paper | Venue/status | Quartile/equivalent basis | Year/source | Read scope | Why selected |
|---|---|---|---|---|---|---|
| CONTRIBUTION_SHAPE_ANCHOR | PyTorch 2: Faster Machine Learning Through Dynamic Python Bytecode Transformation and Graph Compilation | ASPLOS 2024 | premier architecture/systems venue / Q1-equivalent | 2024, official PDF | guarded frame cache, dynamic Python capture, evaluation and limitations | exact system/object anchor |
| EVALUATION_ANCHOR | DISC: A Dynamic Shape Compiler for Machine Learning Workloads | arXiv/system paper | contribution/evaluation anchor, not used to assert quartile | 2021, primary preprint | dynamic representation, compilation/runtime/memory motivation, end-to-end evaluation | anchors breadth and same-function dynamic-shape comparisons |
| DOMAIN_NEIGHBOR | Vortex: Efficient Sample-Free Dynamic Tensor Program Optimization via Hardware-aware Strategy Space Hierarchization | arXiv, current primary preprint | contribution-shape comparator, not used to inflate venue status | 2024, primary preprint | sample-free strategy, CPU/GPU evaluation, compile/runtime tradeoff | strongest adjacent generalized-compilation subtractor |
| BOUNDARY_OR_NEGATIVE_ANCHOR | PyTorch 2.13 source/docs, issue #166926, isolate-recompiles DevLog | current first-party implementation evidence | not a venue comparator | 2025–2026 | PGO, limits, MRU, guard filtering, cache layers, overlapping-entry correctness | defines current union and semantic boundary |

## Comparator matrix

| Dimension | Candidate | Anchor evidence | Gap | Current disposition |
|---|---|---|---|---|
| Problem importance/readership | repeated compile/guard/cache cost in dynamic PyTorch workloads | PyTorch 2, official guard and caching docs establish broad importance | candidate-specific prevalence unmeasured | important but conditional |
| Contribution type | sound online admission/compaction compiler policy | anchors contribute compiler mechanisms, not tuning grids | guard algebra/ownership not frozen | revision required |
| Nearest-prior delta | cost-aware certified cover plus safe retirement | current union already supplies most ingredients separately | residual is narrow conjunction | no direct fatal; must stay exact |
| Algorithm/mechanism substance | online policy over certified coverage DAG | DISC/Vortex have nontrivial compiler algorithms | no formal objective/guarantee yet | Tier B conditional |
| Baseline strength/fairness | full PyTorch 2.13 union, simple cache, offline oracle | current upstream exposes many competitive controls | Discovery baseline list omitted PGO/isolation/exclusion/MRU/filter/cache layers | repair specified |
| Natural workload/platform | result-independent public variable-shape streams on CPU + one CUDA GPU | anchors use public ML workloads and CPU/GPU platforms | no frozen panel or natural trace provenance | open |
| Full-cost coverage | compile, run, guard lookup, fallback, policy, entry/code/disk/device residency | official cache stack shows multiple cost layers | retirement-to-artifact ownership unresolved | revision required |
| Main result/statistics | none | anchors report end-to-end speedups/breadth | complete gap | Stage A only probes premise |
| Ablation/mechanism evidence | guard quotient, overlap, admission, retirement, ownership, stream strata | anchors separate components/strategies | no evidence | open |
| Scale/generalization | planned ≥12 models, 3 families, CPU/CUDA and positive/negative streams | dynamic compiler anchors cover multiple models/platforms | Discovery only proposed a broad route | Q2 breadth frozen in revision |
| Failure boundary | static/dynamic/disjoint, recomputation, shared artifacts | issue #166926 supplies a real overlapping-entry failure mode | must be measured and enforced | central contribution condition |
| Artifact/reproducibility | source-pinned hook, traces, configs, raw full-cost ledger | PyTorch/DISC/Vortex are public | no candidate artifact | open |

## Reviewer-shape assessment

- Editor/venue-fit view: a Q2 paper is plausible only if the work is a sound compiler mechanism with broad public evidence; a better recompile-limit heuristic or a short synthetic trace is below Q2.
- Methodology view: guard implication is necessary but not sufficient. Compile-unit identity, side effects, output/autograd signatures and artifact ownership are validity gates, not ablations.
- Domain-contribution view: PyTorch 2.13 makes the problem current and observable, but its rich native policy union raises the baseline bar sharply.
- Devil's-advocate view: automatic dynamic + PGO + MRU may already dominate almost all natural streams; any remaining improvement could be generic weighted caching with PyTorch names. The Stage A killer is designed to expose exactly that outcome.

## Decision

- Quality tier: `TIER_B_Q2_VIABLE` after revision; no Q1 label.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Closed gaps: exact current release/object, direct-fatal audit, public source route, strong native baseline inventory, finite falsifier.
- Executable next gaps: restricted implication grammar, compile-unit compatibility oracle, logical/physical retirement ownership, frozen natural panel and full-cost denominator.
- Human/resource-dependent gaps: none for the public CPU/single RTX 4070 route; broader multi-GPU evidence is optional and cannot be assumed.
- Bounded near-Q1 gaps: a formal online guarantee on a justified laminar/interval family, broad cross-version evidence, and upstream-quality integration. They are not currently closed enough for Tier A.
- Gap that would invalidate the paper: no safe nontrivial cover pair on natural frames or no Pareto advantage over the complete native/simple baseline union.
- Why this is calibration rather than novelty or baseline evidence: papers define expected mechanism/evaluation depth; current official implementation establishes collision and baselines. Neither supplies a candidate result.
- Why Tier B can still close the hard gates: the same-object revision can make legality and ownership finite; public source/models and CPU/single GPU can supply strong baselines, natural evidence, full cost and reproducibility without lowering exact semantics.

