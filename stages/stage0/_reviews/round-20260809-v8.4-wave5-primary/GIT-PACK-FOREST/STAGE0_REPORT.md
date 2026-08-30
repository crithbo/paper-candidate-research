# GIT-PACK-FOREST Stage 0 PRIMARY Report

- Lane id: `STAGE0-BATCH-GATE/PRIMARY`
- Assignment id: `STAGE0-P1-20260809-GIT-PACK-FOREST-PRIMARY-V8.4`
- Input freeze SHA-256: `736638AED4B1C05137301A03C0D6FEF0FFA50E08CE7B11CA60AA5ADBC9980C12` (Discovery manifest)
- Cross-assignment contamination declaration: prior assignments and their scores/PASS states were not used; only the assigned Wave-5 files, current control files, role templates and independently checked primary sources were used.
- Decision: `PASS_RECOMMENDED / PENDING_CONFIRMATION`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.73` (structural-potential judgment; no candidate result exists)
- Evidence ceiling: `DESIGN_AND_PRIMARY_SOURCE_AUDIT_ONLY__NO_CLAIM_BEARING_RESULT`
- Novelty route: `N2`
- Candidate Q1 venue family: systems/storage/software-engineering venues; Tier A is not yet recommended.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim and does not authorize Stage A or Stage B.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a focused, credible Q2 paper. A Git-format-preserving constructor that jointly chooses a capped type-preserving candidate graph, a bounded-depth delta forest and legal pack order—and produces a full-cost Pareto point outside current Git's finite fair action set—would be a non-trivial algorithmic contribution rather than parameter tuning.
- Current evidence-acquisition readiness/risk: `MODERATE_FINITE_CPU_ROUTE`. Git source, formats, validators and public repositories are available, and the decisive test is CPU-only. The candidate, 20-repository corpus and measurements have not been produced.
- Why missing implementation/results/proof/hardware is or is not structurally fatal: it is not fatal at Stage 0 because the object, comparison, invariant and falsifier are finite and reproducible. It does keep the claim ceiling at a design hypothesis. Failure of the planned residual or Pareto test would be scientific STOP.

## Discovery provenance

- Opportunity origins: direct algorithm/software improvement over a production format-preserving pack constructor; baseline-residual-first search.
- Domain tags: `software-engineering`, `storage`, `compression`, `Git`, `algorithms`.
- Paper genealogy: Git pack heuristics and current `pack-objects`; JSS 2025 source-dataset compression study; generic resemblance/delta-compression systems including Finesse and LoopDelta.
- Discovery method revision: `v8.4`, conditional paper-potential semantics.
- Backtest reference and status: Discovery cites `O7_DIRECT_ALGORITHM_SOFTWARE/v2`; treated only as method calibration, not candidate evidence.
- Provenance warning: no `GIT-PACK-FOREST` entry was found in the `registry.yaml` snapshot read at PRIMARY start. The mainline assignment and Discovery manifest are internally coherent, so this does not alter the scientific decision; mainline must resolve registration before any state transition.

## Frozen object and claim

The exact object is one fixed public Git repository at one fixed commit/ref closure, with its complete reachable object-ID/type/size/content manifest, mapped to exactly one self-contained on-disk `.pack` and its `.idx`. The hash algorithm, Git version, compression level, input object order policy and host budget must be frozen. Thin packs, filters, promisor omissions, changed object sets, codec/format changes and dependence on external bases are excluded.

The output contract is canonical Git-object equality and successful `git index-pack --verify --strict` plus repository-level `git fsck --strict`. The candidate may only select legal same-type delta bases, a directed acyclic forest within the frozen maximum depth, and a legal physical order/encoding already expressible by Git's pack format.

The narrow conditional claim is: on a characterized subset of natural repositories, a budgeted Git-format/locality-constrained constructor over `(E,F,pi)` yields at least one non-dominated pack+index-size / end-to-end-construction-cost / reconstruction-access-cost point outside the frozen current-Git union while preserving the exact object manifest and strict verification. It does not claim universal improvement, a new codec or a new Git format.

## Positive opportunity map

- Natural workloads: 20 public repositories, each frozen at a commit with a reproducible reachable-object manifest; selection must cover diverse sizes, histories and path/version structures without choosing on candidate outcome.
- Observed or expected cost/headroom: official Git implements type/size/name/path ordered bounded-window search and explicitly exposes window/depth/memory tradeoffs. JSS 2025 reports a size/throughput tradeoff from enlarged Git window/depth on natural popular repositories. These support a natural optimization tension, not a candidate gain.
- Mechanism-specific prediction: if useful candidate edges lie beyond the finite legal local/path-walk search while still forming shallow families that admit a favorable write layout, joint forest/layout construction can improve compression without unacceptable construction or random reconstruction cost. If those edges are rare or too costly to find, the hypothesis fails.

## Named baselines and fairness contract

All baselines receive the identical reachable-object manifest, Git version, hash/codec settings, host limits and output guarantee; all emit one self-contained pack+index and pass the same strict checks.

1. `B0`: current upstream Git default `pack-objects`/full repack mode.
2. `B1`: a preregistered, finite, budget-matched set of larger legal `--window`, `--depth` and `--window-memory` configurations; no post-hoc sweep.
3. `B2`: current path/name actions, including `--path-walk` and both legal `--name-hash-version` settings, respecting bitmap/path-walk and path-walk/delta-island incompatibilities.
4. `B3`: reuse/no-reuse and delta-island variants only when they consume the same initial repository state and preserve the exact frozen output semantics; otherwise they are reported separately, not unioned.
5. `B4`: deterministic type/path/size and nearest-similar simple constructors under the candidate's candidate-generation budget.
6. `O-small`: an exact tiny-instance forest/layout solver is an offline ceiling/oracle, never a deployment baseline.

JSS PPC/MinHash/graph and FAST-style resemblance detectors are method subtractors and negative/ceiling references. If they change the collection object, encoding or self-containment contract, they cannot impersonate equal-quality same-object baselines.

Full cost includes object enumeration, fingerprints, candidate edges and actual delta estimates, optimization, pack/index write and verification, wall-clock CPU, peak RSS, temporary/disk bytes, sequential reconstruction and preregistered random-object access. Failure and fallback costs are charged.

## Collision analysis

Current Git 2.55 documentation and upstream source materially strengthen the baseline relative to a default-only comparison. `pack-objects` exposes window/depth/memory, two name hashes, path-walk, delta reuse and islands. Its source performs a first per-path region compression under path-walk, then a type/size-sorted bounded-window pass; `try_delta` enforces same type and depth, and write order walks completed delta families. Thus path-aware grouping, local base selection, bounded depth and family-aware emission are all subtracted.

No checked first-party source was found that directly formulates and solves the candidate's complete same-object decision `(capped content graph, globally constrained bounded-depth forest, legal layout)` with the same Git pack/index identity, verification and full-cost objective. This is `SEARCH_BOUNDED_OPEN`, not a novelty proof.

JSS 2025 directly subtracts generic graph pruning/PPC/MinHash/source-collection compression and evaluates Git pack configurations. Its broader Software Heritage collection object and non-Git codecs do not satisfy the frozen one-repository Git-pack contract. Finesse, DeepSketch and LoopDelta subtract generic feature, reference-search and locality mechanisms, but target deduplicating storage rather than Git's exact pack format.

### Nearest-prior facet matrix

| Facet | Candidate | Closest current source/paper | Residual after subtraction |
|---|---|---|---|
| Object | One fixed reachable Git object set to one self-contained pack+idx | Git `pack-objects` | Same object |
| Candidate discovery | Capped type-preserving content-similarity graph | Git name/path/type/size ordering; path-walk; generic MinHash/PPC | Only edges demonstrably outside the frozen Git action set remain |
| Base selection | Whole bounded-depth directed forest | Git greedy bounded-window `try_delta` search | Global coupled feasibility/objective, if not reproducible by any finite union member |
| Layout | Joint legal `pi` with forest/locality budget | Git separates delta search from family-aware write order | Joint forest/layout tradeoff only |
| Format/verification | Existing Git codec, self-contained pack, strict identity | Git native format and validators | No format claim |
| Objective/cost | Pack+idx bytes plus full construction/RSS/access | Git/JSS size-throughput; FAST locality systems | Full Git-specific Pareto construction |

### Seed-distance and method-name deletion test

Deleting the name “delta forest” leaves a concrete algorithmic change: replace fixed-order local pair choice with a budgeted global directed-forest selection plus a constrained legal write order, under unchanged Git encoding and object identity. Deleting “Git” destroys the semantic constraints and the strongest deployment baseline; therefore this is not a generic compressor renamed for Git. Conversely, if implementation is merely an external reorder, `--window/--depth` tuner, PPC/MinHash wrapper or ordinary graph MST without Git depth/layout/full-cost constraints, the N2 disappears.

## Competing mechanism decision

- Selected mechanism: sparse candidate graph plus Lagrangian/locality-constrained bounded-depth forest and legal emission.
- Registered backup: cluster-first bounded DP over a frozen clustering, assessed separately against the same union.
- Pivot boundary: no free combination. A switch from the selected global forest mechanism to cluster-first DP would require the registered Stage-0/Stage-A pivot mechanism; changing object, codec or pack contract is a new topic.

## Residual paper kernel

The paper kernel is not “better Git compression.” It is a Git-native constrained constructor with an auditable residual-action certificate: which selected edges were unreachable to each preregistered current-Git baseline under equal budgets, how bounded depth and locality couple their selection, and how the legal order realizes them. The minimum theorem/invariant package is object/type preservation, acyclicity, maximum-depth compliance, base-before-dependent legality and deterministic fallback. The empirical kernel is a full-cost non-dominated outcome on natural repositories plus declared no-gain regions.

## Evidence route

- `PERFORMANCE / PARETO_APPROXIMATION`
- Primary evidence: exact-object equivalence and strict validation; residual-action coverage; pack/index bytes; CPU/RSS/temp I/O; sequential and random reconstruction; 20-repository paired comparisons.
- Supporting evidence: tiny exact optimum gap, component ablations (candidate graph, forest objective, locality/order), sensitivity to graph cap/depth/budget and failure-region characterization.

## Performance-optimization admissibility, if applicable

- Same-function contract: fixed reachable canonical objects to one self-contained Git pack+index under native strict verification.
- Algorithmic delta: global bounded-depth forest/layout construction over a capped candidate graph.
- Full-cost ledger: all preprocessing, solver/optimization, write, verification, memory, disk and access costs, including failures/fallback.
- Strong-implementation fairness: current Git 2.55 or a frozen newer commit is built consistently and receives a finite budget-matched current action union; no default-only straw baseline.
- Generality and failure boundary: predeclared diverse repositories and characterization of when useful residual edges are absent or too expensive.
- Why not routine tuning: the N2 survives only if the selected global constrained actions cannot be reproduced by ordinary sorting/window/depth/path-walk/reuse/island configurations.

## Q1/Q2 paper shape

- Problem: Git's practical local delta search exposes a compression/build/reconstruction tradeoff within a strict compatibility contract.
- Contribution: a new constrained forest-and-layout constructor plus preservation invariants and residual-action accounting.
- Evidence plan: 20 natural repositories; the full current Git union; small exact ceilings; end-to-end full costs; mechanism ablations and failure boundaries.
- Expected paper narrative: current local heuristics leave a measurable, structured residual on some histories; a bounded global constructor captures it without changing Git format or hiding costs; other histories correctly fall back.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: JSS 2025 source-collection compression; FAST'19 Finesse; USENIX ATC'23 LoopDelta.
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: the candidate is narrower and currently lacks a proved/observed residual; Q1-level framing would need a stronger general algorithmic insight than a Git-specific optimization alone.
- Evidence-shape gap: no candidate artifact or natural paired results exist; successful Stage A only supplies preliminary risk evidence.
- Stage A closure plan: trace the complete current action union, establish residual-edge prevalence, implement one constrained constructor, and perform the preregistered full-cost killer on a small natural subset before scaling.

## Non-relaxable quality audit

- Same-object: clearly definable and mechanically checkable.
- Latest collision: current Git 2.55 docs and current upstream source audited through 2026-08-09; closest generic papers rechecked. Status remains `SEARCH_BOUNDED_OPEN`.
- Strong fair baselines: finite current-Git union, not default-only and not a universal post-hoc union.
- Natural input/evidence: route is 20 frozen public repositories; no current result is claimed.
- Full-cost: explicitly includes graph/solver, verification, memory and access.
- Reproducibility: public CPU-only stack, pinned Git/repository commits, commands, manifests and hashes are feasible.
- Evidence/claim honesty: Discovery's JSS facts are baseline motivation only; all candidate outcomes are conditional.

## Evidence path and AI completion

- AI executability class: `AI_CORE_EXECUTABLE_WITH_HUMAN_SEMANTIC_AUDIT`
- Estimated ai_core_fraction: `0.72`
- 72-hour first evidence: pin Git and 3–5 repositories; reproduce all validators; enumerate and trace `B0–B3` candidate actions; measure residual-edge coverage; run the selected forest constructor on small graphs; produce a paired full-cost ledger and exact-small oracle check.
- Human-only items and why they are non-decisive: maintainer-level audit of pack/repack mode equivalence and venue positioning improves confidence but does not block the public CPU experiment or determine the algorithm.

## Stage A highest-risk probe plan

- Risk-bearing premise: natural Git histories contain enough useful, affordable delta edges outside the complete finite current-Git action union that a coupled bounded-depth forest/layout decision can produce a non-dominated end-to-end point.
- Cheap discriminating probe or counterexample search: on a preregistered subset, log all pairs considered by `B0–B3`; generate a capped independent content-similarity graph; compute actual Git delta costs for residual edges; solve small exact and candidate forests; verify identical packs and charge full costs.
- Negative result that kills the direction: residual useful-edge coverage below 10%; any object/equality/strict-validation failure; no p50 and p90 full-cost Pareto advantage over the frozen union; or graph/optimization cost consumes the pack/access benefit.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

1. A primary-source direct collision covers the same Git object, format, constrained forest/layout decision, guarantee and full-cost result.
2. The residual action certificate shows fewer than 10% useful candidate edges outside the frozen fair union.
3. Any reachable-object equality, self-containment, `index-pack --verify --strict` or `fsck --strict` contract fails without a semantics-preserving fallback.
4. Candidate or precomputation/optimization cost removes every p50/p90 Pareto advantage against the union.
5. The method collapses to external reorder, ordinary parameter sweep, generic PPC/MinHash graph use or a checker wrapper.

## Dual-axis score

- Academic value: `51/70`
- AI executability bonus: `22/30`
- Total: `73/100`

The score supports a Tier-B conditional pass; it does not override the scientific hard gates.

## Human research reserve, if applicable

Not applicable. The core path is public, CPU-executable and substantially automatable; human semantic review is bounded.

## User-action blocker, if applicable

No current resource blocker. The missing registry entry is a mainline provenance/state issue, not a user resource blocker and not a scientific negative observation.

