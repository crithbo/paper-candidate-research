# Source104 S3 离线发散 Seed Pool

本池在外部检索、下载、资源动作和科学判断之前一次性冻结。所有 seed 都是非证据性草图：不声称新颖性、公开 trace 已具备某字段、当前系统不存在某能力，或任何性能结果。

## Pool metadata

- Assignment / lane: `DISCOVERY-S3-20260824-SOURCE104-PUBLIC-CARRIER-DIVERSIFIED-V1` / `DISCOVERY_S3`
- Frozen profile: `SOURCE104_PUBLIC_CARRIER_FIRST_DIVERSIFIED_LLM_VLA_V1`
- Seed ceiling: `<=12`; 本池: `10`
- RQ candidate ceiling after convergence: `<=8`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`
- Source104 isolation: no Rule Audit output, Source103 temporary judgment, or group-repository input was loaded.

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S3-104-01, S3-104-07 |
| `PROBLEM_REFRAMING` | yes | S3-104-02 |
| `CONSTRAINT_MANIPULATION` | yes | S3-104-03 |
| `NEGATION_OR_INVERSION` | yes | S3-104-04 |
| `ABSTRACTION_LADDER` | yes | S3-104-05 |
| `ADJACENT_POSSIBLE_OR_BOUNDARY` | yes | S3-104-06 |
| `JANUSIAN_TENSION` | yes | S3-104-08 |
| `COMPOSE_DECOMPOSE_SIMPLIFY` | yes | S3-104-09, S3-104-10 |

## Seed records

### `S3-104-01`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective role: `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: An agent trace is a causal event graph—LLM turn, tool launch, tool completion, append, next turn—not an independent arrival process.
- Exact public anchor candidate and version/date if already known: A versioned public coding-agent trace/replay artifact with ordered timing events.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A causal trace-replay generator could preserve the dependencies between a tool completion, its appended context, and the next model invocation while making only declared timing substitutions. This would be a benchmark-generation or measurement method only if it changes a falsifiable serving conclusion relative to marginal/inter-arrival replay and charges all replay transformations.
- Conclusion-first test: The narrow conclusion would be that preserving one named causal dependency changes a defined queueing, TTFT, or resource-provisioning conclusion for the same public trace.
- Exact structural mapping, tension or manipulated constraint: Workflow DAG replay maps to event-causal simulation; tool completions are causal parents rather than exogenous arrival timestamps.
- Counterfactual consequence if the idea were true: A serving benchmark would use an event-causal generator rather than independently resampling timestamps.
- Likely generic/current-union/changed-object risk: Existing trace replay tooling may already preserve this entire relation.
- Evidence needed before it can become a locator: Public trace schema, replay implementation, a stated current replay assumption, and a decision endpoint.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-104-02`

- Engine: `PROBLEM_REFRAMING`
- Perspective role: `RUNTIME_OR_MEMORY_ENGINEER`
- Starting anchor or hunch: The useful estimand may be trace-native warm-state debt—the re-prefill work caused by a causal boundary—not headline cache-hit rate.
- Exact public anchor candidate and version/date if already known: Public multi-turn trace containing input growth, timing, and cache/accounting fields.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A trace-native estimator might separate unavoidable new input from previously observed context that becomes recomputed after a defined boundary such as a human/tool gap or context compaction. It is viable only if the definition is provider- and semantics-aware, gives an action beyond cache policy, and changes a declared capacity/full-cost conclusion.
- Conclusion-first test: The narrow conclusion would be that a certified lower/upper bound on re-prefill debt changes one stated workload provisioning or evaluation decision.
- Exact structural mapping, tension or manipulated constraint: Cache accounting is reframed as a causal recomputation debt ledger rather than an optimization score.
- Counterfactual consequence if the idea were true: Benchmark reports or capacity models use a different denominator and uncertainty statement.
- Likely generic/current-union/changed-object risk: May be a dashboard metric or already fully measured by existing trace analysis.
- Evidence needed before it can become a locator: Exact provider fields, documented semantics, a decision endpoint, and a contrary current metric.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-104-03`

- Engine: `CONSTRAINT_MANIPULATION`
- Perspective role: `SYSTEM_ARCHITECT`
- Starting anchor or hunch: Tool-result continuations and user-initiated turns may belong to structurally distinct readiness processes, even when their request sizes look similar.
- Exact public anchor candidate and version/date if already known: Versioned public agent trace with trigger type and event timing.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A workload generator could retain trigger-conditioned transition structure and test whether a serving conclusion reverses when this relation is destroyed while marginal lengths are held fixed. The action must be a trace-generation or evaluation construction, not a queue priority or cache-retention policy.
- Conclusion-first test: The narrow conclusion would be that a trigger-conditioned structural relation is required for one reproducible benchmark conclusion.
- Exact structural mapping, tension or manipulated constraint: Two observed trigger classes map to different renewal/causal processes; the ablation removes only the class relation.
- Counterfactual consequence if the idea were true: Evaluation traces preserve trigger-conditioned dependencies.
- Likely generic/current-union/changed-object risk: Existing agent trace suites may already make this split and generator models may already encode it.
- Evidence needed before it can become a locator: Public schema, current generator/replay route, and a concrete conclusion that changes.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-104-04`

- Engine: `NEGATION_OR_INVERSION`
- Perspective role: `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: Provider-exposed “cached input” fields may not be interchangeable with an open runtime's exact token/block reuse semantics.
- Exact public anchor candidate and version/date if already known: Public trace schema that records provider cache/accounting fields and public runtime specification/source.
- Intended source role: `CURRENT`
- Two-sentence idea sketch: A semantic calibration contract could classify which portions of a public agent trace are sufficient for which open-runtime replay or cache claim, and which must remain bounded. It becomes a paper route only if a concrete mapping/checker changes a benchmark validity conclusion rather than restating that APIs differ.
- Conclusion-first test: The narrow conclusion would be that a named trace-to-runtime replay claim is valid only under an explicit semantic contract with a reproducible falsifier.
- Exact structural mapping, tension or manipulated constraint: Provider billing/accounting fields are separated from runtime KV-block semantics.
- Counterfactual consequence if the idea were true: A public benchmark receives a bounded claim ceiling or a semantics-checked conversion rule.
- Likely generic/current-union/changed-object risk: Could reduce to documentation or a schema wrapper without a decision-changing estimator.
- Evidence needed before it can become a locator: Exact public field definitions, runtime semantics, and an existing benchmark/replay claim.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-104-05`

- Engine: `ABSTRACTION_LADDER`
- Perspective role: `RUNTIME_OR_MEMORY_ENGINEER`
- Starting anchor or hunch: Agent multi-turn traces may admit a stable “context-growth episode” abstraction with different memory/provisioning consequences than sessions or requests alone.
- Exact public anchor candidate and version/date if already known: Public trace with ordered round-level input/output sizes and timing.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: An episode segmentation algorithm would be relevant only if its boundaries are observable from public data, preserve trace semantics, and produce a new estimator or benchmark construction whose failure condition is explicit. It must not merely rename sessionization or implement a generic cache lifetime rule.
- Conclusion-first test: The narrow conclusion would be that one observable episode abstraction gives a reproducible, more decision-relevant workload unit for a stated serving analysis.
- Exact structural mapping, tension or manipulated constraint: Round sequences are abstracted to growth episodes; user/tool interruptions act as potential boundary witnesses.
- Counterfactual consequence if the idea were true: One planning/evaluation unit changes while raw event ordering remains intact.
- Likely generic/current-union/changed-object risk: Existing traces may already define equivalent sessions/requests/rounds and no distinct conclusion may follow.
- Evidence needed before it can become a locator: Trace data dictionary, existing segmentation semantics, and a finite counterexample.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-104-06`

- Engine: `ADJACENT_POSSIBLE_OR_BOUNDARY`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: Repeated tool-loop append lengths may imply a natural prefill microbatch geometry whose evaluation needs a trace-preserving construction.
- Exact public anchor candidate and version/date if already known: Public agent trace and a public serving replay harness.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: The possible contribution is a workload-derived geometry panel that tests a fixed backend/compile boundary, not a runtime selector or scheduling controller. It must demonstrate that preserving append-length correlation changes a fixed same-object backend conclusion and include warm-up, graph-capture, and full-cost accounting.
- Conclusion-first test: The narrow conclusion would be that an append-geometry relation is necessary to evaluate one named backend/compile decision.
- Exact structural mapping, tension or manipulated constraint: Tool-loop append lengths map to prefill token budgets; trace order constrains grouping.
- Counterfactual consequence if the idea were true: A benchmark/replay construction changes the backend evaluation input panel.
- Likely generic/current-union/changed-object risk: May collapse to existing length-aware prefill work or a synthetic trace recipe.
- Evidence needed before it can become a locator: Public trace fields, current replay/backend path, and closest length-aware comparator.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-104-07`

- Engine: `BISOCIATION_STRUCTURAL_TRANSFER`
- Perspective role: `THEORIST`
- Starting anchor or hunch: Public agent traces can be modeled as partially observed causal processes, so replay equivalence may require an information contract rather than statistical similarity alone.
- Exact public anchor candidate and version/date if already known: Versioned public trace format and replay artifact.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A formal or algorithmic contribution could define the minimum observable fields needed for a replay to preserve a stated queueing/cost estimand, and give a counterexample when a field is removed. This must yield a nontrivial sufficient/necessary condition or checker, not an informal data-quality checklist.
- Conclusion-first test: The narrow conclusion would be that a specified trace schema is sufficient or insufficient for one replay estimand under a formalized information contract.
- Exact structural mapping, tension or manipulated constraint: Causal identifiability maps to trace replay observability; hidden content/timing state is an information boundary.
- Counterfactual consequence if the idea were true: Trace authors can validate whether a released dataset supports a named system claim.
- Likely generic/current-union/changed-object risk: May be too broad, become a generic schema/checker, or be covered by benchmark methodology.
- Evidence needed before it can become a locator: Exact schema, existing replay claim, precise estimand, and a finite counterexample/oracle.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-104-08`

- Engine: `JANUSIAN_TENSION`
- Perspective role: `END_USER`
- Starting anchor or hunch: Human-paced pauses and autonomous tool bursts can coexist within one agent session, so a single session-level distribution may hide a decision-relevant transition.
- Exact public anchor candidate and version/date if already known: Public agent trace with explicit human/tool event ordering.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A measurement route could identify a stable transition statistic and show that it changes a full-cost or SLO conclusion under held-out traces. It must lead to a concrete evaluator/model/representation action and not a generic cache retention rule.
- Conclusion-first test: The narrow conclusion would be that a stated within-session transition changes one reproducible serving evaluation conclusion.
- Exact structural mapping, tension or manipulated constraint: Human and autonomous phases are modeled as alternating regimes inside one session.
- Counterfactual consequence if the idea were true: Evaluation/reporting conditions on phase transitions rather than session aggregate only.
- Likely generic/current-union/changed-object risk: TraceLab or existing cache work may already quantify this exact phenomenon.
- Evidence needed before it can become a locator: Public phase labels/timing, explicit current metric, and a held-out test route.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-104-09`

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspective role: `SYSTEM_ARCHITECT`
- Starting anchor or hunch: A trace replay may need to preserve the joint relation among tool latency, appended-token mass, and context growth, rather than each marginal independently.
- Exact public anchor candidate and version/date if already known: Public coding-agent trace with round timing, tool records, and input/output token accounting.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A dependency-preserving replay algorithm could be compared against independent-marginal synthesis using a fixed downstream queueing or memory estimator. It must specify a minimal graph/factorization and demonstrate a non-generic decision consequence, with transformations and uncertainty fully charged.
- Conclusion-first test: The narrow conclusion would be that one joint dependency is indispensable for reproducing a named system-level ordering or threshold.
- Exact structural mapping, tension or manipulated constraint: A three-variable dependence maps to a trace-generation factor graph; the ablation breaks only that edge.
- Counterfactual consequence if the idea were true: Trace-driven evaluation uses a dependency-preserving generator.
- Likely generic/current-union/changed-object risk: Existing replay tools may already preserve all event relations or the proposal may be standard statistical modeling.
- Evidence needed before it can become a locator: Data schema, replay implementation, exact baseline generator, and a finite estimand.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

### `S3-104-10`

- Engine: `COMPOSE_DECOMPOSE_SIMPLIFY`
- Perspective role: `MEASUREMENT_REVIEWER`
- Starting anchor or hunch: Trace sanitization may preserve sufficient aggregate timing/accounting for some system conclusions but erase the token identity needed for others.
- Exact public anchor candidate and version/date if already known: Public sanitized agent trace release and its schema/sanitizer.
- Intended source role: `ANCHOR`
- Two-sentence idea sketch: A claim-aware release contract could automatically partition valid conclusions into trace-supported and unidentifiable classes, then test the boundary on public raw-to-sanitized examples where permitted. It must yield an executable or formal decision procedure and a conclusion-changing endpoint, not a checklist.
- Conclusion-first test: The narrow conclusion would be that a given sanitization contract certifies or rejects one named serving-analysis claim class.
- Exact structural mapping, tension or manipulated constraint: Sanitization is modeled as an information-reducing map; estimand identifiability is the preserved property.
- Counterfactual consequence if the idea were true: Public trace users receive machine-checkable claim ceilings before replay or evaluation.
- Likely generic/current-union/changed-object risk: May be a generic privacy/schema proposal or already represented by existing trace documentation.
- Evidence needed before it can become a locator: Public sanitizer/schema, a specified claim class, checker route, and positive/negative examples.
- Relation to existing seed/family: `FRESH_SKETCH`
- Generic-shell noun-swap test: `PASS`
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Clustering and genealogy

| Cluster | Seed IDs | Shared structure | Material differences | Representative |
|---|---|---|---|---|
| Event-causal replay | 01, 03, 09 | Ordered tool/LLM dependencies | event graph, trigger process, joint factorization | S3-104-01 |
| Claim-aware trace semantics | 02, 04, 07, 10 | Information available in public traces | debt estimator, semantic mapping, formal sufficiency, sanitizer contract | S3-104-10 |
| Regime/geometry evaluation | 05, 06, 08 | Within-session natural structure | episode unit, append geometry, phase transition | S3-104-08 |

## Coverage-constrained convergence

Selection was frozen before external evidence lookup. Four candidates preserve distinct replay-construction, semantics-mapping, formal-identifiability, and release-contract endpoints; overlap variants remain backlog rather than being forced into the RQ budget.

| Selected seed | Why this preserves portfolio coverage | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| S3-104-01 | Event-causal replay construction is distinct from metric definition. | Public agent trace replay and a queueing/cost endpoint. | S3-104-RQ01 |
| S3-104-04 | Provider-to-runtime semantic mapping targets a same-claim conversion contract. | Public cache-accounting fields and an open runtime's exact reuse semantics. | S3-104-RQ02 |
| S3-104-07 | Formal minimum-observability condition differs from a replay implementation. | Public schema and a fixed replay estimand. | S3-104-RQ03 |
| S3-104-10 | Sanitization contract targets automatic claim-ceiling certification. | Public sanitizer/schema and a named serving-analysis claim class. | S3-104-RQ04 |

## Append-only backlog

`S3-104-02`, `S3-104-03`, `S3-104-05`, `S3-104-06`, `S3-104-08`, and `S3-104-09` remain non-evidence backlog. They are not scientific negatives and may only re-enter under a later explicit convergence boundary.

## Advisory

- Engines used: 8
- Perspective roles used: `MEASUREMENT_REVIEWER`, `RUNTIME_OR_MEMORY_ENGINEER`, `SYSTEM_ARCHITECT`, `COMPILER_OR_BACKEND_ENGINEER`, `THEORIST`, `END_USER`
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 该池刻意把重点从 prefix-cache policy 移到 trace 的因果 replay、信息可识别性和评测构造；是否已有直接覆盖尚未判断。
