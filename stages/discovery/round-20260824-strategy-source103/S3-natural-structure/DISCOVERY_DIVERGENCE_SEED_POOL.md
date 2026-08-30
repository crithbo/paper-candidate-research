# Source103 S3 离线发散 Seed Pool

本文件在任何外部检索、下载、资源动作或科学判断之前生成。所有 seed 均为可推翻的非证据性草图：不主张新颖性、current absence、性能效果或论文质量。

## Pool metadata

- Assignment / lane: `DISCOVERY-S3-20260824-SOURCE103-LLM-VLA-STRATEGY-V1` / `DISCOVERY_S3`
- Frozen profile: `SOURCE103_USER_LLM_VLA_PUBLIC_SINGLE_GPU_CPU_FIRST_V1`
- Seed ceiling: `<=12`; 本池: `10`
- RQ candidate ceiling after seed convergence: `<=8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Group-repository access: `FORBIDDEN`; no group-repository file was read.

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S3-103-01, S3-103-06 |
| `PROBLEM_REFRAMING` | yes | S3-103-02, S3-103-08 |
| `CONSTRAINT_MANIPULATION` | yes | S3-103-03 |
| `NEGATION_OR_INVERSION` | yes | S3-103-09 |
| `ABSTRACTION_LADDER` | yes | S3-103-04 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S3-103-05 |
| `JANUSIAN_TENSION` | yes | S3-103-07 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S3-103-10 |

## Seed records

### `S3-103-01`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective role: `RUNTIME_OR_MEMORY_ENGINEER`
- Starting anchor or hunch: Public LLM serving systems may expose a versioned prefix forest rather than an unstructured set of KV pages.
- Exact public anchor candidate and version/date if already known: A current open-source LLM-serving runtime with publicly documented prefix caching; version is intentionally unfrozen until anchor lookup.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Treating reusable prefixes as a forest might make the prefix topology itself a memory-layout input, rather than merely an eviction-policy input. A paper-worthy residual would require an exact copy-on-write/page-semantics-preserving representation or operation whose cost and tail behavior differ from the current native representation.
- Conclusion-first test: If supported, the narrow conclusion would be that a measurable prefix-topology law justifies one concrete semantics-preserving KV metadata/layout action under a declared full-cost boundary.
- Exact structural mapping, tension or manipulated constraint: Tree-shared immutable prefixes map to shared persistent-memory objects; branch creation maps to copy-on-write divergence.
- Counterfactual consequence if the idea were true: The runtime's representation or lookup/update path, not only its admission policy, would change.
- Likely generic/current-union/changed-object risk: Existing radix-trie/page-table mechanisms may already absorb the action.
- Evidence needed before it can become a locator: One versioned native prefix-cache implementation locus plus a public workload/trace carrier that can reveal prefix topology.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-103-02`

- Engine: `PROBLEM_REFRAMING`
- Perspective role: `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: The operationally relevant object may be a time-varying prefix-reuse regime, not average cache-hit rate.
- Exact public anchor candidate and version/date if already known: Public serving trace, benchmark trace, or reproducible request-log generator; exact carrier remains to be anchored.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A stable change-point or regime law in reuse, sequence length, and active-session composition could invalidate averages as a sufficient capacity-planning estimand. The contribution would need a held-out falsifier and a decision consequence such as a verifiable memory-provisioning or layout boundary, rather than a dashboard or heuristic controller.
- Conclusion-first test: If supported, the narrow conclusion would be that one explicitly defined aggregate metric hides a stable regime boundary that changes a same-object serving decision.
- Exact structural mapping, tension or manipulated constraint: Aggregate hit-rate reporting is contrasted with conditional distributions over prefix depth, session age, and request phase.
- Counterfactual consequence if the idea were true: A runtime or evaluator would use a different measurable planning denominator.
- Likely generic/current-union/changed-object risk: This may collapse to ordinary workload characterization without a non-controller consequence.
- Evidence needed before it can become a locator: Versioned public trace carrier, stated estimand, and a public default capacity/placement decision to test.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-103-03`

- Engine: `CONSTRAINT_MANIPULATION`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: Natural multimodality in request length or KV block occupancy may create an interface-level boundary between a generic attention path and a specialized kernel/memory layout path.
- Exact public anchor candidate and version/date if already known: A public serving runtime and its current attention backend configuration surface; version remains unfrozen.
- Intended source role: `CURRENT`
- Two-sentence idea sketch: The target is not a generic kernel selector but a fixed, semantics-preserving representation or batching contract that can exploit a naturally recurrent shape class. A viable family must show why the action survives after current backend flags, padding, grouping, and full launch/metadata cost are counted.
- Conclusion-first test: If supported, the narrow conclusion would be that a natural shape class permits one nontrivial same-semantics backend action with an explicit no-gain region.
- Exact structural mapping, tension or manipulated constraint: Fixed-shape compiler specialization is challenged by dynamic serving shape distributions and tail constraints.
- Counterfactual consequence if the idea were true: A current layout or backend interface, rather than only a scheduling choice, would be refined.
- Likely generic/current-union/changed-object risk: May be routine dispatch, retuning, or already available through existing backend configuration.
- Evidence needed before it can become a locator: Current source/flag audit, natural shape distribution, and a candidate action stronger than selection.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-103-04`

- Engine: `ABSTRACTION_LADDER`
- Perspective role: `RUNTIME_OR_MEMORY_ENGINEER`
- Starting anchor or hunch: Session lifetime and KV-page liveness may have a reusable structural law at the allocator interface.
- Exact public anchor candidate and version/date if already known: Public session/prefix-cache workload carrier and a versioned allocator/page-management locus in an open runtime.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: Instead of proposing an eviction rule, this seed asks whether naturally nested lifetimes justify a different exact ownership, reference-count, or free-list representation with lower metadata or fragmentation cost. The object remains the native runtime's KV semantics and must retain copy-on-write legality and include host/device synchronization and metadata costs.
- Conclusion-first test: If supported, the narrow conclusion would be that one observable lifetime structure justifies a representation-level allocator change under the same KV correctness contract.
- Exact structural mapping, tension or manipulated constraint: Nested object lifetimes are mapped to region/arena allocation, while diverging sessions constrain safe reclamation.
- Counterfactual consequence if the idea were true: Allocation bookkeeping or memory-layout construction changes without changing response semantics.
- Likely generic/current-union/changed-object risk: Could be absorbed by current block managers or reduce to a generic allocator optimization.
- Evidence needed before it can become a locator: Current native allocation/reclamation path, workload lifetime carrier, and a minimum legality witness.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-103-05`

- Engine: `ADJACENT_POSSIBLE_OR_BOUNDARY`
- Perspective role: `SYSTEM_ARCHITECT`
- Starting anchor or hunch: Prompt-prefix reuse may induce a natural separation between immutable shared KV material and mutable per-session state that changes data-movement accounting.
- Exact public anchor candidate and version/date if already known: Public prefix-cache runtime documentation/source and a public trace or workload corpus.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: The candidate contribution is an exact transfer/layout boundary for shared versus divergent state, not a claim that all cached bytes are reusable or that any cache policy improves. It must expose copies, page-table updates, synchronization, host overhead, and a natural workload condition under which the boundary is falsified.
- Conclusion-first test: If supported, the narrow conclusion would be that a fixed semantic partition yields a more complete same-object data-movement model or implementation path.
- Exact structural mapping, tension or manipulated constraint: Immutable prefix state is separated from post-divergence mutable state under copy-on-write constraints.
- Counterfactual consequence if the idea were true: The cost model or native transfer construction would distinguish shared and private state explicitly.
- Likely generic/current-union/changed-object risk: The runtime may already implement and account for this separation.
- Evidence needed before it can become a locator: Source-level ownership/transfer path and a trace with observable divergence points.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-103-06`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective role: `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: Prefix reuse may have a heavy-tailed topology analogous to skewed graph neighborhoods, making uniform cache-capacity tests potentially uninformative.
- Exact public anchor candidate and version/date if already known: Reproducible serving trace or benchmark with request/prefix observability; exact public artifact remains to be fixed.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: The research question would be whether a topology-sensitive estimand predicts a decision-relevant tail outcome better than an aggregate reuse measure. A viable result needs a stable law, a counterexample, and a mechanism that changes a benchmark/evaluation conclusion or a non-controller runtime data structure.
- Conclusion-first test: If supported, the narrow conclusion would be that topology-conditioned reuse is necessary for one stated capacity or tail-latency conclusion on a named carrier.
- Exact structural mapping, tension or manipulated constraint: Prefix-sharing degrees map to graph-neighborhood degree distributions; tail requests test the nonuniform region.
- Counterfactual consequence if the idea were true: A common evaluation aggregation or a metadata organization is no longer adequate for the stated decision.
- Likely generic/current-union/changed-object risk: Could be only a descriptive metric or already captured by standard trace analyses.
- Evidence needed before it can become a locator: One named trace, explicit estimand, held-out test, and contrary baseline metric.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-103-07`

- Engine: `JANUSIAN_TENSION`
- Perspective role: `END_USER`
- Starting anchor or hunch: Long-lived sessions can simultaneously provide reuse opportunities and create tail/memory pressure through retained divergent state.
- Exact public anchor candidate and version/date if already known: Open runtime session cache and publicly reproducible multi-turn/agent-serving workload; exact versions are not yet evidence.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: This seed asks whether a natural session-age or divergence structure yields a Pareto boundary that current single-metric evaluation hides. To remain admissible, the resulting action must be a measurable representation, compiler, or evaluation mechanism—not an unconstrained cache controller—and must charge all request, metadata, and transfer costs.
- Conclusion-first test: If supported, the narrow conclusion would be that a named natural session regime reverses a defined full-cost comparison or reveals a stable no-gain region.
- Exact structural mapping, tension or manipulated constraint: Reuse depth and retained-private-state growth are jointly conditioned on session age.
- Counterfactual consequence if the idea were true: A tail-aware full-cost boundary or data representation changes a same-object design decision.
- Likely generic/current-union/changed-object risk: May merely restate cache capacity versus hit-rate tradeoffs.
- Evidence needed before it can become a locator: Natural multi-turn carrier, full-cost denominator, and strongest simple cache baseline.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-103-08`

- Engine: `PROBLEM_REFRAMING`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: The natural structure may live in repeated operator-shape sequences across requests, rather than in individual token lengths.
- Exact public anchor candidate and version/date if already known: Public model-serving graph/trace corpus and a current open backend; exact artifact is unfrozen.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: If stable shape-sequence motifs exist, they may support a fixed compilation or memory-plan artifact whose setup cost is amortized by a declared recurrence condition. The candidate must retain graph and quantization semantics, account for compilation/cache lookup cost, and distinguish itself from an ordinary autotuning selector.
- Conclusion-first test: If supported, the narrow conclusion would be that one naturally recurring graph-shape motif warrants one auditable compilation/memory-plan artifact under explicit amortization conditions.
- Exact structural mapping, tension or manipulated constraint: Repeated request shape sequences map to recurring compilation trace motifs, while dynamic inputs bound valid reuse.
- Counterfactual consequence if the idea were true: Compilation caching or memory-plan construction becomes a first-class same-object action.
- Likely generic/current-union/changed-object risk: Existing graph caches, CUDA graphs, or backend specializers may cover the entire action.
- Evidence needed before it can become a locator: Current implementation/flag audit, a public natural carrier, and a fixed artifact/semantic contract.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-103-09`

- Engine: `NEGATION_OR_INVERSION`
- Perspective role: `SYSTEM_ARCHITECT`
- Starting anchor or hunch: A prefix-cache benchmark may report reuse while its carrier lacks the divergence, mutation, or concurrency structure needed to support a deployment conclusion.
- Exact public anchor candidate and version/date if already known: Public prefix-cache benchmark or trace suite; exact benchmark/version remains unfrozen.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: The possible contribution is a benchmark-validity or measurement result if a frozen coverage gap changes the conclusion reached by cache or memory-system comparisons. It must provide an explicit estimand, missing structural factor, counterfactual conclusion, and held-out falsifier; it cannot be a dashboard or benchmark expansion alone.
- Conclusion-first test: If supported, the narrow conclusion would be that a named benchmark cannot support one specific deployment claim without a stated structural panel or measurement correction.
- Exact structural mapping, tension or manipulated constraint: Observed reuse is inverted into a test of whether omitted divergence/concurrency factors change the same conclusion.
- Counterfactual consequence if the idea were true: A research evaluation or runtime decision would use a corrected carrier or disclosed claim ceiling.
- Likely generic/current-union/changed-object risk: Could be a generic benchmark complaint with no decision-changing endpoint.
- Evidence needed before it can become a locator: Benchmark specification, exact claim endpoint, public counter-carrier, and a held-out evaluation rule.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-103-10`

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspective role: `RUNTIME_OR_MEMORY_ENGINEER`
- Starting anchor or hunch: Serving requests may decompose into a common-prefix stage and a variable suffix stage with different natural locality and accounting requirements.
- Exact public anchor candidate and version/date if already known: Public LLM-serving execution trace plus a versioned runtime prefill/decode and prefix-cache path.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A candidate family would ask whether an exact decomposition enables a distinct data structure, memory-plan, or cost-model action that remains valid across the native prefill/decode interface. It cannot merely re-label continuous batching; it must specify the state handoff, complete cost denominator, and a natural condition where decomposition fails.
- Conclusion-first test: If supported, the narrow conclusion would be that one observed request decomposition supports a semantics-preserving full-cost refinement beyond a current aggregate path.
- Exact structural mapping, tension or manipulated constraint: Common-prefix processing and variable suffix progression are separated, with their state handoff treated as a cost-bearing interface.
- Counterfactual consequence if the idea were true: The implementation or evaluation uses a different interface-level action and not just a scheduling policy.
- Likely generic/current-union/changed-object risk: Native prefill/decode separation or standard batching may already absorb the proposal.
- Evidence needed before it can become a locator: Current source locus, natural trace, and direct comparison with the native split path.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Clustering and genealogy

| Cluster | Seed IDs | Shared object/mechanism | Material differences | Representative seed |
|---|---|---|---|---|
| Prefix topology and ownership | S3-103-01, S3-103-04, S3-103-05, S3-103-07 | Prefix sharing, lifetime/divergence, KV state | Representation, allocator, transfer boundary, tail-cost consequence | S3-103-01 |
| Shape and execution motifs | S3-103-03, S3-103-08, S3-103-10 | Recurrent serving shapes and execution interfaces | Kernel/layout, compilation artifact, prefill/decode boundary | S3-103-08 |
| Measurement and evaluation structure | S3-103-02, S3-103-06, S3-103-09 | Natural workload regimes and evaluation validity | Capacity estimand, topology metric, benchmark claim validity | S3-103-02 |

## Coverage-constrained convergence

Selection was frozen before any external evidence lookup. Four seeds retain distinct non-dominated combinations of representation action, lifetime structure, compilation/memory-plan artifact, and benchmark-validity endpoint; the remaining seeds are retained as non-evidence backlog rather than force-filled into the RQ budget.

| Selected seed | Why this preserves portfolio coverage | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| S3-103-01 | Prefix-topology representation and copy-on-write legality are distinct from allocator policy. | Native prefix-cache metadata/layout for a public serving runtime. | S3-103-RQ01 |
| S3-103-04 | Natural liveness structure targets ownership/reclamation representation rather than lookup topology. | Native KV page lifetime/allocation path under shared-prefix semantics. | S3-103-RQ02 |
| S3-103-08 | Recurring shape motifs target a compiler/memory-plan artifact with amortization, not cache state. | Serving graph/shape execution path in a current public backend. | S3-103-RQ03 |
| S3-103-09 | Benchmark validity has a decision-changing measurement endpoint rather than an implementation action. | Public prefix-cache workload/benchmark claim and its structural coverage. | S3-103-RQ04 |

## Append-only backlog

`S3-103-02`, `S3-103-03`, `S3-103-05`, `S3-103-06`, `S3-103-07`, and `S3-103-10` remain append-only non-evidence backlog. They may only re-enter in a later explicit convergence boundary; they are not negative scientific results and do not count toward raw/deep/brief denominators.

## Advisory

- Engines used: 8
- Perspective roles used: `RUNTIME_OR_MEMORY_ENGINEER`, `MEASUREMENT_REVIEWER`, `COMPILER_OR_BACKEND_ENGINEER`, `SYSTEM_ARCHITECT`, `END_USER`
- Largest object/surface share: Prefix/KV serving-memory structure (4 of 10); below a mandatory exclusion threshold.
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 本池保留表示、编译接口和测量三类不同路线；是否有自然载体、是否已被当前实现覆盖、以及是否达到二区形状，均尚未判断。
