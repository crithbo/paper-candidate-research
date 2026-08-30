# Source103 S2 — Divergence Seed Pool

本表仅记录离线、非证据性的研究构想。它不构成 locator、raw、候选证据、新颖性或 current-absence 结论；后续任何公开检索均须从本表完成后冻结的 RQ 开始。

## Pool metadata

- Assignment / lane: `DISCOVERY-S2-20260824-SOURCE103-LLM-VLA-STRATEGY-V1` / `DISCOVERY_S2`
- Frozen profile: `SOURCE103_USER_LLM_VLA_PUBLIC_SINGLE_GPU_CPU_FIRST_V1`
- Seed ceiling: `<=12`; actual: `8`
- RQ candidate ceiling after seed convergence: `<=8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Group-repository use: only hash-pinned, listed files as locator/resource-alignment input; never candidate evidence.

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S2-103-01, S2-103-08 |
| `PROBLEM_REFRAMING` | yes | S2-103-03, S2-103-06 |
| `CONSTRAINT_MANIPULATION` | yes | S2-103-02, S2-103-04 |
| `NEGATION_OR_INVERSION` | yes | S2-103-05 |
| `ABSTRACTION_LADDER` | yes | S2-103-07 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S2-103-01, S2-103-03 |
| `JANUSIAN_TENSION` | yes | S2-103-06 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S2-103-02, S2-103-08 |

## Seed records

### `S2-103-01`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: a fixed DeepSeek-style stage graph has operator-local layout/remapping descriptions while cross-stage reuse and 28-slice transport may make a local mapping choice non-local in cost.
- Exact public anchor candidate and version/date if already known: `https://github.com/uSFrances/ndp-sim.git` at `e299b2804448242d1589b3e58ed7c5a9a5eca09f` (candidate only).
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Ask whether a compiler-level representation can choose a legal cross-operator layout/remap boundary jointly with reuse and required transport, rather than optimizing each stage in isolation. The tentative mechanism is that the representation exposes an otherwise hidden downstream data-movement denominator without changing tensor semantics.
- Conclusion-first test: 若成功，最谨慎的结论只能是：在冻结的同一 stage graph 与语义下，某类跨算子 layout decision 可减少完整搬运/重映射成本；它值得关心仅因局部 kernel 优化可能把瓶颈转移到该边界。
- Exact structural mapping, tension or manipulated constraint: local stage layout ↔ global producer-consumer allocation/transport; fixed numerical semantics and legal remapping remain immutable.
- Counterfactual consequence if the idea were true: the compiler/backend engineer would select a different legal layout boundary than a stage-local policy.
- Likely generic/current-union/changed-object risk: high risk of being a generic graph-layout optimizer or existing compiler scheduling.
- Evidence needed before it can become a locator: exact public stage/execplan carrier, its legal remapping semantics, and a named current compiler/runtime comparator.
- Relation to existing seed/family: `FRESH_SKETCH`; `RELATED_ONLY` to prior low-bit packing closures, not a reopening of `QPACK-REFINE-REV0` or `PACKROUTE-DISCOVERY-REV0`.
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S2-103-02`

- Engine: `CONSTRAINT_MANIPULATION`
- Perspective role: `MAINTAINER`
- Starting anchor or hunch: lowering a low-bit GEMM/GEMV can reduce arithmetic time yet expose dequantization, metadata, activation or non-GEMM stages as the end-to-end dominant cost.
- Exact public anchor candidate and version/date if already known: vLLM public source repository, exact revision to be frozen only after selection.
- Intended source role: `CURRENT`
- Two-sentence idea sketch: Examine whether an end-to-end compiler decision can select a semantically legal producer-side representation specifically to avoid a downstream non-GEMM conversion or metadata path. The question is deliberately not a new packing format or a GEMM tile retile.
- Conclusion-first test: 若成功，最谨慎的结论只能是：对同一低比特 inference path，联合 representation decision 能在完整分母下避免一个可定位的下游转换；它不是单一 kernel speedup。
- Exact structural mapping, tension or manipulated constraint: faster GEMM ↔ slower representation consumers; action must preserve rounding, scales, zero-points and output semantics.
- Counterfactual consequence if the idea were true: a backend would preserve or materialize a different legal representation at a boundary to change end-to-end cost.
- Likely generic/current-union/changed-object risk: high; may collapse to terminal QPack/QGroup or ordinary fusion.
- Evidence needed before it can become a locator: current low-bit representation contracts, downstream consumer semantics, and explicit distinction from existing unpack/transpose/repack paths.
- Relation to existing seed/family: `FRESH_SKETCH` with mandatory exact-identity screening against `QPACK-REFINE-REV0`, `QGROUP-GUARD-REV0`, and `SEGMENTED-SCALE-W4A16-REV0`.
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S2-103-03`

- Engine: `PROBLEM_REFRAMING`
- Perspective role: `HARDWARE_ARCHITECT`
- Starting anchor or hunch: a GPU–NDP deployment can make a locally faster NDP placement inferior once host transfer, fallback, layout conversion and launch sequencing are charged.
- Exact public anchor candidate and version/date if already known: `uSFrances/ndp-sim` commit `e299b2804448242d1589b3e58ed7c5a9a5eca09f` plus a public GPU inference runtime to be version-frozen after selection.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Seek a same-object partition decision whose atomic action jointly assigns an operator and its required representation/transfer boundary, instead of claiming that an NDP component is inherently faster. The conservative hypothesis is that a threshold policy exists only if fallback and all added movement are in the denominator.
- Conclusion-first test: 若成功，最谨慎的结论只能是：在公开可复核模型下，某类 legal GPU–NDP partition boundary changes a full-cost Pareto decision; it does not establish unmeasured hardware superiority.
- Exact structural mapping, tension or manipulated constraint: placement choice ↔ data-layout/transfer/fallback contract; output and precision semantics fixed.
- Counterfactual consequence if the idea were true: the system would retain an operation on GPU or move it to NDP under a formally stated full-cost boundary.
- Likely generic/current-union/changed-object risk: high risk of generic heterogeneous scheduling or assuming unavailable NDP results.
- Evidence needed before it can become a locator: an executable/public model or trace, explicit fallback semantics, and a finite CPU/single-GPU mechanism-validation route.
- Relation to existing seed/family: `FRESH_SKETCH`; not a claim about the dirty group repository or its server path.
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S2-103-04`

- Engine: `CONSTRAINT_MANIPULATION`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: a 28-slice carrier exposes a choice between high-group-local execution and cross-group transport, whose metadata and synchronization may dominate after local compute is optimized.
- Exact public anchor candidate and version/date if already known: `uSFrances/ndp-sim` commit `e299b2804448242d1589b3e58ed7c5a9a5eca09f`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Test whether a compiler can make one non-separable choice over a legal operator sequence—group placement plus transfer form—under a fixed address/remapping contract. The seed does not assume that changing a ring or replacing a named interconnect is itself a contribution.
- Conclusion-first test: 若成功，最谨慎的结论只能是：a constrained backend decision may reduce charged inter-group transport while retaining one public execution-plan semantics.
- Exact structural mapping, tension or manipulated constraint: HIGH-4 locality ↔ LOW-28 transfer requirement; address ownership, alignment, and tensor identity remain fixed.
- Counterfactual consequence if the idea were true: backend placement would differ from a local-only placement rule for a defined cross-group dependency.
- Likely generic/current-union/changed-object risk: high risk of L3/asynchronous-DIMM renaming or an existing simulator policy.
- Evidence needed before it can become a locator: public command/transport semantics, a current implementation locus, and an exact non-generic decision variable.
- Relation to existing seed/family: `FRESH_SKETCH`; must reject any identity that only renames `L3_OR_ASYNCDIMM`.
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S2-103-05`

- Engine: `NEGATION_OR_INVERSION`
- Perspective role: `OPERATOR`
- Starting anchor or hunch: a mapping that is favorable in steady-state can be unfavorable when layout initialization, plan construction, or cold cache/fallback costs are included.
- Exact public anchor candidate and version/date if already known: public LLM inference runtime source, exact revision to be selected after RQ convergence.
- Intended source role: `ESCAPE`
- Two-sentence idea sketch: Reframe the objective from isolated operator throughput to a cold-versus-warm full-cost boundary for a fixed inference operation and legal backend mapping. The action would need to be more than tuning a cache threshold: it must use available input and reuse information to choose a representation or placement before the cost is incurred.
- Conclusion-first test: 若成功，最谨慎的结论只能是：for a fixed service operation, an explicitly defined initialization-aware decision changes the measured Pareto boundary; it does not generalize without its reuse assumptions.
- Exact structural mapping, tension or manipulated constraint: warm reuse benefit ↔ cold setup/metadata/transfer cost.
- Counterfactual consequence if the idea were true: the runtime would choose a different mapping/representation given a declared reuse horizon.
- Likely generic/current-union/changed-object risk: medium-high; may be routine cache admission or scheduling.
- Evidence needed before it can become a locator: one current runtime path, exact lifetime/initialization semantics, and a current strong baseline.
- Relation to existing seed/family: `FRESH_SKETCH`.
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S2-103-06`

- Engine: `JANUSIAN_TENSION`
- Perspective role: `END_USER`
- Starting anchor or hunch: aggressive fusion removes launches but can force a representation that increases transfer, fallback or memory pressure in a downstream stage.
- Exact public anchor candidate and version/date if already known: public compiler/runtime source with a version to be frozen after RQ selection.
- Intended source role: `CONTRARY`
- Two-sentence idea sketch: Consider a legality-aware fuse-or-materialize decision for a fixed operator boundary where neither fewer launches nor fewer transfers is universally preferred. The possible contribution is a target-specific decision rule with a full-cost no-gain region, not a generic fusion pass.
- Conclusion-first test: 若成功，最谨慎的结论只能是：a compiler can select between two semantically equivalent legal boundaries using a specified cost signal, with both launch and downstream representation costs charged.
- Exact structural mapping, tension or manipulated constraint: launch reduction ↔ representation/transfer expansion.
- Counterfactual consequence if the idea were true: the compiler would intentionally decline a legal fusion in some inputs/configurations.
- Likely generic/current-union/changed-object risk: high; ordinary fusion/defusion policy.
- Evidence needed before it can become a locator: named native fusion semantics, a source-supported bottleneck and an atomic decision not already expressible by current cost models.
- Relation to existing seed/family: `FRESH_SKETCH`; no claim that a group-repository graph establishes the residual.
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S2-103-07`

- Engine: `ABSTRACTION_LADDER`
- Perspective role: `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: operator-level measurements can attribute a gain to low-bit compute while an adjacent host-side launch, synchronization, or fallback path determines the service-level outcome.
- Exact public anchor candidate and version/date if already known: a public single-GPU serving benchmark/trace with version to be selected after RQ convergence.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Ask whether a benchmark/measurement contribution can expose when a stated low-bit or NDP acceleration changes the rank of complete pipelines after previously omitted adjacent costs are included. This is not a dashboard proposal: the endpoint must be a stable, decision-changing measurement conclusion with a held-out falsifier.
- Conclusion-first test: 若成功，最谨慎的结论只能是：under a declared carrier and denominator, a repeatable attribution rule identifies a ranking reversal or no-gain region; it makes no deployment-wide claim.
- Exact structural mapping, tension or manipulated constraint: operator microbenchmark ↔ complete service/graph denominator.
- Counterfactual consequence if the idea were true: system designers would select a different optimization target or benchmark interpretation.
- Likely generic/current-union/changed-object risk: medium-high; must avoid merely collecting profiles.
- Evidence needed before it can become a locator: canonical/public carrier, exact estimand, confound route, and a decision threshold.
- Relation to existing seed/family: `FRESH_SKETCH`.
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S2-103-08`

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspective role: `HARDWARE_ARCHITECT`
- Starting anchor or hunch: address remapping and allocation reuse can reduce one transfer but impose fragmentation, metadata or synchronization costs on later operators.
- Exact public anchor candidate and version/date if already known: `uSFrances/ndp-sim` commit `e299b2804448242d1589b3e58ed7c5a9a5eca09f`.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Explore a constrained remap-or-materialize construction that chooses one representation boundary jointly with future reuse under fixed alignment and address semantics. The seed is invalid if it reduces to a parameter choice in an existing remapper or merely changes the simulated platform.
- Conclusion-first test: 若成功，最谨慎的结论只能是：a legal cross-stage allocation/remapping construction changes full traffic plus metadata cost on a declared public plan; it does not claim hardware implementation results.
- Exact structural mapping, tension or manipulated constraint: allocation reuse/remap savings ↔ fragmentation, metadata and synchronization obligations.
- Counterfactual consequence if the idea were true: a compiler/planner would materialize rather than reuse, or vice versa, under a finite criterion.
- Likely generic/current-union/changed-object risk: high; may collapse to generic allocator/remapper policy.
- Evidence needed before it can become a locator: formal/legal remapping rules, observable full-cost components, and a current implementation comparison.
- Relation to existing seed/family: `FRESH_SKETCH`; must not reuse terminal PackRoute or SegmentedScale object/guarantee.
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Clustering and genealogy

| Cluster | Seed IDs | Shared object/mechanism | Material differences | Representative seed |
|---|---|---|---|---|
| Cross-stage representation/transport | 01, 04, 08 | legal layout/remap plus data movement | IR boundary vs placement/transport vs allocation reuse | 01 |
| Low-bit downstream transfer | 02, 06 | local acceleration shifts downstream cost | representation consumer vs fuse/materialize decision | 02 |
| Heterogeneous full-cost boundary | 03, 05, 07 | local gain can reverse under complete denominator | partitioning vs cold/warm setup vs measurement conclusion | 03 |

## Coverage-constrained convergence

Selection is frozen before any external evidence lookup. The three selected seeds keep non-dominated combinations of compiler representation, heterogeneous placement, and measurement endpoint; remaining seeds are retained as non-evidence backlog.

| Selected seed | Why this preserves portfolio coverage | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| S2-103-01 | Compiler/IR representation route | one public DeepSeek-style stage-plan carrier with legal cross-stage layout/remap/reuse semantics | S2-103-RQ01 |
| S2-103-03 | Heterogeneous placement route | one fixed GPU–NDP operator/graph boundary with transfer and fallback included | S2-103-RQ02 |
| S2-103-07 | Measurement/characterization route | one public single-GPU inference carrier and exact end-to-end attribution estimand | S2-103-RQ03 |

## Append-only backlog

`S2-103-02`, `S2-103-04`, `S2-103-05`, `S2-103-06`, and `S2-103-08` are non-evidence backlog only. They may not become locators in this assignment unless a pre-evidence mechanical duplicate/terminal rule selects an already frozen reserve route; no evidence outcome may cause replacement.

## Advisory

- Engines used: 8/8
- Perspective roles used: compiler/backend engineer, maintainer, hardware architect, operator, end user, measurement reviewer
- Largest object/surface share: cross-stage layout/remap/transport (3/8)
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 这组想法只测试“局部优化把成本转移到相邻阶段”是否能形成同对象、全成本、可反证的问题；并未假定任何组内仓库、NDP 硬件或公开 runtime 已存在该缺口。
