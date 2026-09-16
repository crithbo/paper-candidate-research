# SOURCE121-S1-EXECUTORCH-QFALLBACK-RANK-VALIDITY Stage 0 Report

## 中文摘要

- 结论：`PASS_RECOMMENDED`。
- 为什么：当前 ExecuTorch 官方工具已经提供 partition/delegation 表、ETRecord/ETDump、operator/delegate timing、端到端 `Method::execute` 和数值差异检查，因此普通 profiling、delegated share 或 dashboard 不是贡献。有界检索未发现同一 `.pte`/质量合同下，系统验证这些 proxy 能否保持量化/backend 配置的端到端排名，并在 held-out model 上校准 fallback-boundary/full-cost 预测误差的现有工作。该 residual 是有限、可证伪的 N3 benchmark-validity 题。
- 下一道门：MAINLINE 验收后交 SENTRY 独立确认；若确认 PASS，Stage A 首门只允许冻结三模型 CPU/XNNPACK panel，并验证当前 observability 能否形成不重叠计价的 boundary/full-cost 特征与 profiling-off 排名真值。
- 是否需要用户操作：否。

- Lane id: `STAGE0_PRIMARY`
- Assignment id: `STAGE0-PRIMARY-20260830-EXECUTORCH-QFALLBACK-RANK-VALIDITY`
- Input freeze SHA-256: `62D7B0F42E6B01535F763E233A2A151CB62ED25FEAEF088FFC456B2826F760BD`
- Cross-assignment contamination declaration: `false`; queued LeRobot assignment was not read.
- Scientific verdict: `PASS_RECOMMENDED`
- Operational disposition: `READY`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.77`
- Evidence ceiling: `CONDITIONAL_CANONICAL_EXECUTORCH_BENCHMARK_VALIDITY_ONLY; NO RANKING RESULT OBSERVED`
- Novelty route: `N3` primary; no standalone N2 claim for collecting native traces.
- Candidate Q1 venue family: empirical software engineering / mobile systems measurement (`TSE/TOSEM/JSS` or equivalent); Q1 is not currently claimed.
- Stage semantics: conditional paper-potential screen; this report does not establish a ranking reversal or performance gain.

## Optional process telemetry

- Atomic repair trace mode/artifact path/hash, if assignment-enabled: `OFF_BY_MISSING_MODE_FAIL_CLOSED / NOT_APPLICABLE`
- Decision effect while nonproduction: `NONE`
- Current-cycle reset control correction: ACK's `usage_reset_confirmed=true` was a historical-plan misread. Canonical correction is `stages/control/user-authorizations/CURRENT_CYCLE_USAGE_RESET_STATUS_20260830.yaml`, SHA256 `049A509C0F49EFD3EC5901CDB854F2C000926EE7CD2B0F7AC52E91B3F09D93D8`, with `confirmed=false`. Scientific effect: `NONE`.
- Authorized source activity: 11 bounded web connector calls; no code/artifact download, persistent resource action, build, experiment or implementation. Exact network-byte telemetry was unavailable and was not estimated.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a reproducible measurement/benchmark paper showing when native partition and delegate-time proxies preserve or reverse full end-to-end configuration rankings, under fixed model semantics and quality thresholds.
- Current evidence-acquisition readiness/risk: E1 is credible. Official source exposes all required graph identities, runtime events, end-to-end timing loci and output validation. The main risk is that explicit boundary conversion/layout/synchronization events are not individually labeled, so the estimator must remain predictive rather than claim causal attribution.
- Why missing implementation/results/proof/hardware is not structurally fatal: Stage 0 is conditional. A public CPU/XNNPACK route can attack the first premise without proprietary accelerators.

## Discovery provenance

- Opportunity origins: `O1 / O4 / O8`
- Domain tags: `ExecuTorch, quantization, XNNPACK, delegation, CPU fallback, measurement validity`
- Paper genealogy: mobile benchmark/full-SUT measurement → kernel/operator latency predictors → ExecuTorch backend partition and developer tools → boundary-aware proxy-validity audit.
- Discovery method revision: `RQ_REFINEMENT_STAGED_EVIDENCE_V1 + EXACT_PUBLIC_CARRIER_FIRST`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `OF-S121-S1-EXECUTORCH-QFALLBACK-RANK-VALIDITY-01`
- Contribution type and type-contract verdict: `MEASUREMENT_CHARACTERIZATION / BENCHMARK_DATASET`; conditionally complete after restricting boundary terms to predictive features and using profiling-off end-to-end ranking as truth.
- Independently audited A/C/D/E coordinates: `A1/C0/D1/E1`; full direct coverage is rejected below.
- Backtest reference and status: no method backtest used as candidate evidence.
- Reminder: method calibration is not candidate evidence.

## Frozen object and claim

The exact object is a fixed official ExecuTorch source model, input panel and output-quality threshold exported into precommitted `.pte` configurations on one pinned CPU target. The admissible endpoint is whether proxy rankings—delegated node/share, delegated subgraph count and delegate-only event time—agree with profiling-off end-to-end configuration rankings after charging export/lowering, initialization, artifact size, portable fallback, delegate calls, host/operator time, validation and observer effect.

The claim is not that fallback is always expensive, that one backend/quantization is universally faster, or that Inspector directly measures boundary conversion/layout/synchronization cost.

## Claim-package completeness audit

- Atomic action and mechanism: map a frozen configuration to partition identity plus trace features, predict its full-cost rank, and compare that rank against repeated profiling-off end-to-end measurements.
- Information/assumption contract: only current official graph metadata and measured runtime events; no private device counters or result-aware feature selection.
- Effect target/output/guarantee: rank agreement/reversal and held-out prediction error while satisfying the same source→edge→runtime quality threshold.
- Boundary/failure region/competing explanation: proxy error may reflect delegate boundary crossings, layout/conversion/synchronization, portable fallback kernels, initialization, instrumentation overhead or runtime noise. These explanations must remain distinguishable where observable and otherwise be reported as unresolved residual, not assigned causally.
- Minimum falsifier: native simple proxies retain the same ranking and uncertainty class across all frozen model/configuration cells, while the boundary-aware feature set offers no held-out improvement.
- Dependencies and evidence ceiling: public CPU, exact ExecuTorch commit, three public official models and current native tools; canonical benchmark-only ceiling.
- Opportunity-family relation audit: native Developer Tools contain observables, not a validated ranking estimator. nn-Meter supplies a general kernel-level prediction method, not the same ExecuTorch fallback/quality object. MLPerf Mobile supplies a full-SUT measurement discipline, not proxy validity.
- Independent search identity/scope: current ExecuTorch repository/docs/paper, Inspector and delegation APIs, XNNPACK/portable fallback docs, official model/export lists, nn-Meter, MLPerf Mobile and delegate-performance adjacency through 2026-08-30.
- Evidence-ledger integrity and contradiction disclosure: no ranking, latency, accuracy or reversal was observed in this review.

## Positive opportunity map

- Natural workloads: claim ceiling is canonical benchmark only. Proposed minimum public panel is three official ExecuTorch-supported small LLMs—`HuggingFaceTB/SmolLM2-135M`, `Qwen/Qwen2.5-0.5B`, and `Qwen/Qwen3-0.6B`—with exact weights/license/hashes to be frozen before execution.
- Observed or expected cost/headroom: current official LLM example shows 2,588 delegated and 2,513 non-delegated nodes across 368 subgraphs for one configuration, demonstrating that mixed delegation is a real current carrier. This is a source observation, not candidate performance evidence.
- Mechanism-specific prediction: proxy error increases when configs differ in fallback topology or when equal delegated share masks different subgraph fragmentation/host work; it should vanish on fully delegated or identically partitioned graphs.

## Named baselines and fairness contract

1. Delegated-node/share from `get_delegation_info` / verbose export.
2. Delegated-subgraph count and partition-table features.
3. Sum or share of delegate-only ETDump event time.
4. Raw profiling-on `Method::execute` time.
5. profiling-off repeated wall-clock end-to-end ranking as evaluation truth, not an online proxy.
6. nn-Meter-style kernel/execution-unit predictor as methodological ceiling where features are available.

Every configuration must preserve the same source model, tokenizer/input, generation or task endpoint, output-quality threshold, warm/cold state, thread count, affinity and target. Failed or unsupported exports/runs remain in the denominator. Export, quantization, lowering, program load/method initialization, runtime, artifact size, numerical validation and instrumentation deltas are reported separately to avoid double counting.

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | Current ExecuTorch paper/tools use the same export→partition→`.pte`→runtime object | PASS |
| Same scenario/workload | Official evaluation covers models/backends, but no located source freezes the proposed three-model proxy-validity panel | FAIL |
| Same or weaker information | Native tools expose graph identities, delegate/fallback events and end-to-end timing | PASS |
| Atomic action covered | Profiling and delegation counting are covered; held-out full-cost rank validation is not | FAIL |
| Same/stronger legality, quality and guarantee | BundledProgram/Inspector support output validation, but no located ranking study freezes one common threshold | FAIL |
| Same non-worse full-cost boundary | ExecuTorch evaluation and tools expose pieces; no located source jointly prices all lifecycle and observer-effect dimensions for ranking validity | FAIL |
| Comparable scale/platform/version/config | System paper is broader across devices/backends; candidate pins current CPU/XNNPACK and multiple configurations | PARTIAL |
| Sufficient full-text/implementation/reproduction depth | Current source/docs and MLSys paper are deep enough to subtract native tools | PASS |

`DIRECT_FATAL`: `NO`. Novelty remains `SEARCH_BOUNDED_OPEN`; no global-first claim is made.

### Nearest-prior facet matrix

| Prior/current source | Same object | Estimator/proxy | Fallback boundary | Quality contract | Held-out rank validity | Classification |
|---|---:|---:|---:|---:|---:|---|
| ExecuTorch MLSys 2026 system paper | yes | performance/component measurements | architecture describes partition/delegate | preserves PyTorch semantics broadly | no located conjunction | `DIRECT_SUBTRACT` |
| ExecuTorch Developer Tools | yes | delegation table, operator/delegate/end-to-end events | inferable but not explicitly itemized | BundledProgram/numerical discrepancy | no | `DIRECT_SUBTRACT / DEPLOYMENT_BASELINE` |
| nn-Meter, MobiSys 2021 | no, generic edge runtimes | kernel-level latency predictor | runtime optimization captured indirectly | no same `.pte` threshold | held-out prediction at large scale | `METHODOLOGICAL_ADJACENT` |
| MLPerf Mobile, MLSys 2022 | mobile full SUT | canonical end-to-end metrics | delegate internals not estimand | explicit quality/run rules | no proxy audit | `METHODOLOGICAL_ADJACENT` |
| LiteRT Delegate Performance Benchmark | different framework | startup/stable latency | delegate/fallback deployment | framework-specific | no same-object held-out rank study located | `DEPLOYMENT_BASELINE` |
| Parallax mixed CPU/delegate work | different runtime/action | analytical boundary-transfer cost | explicit mixed-graph concern | not same artifact/quality contract | scheduler optimization, not rank validation | `METHODOLOGICAL_ADJACENT` |

### Seed-distance and method-name deletion test

After deleting framework/tool names, the residual remains: determine when partition-coverage and component-time proxies preserve the end-to-end ranking of quantized heterogeneous-runtime configurations under one quality contract. This is a specific measurement-validity question, not merely “profile the model.” It survives the deletion test.

## Competing mechanism decision

- Selected mechanism: partition fragmentation and portable fallback make delegated share/delegate-only timing an incomplete proxy for full-system cost.
- Registered backup: observer-effect or initialization may dominate the same ranking error. These are alternative explanations to test, not a separate mechanism pivot.
- Pivot boundary: selecting or modifying backend partitions to improve performance, changing models/quality thresholds after results, or adding proprietary-device strata changes the assignment and is forbidden.

## Residual paper kernel

A current, public, reproducible benchmark-validity study that estimates and falsifies the conditions under which native ExecuTorch proxy metrics preserve configuration rank. The contribution is the validated estimator/negative boundary and trace panel, not the raw observability infrastructure.

## Evidence route

- `MEASUREMENT_MECHANISM`

## Performance-optimization admissibility, if applicable

Not a performance-optimization paper. No policy or backend is optimized. Performance is the measured object used to audit proxy validity.

## Q1/Q2 paper shape

- Problem: users select quantization/backend configurations using convenient partial proxies, while unsupported/fallback regions and lifecycle costs may change the decision.
- Contribution: same-artifact, quality-gated proxy-validity estimator and public trace panel with held-out model validation.
- Evidence plan: three public small models; at least three precommitted configurations per model; partition/ETDump features; profiling on/off pairs; output checks; repeated full-cost ranking; held-out prediction and failure-boundary analysis.
- Expected paper narrative: current observable proxies → their information loss → frozen estimator → ranking validity/reversal or validated no-reversal region → guidance on when proxies are safe.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: ExecuTorch (MLSys 2026), nn-Meter (MobiSys 2021 Best Paper), MLPerf Mobile (MLSys 2022).
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: one framework and CPU target cap Q1 potential; Q2 requires held-out validity rather than a dashboard.
- Evidence-shape gap: no model/config cell, observer-effect estimate or rank result exists yet.
- Stage A closure plan: first verify observability and same-quality execution on one model/two configurations; proceed only if features are non-overlapping and a three-model held-out panel is feasible.

## Non-relaxable quality audit

- Same-object: PASS.
- Latest collision: PASS for bounded Stage 0; current tools and paper fully subtracted, no full conjunction found.
- Strong fair baselines: PASS conditionally; six named proxies/ceilings.
- Natural input/evidence: canonical benchmark-only route is honest; no deployment generalization.
- Full-cost: finite and explicit, not yet observed.
- Reproducibility: public commits/models/configs and deterministic inputs can be frozen.
- Evidence/claim honesty: no reversal, accuracy or speedup is claimed.

## Evidence path and AI completion

- E1/E2 execution-readiness audit; scientific inference explicitly excluded: E1 confirms official model IDs, configs, partition tables, ETRecord/ETDump/Inspector and output validation. E2 was not run and is not needed for Stage 0.
- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.90`
- 72-hour first evidence: after separate authorization, freeze one model and two configurations, generate identical source/edge/runtime outputs, collect paired profiling on/off traces and test whether one boundary feature is identifiable without double counting.
- Human-only items and why they are non-decisive: venue choice and interpretation of device external validity; neither decides the first falsifier.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: yes, after restricting boundary terms to predictive features rather than direct causal measurements.
- Comparator, denominator, full-cost and small-witness plan: finite; all model×configuration cells and failures remain visible.
- Why an unimplemented interface/format/checker is not structurally fatal: native trace and output-check interfaces exist; Stage A must prove composition and timing support on exact configurations.
- Reminder: Stage A must close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before any claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: visible ExecuTorch `main` commit `c27baa8031862fb7528bb87616d6793a032a1257`, checked 2026-08-30. Stage A must revalidate the immutable commit before execution.
- Current official documentation checked: ExecuTorch architecture/backend delegation, XNNPACK, quantization overview, LLM export, Developer Tools/Inspector and getting-started model routes.
- Actual source paths/symbols checked: `extension/llm/export/config/llm_config.py`, `export_llm`, `get_delegation_info`, `ETRecord`, `ETDump`, `Inspector.Event`, `Method::execute`, XNNPACK partitioner and portable fallback descriptions.
- Default/non-default flags, thresholds and configurations checked: XNNPACK enabled/disabled, `extended_ops`, 8da4w and related current quantization routes, debug verbose, ETRecord generation, profiling on/off.
- Discovery absence claim confirmed, narrowed or contradicted: native observables confirmed; absence of an explicit ranking-validity conjunction remains search-bounded. Direct boundary-cost observability is narrowed: the tools expose events and graph mapping, not a canonical causal boundary-cost field.
- If contradicted, current native mechanism and finite configuration-grid baseline: native delegation/Inspector/simple-proxy grid listed above.
- Any non-tuning residual that remains: held-out validation of proxy rank against full-cost truth.

## Public model-panel audit

- Minimum panel: `HuggingFaceTB/SmolLM2-135M`, `Qwen/Qwen2.5-0.5B`, `Qwen/Qwen3-0.6B`, all named by current official ExecuTorch model/export code.
- Why three are sufficient for Stage A risk testing: they provide a small-to-moderate transformer size range while staying on one CPU/XNNPACK semantic route; two can calibrate and one can remain held out.
- Required freeze before execution: exact model revisions, file hashes, licenses, tokenizer/config hashes, prompt/input panel, output-quality thresholds and any authentication-free reacquisition route.
- Ceiling: three public models can support Q2 conditional evidence, not broad mobile-device or backend generalization.

## Stage A highest-risk probe plan

- Risk-bearing premise: current ETRecord/ETDump/partition metadata can form a non-overlapping predictive feature set whose held-out ranking accuracy exceeds simple native proxies while profiling-off end-to-end truth remains reproducible.
- Cheap discriminating probe or counterexample search: one smallest official model; portable-only vs XNNPACK standard vs XNNPACK `extended_ops` where supported; identical quantization/inputs; source→edge→runtime quality check; delegation table; ETDump on; external timer on/off; initialization separated; one replay for determinism before any panel expansion.
- Negative result that kills the direction: no legal result-independent configurations with different fallback topology; boundary features cannot be separated without double counting; instrumentation changes rank beyond uncertainty; output thresholds fail; or the estimator offers no held-out rank improvement over delegated share/delegate-only/end-to-end simple proxies.
- Positive-result ceiling: preliminary support/non-falsification only; not proof of the final paper claim.

## Stop conditions

1. Current native paper/tool work is found to contain the full same-object held-out ranking-validity conjunction.
2. Public models/configurations cannot preserve one output-quality contract or produce a visible denominator.
3. Boundary/fallback features cannot be observed or inferred without circular use of the ranking target.
4. Profiling observer effect makes configuration rank unstable.
5. The three-model held-out estimator does not beat simple proxies or yields no decision-changing information.

## Discovery repair vector

- Codes: `ATOMIC_ACTION_UNCLEAR`, `FULL_COST_GAP`
- Materiality: moderate. Discovery treated boundary cost as derivable; Stage 0 narrows this to predictive graph/trace features validated against profiling-off full-cost truth and requires explicit non-overlap/observer-effect accounting.
- Was the missing information available before the frozen cutoff?: yes, from current Inspector and runtime docs.
- Does this feedback alter the independent scientific decision?: `NO`; it narrows the claim and strengthens the Stage A killer while retaining Tier-B potential.

## Dual-axis score

- Academic value: `46/70`
- AI executability bonus: `27/30`
- Total: `73/100`

## Human research reserve, if applicable

Not applicable.

## User-action blocker, if applicable

Not applicable. No claim-bearing observation was obtained, no resource failure occurred and no scientific revision was consumed.

## Source verification note

This review used AI-assisted source search and synthesis. Claims are limited to cited official/current sources and primary publication pages. The novelty conclusion is search-bounded rather than exhaustive.
