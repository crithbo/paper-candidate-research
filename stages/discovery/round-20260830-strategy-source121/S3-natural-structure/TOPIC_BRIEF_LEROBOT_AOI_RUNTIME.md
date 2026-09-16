# LEROBOT-AOI-SLO-RUNTIME-REV0 Model-agnostic observation-age SLO control for LeRobot asynchronous inference

## 中文摘要

- 研究机会：在不改 VLA 策略或动作语义的前提下，把 LeRobot 分布式异步推理从“队列低于固定比例就发新观测”改为显式约束动作执行时所依赖观测的年龄（AoI），并联合决定观测发送、返回 action chunk 的接纳/裁剪以及安全退化。
- 为什么可能值得做：同样的队列长度可对应完全不同的网络/推理延迟与观测年龄；现有实现已经携带时间戳、动作 timestep、队列和时延信息，却未暴露年龄或截止期控制。若该别名效应在自然时延波动下成立，可形成跨模型的 runtime scheduling 算法与可复现 benchmark/profiler。
- 为什么保留：固定阈值、RTC、StreamingVLA、FutureRTC 和 A2C2 已覆盖大量相邻空间，但在本轮边界内未发现它们在同一 LeRobot 分布式协议上提供显式、模型无关的 observation-age SLO。该判断仍为 `SEARCH_BOUNDED_OPEN`，不是新颖性定论。
- 下一步：Stage 0 独立完成全文与当前源码并集审查；若残差仍在，再于 Stage A 先闭合时间戳语义、小状态安全 witness、自然时延 trace 与 full-cost 协议，之后才能运行首个 claim-bearing pilot。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O3 / O4 / O6`
- Domain tags: `VLA`, `robot-runtime`, `asynchronous-inference`, `scheduling`, `age-of-information`, `LeRobot`
- Contribution route: `N2`
- Discovery date: `2026-08-30`
- Discovery method revision: `RESEARCH_TOPIC_DISCOVERY_R1_R40_20260815`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `PRODUCTION`; `RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Opportunity family ID: `OF-LEROBOT-ASYNC-FRESHNESS-CONTROL`
- Contribution type: `SYSTEM_ARCHITECTURE`
- Local audit coordinates: `A1 / C1 / CU-open / D1 / E1-static-only`
- Discovery divergence seed ID/path: `SOURCE121-PORTFOLIO-S3 / EXACT_CARRIER_PORTFOLIO.yaml`
- Discovery RQ candidate ID/path: `RQ01 / RQ_CANDIDATES.yaml`
- Discovery question card ID/path: `QC01 / QUESTION_CARDS.yaml`
- Front-end disposition before deep review: `EVIDENCE_QUALIFIED_RAW`
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`

## Research question

Can a model-agnostic observation-age SLO controller use LeRobot's existing timestamps, latency observations, and action-queue state to schedule observation dispatch and returned-action admission under variable inference/network delay, while preserving the same policy, action semantics, and no-idle/safe-stop contract?

## Canonical research claim package

- Exact object and same-function/protocol/quality contract: LeRobot commit `4aaff99be4a1d81568c08c8f0296b41b40c99ec4`, distributed async inference client/server, unchanged robot, policy checkpoint, observation preprocessing, action representation, control frequency and task-success definition.
- Natural/canonical scenario or workload: distributed LeRobot inference with measured local/LAN latency traces and public LeRobot-format robot episodes; RoboCasa is canonical-only support, not evidence of natural network delay.
- Observed problem/opportunity and quantitative/static anchor: `_ready_to_send_observation` is a function of normalized queue size, while current timed observations/actions and logs expose capture time, action timestep and latency. No effectiveness number was generated.
- Intervention and atomic action: at each send/admission opportunity, estimate the execution age of queued/returned actions; dispatch, admit, trim, retain or safe-stop according to a frozen age budget and no-idle constraint.
- Claimed mechanism and mechanism-specific prediction: queue occupancy aliases states with unequal delay and age; the controller should differ from fixed threshold specifically when latency variance or scene-change risk makes age diverge at equal occupancy.
- Available/unavailable information and assumptions: only online timestamps, queue horizon, recent latency and fixed fps are available; future latency and task success are unknown. Clock-domain validity must be closed before use.
- Named comparator and fairness contract: LeRobot fixed `chunk_size_threshold` with a preregistered fair grid; RTC on compatible flow/diffusion policies; matched policy/model/device/task, request budget and aggregation semantics.
- Expected effect target, output or guarantee: fewer tail age-budget violations and stale-action admissions at non-worse task success, with throughput/idle, inference-call and network-byte costs reported. No effect is currently claimed.
- Full-cost boundary: wall time, control-loop rate, inference calls/GPU time, bytes, queue occupancy, action discard/trim, safe-stop/idle, age distribution and task success.
- Scope, no-gain/failure region and competing explanation: no gain is expected under stable low latency or slowly changing scenes; aggressive deadlines can increase calls or empty queues. Gains may instead come from better parameter tuning, RTC inpainting or model-level saliency.
- Minimum falsifier: after fair tuning and matched costs, no Pareto improvement over fixed threshold, or the complete current union directly implements the same explicit age-budget action on the same protocol.
- Dependencies/resources and claim ceiling: public source, CPU plus single RTX 4070 route, public policy/checkpoint and robot/simulator traces. Claim ceiling is implementation-carrier plus canonical benchmark until natural latency and task evidence exist.
- Contribution-type contract closure: a nontrivial online scheduling/admission algorithm, formal or exhaustive small-state safety contract, open implementation, trace suite, profiler and full-cost evaluation are required; simple threshold retuning is disallowed.

## Opportunity-family graph

| Related family ID | Relation | Evidence | Disposition |
|---|---|---|---|
| LeRobot fixed-threshold async | prerequisite/deployment baseline | current source/docs | mandatory same-stack baseline |
| RTC | alternate mechanism/conditional comparator | arXiv:2506.07339 and LeRobot integration | direct-coverage audit required |
| StreamingVLA | alternate mechanism/competing explanation | arXiv:2603.28565 | model-changing adjacent collision |
| FutureRTC | alternate mechanism/competing explanation | arXiv:2607.24008 | latest-union audit required |
| A2C2 | alternate mechanism | arXiv:2509.23224 | latest-union audit required |

## Paper genealogy

- Anchor paper/artifact: LeRobot distributed asynchronous inference implementation and official async documentation.
- Key predecessors: action chunking and temporal aggregation; Real-Time Chunking (RTC).
- Follow-up / competing papers: StreamingVLA, A2C2, FutureRTC, adaptive action chunking.
- Counter-evidence / negative source: official LeRobot documentation reports that fixed thresholds work well in its experiments and explicitly recommends tuning them.
- Artifact / benchmark / specification: pinned LeRobot source; public RoboCasa LeRobot-format episodes; optional compatible LIBERO/RLBench canonical tasks.
- Search boundary: eight official-source search/open batches or commit queries, official public code/docs and primary abstracts, ending 2026-08-30; no download, build or experiment.

## Topic-origin card

- Trigger: current implementation records time but makes readiness depend only on queue occupancy.
- Measurable observation / quantitative anchor: action-observation age and queue occupancy are separately reconstructible; no measured outcome is yet available.
- Baseline limitation: a fixed occupancy threshold cannot distinguish equal-queue states with different delay/age.
- Optional inherited assumption: older observations are more likely to yield mismatched actions in sufficiently dynamic tasks.
- Structural cause: compute/transport and execution are decoupled, while dispatch is indexed by remaining actions rather than when the underlying state was observed.
- Decision variable: observation send time plus returned-action admission/trim policy under an age budget.
- Candidate Q1 venue family: robotics systems, real-time/embedded systems, or ML systems; current evidence supports only Tier B hypothesis.

## Historical method calibration

- Source-session backtest file: `stages/discovery/_method-backtests/RQ_REFINEMENT_FRONTEND/RQ-REFINEMENT-STAGED-EVIDENCE-V1/auditor/handoff.yaml`
- Backtest status: `CALIBRATED`; production cutover verified in bootstrap.
- This field calibrates the discovery method and is not candidate evidence.

## Importance and group fit

- Strategic alignment: `CORE`
- Local executable carrier: pinned LeRobot source, public policy/checkpoint and canonical robot/simulator episodes; CPU plus single RTX 4070.
- Decision endpoint changed by the answer: when to send a new observation and whether/which returned actions may enter the execution queue.
- Mechanism-specific prediction: at equal occupancy, high-latency/high-age states receive earlier refresh or stricter admission than low-age states.
- Intended paper artifact: `RUNTIME_COMPONENT / PROFILER / BENCHMARK`
- Public-to-group bridge and evidence ceiling: public software can later inform VLA/NPU placement and runtime co-design, but no closed NPU or real-robot resource is assumed.
- Resource realism: local public route for Stage A; natural robot deployment remains conditional and cannot raise the current ceiling.

## Exact object

The object is the public LeRobot gRPC-style distributed async inference path at commit `4aaff99be4a1d81568c08c8f0296b41b40c99ec4`, specifically `robot_client.py`, `policy_server.py`, `configs.py` and their timed observation/action protocol. It is not generic AoI scheduling, a new VLA model, or a replacement robot task.

## Named fair baselines

- Deployment/default baseline: current LeRobot fixed `chunk_size_threshold`, default and tuned grid, same `actions_per_chunk`, fps and aggregation.
- Closest recent-paper baseline: RTC for policy families where the same action semantics and inference interface can be preserved.
- Competitive simple baseline: latency-adjusted static threshold chosen offline from training traces but frozen during evaluation.
- Optional offline ceiling: oracle schedule with future latency/scene-change knowledge, clearly marked unavailable online.

## Mechanism hypothesis

An age-indexed controller should outperform occupancy-only control only when two equal-occupancy states have meaningfully different predicted execution age. Its distinctive signature is reduced high-quantile age violations without merely increasing request rate or silently discarding difficult steps.

## Alternative explanation, null and optional competing mechanisms

- Mechanism A: explicit AoI estimation separates aliased queue states and enables better dispatch/admission.
- Strongest alternative explanation: a properly tuned fixed threshold, RTC action inpainting, or model-level adaptive observation already captures all useful variation.
- Optional mechanism B: scene-change saliency, not clock age, is the operative variable.
- Preferred mechanism and why: AoI is model-agnostic and directly supported by existing protocol metadata, but remains provisional until controlled evidence separates it from saliency and threshold tuning.

## Mechanism signature

Condition on queue occupancy and policy/task; the candidate should change decisions monotonically with predicted execution age and improve the age-violation tail primarily in high-jitter regimes. A gain only after raising inference frequency is not mechanism-specific.

## Seed-distance test

- What changes relative to the anchor: the decision statistic changes from queue fraction to predicted action execution age under an explicit SLO, plus age-aware chunk admission.
- What changes relative to the closest prior work: unlike RTC inpainting or StreamingVLA model/saliency changes, the policy remains unchanged and the runtime enforces an external age budget.
- Why this is not an application/backend rename: the atomic scheduling and admission decisions, constraint, falsifier and full-cost ledger are explicit and general across supported LeRobot policies.
- Result of method-name deletion test: the claim remains identifiable as an online deadline/age-constrained runtime problem.

## Candidate paper claim

A nontrivial, model-agnostic online AoI-SLO controller for LeRobot's distributed asynchronous inference can reduce tail stale-action violations under variable delay at a better full-cost Pareto point than tuned occupancy-only dispatch, while preserving policy/action semantics. This is a hypothesis, not a discovered result.

## Evidence route

- `PERFORMANCE / MEASUREMENT_MECHANISM`

## Software/algorithm performance admissibility

- Same-function contract: identical observation preprocessing, policy checkpoint, task, action representation, controller frequency and success metric.
- Algorithmic delta: online latency/age estimator plus constrained dispatch and action-admission/trim rule; no parameter-only paper.
- Full-cost ledger scope: compute, calls, bytes, latency, discarded work/actions, idle/safe-stop, task quality and age tails.
- Generality hypothesis: applies across LeRobot action-chunk policies without retraining, subject to valid timestamps and a meaningful age budget.
- Why this is not routine tuning: decisions vary online at equal queue occupancy using age and latency state, and must satisfy a formalized safety/no-idle contract.
- Expected no-gain region: deterministic low latency, long safe horizons, static scenes, or policies already insensitive to observation age.

## Nearest-prior facet matrix

| Facet | Candidate | Closest prior | Residual |
|---|---|---|---|
| Research problem | explicit observation-age SLO | smooth real-time chunk execution / early observation | external age constraint and tail violations |
| Exact object | LeRobot distributed async protocol | RTC-supported flow/diffusion VLA or StreamingVLA model | same public runtime with unchanged model |
| Decision variables | send time and returned-action admission/trim | chunk inpainting or model-level observation timing | model-agnostic runtime admission |
| Constraints / information | online timestamps, recent latency, queue horizon | committed actions or action saliency | age budget with no future knowledge |
| Core algorithm | online constrained age controller | inpainting / adaptive observation | explicit AoI estimator and SLO rule |
| Guarantee | bounded/controlled age violations plus safe fallback | continuity/reactivity | age-tail contract, if established |
| Evidence object | pinned runtime plus measured/canonical traces | simulation and real robot tasks | same-stack full-cost trace suite |

## Current collision classification

### Eight-predicate direct-coverage audit

| Predicate | Evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | LeRobot source versus RTC/StreamingVLA abstracts | FAIL for StreamingVLA; UNKNOWN for complete RTC integration |
| Same scenario/workload | asynchronous VLA execution | PASS |
| Same or weaker information | timestamps/latency/queue versus committed actions/saliency | UNKNOWN |
| Atomic action covered | explicit age-based send plus admission/trim | UNKNOWN |
| Same/stronger legality, quality and guarantee | observation-age SLO and safe fallback | UNKNOWN |
| Same non-worse full-cost boundary | calls, bytes, idle, discard and task quality | UNKNOWN |
| Comparable scale/platform/version/config | current LeRobot public stack | UNKNOWN |
| Sufficient full-text/implementation/reproduction depth | current source for anchor; abstracts for latest papers | FAIL |

- DIRECT_FATAL: none found within the bounded search.
- DIRECT_SUBTRACT: broad claims of asynchronous smoothness, chunk continuity and adaptive observation are removed.
- METHODOLOGICAL_ADJACENT: RTC, StreamingVLA, FutureRTC and A2C2.
- DEPLOYMENT_BASELINE: current LeRobot fixed threshold; RTC when compatible.
- SEARCH_BOUNDED_OPEN: yes.
- Discovery closure debt handed to Stage 0: full-text/source direct-coverage matrix; upstream RTC integration semantics; current issue/PR scan; natural delay evidence; venue analogs.
- Why each open item is finite: all are named public papers/source paths and can be resolved without changing the exact object or endpoint.

## Decisive falsifier

Drop if Stage 0 finds direct same-object coverage of explicit age-budgeted dispatch/admission, or if no finite clock/age semantics can be defined without changing the action protocol. At Stage A, fail the mechanism if a fair tuned threshold matches the full-cost Pareto frontier or age adds no predictive/control value after occupancy and request rate are held fixed.

## Search and claim-evidence audit

- Evidence ledger: `DISCOVERY_EVIDENCE_LEDGER.yaml`
- Heterogeneous independent search owner/path: Stage 0 independent review required; not performed by this Discovery lane.
- Contrary/no-gain search: official docs favor tuned fixed thresholds; RTC/StreamingVLA/FutureRTC/A2C2 are explicit competing mechanisms.
- Highest-impact unresolved issue: direct coverage by the complete RTC/FutureRTC/A2C2 union.
- Decision-ready stopping checklist result: enough for conditional Stage 0 review, not enough for novelty acceptance or experiment authorization.
- Bounded-open statement: claim is limited to a source-visible implementation gap and finite closure plan.
- Nonterminal reopen triggers: new upstream age/deadline feature, full-text direct coverage, invalid clock semantics, or absence of a natural/canonical full-cost evaluation route.

## Executable evidence path

### Current upstream reality check

- Checked current upstream commit/tag and date: `4aaff99be4a1d81568c08c8f0296b41b40c99ec4`, `main`, queried 2026-08-30.
- Official current documentation location: `docs/source/async.mdx` and the Hugging Face async inference blog.
- Actual source symbols/paths: `robot_client.py::_ready_to_send_observation`, `control_loop`, `receive_actions`; `configs.py::RobotClientConfig`; timed observation/action construction in `policy_server.py`.
- Default and non-default flags/thresholds/configurations checked: `chunk_size_threshold`, `actions_per_chunk`, `fps`, `aggregate_fn_name`, queue debug, observation queue timeout, configurable inference latency.
- Evidence supporting the absence claim: readiness is computed from queue size ratio; no explicit action-age budget/deadline configuration was found in the checked paths.
- Contrary evidence and disposition: timestamps, similarity filtering, must-go messages and RTC exist; they narrow the residual and are not treated as absence evidence.
- Why the residual is outside the current native mechanism: equal queue ratios can have different age/latency, while the native readiness predicate receives only queue state.

### Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Complete atomic action and action interface: dispatch observation; on chunk return, admit/trim/retain/safe-stop based on predicted execution age.
- Real comparator and native semantics: unmodified LeRobot client/server, serialization, preprocessing, timed action representation, aggregation and robot action API.
- Same-object/same-function/guarantee boundary: same policy/task/action protocol; only runtime scheduling/admission changes.
- Common denominator and full-cost dimensions: identical episodes/seeds/delay traces and success denominator; calls, bytes, time, compute, discard, idle/safe-stop and age tails.
- Small pre-corpus legality/equivalence witness: enumerate short queues, observation times, latency realizations and chunk arrivals; check monotonic age, timestep legality, no duplicate/out-of-order execution and explicit safe fallback.
- Finite closure steps and required resources: source pin; clock-domain audit; pure controller and witness; trace recorder/replayer; public policy/task smoke; preregistered canonical and measured-delay pilot.
- Structural failure condition: required age cannot be reconstructed without unsynchronized clocks or legal admission cannot avoid changing action semantics.

### Front-end closure-debt transfer

- Complete current-union debt: RTC, StreamingVLA, FutureRTC, A2C2 and recent adaptive chunking.
- Strongest-collision/genealogy debt: source-level RTC integration and full algorithms, not abstracts alone.
- Witness/interface/corpus debt: clock semantics, timed-action contract and a public reproducible trace corpus.
- Full-cost protocol debt: natural delay acquisition, request/network accounting and safe-stop/idle denominator.
- Maximum decisive questions and owner stage: four, owned by independent Stage 0 then Stage A fidelity gate.
- Claim ceiling while debt remains open: `SEARCH_BOUNDED_OPEN`; no novelty or effectiveness assertion.

### 72-hour first evidence

If later authorized, complete source-level clock/queue semantics and the exhaustive small-state legality witness before any task-performance run; then replay a preregistered public episode trace with measured local delay traces against a tuned fixed-threshold grid.

### Execution readiness

- E1 static preflight result and evidence: source-visible metadata and insertion points exist; exact dependency/runtime compatibility was not executed.
- E2 assignment authorization/allowlist: `NOT_RUN_NOT_REQUIRED_FOR_STAGE0`.
- E2 engineering-only result and prohibited scientific inference: none; zero build/experiment.
- EB/EH boundary and next action: no hard external resource is required for static closure; real-robot natural evidence is optional/conditional and cannot be assumed.

### AI core fraction and critical path

AI can perform source audit, controller implementation, formal small-state witness, trace tooling, simulator/canonical replay and analysis. Human/physical-robot work would only raise the natural-deployment ceiling.

### Semantics-preserving open alternatives

Use public LeRobot-compatible simulator episodes, several policy families, and recorded local/LAN delay traces. Do not substitute a new VLA architecture or synthetic special-case workload as the primary claim.

## Q1/Q2 sufficiency hypothesis

- Why this supports at least a complete Q2 paper: if the explicit age mechanism survives current-union review and yields a reproducible same-stack Pareto improvement, the package can include a runtime algorithm, safety contract, profiler, trace benchmark and multi-policy evaluation.
- Why it remains Tier B: recent async VLA work is dense, the current residual is narrow, and no effect or natural delay evidence exists.
- What would still be required at Stage B: multi-policy/task evidence, measured delay regimes, strong current baselines, ablations, failure regions, full cost and independent reproduction.
- Preliminary contribution-shape analogs: real-time scheduling and AoI control, not candidate novelty evidence.

## Non-relaxable quality audit

- Same-object: pinned LeRobot distributed async path and unchanged policy/action protocol.
- Latest collision: bounded open; named dense current union transferred to independent Stage 0.
- Strong fair baselines: tuned current threshold, static latency-aware threshold, RTC where compatible.
- Natural input/evidence: public robot tasks plus measured delay traces required; canonical replay alone limits claim ceiling.
- Full-cost: calls, bytes, compute/time, discard, idle/safe-stop, age and task quality.
- Reproducibility: pinned code, public policies/tasks, trace recorder/replayer, fixed seeds/configs and small-state witness required.
- Evidence/claim honesty: zero build, zero experiment and zero effectiveness result in Discovery.

## AI and researcher boundary

No user action is required for Stage 0. A later real-robot study or private hardware would require separate authorization and is not needed for the initial public single-GPU/CPU evidence path.

