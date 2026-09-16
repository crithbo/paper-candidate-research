# SOURCE121-S1-EXECUTORCH-QFALLBACK-RANK-VALIDITY Boundary-aware validity of quantized ExecuTorch backend rankings

## 中文摘要

- 研究机会：ExecuTorch 官方流程同时提供量化配置、AOT backend partition、CPU fallback、delegation 表与 ETRecord/ETDump/Inspector，但常用的 delegated share 或 delegate-only timing 可能不能代表完整端到端配置排名。
- 为什么可能值得做：可在官方模型/config carrier 上冻结同对象 estimator，验证 fallback boundary、转换/布局/同步、初始化和观测开销是否导致配置排序反转，并发布可复现 trace panel。
- 为什么保留：对象、canonical benchmark carrier、决策端点、强比较器、full-cost 与最低 falsifier 已明确；当前工具提供观测量但未在本次边界内直接覆盖完整 ranking-validity conjunction。
- 下一步：Stage 0 独立核验最新 ExecuTorch 论文/工具是否已覆盖该 conjunction，并判定 3-5 个公开官方模型和本机 CPU 路线是否足以形成 Q2；否则 DROP。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O1 / O4 / O8`
- Domain tags: `ExecuTorch, quantization, backend delegation, CPU fallback, measurement validity`
- Contribution route: `N3 / N2`
- Discovery date: `2026-08-30`
- Discovery method revision: `RQ_REFINEMENT_STAGED_EVIDENCE_V1 + EXACT_PUBLIC_CARRIER_FIRST`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `PRODUCTION; RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Opportunity family ID: `OF-S121-S1-EXECUTORCH-QFALLBACK-RANK-VALIDITY-01`
- Contribution type: `MEASUREMENT_CHARACTERIZATION / BENCHMARK_DATASET`
- Local audit coordinates: `A1/C0/D1/E1`
- Discovery divergence seed ID/path: `S121-S1-08 / DIVERGENCE_SEED_POOL.md`
- Discovery RQ candidate ID/path: `RQ08 / RQ_CANDIDATES.md`
- Discovery question card ID/path: `QC-RQ08 / QUESTION_CARDS.md`
- Front-end disposition before deep review: `EVIDENCE_QUALIFIED_RAW`
- Carrier kind: `CANONICAL_BENCHMARK_ONLY`

## Research question

For fixed official ExecuTorch models, inputs, output-quality thresholds and target device, when does charging quantized fallback-region and delegate-boundary full cost change the ranking of precommitted backend/quantization configurations relative to delegated-share or delegate-only proxies?

## Canonical research claim package

- Exact object and contract: `.pte` artifacts generated from the same official model/input under precommitted current ExecuTorch configurations; outputs must satisfy one frozen source→edge→runtime quality threshold.
- Canonical workload: 3-5 publicly reacquirable official ExecuTorch example/LLM models, exact commit and weights to be frozen by Stage 0/Stage A.
- Static anchor: the official LLM export documentation presents `8da4w`, XNNPACK/`extended_ops`, a delegation table with thousands of delegated and non-delegated nodes, and ETRecord generation.
- Atomic action: derive a boundary-aware full-cost estimator from AOT partition identity plus ETRecord/ETDump events; use it only to rank frozen configurations.
- Mechanism: quantized fallback fragments execution and adds boundary/host costs not represented by delegated share or delegate-only time; prediction is that proxy error grows with boundary-weighted fallback structure.
- Information contract: only compile-time graph/partition metadata and measured trace events available to the current tooling; no private device telemetry.
- Named comparators: delegated-node/share; delegated-subgraph count; delegate-only event time; unmodeled end-to-end timing.
- Output: ranking-validity/reversal matrix and held-out prediction error, not a universal claim that one backend is faster.
- Full cost: export/lowering, initialization, artifact size, delegate/fallback execution, conversions/layout/synchronization, host time, repeat variance, numerical checking and observer effect.
- Failure/no-gain region: fully delegated graphs, negligible boundary cost, CPU-only configurations with identical regions, or Inspector observability too coarse to attribute boundaries.
- Minimum falsifier: no decision-changing reversal and no held-out prediction improvement over simple proxies on the frozen panel.
- Dependencies/ceiling: public CPU-first route; optional device strata are conditional. Discovery produced no run or empirical result.

## Genealogy and current collision

- Canonical anchor: current ExecuTorch backend, quantization/export and Inspector documentation.
- Closest current system work: the current ExecuTorch system paper and native developer tools; full facet audit is Stage 0 debt.
- Generic-kernel adjacency: TFLite delegate partition/fallback and general mobile DNN partition literature; methodological only unless same object and guarantee match.
- DIRECT_SUBTRACT: native profiling, delegation counting and numerical comparison are not contributions.
- DIRECT_FATAL: none established for the full same-object ranking-validity conjunction within 24 calls.
- SEARCH_BOUNDED_OPEN: current paper/tool union, exact model panel and device/config support.

## Named fair baselines

- Deployment/default: official ExecuTorch export with selected backend and portable CPU fallback.
- Current tool baseline: ETRecord/ETDump + Inspector without boundary-aware ranking estimator.
- Competitive simple baselines: delegated-node/share, subgraph count, delegate-only time, raw end-to-end time.
- Offline ceiling: post-hoc oracle ranking from complete measured end-to-end cost, used only as an evaluation ceiling.

## Decisive falsifier

Drop if current same-object work already provides the conjunction with a non-worse cost/guarantee boundary, if a public panel cannot be frozen without changing model/quality semantics, or if boundary-aware attribution does not change or improve any held-out ranking decision.

## Executable evidence path

### Current upstream reality check

- Current upstream/date: ExecuTorch official current docs/source observed 2026-08-30; exact tag/commit remains a Stage 0 freeze item.
- Documentation: backend overview, `export_llm`, quantization overview, Inspector API.
- Current surfaces: `QuantizationConfig`, XNNPACK `enabled/extended_ops`, verbose delegation output, ETRecord/ETDump, Inspector `Event` and numerical-gap APIs.
- Contrary evidence: the native union already exposes the raw observables; retained residual is validity estimation/held-out decision evidence, not missing tooling.
- No absence claim is used to assert novelty.

### Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Atomic interface: frozen model/config/input → `.pte` + partition table + paired ETRecord/ETDump → validated output → boundary/full-cost features → configuration ranking.
- Native semantics: official exporter, backend partitioner, portable CPU fallback, Inspector event timing and numerical comparator.
- Same-object boundary: identical source model, input panel and output-quality threshold across configurations; unsupported artifacts remain denominator-visible.
- Denominator/full-cost: all precommitted model×configuration cells; compile/init/storage/runtime/boundary/host/validation/observer-effect dimensions.
- Small witness: one official model with two result-independent configurations that differ only in `extended_ops` or an equivalent frozen support-set control, plus source→edge→runtime output checks.
- Finite steps: freeze commit/models/configs; verify all cells; generate trace pairs; validate attribution; run held-out ranking analysis; release manifest/panel.
- Structural failure: requires proprietary weights/device, changes model semantics, uses edge output as an unvalidated golden, deletes failed cells, or cannot observe boundary cost with current APIs.

### Front-end closure debt

- Current union: independent full read of the current ExecuTorch paper and same-object benchmark tools.
- Corpus: exact public weights/licenses and 3-5-model sufficiency.
- Observer effect: ETDump/ETRecord overhead and instrumentation-on/off pairing.
- Q2 shape: minimum models/configs/devices and venue-family analogs.
- Owner/questions: Stage 0, at most four decisive questions; Stage A preclaim closes exact execution fidelity if Stage 0 passes.
- Claim ceiling: proposal only; no novelty, reversal, accuracy or performance claim.

### 72-hour first evidence

After a later authorization, freeze one official model and two result-independent configurations, verify source→edge→runtime output validity, and determine whether the trace can isolate a boundary-cost term distinct from existing proxy metrics. This is a future falsifier, not an executed result.

## Q1/Q2 sufficiency hypothesis

- Q2: plausible only with a reusable public panel, held-out validity result, decision-changing reversal or a validated no-reversal boundary, and complete full-cost reporting.
- Q1: not claimed; would require cross-backend/device generality and a stable mechanism beyond one framework release.
- Below-Q2 boundary: one model/device, unsupported-op counting, dashboarding, or routine performance comparison.

## Non-relaxable quality audit

- Same-object: fixed source model/input/quality threshold and ExecuTorch artifact contract.
- Latest collision: bounded first-party search complete; independent Stage 0 audit required.
- Strong baselines: native Inspector and simple proxy/end-to-end rankings.
- Evidence: canonical benchmark only; no natural deployment extrapolation.
- Full-cost: compilation through output validation and observer effect.
- Reproducibility: exact commit/config/model/input/trace manifest required.
- Honesty: zero build, experiment and observed ranking result.

## AI and researcher boundary

AI can perform public-source freezing, trace extraction, validation and analysis after authorization. Closed-device-only strata are conditional and cannot raise the claim ceiling without access.
