# KNATIVE-DRAIN-CREDIT Stage 0 Report

- Lane id: `STAGE0-BATCH-GATE / PRIMARY`
- Assignment id: `STAGE0-P1-20260810-KNATIVE-DRAIN-CREDIT-PRIMARY-V8.7`
- Input freeze SHA-256: `B837EEBE2AFB876512A0E469C7F9B6DB1BEADDBB900BEC8A6964ECA38BAA17FD`
- Cross-assignment contamination declaration: prior assignments supplied no scientific fact or score to this review
- Decision: `STOP`
- Quality tier: `BELOW_Q2_STOP`
- Terminal sentinel: `STOP_SPLIT_COMMIT_POINTS_AND_UNSAFE_REQUEST_MIGRATION`
- Same-ID revision recommended: `false`
- Confidence: `0.91`
- Evidence ceiling: `CURRENT_SOURCE_AND_CONTRACT_STRUCTURAL_NEGATIVE`
- Novelty route assessed: `N2`
- Candidate Q1 venue family: serverless systems/runtime (SoCC/ATC/EuroSys/SOSP family)
- Stage semantics: conditional paper-potential screen; this report does not establish an empirical performance result.

## Structural paper potential vs current readiness

- Structural paper potential if successful: the broad problem—completion-risk-aware draining during serverless transitions—is important. The frozen mechanism, however, does not define one legal same-object action. It combines three decisions that occur on opposite sides of Knative's revision-assignment and request-acceptance commit points.
- Current evidence-acquisition readiness/risk: public Knative source and Azure trace are available; no proprietary resource is needed. Readiness is not the stopping reason.
- Why missing implementation/results/proof/hardware is or is not structurally fatal: none of these missing items is fatal. The fatal issue is that “admit / withdraw / migrate through Activator” cannot be implemented for the unchanged general HTTP contract as one atomic action without either changing the routing object, restricting/replaying HTTP requests, or changing from revision transition to pod draining.

## Discovery provenance

- Opportunity origins: `O2_BOTTLENECK_TRANSFER`
- Domain tags: `SERVERLESS_RUNTIME`, `KUBERNETES`, `ONLINE_ALGORITHM`
- Paper genealogy: Knative native request flow and drain; Azure Functions production traces; proactive MPC prewarm/dispatch; PREEMPT-FaaS orchestration priority.
- Discovery method revision: production `v2/v8.1 + v8.6 + v8.7`
- Backtest reference and status: no backtest result was used as candidate evidence.
- Reminder: method backtest is calibration, not candidate evidence.

## Frozen object and claim

The brief freezes one Knative Serving Service/Revision HTTP lifecycle and promises unchanged request semantics. It proposes an online completion-credit ledger that jointly:

1. decides when a draining revision stops receiving traffic;
2. decides how many queued requests are released to it; and
3. migrates requests through the existing Activator path.

The source-level object is not one atomic decision domain:

- the Ingress/HTTP router chooses a Revision and appends the Revision name/namespace headers;
- the Activator consumes that already-selected `revID`, waits for capacity, and selects a destination only within that Revision;
- Queue-Proxy performs per-pod admission/queueing and graceful drain after the request has reached the selected Revision/pod path.

Consequently, a request in the Activator queue has already been assigned to a Revision, while a request in Queue-Proxy has crossed a later acceptance/proxy boundary. The native Activator is not a cross-Revision migration layer.

## Positive opportunity map

- Natural workloads: real HTTP revision rollouts and pod termination with heterogeneous service times are plausible and important.
- Observed or expected cost/headroom: Knative issue #15649 records real long-request termination/drain interactions; current metrics expose queue depth and invocation duration. This establishes a real boundary, not the candidate's legal action or benefit.
- Mechanism-specific prediction: a lawful pre-assignment credit policy might reduce tail loss/churn, but that would require a new frozen routing object. A same-Revision pod-drain policy might use Activator capacity, but then it is not revision migration. Neither is the current mechanism.

## Named baselines and fairness contract

The finite fair native baseline is one compatible deployed pipeline, not a universal union:

1. `B0`: Knative Serving `knative-v1.23.0`, commit `7ed4aa2ab601e3a33c6552285f6e0d910747351d`, default Route/Activator/Queue-Proxy/KPA behavior.
2. `B1`: the same release under a finite grid covering Route traffic weights, `target-burst-capacity` (including proxy-always behavior), container concurrency target/utilization, stable/panic window, scale-down delay, Revision request/response-start/idle timeout, and legal termination/grace settings.
3. `B2`: same-information native dynamic control using current queue-depth/invocation-duration observations, but restricted to legal pre-assignment routing or same-Revision backend exclusion; this is required to show any remaining algorithmic coupling.
4. Offline future-aware routing is only a ceiling.

MPC and PREEMPT-FaaS are separate algorithmic subtractors because they use forecast/prewarming or priority/orchestration information and different actions. They cannot repair the candidate's object mismatch and are not combined into a fatal universal baseline.

## Collision analysis

### Nearest-prior facet matrix

| Work | Exact object/action | Information | Guarantee/objective | Classification |
|---|---|---|---|---|
| Current Knative v1.23.0 | Revision selected at ingress; Activator queues within selected Revision; Queue-Proxy admits/drains per pod | revision header, ready backends, capacity, queue metrics, native config | native HTTP/readiness/termination semantics | `DIRECT_STRUCTURAL_BASELINE`; absorbs the legal component actions |
| Proactive serverless MPC (arXiv:2508.07640) | OpenWhisk prewarm, dispatch, reclaim | forecast arrivals, queue/warm state | cold-start latency/resource trade-off | `DIRECT_SUBTRACT`, different platform/action/information |
| PREEMPT-FaaS (ECRTS 2026) | Kubernetes orchestration scheduling plus Knative patch | declared priority/criticality | orchestration and cold-start latency for critical instances | `DIRECT_SUBTRACT`, not request-drain migration |
| Harvest serverless (SOSP 2021) | placement/eviction on harvested resources | invocation duration and eviction window | cost/reliability/throughput | evaluation and deadline-risk neighbor |
| DRAIN-CREDIT as frozen | claims one joint cross-layer action | active/queued, grace, duration quantile | unchanged general HTTP plus safe migrate | object/action contract fails |

### Seed-distance and method-name deletion test

After deleting the method name, the claimed operation is: “after or around revision assignment, use remaining work and grace to choose whether an HTTP request is accepted by a draining path or transparently sent elsewhere.” For arbitrary unchanged HTTP, the operation must be decided before any unsafe request has been consumed or produced a response. Current Activator receives an already selected Revision; Queue-Proxy is later still. The remaining legal choices are therefore either pre-assignment traffic control or same-Revision backend selection. This deletion test exposes a changed problem rather than a distinct frozen N2.

## Competing mechanism decision

- Selected mechanism: none; frozen `DRAIN-CREDIT` is rejected.
- Registered backup: none under this topic ID.
- Pivot boundary: a future new ID must choose exactly one of (a) pre-assignment, replay-free revision rollout routing, or (b) same-Revision pod-drain backend admission. It may not call one the other or migrate accepted arbitrary HTTP requests.

## Residual paper kernel

No Q2-grade residual remains under the frozen contract.

- If “migrate” means changing the already selected Revision, the operation is not available in Activator and safe transparent replay is not guaranteed for arbitrary HTTP methods, request bodies, streaming, or partially emitted responses.
- If “migrate” means selecting another pod in the same Revision, current Activator throttling/readiness already chooses among ready same-Revision backends; the revision-transition claim disappears.
- If “withdraw” merely flips readiness/routing earlier based on a duration quantile, the mechanism reduces to a controller/threshold over native route and drain actions unless a new pre-assignment online problem and nontrivial guarantee are frozen.

The topic cannot be saved by implementation effort alone. Closing the gap requires changing the decision locus or HTTP guarantee, which is a new object/mechanism contract.

## Evidence route

- `PERFORMANCE / MEASUREMENT_MECHANISM`

The proposed route is useful for a successor but cannot validate the current cross-layer action.

## Performance-optimization admissibility

- Same-function contract: fails for cross-Revision migration of an already accepted arbitrary HTTP request; replay may duplicate non-idempotent effects or cannot reproduce a streamed/partial response.
- Algorithmic delta: once illegal migration is removed, only a duration-aware drain/routing trigger is specified; no nontrivial online bound or distinct legal action remains.
- Full-cost ledger: the brief correctly lists request latency, queue/retry, routing, control CPU/memory and warm-pod time, but omits the decisive cost/semantics of request buffering, body retention, replay, duplicate suppression, routing propagation, and partial-response handling.
- Strong-implementation fairness: native Route + Activator + Queue-Proxy + KPA form one actual compatible pipeline and must be compared jointly.
- Generality and failure boundary: GET-only/idempotent-only or buffered-body-only operation would narrow the HTTP contract and requires a new ID.
- Why not routine tuning: the proposed invariant might avoid routine tuning only after a lawful single decision point and nontrivial competitive/safety guarantee are defined; neither exists here.

## Q1/Q2 paper shape

- Problem: important.
- Contribution: frozen contribution is not internally executable on one same-object protocol.
- Evidence plan: public and finite, but it measures a synthetic overlay unless the revision transition and routing/acceptance state are generated by real Knative.
- Expected paper narrative: current form would be reviewed as a controller built atop already existing drain/routing primitives with an unsafe or underspecified request-migration claim.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: Dirigent (SOSP 2024), Serverless in the Wild (USENIX ATC 2020), Harvested Resources (SOSP 2021), PREEMPT-FaaS (ECRTS 2026).
- Status: `PARITY_NOT_PLAUSIBLE`
- Contribution-shape gap: no single legal action object and no surviving nontrivial N2.
- Evidence-shape gap: Azure trace lacks Knative revision, route, pod, queue, HTTP method/body, response, retry and failure state.
- Stage A closure plan: none for this ID; Stage A must not be created.

## Non-relaxable quality audit

- Same-object: `FAIL` — revision choice, Activator queue, and Queue-Proxy drain are different commit points.
- Latest collision: `PASS_WITH_BOUNDED_SEARCH` — current release/source, MPC and PREEMPT checked; no exact direct paper is needed to establish the object failure.
- Strong fair baselines: `FAIL_IN_BRIEF / CORRECTED_HERE` — current compatible pipeline and dynamic same-information legal control must be one baseline.
- Natural input/evidence: `FAIL_AS_CARRIER` — Azure invocation arrival/end/duration is natural load input but not a Knative revision-transition trace.
- Full-cost: `FAIL` — replay/body/partial-response and propagation costs are absent.
- Reproducibility: `POSSIBLE_FOR_A_SUCCESSOR`; source and trace are public.
- Evidence/claim honesty: `FAIL_IN_FROZEN_MECHANISM` — “migrate through existing Activator” overstates native semantics.

## Evidence path and AI completion

- AI executability class: `AI_CORE_CONDITIONAL`
- Estimated ai_core_fraction: `0.68`
- 72-hour first evidence: not authorized for this ID. A successor's first static test must enumerate request state at ingress, Activator and Queue-Proxy and show that every declared action occurs before an irreversible HTTP commit.
- Human-only items and why they are non-decisive: production deployment access could improve evidence but cannot repair the action contract.

## Fidelity closure plan audit

- Discovery status: `STRUCTURALLY_UNCLOSABLE`
- Complete action and native semantics are finite and same-object: `no`.
- Comparator, denominator, full-cost and small-witness plan: finite only after a new pre-assignment or same-Revision object is selected.
- Why an unimplemented interface/format/checker is or is not structurally fatal: absence of an interface is not the issue. The existing protocol commits Revision identity before Activator and request acceptance before any proposed post-hoc migration; adding transparent migration changes semantics.
- Reminder: no Stage A fidelity gate can legalize a changed object under this ID.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: `knative-v1.23.0`; annotated tag resolves to `7ed4aa2ab601e3a33c6552285f6e0d910747351d`; checked `2026-08-10`.
- Current official documentation checked: Serving overview, Request Flow, load balancing/Activator capacity, probing, metrics, release page.
- Actual source paths/symbols checked: `pkg/reconciler/route/resources/ingress.go`, `pkg/activator/handler/context_handler.go`, `pkg/activator/handler/handler.go`, `pkg/activator/net/throttler.go`, `pkg/queue/sharedmain/handlers.go`, `pkg/queue/sharedmain/main.go`, `pkg/queue/constants.go`, autoscaler config and shipped defaults.
- Default/non-default flags, thresholds and configurations checked: `target-burst-capacity` (including `-1`), container-concurrency target and percentage, stable/panic windows, scale-down delay, request/response-start/idle timeout, 30-second Queue-Proxy quiet period, 60-second hijacked-connection drain cap, Activator deployment grace, Route weights and proxy/serve modes.
- Discovery absence claim confirmed, narrowed or contradicted: no duration-credit algorithm was found, but the claimed atomic native action is contradicted. Current source fixes Revision identity before Activator and supplies native same-Revision queue/drain actions.
- If contradicted, current native mechanism and finite configuration-grid baseline: B0/B1 above.
- Any non-tuning residual that remains: only after a new-ID pre-assignment routing or same-Revision pod-drain contract; none under this ID.

## Stage A highest-risk probe plan

- Risk-bearing premise: none may be probed under this stopped ID.
- Cheap discriminating probe or counterexample search: the completed static source trace is decisive: Ingress writes Revision headers, Activator reads `revID` and invokes its per-Revision throttler, then Queue-Proxy admits/drains.
- Negative result that kills the direction: already observed structural split.
- Positive-result ceiling: not applicable.

## Stop conditions

Triggered:

1. same-object/action contract cannot be defined without changing decision locus or HTTP guarantee;
2. accepted arbitrary HTTP requests cannot be transparently migrated/replayed with unchanged semantics;
3. Azure trace cannot provide the missing Knative routing/transition protocol state; and
4. removing migration leaves a native-drain/route controller without a frozen nontrivial N2.

## Dual-axis score

- Academic value: `34/70`
- AI executability bonus: `21/30`
- Total: `55/100`

The score does not cause the STOP; same-object and N2 gates do.

## New-ID successor boundary

A successor may be reviewed only if it freezes one of these mutually exclusive objects:

1. `PRE_ASSIGNMENT_REVISION_ROLLOUT`: every action occurs before Ingress commits the Revision header; no request replay; general HTTP preserved; actual Knative rollout events and route-propagation cost are logged; or
2. `SAME_REVISION_POD_DRAIN`: Activator chooses only among pods of one already selected Revision; no cross-Revision claim; current readiness/throttler/backend selection is the strongest baseline.

It must also name a nontrivial online algorithm/guarantee beyond a quantile threshold, use real Knative transition state, and treat Azure data only as arrival/duration input. This is a new ID, not a revision of `KNATIVE-DRAIN-CREDIT`.

## Final decision

`STOP / BELOW_Q2_STOP / STOP_SPLIT_COMMIT_POINTS_AND_UNSAFE_REQUEST_MIGRATION`.

Do not send this STOP to confirmation under the ordinary policy unless mainline explicitly requests decisive review. Stage A/B remain unauthorized.
