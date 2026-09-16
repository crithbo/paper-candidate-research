# KNATIVE-DRAIN-CREDIT — Credit-constrained revision draining for Knative Serving

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O2_BOTTLENECK_TRANSFER`
- Domain tags: `SERVERLESS_RUNTIME`, `KUBERNETES`, `ONLINE_ALGORITHM`
- Contribution route: `N2`
- Discovery date: 2026-08-10
- Discovery method revision: production `v2/v8.1 + v8.6 + v8.7`

## Research question

For an unchanged Knative Serving Service/Revision HTTP contract, can an online
drain-credit algorithm jointly decide (i) when a draining revision stops
receiving traffic, (ii) how many queued requests may be released to it, and
(iii) when traffic is safely migrated through the Activator, to reduce
completion-tail latency and futile cold-start/routing churn while preserving
the platform’s readiness and request semantics?

## Paper genealogy

- Anchor: Knative’s current request-flow/probing semantics.
- Key predecessors: Knative readiness rewrite/aggressive probing; Azure
  Functions production-workload characterization.
- Competing work: predictive prewarming-plus-dispatch MPC; PREEMPT-FaaS’s
  criticality-priority orchestration.
- Counter-evidence: current Knative already aggregates probes, buffers through
  Activator, reprograms routes at a burst threshold, and exposes drain
  behavior.  These are strong baselines, not proof that a distinct online
  decision rule is covered.
- Artifact / natural carrier: Microsoft’s public Azure Functions 2021 trace
  contains arrival, completion, and duration; Knative’s own Service/Revision
  semantics supply a native execution object.
- Search boundary: official Knative docs/source/release and original system
  papers checked to 2026-08-10; novelty remains `SEARCH_BOUNDED_OPEN` pending
  independent Stage 0 audit.

## Topic-origin card

- Trigger: cold start/probing reduces one latency cost but moves the relevant
  decision to readiness, route reconfiguration, queued work, and drain state.
- Quantitative anchor: Knative documents a burst transition based on
  `current_demand + target-burst-capacity > pods * concurrency-target`; Azure’s
  public trace provides millisecond arrival/departure/duration observations.
- Baseline limitation: fixed readiness and burst predicates do not use an
  explicit remaining-work completion-risk budget at a revision transition.
- Structural cause: admission, drain, and scale routing observe different
  partial state and are currently composed as predicates rather than one
  bounded online decision.
- Decision variable: nonnegative drain credits per revision and a migration
  decision based on observed active/queued work, remaining grace, and an
  empirical duration quantile; no prewarming, priority, or application API
  change is assumed.
- Candidate venue family: systems/runtime (ATC/SoCC/EuroSys-class); Tier B
  unless a general theorem and multi-platform evidence materialize.

## Exact object

One Knative Serving `Service` revision lifecycle and its unchanged HTTP request
semantics: traffic is delivered either directly or via Activator to the native
Queue-Proxy/user container; accepted requests retain the existing runtime and
Kubernetes termination semantics.  The candidate does not change user image,
function output, API, consistency model, or requested concurrency contract.

## Named fair baselines

- Deployment/default: Knative Serving `v1.23.0` (`7ed4aa2`) with default
  readiness behavior and current routing.
- Strong configurable baseline: the same release with documented custom probes,
  `target-burst-capacity`, `concurrency-target`, direct/Activator path, and
  native drain timeout/resource configuration grid.
- Recent algorithmic baselines: proactive prewarm-plus-dispatch MPC; PREEMPT-
  FaaS priority orchestration.
- Ceiling: trace-informed offline policy with future arrival/duration knowledge,
  reported only as an unattainable ceiling.

## Mechanism hypothesis

`DRAIN-CREDIT` maintains a conservative completion-risk ledger for a draining
revision.  It admits a queued request only when its credit remains nonnegative
after reserving a chosen quantile of active plus newly admitted work before the
native grace boundary.  Otherwise it atomically withdraws routability and
migrates the request through the existing Activator path.  The algorithm is
not a static threshold: its state is per-revision active/queued work, grace
budget, and a bounded duration model, and its output is a coupled
admission–withdrawal–migration action.

## Competing mechanisms

- Mechanism A — fixed Knative predicates: use readiness and burst/concurrency
  settings; prediction: little response to duration-tail heterogeneity.
- Mechanism B — proactive prewarm/dispatch: forecast arrivals and create
  capacity; prediction: helps cold starts but consumes warm resources and does
  not establish a drain-completion invariant.
- Mechanism C — `DRAIN-CREDIT`: account for residual in-flight risk at a
  revision transition; prediction: reduces late completion tails/retries at a
  comparable warm-pod budget, especially for heterogeneous duration traces.
- Preferred: C, because its state and invariant differ from a fixed setting,
  a forecast-only policy, and criticality priority.

## Decision-rule / resource facet comparison

| Facet | Current Knative union | MPC / PREEMPT-style work | DRAIN-CREDIT residual |
|---|---|---|---|
| Decision rule | readiness + burst/concurrency predicates | forecast/prewarm or priority allocation | online credit feasibility plus atomic drain/migrate action |
| Information | probes, demand/capacity, configuration | forecast or declared criticality | active/queued counts, grace budget, bounded duration quantile; no future arrivals/priority |
| Complexity/resource | native control/data plane and configured thresholds | forecast/model or priority controller overhead | O(1) per arrival/transition; per-revision counters and bounded quantile state |
| Quality/guarantee | readiness/routing semantics | latency/resource objective or priority target | safety invariant: candidate never admits after its conservative completion credit is exhausted; no stronger application-completion guarantee claimed |
| Full cost | probes, queue proxy, activator/routing, warm pods | forecasting/priority + platform costs | all native costs plus counter/quantile update and migration/queue delay |
| Generalization / no-gain | static settings | depends on prediction/criticality | no gain for homogeneous short calls, ample grace, or no revision transitions |

## Seed-distance test

- Relative to Knative: changes the online decision rule and information state,
  not the Service object or merely a configuration value.
- Relative to MPC: replaces future-arrival forecasting/prewarming with a
  transition-local completion-risk invariant.
- Relative to PREEMPT-FaaS: does not prioritize classes; it controls residual
  work during a native revision drain.
- Method-name deletion: “given only outstanding work, a termination budget and
  observed duration bounds, decide jointly whether to admit, withdraw, or
  migrate a request while preserving the same service response.”

## Candidate paper claim

A bounded online algorithm can reduce tail completion/retry cost at revision
transitions relative to fair native and algorithmic baselines, without changing
Knative HTTP semantics and while accounting for full queue/probe/routing/warm
resource cost.  This is a hypothesis, not a completed result.

## Evidence route

`PERFORMANCE` and `MEASUREMENT_MECHANISM`.

## Software/algorithm performance admissibility

- Same-function: identical Service/Revision HTTP outcomes and native failure
  semantics; no new user API or relaxed availability guarantee.
- Algorithmic delta: credit-constrained joint admission/withdrawal/migration,
  not setting selection.
- Full-cost: end-to-end request time, queue/retry count, route/probe actions,
  CPU/memory of counters, warm-pod time, and any migrated-request delay.
- Generality: duration heterogeneity and transition pressure are measurable in
  public Azure trace; no-gain regions are explicit above.
- Not routine tuning: fixed threshold grids are a baseline; the candidate’s
  rule uses state unavailable to those fixed predicates and carries a safety
  invariant.

## Current collision classification

- DIRECT_FATAL: none found within stated boundary.
- DIRECT_SUBTRACT: native readiness/Activator/routing composition; MPC
  prewarming/dispatch; PREEMPT-FaaS priority orchestration.
- METHODOLOGICAL_ADJACENT: generic serverless schedulers and performance models.
- DEPLOYMENT_BASELINE: Knative configurable controls.
- SEARCH_BOUNDED_OPEN: a transition-local bounded completion-credit algorithm
  on this exact Knative object was not found; not a novelty proof.

## Decisive falsifier

On a fixed public trace replay, if the candidate cannot simultaneously preserve
native request semantics and beat the best fair Knative configuration on both
(a) p99 completion/retry penalty and (b) warm-pod-time-adjusted full cost, it
is dropped.  A finding that the native configuration grid reproduces the same
credit decision at the same information and cost also drops the topic.

## Executable evidence path

### Current upstream reality check

- Frozen current upstream: Knative Serving `knative-v1.23.0` / `7ed4aa2`,
  released 2026-07-29; checked 2026-08-10.
- Official docs: Serving overview, request flow, architecture, and probe
  configuration pages.
- Actual source/interface surface: `Service`, `Route`, `Configuration`,
  `Revision`, `PodAutoscaler`, Activator and Queue-Proxy; current release
  records native queue-proxy graceful-websocket and queue metrics changes.
- Default/non-default checks: default TCP readiness; user readiness/liveness/
  startup probes; aggressive probing; direct vs Activator routing;
  `target-burst-capacity`, `concurrency-target`, queue-proxy drain/resource and
  operator configuration.
- Supporting gap evidence: official semantics describe readiness aggregation and
  fixed burst/capacity routing, but no documented transition-local duration-
  credit invariant.
- Contrary evidence: current release already drains, probes, buffers, routes,
  and exposes metrics; these are included in the strongest union.  This brief
  claims a new algorithm, not that an interface/action is absent.

### Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`.
- Complete action: integrate the credit state at Queue-Proxy/Activator revision
  transition; all three outcomes (admit, withdraw, migrate) invoke native paths.
- Comparator/native semantics: same Knative Service, Queue-Proxy, Activator,
  Kubernetes readiness and termination; compare native default/configured
  settings and published algorithms using identical arrival/duration inputs.
- Boundary: no response synthesis, no modified user function, no dropped
  accepted request used as a success; only native timeout/failure remains.
- Denominator/full cost: request arrival-to-terminal outcome, queue/retry,
  activator/routing actions, control CPU/memory, and warm-pod residency.
- Small witness: one Service with two deterministic HTTP handlers (short and
  long) and a forced revision transition; verify that each request has exactly
  one terminal native response and no credit-negative admission occurs.
- Finite closure: (1) pin released Knative manifests and source; (2) add an
  in-tree/sidecar-equivalent research patch at the native transition point;
  (3) audit a 20-window Azure trace subset plus witness; (4) enumerate baseline
  configuration grid; (5) verify response and cost ledger.
- Resources: released Knative source/manifests, a local CPU Kubernetes setup,
  and Azure public trace.  No proprietary hardware required.
- Structural failure: required integration only works by bypassing Queue-Proxy/
  Activator semantics, changing the user contract, or a fair current baseline
  reproduces the same rule.

### 72-hour first evidence

Preclaim only: run the witness plus 20 trace windows under default/configured
Knative and the frozen credit rule; reject the topic on any semantic mismatch,
credit-invariant violation, or no two-axis full-cost improvement.

### AI core fraction and critical path

`AI_CORE_CONDITIONAL` (about 60%): trace parser, rule implementation, manifest
pinning, response/cost audit, and comparison harness are automatable; native
Kubernetes integration and semantic review require human supervision.

## Q1/Q2 sufficiency hypothesis

- Q2: credible if the invariant, full-cost multi-trace benefit, no-gain map,
  and native semantic audit survive.
- Q1: requires a stronger online bound plus broader production-like trace and
  deployment evidence.
- Stage B: independent latest-collision review, diverse runtime workloads,
  scale/resource sensitivity, and fault/termination boundary analysis.

## Non-relaxable quality audit

- Same-object: frozen native Knative Service/Revision request lifecycle.
- Latest collision: official current v1.23.0 and recent MPC/PREEMPT work
  subtracted; bounded open, not first claim.
- Strong fair baselines: default/configured Knative plus algorithmic work.
- Natural input: Azure Functions public arrival/completion/duration trace.
- Full-cost: explicit above.
- Reproducibility: released source, manifests, trace and finite witness.
- Evidence honesty: no current result or interface absence is claimed.

## Dual-axis score

- Academic value: `45/70`
- AI executability bonus: `16/30`
- Total: `61/100`

The tier is retained on structural potential, not the score alone; independent
Stage 0 must test the action-gap and Q2 calibration.
