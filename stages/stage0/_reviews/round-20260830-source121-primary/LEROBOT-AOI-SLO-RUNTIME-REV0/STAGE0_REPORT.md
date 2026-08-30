# LEROBOT-AOI-SLO-RUNTIME-REV0 Stage 0 Report

## 中文摘要

- 结论：`PASS_RECOMMENDED`，保持 `TIER_B_Q2_VIABLE`；这是条件性论文潜力通过，不是新颖性定论或效果证明。
- 为什么：LeRobot 当前分布式 async 路径仍用固定 `chunk_size_threshold` 触发观测发送，并只按 action timestep 淘汰已过期返回；未发现同一 LeRobot 协议、同一低信息条件下的显式 observation-age SLO 联合 dispatch/admission。RTC、FutureRTC、A2C2、StreamingVLA/FlashVLA、RAPID 与 ActFovea 已吸收“异步更流畅”“旧观测纠偏”“自适应刷新/丢弃”“通用 safe-failure”等宽泛表述，但没有任何一个来源同时满足 direct-fatal 八谓词。
- 下一道门：先由独立 SENTRY 复核；若确认，再进入 Stage A 的 `PRE_CLAIM_CONTRACT_FIDELITY_GATE`，首个杀手门是 client-local monotonic provenance age 在重叠 chunk/聚合/乱序返回下能否被无歧义定义并满足小状态 legality witness。
- 是否需要用户操作：否。真实机器人/LAN 证据只影响后续 claim ceiling，不阻塞当前公开 CPU/单 GPU 的 canonical Stage A 路线。

- Lane id: `STAGE0_PRIMARY`
- Assignment id: `STAGE0-PRIMARY-20260830-LEROBOT-AOI-SLO-RUNTIME-REV0`
- Input freeze SHA-256: `85F7897BA21CF57AEA2A2FF0895E2F7F29E6BB96E398925DDF325FEC420A1993`
- START SHA-256: `6EEEA482DC5A30E4E8A151F5E7E731A84CCEC173E72CA5FB66E9B4D9A4023FA1`
- Cross-assignment contamination declaration: `false`; queued Source122 assignment/source packets were not read.
- Scientific verdict: `PASS_RECOMMENDED`
- Operational disposition: `READY`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.79 (medium-high)`
- Evidence ceiling: `STATIC_CURRENT_SOURCE_AND_FULLTEXT_UNION__NO_EFFECTIVENESS_RESULT__CANONICAL_ONLY_UNTIL_MEASURED_NATURAL_TRACE`
- Novelty route: `N2`
- Candidate Q1 venue family: robotics systems / ML systems / real-time and embedded systems; current tier is Q2-viable, not Q1-potential.
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.
- Search/open use: `21/32` bounded calls; zero build, experiment, implementation, artifact/trace download, Stage A/B action, or shared write.

## Optional process telemetry

- Atomic repair trace mode/artifact path/hash: assignment omitted the mode; effective mode `OFF` by frozen missing-mode rule.
- Decision effect while nonproduction: `NONE`.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a low-information, model-agnostic runtime scheduler that turns LeRobot's implicit queue heuristic into an explicit freshness contract, together with provenance-aware admission, an executable legality witness, a trace/profiler artifact, and full-cost multi-policy evaluation.
- Current evidence-acquisition readiness/risk: static insertion points and the finite clock/provenance route exist; no candidate output, natural trace corpus, implementation, or task result exists.
- Why missing implementation/results/proof/hardware is not structurally fatal: Stage 0 screens a falsifiable paper shape. The client already sees observation send time, returned chunk/timestep and queue state, and the server echoes the observation timestamp into returned actions. A sidecar provenance ledger can be tested without changing policy/action values. Real hardware is optional for the initial canonical ceiling.

## Discovery provenance

- Opportunity origins: `O3 / O4 / O6`
- Domain tags: `VLA`, `robot-runtime`, `asynchronous-inference`, `scheduling`, `age-of-information`, `LeRobot`
- Paper genealogy: LeRobot fixed-threshold distributed async stack → RTC and action-chunk continuity → A2C2/FutureRTC stale-context correction → StreamingVLA/FlashVLA model-changing streaming → RAPID/ActFovea adaptive dispatch and safeguarding. Generic AoI/UoI scheduling is a methodological ancestor, not candidate novelty.
- Discovery method revision: `RESEARCH_TOPIC_DISCOVERY_R1_R40_20260815`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `OF-LEROBOT-ASYNC-FRESHNESS-CONTROL`
- Contribution type and type-contract verdict: `SYSTEM_ARCHITECTURE`; conditionally complete only if the algorithm is more than threshold retuning and exposes a reproducible component/profiler/benchmark.
- Independently audited A/C/D/E coordinates: `A1 / C1 narrowed / CU-closed-enough / D1 / E1-static-only`
- Backtest reference and status: Discovery frontend calibration was read as process provenance only; it is not candidate evidence.

## Frozen object and claim

The exact object remains LeRobot commit `4aaff99be4a1d81568c08c8f0296b41b40c99ec4`, specifically the distributed `src/lerobot/async_inference/{robot_client.py,policy_server.py,configs.py}` path and its timed observation/action contract. The surviving claim is narrower than the Discovery wording:

> Under the unchanged LeRobot policy, action representation, preprocessing, aggregation function, fps and task semantics, can a client-side, monotonic-clock, provenance-aware age-budget controller jointly decide observation dispatch and returned-action admission/trim, using no visual/kinematic/model-internal features, and improve the tail age-violation/full-cost Pareto frontier over a fairly tuned occupancy-only stack?

The report explicitly subtracts generic runtime safeguarding, general stale-observation correction, action smoothness, edge-cloud partitioning, model acceleration, and formal collision-avoidance guarantees.

## Claim-package completeness audit

- Atomic action and mechanism: at each send or returned-chunk merge point, compute conservative execution age/slack for each queued action contributor; dispatch, admit, trim, retain or fail closed under a frozen age budget and no-idle/safe-stop rule.
- Information/assumption contract: client-local monotonic capture/receive/execute times, action timestep, queue horizon, recent completed latency and fixed fps only. No future latency, reward, scene saliency, image feature, robot kinematics or policy latent is available.
- Effect target/output/guarantee: lower p95/p99 age-budget violation and stale-admission rate at non-worse task success, while accounting for calls, bytes, GPU time, discard, idle and safe-stop. No hard control-safety or collision-avoidance guarantee is claimed.
- Boundary/failure region/competing explanation: deterministic low delay, static scenes, age-insensitive policies, or a perfectly tuned threshold may show no gain. RTC/A2C2/FutureRTC/StreamingVLA/FlashVLA may dominate on compatible policies because they alter generation or use richer information.
- Minimum falsifier: no distinct decision at equal occupancy on measured traces; no Pareto improvement after fair grid/cost matching; inability to track aggregate-action provenance without changing the frozen protocol; or a newly found same-object prior satisfying all direct-fatal predicates.
- Dependencies and evidence ceiling: public source/checkpoints/tasks plus CPU/one GPU. Without measured local/LAN timing joined to task outcomes, evidence remains canonical benchmark only.
- Opportunity-family relation audit: current LeRobot heuristic is baseline; RTC/A2C2/FutureRTC are same-scenario algorithmic competitors; StreamingVLA/FlashVLA are model-changing competitors; RAPID and ActFovea are strong direct-subtract sources; generic AoI/UoI scheduling constrains the novelty of any threshold-like rule.
- Independent search identity/scope: official LeRobot source/docs/paper/issues, primary arXiv/full text, NeurIPS proceedings, ICLR/OpenReview locator and official IJRR page; cutoff 2026-08-30.
- Evidence-ledger integrity and contradiction disclosure: official docs recommend tuning `fps` and `chunk_size_threshold`, with 0.5–0.6 working in their experiments. LeRobot's paper reports its inference evaluation used client and server on the same machine, so it does not supply a reusable natural distributed-network trace.

### Decisive public source ledger

- LeRobot frozen commit: <https://github.com/huggingface/lerobot/commit/4aaff99be4a1d81568c08c8f0296b41b40c99ec4>
- Current official client/config/server source: <https://github.com/huggingface/lerobot/blob/main/src/lerobot/async_inference/robot_client.py>, <https://github.com/huggingface/lerobot/blob/main/src/lerobot/async_inference/configs.py>, <https://github.com/huggingface/lerobot/blob/main/src/lerobot/async_inference/policy_server.py>
- Official async and RTC documentation: <https://github.com/huggingface/lerobot/blob/main/docs/source/async.mdx>, <https://github.com/huggingface/lerobot/blob/main/docs/source/rtc.mdx>
- LeRobot paper (ICLR 2026): <https://arxiv.org/abs/2602.22818>
- RTC (NeurIPS 2025): <https://proceedings.neurips.cc/paper_files/paper/2025/hash/300ccb2187dedd4edcc07f7e76d8e553-Abstract-Conference.html>
- A2C2: <https://arxiv.org/abs/2509.23224>; FutureRTC: <https://arxiv.org/abs/2607.24008>
- StreamingVLA: <https://arxiv.org/abs/2603.28565>; FlashVLA: <https://arxiv.org/abs/2608.27384>
- RAPID: <https://arxiv.org/abs/2603.07949>; ActFovea: <https://arxiv.org/abs/2607.29169>
- Generic urgency/AoI boundary: <https://arxiv.org/abs/2002.07987>
- Q1 journal shape anchor, Diffusion Policy: <https://journals.sagepub.com/doi/10.1177/02783649241273668>

## Positive opportunity map

- Natural workloads: actual same-host client/server policy inference jitter on public LeRobot-compatible simulator tasks is the minimum natural compute carrier; actual LAN/robot runs can raise the ceiling later. Recorded robot episodes alone are not latency evidence.
- Observed or expected cost/headroom: current readiness uses only `queue_size / action_chunk_size <= threshold`; equal occupancy can correspond to different completed/expected delay. Public issue logs show practical remote deployment and timing variability, but are anecdotal rather than a benchmark corpus.
- Mechanism-specific prediction: holding occupancy, policy, task and request budget fixed, decisions should be monotone in conservative provenance age/slack and differ only in high-jitter regimes; a gain caused only by more requests fails the mechanism claim.

## Named baselines and fairness contract

1. Current LeRobot fixed threshold with the full preregistered grid `g ∈ {0, 0.1, …, 1.0}`, explicitly including official default `0.5`, reported good range `0.5–0.6`, and extremes.
2. Offline latency-adjusted static threshold, selected on validation traces then frozen on test traces.
3. A jointly tuned static configuration over permitted `fps`, `actions_per_chunk`, `aggregate_fn_name` and `g`; candidate and baseline use the same selected non-controller settings and matched policy/checkpoint/task/seed.
4. RTC only where the same policy family/action semantics can be preserved; A2C2/FutureRTC/StreamingVLA/FlashVLA are literature comparators or upper alternatives, not automatically fair same-stack baselines because they train/modify policy-side components.
5. Optional future-latency oracle is an offline ceiling only.

Fairness requires identical task denominator, action representation, aggregation semantics, offered observation stream, control frequency, policy calls/bytes accounting and safe-stop/idle accounting. Baseline tuning uses a disjoint validation split; per-test-trace oracle selection is forbidden.

## Collision analysis

### Eight-predicate direct-coverage audit

The table asks whether any single current source covers the entire frozen candidate; partial coverage by different papers cannot be composed into a direct fatal result.

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | LeRobot's current distributed gRPC-style async path is distinct from local RTC rollout, OpenPI/StreamingVLA, RAPID's OpenVLA edge-cloud stack and ActFovea's LIBERO/π0 safeguard. | FAIL |
| Same scenario/workload | All closest papers study asynchronous/chunked VLA execution under delay or staleness. | PASS |
| Same or weaker information | RTC uses policy sampling/committed actions; FutureRTC/A2C2 use learned visual/state/policy features; RAPID uses kinematics/torque; ActFovea uses images, calibration, proprioception and action history. None matches the candidate's timestamp/queue-only information. | FAIL |
| Atomic action covered | RAPID preempts and overwrites stale chunks; ActFovea re-queries, shortens horizons and holds; current LeRobot merges/filters timesteps. No source jointly performs explicit age-budgeted send plus provenance-aware aggregate admission on the frozen protocol. | FAIL |
| Same/stronger legality, quality and guarantee | Closest works target success, continuity, latency or disturbance recovery. ActFovea explicitly disclaims formal collision avoidance. None provides the frozen age-tail/full-cost contract. | FAIL |
| Same non-worse full-cost boundary | No closest source jointly accounts for calls, bytes, GPU time, aggregation/discard, idle/safe-stop, age tails and task success on this stack. | FAIL |
| Comparable scale/platform/version/config | Evaluations span Kinetix/LIBERO/real robots, but not the pinned LeRobot distributed async protocol with the same policy-agnostic interface/config. | FAIL |
| Sufficient full-text/implementation/reproduction depth | RTC, FutureRTC, A2C2, StreamingVLA, FlashVLA, RAPID, ActFovea and LeRobot were checked through primary full text and/or official source/docs. | PASS |

No `DIRECT_FATAL` is present because all eight predicates are not satisfied by any prior. Material `DIRECT_SUBTRACT` applies:

- RTC absorbs generic delay robustness, no-idle execution and chunk continuity for flow/diffusion policies.
- A2C2 explicitly formalizes executed-action observation age as at least `d` and as much as `d+e`, and absorbs learned per-step correction from latest observations.
- FutureRTC absorbs prediction-execution misalignment correction through predicted execution-time visual/state context.
- StreamingVLA/FlashVLA absorb broad streaming, adaptive early observation, fast decoding and smooth asynchronous-execution claims.
- RAPID absorbs dynamic triggering, cached-chunk preemption/discard, fresh re-query, cooldown and queue overwrite in edge-cloud VLA execution.
- ActFovea absorbs observation timestamp/freshness monitoring, lag-aware recovery, action-chunk verification, adaptive short horizon/re-query and bounded hold/safe-failure.

### Nearest-prior facet matrix

| Facet | Frozen residual | Strongest current coverage | Residual after subtraction |
|---|---|---|---|
| Object | pinned LeRobot distributed async protocol | LeRobot fixed threshold; RTC local rollout integration | same remote protocol remains |
| Decision | send + aggregate admission/trim | RAPID dispatch/preemption; ActFovea short horizon/hold | explicit joint age-budget action remains |
| Information | timestamps, queue, completed latency only | richer kinematics/images/latents or policy internals | low-information contract remains |
| Guarantee | age-tail SLO with no hidden cost | success/latency/continuity/safe failure | explicit freshness/full-cost contract remains |
| Algorithm | provenance-aware constrained online controller | fixed threshold, dual kinematic threshold, learned correction | nontrivial contributor-age accounting plus constrained scheduling remains hypothetical |
| Evidence | same-stack trace/profiler/full-cost artifact | paper-specific simulators and real robots | reproducible LeRobot protocol benchmark remains |

### Seed-distance and method-name deletion test

Deleting “AoI” leaves an identifiable problem: constrain how old the observations contributing to each executed/aggregated action may be, using only protocol metadata. It is not a backend rename. However, deleting “LeRobot” would reduce it to well-known AoI/UoI threshold scheduling, so the paper must earn novelty from action-provenance semantics, joint admission/dispatch, the no-idle contract and same-stack evidence—not from age terminology alone.

## Competing mechanism decision

- Selected mechanism: client-local monotonic, contributor-provenance age/slack under explicit budget.
- Registered backup: none. Scene saliency, learned correction and kinematic triggers remain competing mechanisms, not a result-contingent pivot.
- Pivot boundary: if age adds no decision/predictive value after occupancy, call rate and trace split are controlled, stop rather than pivot to a different information source.

## Residual paper kernel

The defensible kernel is a narrow systems contribution: define and enforce action-contributor freshness in LeRobot's overlapping-action queue without modifying policy outputs, including a cross-host-clock-safe sidecar provenance construction, deterministic legality witness, and matched-cost evidence. Claims of universal robot safety, generic adaptive observation, generic stale-action rejection or general VLA latency robustness are out of scope.

## Evidence route

- `PERFORMANCE / MEASUREMENT_MECHANISM`

## Performance-optimization admissibility

- Same-function contract: unchanged observation preprocessing, policy checkpoint, action values/representation, task, controller frequency and success definition.
- Algorithmic delta: online contributor-age/slack estimator plus constrained joint dispatch/admission; a retuned scalar threshold alone is disallowed.
- Full-cost ledger: wall time, control-step rate, policy calls/GPU time, bytes, queue occupancy, contributor age, action aggregation/discard/trim, empty-queue/hold/safe-stop and task success.
- Strong-implementation fairness: tune static baselines on a disjoint split; match all non-controller knobs and request/cost budgets; include current LeRobot aggregation and stale-timestep filtering.
- Generality and failure boundary: at least two policy families or an explicit single-policy claim ceiling; deterministic low-latency and age-insensitive tasks are declared no-gain regions.
- Why not routine tuning: the controller must make different actions at equal occupancy based on auditable provenance age and satisfy a frozen legality/no-hidden-idle contract.

## Q1/Q2 paper shape

- Problem: action queues hide observation freshness under variable inference/transport delay, while current configuration exposes no freshness contract.
- Contribution: a protocol-level age semantics, low-information constrained controller, small-state legality checker, trace/profiler artifact and full-cost evaluation.
- Evidence plan: current LeRobot exact stack; tuned static grid; measured same-host natural compute timings plus preregistered perturbation strata; public canonical tasks; at least two policies if feasible; RTC where fair; mechanism ablations and failure regions.
- Expected paper narrative: “queue occupancy aliases stale-action risk” is first demonstrated; the new controller is then tested for age-tail/cost/task Pareto improvement; negative regions and richer-information alternatives are reported.

## Q1/Q2 shape calibration

- Comparator file: `q1_calibration.md`
- Reference set: RTC (NeurIPS 2025), LeRobot (ICLR 2026), Diffusion Policy (IJRR 2025), with ActFovea/RAPID/A2C2/FutureRTC as current boundary sources.
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: residual is narrower than RTC/LeRobot and currently lacks a concrete nontrivial algorithm beyond the frozen interface contract.
- Evidence-shape gap: no implementation, natural trace/task coupling, multi-policy evidence, statistics or independent reproduction.
- Stage A closure plan: close provenance/clock semantics first, run the small-state witness, then perform one matched trace-replay killer before any broader task study.

## Non-relaxable quality audit

- Same-object: preserved at pinned LeRobot distributed async source.
- Latest collision: current source/paper union closed enough for Stage A; latest 2026 works materially narrow but do not directly absorb the residual.
- Strong fair baselines: full static threshold grid, offline latency-adjusted static rule, joint configuration tuning, RTC where compatible.
- Natural input/evidence: actual same-host inference timing is the minimum natural carrier; recorded episodes without timing and injected delay alone cannot support a deployment claim. Real LAN/robot evidence raises but is not required for the canonical ceiling.
- Full-cost: mandatory dimensions enumerated; task success cannot be replaced by age metrics.
- Reproducibility: pin source/policy/task, publish timing/provenance schema, trace splits, controller config, legality witness and seeds.
- Evidence/claim honesty: no candidate run or effect result exists; all positive statements are hypotheses.

## Evidence path and AI completion

- E1/E2 execution-readiness audit; scientific inference explicitly excluded: `E1_STATIC_PREFLIGHT` only. No E2/build/smoke was authorized or run.
- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.82`
- 72-hour first evidence: exact provenance/clock specification, exhaustive short-queue witness, and a preregistered trace-replay comparison against the full static grid.
- Human-only items and why they are non-decisive: a real robot/LAN study raises external validity, but canonical public simulator plus actual local inference timing can decide the first mechanism gate.

## Fidelity closure plan audit

- Discovery status: `READY_TO_CLOSE_IN_STAGEA`
- Complete action and native semantics are finite and same-object: yes, provided age is defined over contributor observations and tracked in a client-side sidecar keyed by returned chunk origin/timestep.
- Comparator, denominator, full-cost and small-witness plan: finite and listed above.
- Why an unimplemented interface/format/checker is not structurally fatal: LeRobot returns the originating observation timestamp/timestep in the first action and exposes merge points. Stage A must prove that repeated timesteps, reordered returns and aggregation contributors can be matched without changing the wire/action protocol.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: `4aaff99be4a1d81568c08c8f0296b41b40c99ec4`, checked 2026-08-30. The commit itself changes dependency bounds, not async inference files.
- Current official documentation checked: LeRobot async guide, inference/RTC guides, ICLR 2026 LeRobot paper, current GitHub source/tests/issues.
- Actual source paths/symbols checked: `RobotClient._ready_to_send_observation`, `_aggregate_action_queues`, `receive_actions`, `control_loop_observation`; `PolicyServer._enqueue_observation`, `_time_action_chunk`, `_predict_action_chunk`; `RobotClientConfig` and `PolicyServerConfig`.
- Default/non-default flags, thresholds and configurations checked: `chunk_size_threshold` default 0.5 and valid [0,1], `actions_per_chunk`, `fps`, `aggregate_fn_name`, `inference_latency`, observation timeout, queue visualization, must-go behavior.
- Discovery absence claim confirmed, narrowed or contradicted: confirmed for explicit age-SLO configuration; narrowed because current code already removes actions with `timestep <= latest_action`, overwrites old server observations, aggregates overlapping actions, logs timing, and a separate RTC rollout backend tracks delay.
- If contradicted, current native mechanism and finite configuration-grid baseline: no direct contradiction. Native mechanism is occupancy threshold plus timestep legality filtering; its full grid is mandatory.
- Any non-tuning residual that remains: contributor-provenance freshness, explicit budget, joint send/admission and full-cost contract.

### Clock and age semantics audit

1. Current `TimedObservation.timestamp` uses client `time.time()`. The server subtracts its own `time.time()` for one-way logs, which is invalid without cross-host synchronization; public logs can even show the client ahead of the server.
2. Returned `TimedAction.timestamp` is derived from the originating observation timestamp plus action-index × `environment_dt`; it is a nominal logical action time, not a server-generation timestamp.
3. The candidate must not subtract server and client wall clocks. At client capture, store `(echoed_wall_timestamp, observation_timestep) → local_monotonic_capture`. Match a returned chunk through its first action's echoed pair, and carry contributor sets through queue aggregation.
4. For an unaggregated action, observation age is `client_monotonic_execute - client_monotonic_capture(origin)`. For a weighted aggregate, the safe conservative age is the maximum age over nonzero contributors; an effective weighted age may be reported only as a secondary metric.
5. Any ambiguous origin, lost sidecar, impossible monotonic ordering or clock rollback must fail closed before a claim-bearing run. If matching requires a new wire identifier, Mainline must decide whether that violates the frozen protocol; the current Stage A plan first tests the no-wire-change route.

## Stage A highest-risk probe plan

- Risk-bearing premise: exact contributor age can be reconstructed under duplicate observation timesteps, server latest-only observation queueing, out-of-order returns, overlapping action aggregation and wall-clock discontinuity without changing policy/action/wire semantics.
- Cheap discriminating probe or counterexample search: exhaustively enumerate short traces (queue length ≤4, two overlapping chunks, duplicate/reordered returns, all four aggregation functions, empty-queue/must-go, wall-clock jumps) and compare the sidecar's age/admission decision with a reference event-history oracle. Then replay measured same-host timing traces and condition on equal occupancy.
- Negative result that kills the direction: any legal trace admits an action whose contributor age violates the budget without an explicit accounted hold/safe-stop; origin is ambiguous without protocol change; or measured traces produce no age-conditioned decision/value beyond occupancy after matched request cost.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

- A same-object current source satisfies all direct-fatal predicates.
- Contributor provenance cannot be defined without changing the frozen object or action semantics.
- The only viable algorithm reduces to per-policy static threshold tuning or generic AoI thresholding with no LeRobot-specific systems substance.
- The legality/no-idle contract hides stale execution, uncounted holds, altered task denominator or unsafe unbounded motion.
- Fair tuned baselines match or dominate the full-cost Pareto frontier, or age has no incremental decision value at equal occupancy/cost.

## Discovery repair vector

- Codes: `OMITTED_CURRENT_SAME_OBJECT` is not triggered; `OMITTED_GENERIC_KERNEL`, `ATOMIC_ACTION_UNCLEAR`, `NATURAL_CARRIER_GAP`, `FULL_COST_GAP`, `Q2_SHAPE_GAP`.
- Materiality: material direct subtraction and fidelity narrowing. ActFovea, RAPID and FlashVLA were available before the frozen cutoff and should have appeared in the latest union; generic AoI/UoI work constrains the algorithmic novelty claim.
- Was the missing information available before the frozen cutoff?: `YES`.
- Does this feedback alter the independent scientific decision?: `NO`; the vector is diagnostic and non-decisional. The independent verdict above was formed after incorporating the sources.

## Dual-axis score

- Academic value: `44/70`
- AI executability bonus: `25/30`
- Total: `69/100`

## Human research reserve

Not applicable. The decisive Stage A gate is publicly executable; real robot evidence is a later ceiling issue.

## User-action blocker

None.
