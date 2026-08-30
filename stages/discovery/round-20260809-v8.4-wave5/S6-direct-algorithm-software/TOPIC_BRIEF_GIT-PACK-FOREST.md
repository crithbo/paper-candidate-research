# GIT-PACK-FOREST — Git 自包含 pack 的局部性受限 delta-forest 构造

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O7`
- Domain tags: `ALGORITHM_DATA_STRUCTURE`, `VERSION_CONTROL`, `LOSSLESS_COMPRESSION`, `CPU_REPRODUCIBLE`
- Contribution route: `N2`
- Discovery date: 2026-08-09
- Discovery method revision: `DISCOVERY_METHOD_V2_V8_1` only. O7 v2 historical backtest is `CALIBRATED`; TLS-blocked two-axis `v8.2r2` was not used.

## Research question

For a fixed reachable object set of one natural Git repository, can a sparse, locality-constrained **delta-forest constructor** choose bases and a legal pack order that preserves the exact Git object set and self-contained pack semantics, while improving the pack-size / construction-cost / reconstruction-cost Pareto frontier over Git's current sorted sliding-window construction?

## Paper genealogy

- Anchor / deployment algorithm: Git's upstream [pack heuristics](https://www.kernel.org/pub/software/scm/git/docs/technical/pack-heuristics.html) describe sorting, a bounded sliding window for delta selection, bounded delta chains, and a distinct recency-oriented write order. Current [git-repack](https://git-scm.com/docs/git-repack) documents that `--window` searches only within the window and `--depth` bounds reconstruction chains.
- Closest recent paper: Bertolotti et al., [On the Compressibility of Large-scale Source Code Datasets](https://upsilon.cc/~zack/research/publications/jss-2025-swh-compression.pdf), JSS 2025. It measures Git's v2.44 sorted sliding-window chains and subtracts the generic graph-pruning/PPC source-collection literature.
- Direct subtractors: Ouyang et al., *Cluster-based delta compression of a collection of files* (WISE 2002), as identified in the JSS paper; the JSS paper's MinHash graph and PPC variants; Git's own `--window`, `--depth`, `--window-memory`, name/path ordering, delta-island and reuse modes. None may be re-presented as this proposal.
- Artifact / specification / natural carrier: upstream [git](https://github.com/git/git), [pack format](https://git-scm.com/docs/pack-format), and public natural Git histories (for example the upstream Git, Linux, LLVM and Rust repositories). The pack format specifies OFS/REF deltas and says stored packs should be self-contained.
- Search boundary: paper originals and official/upstream sources through 2026-08-09. Searches covered `Git pack delta compression optimization`, `packfile delta branching`, source-code delta compression, current Git packing/repacking docs, and upstream source/docs. No Git-format-compatible, single-repository constrained forest constructor was located. This is `SEARCH_BOUNDED_OPEN`, never a novelty claim; Stage 0 must redo the collision search.

## Topic-origin card

- Trigger: Git's exposed object is lossless pack construction under a correctness contract, but its documented construction compares candidates within a sorted `--window`; increasing window/depth is a known cost tradeoff rather than a new decision structure.
- Measurable observation / quantitative anchor: JSS 2025 reports Git's v2.44 sliding-window chain construction and observes only modest pack-size improvement when it enlarges window/depth on its natural popular-repository carrier, while compression throughput drops. That is an external baseline fact, **not** evidence that the proposed mechanism improves Git.
- Baseline limitation: a bounded local scan decides one base at a time after a fixed order. It does not expose selection of a sparse candidate graph, a whole bounded-depth forest, and a coupled layout objective as a single constrained optimization problem.
- Structural cause: base choice influences chain depth and the legal/beneficial placement of later objects; each edge's value is conditional on previously selected bases and locality. The latent object is therefore a constrained construction, not a per-object parameter.
- Decision variable: `(E, F, pi)`: a budgeted candidate-edge set, a directed acyclic bounded-depth delta forest, and a legal emission order. Constraints freeze object identity/type, Git's delta encoding, self-containment, maximum depth, and a predeclared locality/reconstruction budget.
- Candidate Q1 venue family: systems/software-engineering storage and data-management venues. Current forecast remains Tier B until Stage 0 finds a stronger calibrated same-object paper family.

## Historical method calibration

- Source-session backtest file: `stages/discovery/_method-backtests/O7_DIRECT_ALGORITHM_SOFTWARE/v2/handoff.yaml`
- Backtest status: `CALIBRATED` (3/3 positive recoveries; negative control abstained).
- This calibrates the method, not the candidate.

## Importance and group fit

Git pack construction is a CPU-only, public, correctness-checkable algorithm used on natural software histories. A positive result would be a lossless construction improvement, not a changed codec, changed repository object, or an interface wrapper. The proposal deliberately restricts itself to one ordinary self-contained on-disk pack, avoiding cross-repository archive compression and fetch-serving variants.

## Exact object

The exact object is **construction of one self-contained on-disk Git pack and index for a fixed reachable object set from one repository**, initially the ordinary all-object repack case with no thin packs, no filtering, and no changed objects. Same function/quality means every original object identifier resolves to the same canonical object content, the pack/index checksums and format are valid, and `git index-pack --verify --strict` plus `git fsck --strict` accept the result. It is not a new compressor/codec, a cross-repository archive, a fetch-pack selector, MIDX policy, bitmap redesign, or a changed Git object model.

## Named fair baselines

- Deployment/default baseline: current upstream Git `repack` / `pack-objects` using its documented default sorted window/depth construction.
- Strong baseline union (frozen before method design): current Git with the applicable documented action space: default; larger legal `--window`/`--depth` paired with `--window-memory`; applicable name-hash/path ordering; and existing reuse/island settings **only when the frozen repack mode gives the same semantics and input state**. Each setting's memory, CPU, pack/index bytes and verification are costed.
- Closest paper baseline: JSS 2025 Git-pack configurations (`w=10,d=50`, `20,100`, `40,200`) on its natural repositories, used only as published calibration—not as a substitute for current upstream reproduction.
- Competitive simple baseline: a stable type/path/size order with the existing bounded window; a deterministic nearest-similar candidate within the same budget; and no-new-delta/full-object packing as a correctness/cost reference.
- Optional offline ceiling: exact bounded-depth directed-forest optimization on tiny frozen object sets, with candidate-edge discovery cost included and reported separately from scalable construction.

## Baseline-residual action-space test

| Union facet | Frozen current union | Candidate residual | Why same object stays fixed |
|---|---|---|---|
| Information | Object type, size, path/name ordering, existing delta/reuse state, bounded candidate window, optional islands | Budgeted content-similarity candidates and estimated delta sizes, plus chosen forest dependencies | No source/object content changes |
| Actions | Sort; compare within a window; choose/reuse a delta or full object; bound depth; emit pack | Choose a sparse edge graph, a global bounded-depth forest, and an emission order jointly | Same Git delta representations and object identities |
| Guarantee | Valid pack encoding, reconstructable objects; stored pack self-contained; configured depth/island conditions | Same guarantees; additionally acyclic forest and enforced locality/depth budget | No weaker verification or thin-pack escape |
| Full cost | Packing CPU/RSS, window memory, pack/index bytes, verification and unpack cost | Includes fingerprinting/edge construction, optimization, layout, packing, verification and reconstruction | No uncharged precompute or offline oracle as deployable result |

The residual is admissible only if its selected edge/forest action cannot be reproduced by a union member merely through its documented sorting/window parameter choices. A post-hoc parameter sweep, external reorder wrapper, or use of generic PPC output is disqualifying.

## Mechanism hypothesis

Build a capped, type-preserving sparse similarity graph from object content; estimate actual Git-format delta costs only for admitted edges. Solve a bounded-depth rooted forest with a lexicographic objective: pack+index bytes first, then a fixed reconstruction/locality surrogate, subject to an explicit candidate-generation and memory budget. Topologically emit bases before OFS deltas where required. The output uses existing Git representations; the N2 is the construction algorithm and its constrained data structure, not a new verification tool.

## Competing mechanisms

- Mechanism A — sparse forest with Lagrangian locality budget: select a bounded-depth arborescence forest from capped candidates, penalizing high expected reconstruction work and far layout dependencies. Prediction: helps repositories with near duplicates separated beyond Git's local sorted window; loses where path ordering already concentrates all useful candidates.
- Mechanism B — cluster-first bounded dynamic program: form deterministic small content clusters, solve each cluster's depth-bounded forest, then interleave only legal base-before-child blocks. Prediction: lower construction/RSS cost than A; loses if useful bases cross clusters.
- Mechanism C — current Git sorted sliding-window construction, including legal enlarged-window configurations. This is the deployment baseline, not an ablation to be weakened.
- Preferred mechanism and why: A has one explicit new decision structure `(E,F,pi)` and a finite infeasibility test. B is a competing decomposed algorithm, not a freely combined union.

## Mechanism signature

A valid result preserves the object set and strict Git verification while showing a non-dominated full-cost outcome attributable to global forest/layout decisions. A smaller pack achieved by changing compression level, using a thin pack, dropping unreachable objects, omitting index/verification, hiding fingerprint/optimization time, or comparing only to Git defaults fails the contract.

## Seed-distance test

- What changes relative to the deployment seed: Git's local candidate scan remains a baseline; the proposal selects a bounded-depth forest and layout under frozen legal constraints.
- What changes relative to JSS 2025: JSS studies broad source-code collection compression and PPC/graph compressors; this proposal must work within the Git pack format and one-repository, self-contained, object-preserving contract, with current Git union as the fair comparator.
- Why this is not an application/backend rename: the format and repo are unchanged; the algorithmic decision variable changes from local pair selection after sort to constrained forest construction and legal emission.
- Result of method-name deletion test: “Given immutable objects and a fixed delta format, select a bounded-depth acyclic base forest and layout minimizing fully charged encoded size subject to bounded reconstruction work” remains a distinct construction problem.

## Candidate paper claim

On a characterized subset of natural Git histories, a budgeted, locality-constrained delta-forest constructor can preserve self-contained pack semantics and strict verification while creating a pack-size / construction-cost / reconstruction-cost Pareto point not reached by the frozen current Git baseline union. The paper would claim neither universal compression gains nor a new Git format.

## Evidence route

- `PERFORMANCE` plus a format-preservation invariant and an exact small-instance ceiling.

## Software/algorithm performance admissibility

- Same-function contract: fixed reachable object IDs and canonical contents; valid self-contained `.pack` + `.idx`; strict index/fsck acceptance; same repo hash format and no thin-pack dependency.
- Algorithmic delta: sparse candidate index plus constrained forest/layout selection. This is nontrivial only if Stage A demonstrates edges/actions outside all fair union members.
- Full-cost ledger: revision checkout/object enumeration, fingerprinting, candidate materialization, delta estimation, optimization, pack/index writing, verification CPU, peak RSS, disk bytes, I/O, random-object reconstruction and timeouts. Pack and index sizes both count.
- Generality hypothesis: naturally occurring repositories with renamed/moved/vendor-derived/similar files separated by current sorted windows; no claim for already-local histories, binaries beyond Git's big-file treatment, or small repos.
- Why this is not routine tuning: it adds a new global constrained decision variable and data structure, rather than changing `--window`, `--depth`, compression level, or thread count.
- Expected no-gain region: repositories where Git's sort/window already contains best bases; low similarity or mostly incompressible blobs; constrained low-memory repacks where candidate construction dominates; histories requiring reuse/island semantics that leave no residual legal action.

## Nearest-prior facet matrix

| Facet | Candidate | Closest prior / baseline | Residual |
|---|---|---|---|
| Research problem | Lossless one-repo Git pack construction | Git local pack heuristics; JSS source-collection compression | Git-format constrained global construction |
| Exact object | Fixed reachable Git object set → self-contained pack/index | Git pack-objects | Same object |
| Decision variables | Sparse edges, bounded-depth forest, emission order | Sorted order + local window base choice | New coupled decision structure |
| Constraints / information | Git encoding, self-containment, depth and locality/cost budget | Window/memory/depth and optional current modes | Explicit global feasibility/cost structure |
| Core algorithm | Capped graph + constrained forest/layout | Sliding window; PPC/graph compression outside pack contract | Direct N2 construction residual |
| Guarantee | Strict pack/index/fsck acceptance; canonical objects | Same | Unchanged function/quality |
| Evidence object | Public natural Git histories | Same repositories/current Git | Fair same-object route |

## Current collision classification

- DIRECT_FATAL: none found in the bounded search for the frozen Git-format-compatible, one-repository forest constructor; Stage 0 must independently verify.
- DIRECT_SUBTRACT: Git sliding-window heuristics and every `--window`/`--depth` action; generic clustered delta compression; JSS 2025 PPC and MinHash graph methods. These are baseline/subtractor material, not contribution claims.
- METHODOLOGICAL_ADJACENT: cross-repository Software Heritage compression, general file collection compression, thin transfer packs, MIDX geometric repacking and fetch reuse.
- DEPLOYMENT_BASELINE: current Git `pack-objects`/`repack` union and strict verification tools.
- SEARCH_BOUNDED_OPEN: whether the constrained residual has an unreported direct collision; not a claim of priority.

## Decisive falsifier

Freeze 20 public natural repositories spanning source-heavy, vendored/renamed, and low-similarity histories, plus object-set manifests. Stop this mechanism if any of the following occurs: (a) after exact union tracing, fewer than 10% of candidate-selected edges lie outside every legal current-union window/action on the frozen corpus; (b) strict verification or canonical-object equality fails for any accepted pack; (c) under a predeclared memory/candidate budget, A produces no non-dominated point against the union on pack+index bytes, end-to-end construction CPU/RSS, and fixed random-object reconstruction across both p50 and p90; or (d) candidate generation/optimization consumes the entire apparent pack-size saving. No relaxed thin-pack, changed-object, or uncharged-precompute pivot is allowed.

## Executable evidence path

### 72-hour first evidence

1. Pin upstream Git commit/toolchain and 20 public repo revisions; record refs, reachable object manifests, Git config, and hardware-independent input hashes.
2. Instrument a read-only build of current packing to log which legal candidate comparisons/actions each baseline-union member actually considers; reproduce valid packs and strict verification before implementing the candidate.
3. Implement candidate generation and an exact solver only on capped subgraphs to test the residual; charge all work and compare it to the frozen union.
4. Implement A only if the residual-coverage gate passes. Kill on the stated falsifier; if surviving, compare A, B, and each fair union member, never only Git defaults.

### AI core fraction and critical path

`AI_CORE_EXECUTABLE` (about 70%): checkout pinning, manifest extraction, instrumentation, pack parser/validator harness, candidate graph and solver implementation, and complete cost collection are public CPU work. A maintainer-level review is required to validate that all output modes preserve Git's pack/repack semantics and that baseline configurations are genuinely comparable.

### Semantics-preserving open alternatives

Current upstream Git `pack-objects`, `git repack`, `git index-pack`, `git fsck`, and its source/docs are public. All direct competition uses the same fixed object manifest and strict verification. PPC/zstd collection compressors are adjacent negative controls, not equal-quality Git-pack baselines.

## Q1/Q2 sufficiency hypothesis

- Structural paper potential: `TIER_B_Q2_VIABLE` conditional on a format-preservation proof/invariant, a new constrained construction algorithm, and full-cost Pareto gains on diverse natural repositories. It is not upgraded by absent experiments.
- Current evidence readiness: `MODERATE_FINITE_CPU_ROUTE`; the artifact, format contract, natural inputs and killer are public, but no implementation or result has been run.
- Why this supports at least a complete Q2 paper: it can be a focused same-object N2 algorithm with strict end-to-end correctness, current fair baselines, an exact small-instance ceiling, natural CPU workloads, full cost accounting and declared no-gain regions.
- Why it remains Tier B: generic delta-forest/cluster literature is substantial and JSS 2025 is close; Stage 0 must establish that Git-specific constraints leave a genuine residual and identify appropriate venue calibration.
- What Stage B would still require: independent current collision audit; source-compatible implementation or a faithful isolated pack constructor; union-wide comparisons, diversity-stratified natural corpus, format verification, cost/ablation data, negative regions, reproducible manifest, and maintainer review.
- Preliminary contribution-shape analogs: JSS 2025 source-code compression; classic cluster delta compression; Git's upstream algorithm/specification. These support problem seriousness, not novelty.

## Non-relaxable quality audit

- Same-object: fixed one-repository reachable Git object set and self-contained pack/index; no cross-repository or codec switch.
- Latest collision: upstream Git docs/source and JSS 2025 screened through 2026-08-09; `SEARCH_BOUNDED_OPEN` remains and requires Stage 0.
- Strong fair baselines: current Git action union, not default only; all compatible configuration costs are charged.
- Natural input/evidence: public repository histories and upstream format/verifier, not synthetic similarity graphs as paper evidence.
- Full-cost: candidate discovery, solver/layout, writing, indexes, strict verification, access and memory are explicit.
- Reproducibility: upstream Git and public commits; Stage A must pin URLs/refs/hashes and publish pack/object manifests.
- Evidence/claim honesty: Discovery ran no implementation, pack construction, or benchmark. All benefits are hypotheses; JSS quantitative values describe its own evaluated system only.

## Dual-axis score

- Academic value: `48/70`
- AI executability bonus: `21/30`
- Total: `69/100`

## AI and researcher boundary

AI can build the public instrumentation and constrained constructor, but cannot self-certify Git format/regression completeness or assert a novel residual. A human reviewer must audit semantic equivalence and current competition. Low readiness would alter prioritization, not be a scientific stop.
