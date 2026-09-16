# SOURCE122-S1-ORT-EP-ASSIGNMENT-STABILITY Stage 0 Report

## 中文摘要

- 结论：`REVISE_ONCE`。不是科学 STOP；在同一 ONNX/ORT 对象内仍有潜在 `TIER_B_Q2_VIABLE` 残余，但必须先把含糊的“EP 或 optimizer-level deployment decision”收敛为一个预注册决策端点，并冻结合法 rewrite、lineage quotient 与完整分母。
- 为什么：当前 ORT 已原生提供 EP assignment 记录、strict CPU fallback、profiling、capacity/name/annotation-based assignment；Mobius 已提供 EP-aware graph rewrite 与 trace；QNN 路线已有 source→EP-input→backend-op provenance；ModelMeta、OODTE/DiTOX、OATest 已分别覆盖等价模型变异、ONNX optimizer differential testing 和 ORT optimization-aware graph synthesis。它们没有单独完成“等价表示是否使预注册部署决策失效”的 conjunction，因此不构成 DIRECT_FATAL，但已扣除 mutation、assignment API、lineage、profiling、EP-aware rewrite 和通用 performance anomaly 等宽泛贡献。
- 下一道门：SENTRY 独立确认本次 `REVISE_ONCE`；若确认，revision 只能保持 exact object/RQ 不变，选择一个决策端点、一个版本兼容公共 EP 栈、4 个 canonical rewrite families 和 quotient-lineage denominator。之后才能重新进入 Stage 0 closing；不得直接进入 Stage A。
- 是否需要用户操作：否。

- Lane id: `STAGE0_PRIMARY`
- Assignment id: `STAGE0-PRIMARY-20260830-ORT-EP-ASSIGNMENT-STABILITY`
- Input freeze SHA-256: `45AADF7DCC0865C02E2997B5768C6DEDDE1477B78543A21F80DCCCC7C96EE637`
- START SHA-256: `CF55D894436346480AB6C0A44F308E18A178BDD71F02914D781AE08341B75F79`
- Cross-assignment contamination declaration: `false`; no TorchDynamo assignment/source packet was read.
- Scientific verdict: `REVISE_ONCE`
- Operational disposition: `NONE`
- Quality tier: `TIER_B_Q2_VIABLE` only after the bounded repair; current packet is not Stage-A-ready.
- Confidence: `0.86 (high)`
- Evidence ceiling: `STATIC_CURRENT_SOURCE_AND_PRIMARY_FULLTEXT__ZERO_CANDIDATE_RESULT__CANONICAL_BENCHMARK_HYPOTHESIS_ONLY`
- Novelty route: `N3 primary / N2 conditional`
- Candidate Q1 venue family: software testing, ML systems, compiler/runtime measurement; current evidence does not justify Q1 potential.
- Stage semantics: conditional paper-potential screen; this report does not establish instability, decision regret, novelty, or effectiveness.
- Search/open use: `28/32`; zero implementation, build, experiment, Stage A/B, resource download, or shared write.

## Optional process telemetry

- Atomic repair trace mode/artifact path/hash: assignment omitted the mode; effective `OFF` by the frozen missing-mode rule.
- Decision effect while nonproduction: `NONE`.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a benchmark/measurement paper showing that semantically equivalent ONNX representations cause reproducible EP-assignment and full-cost changes that invalidate a deployment choice made on only one representation, with a quotient-lineage artifact and held-out decision-regret analysis.
- Current evidence-acquisition readiness/risk: ORT 1.24+ exposes the necessary assignment metadata and public wheels exist; the decisive phenomenon has not been observed. The packet has not frozen a single decision endpoint or an equivalence/lineage denominator strong enough to prevent post-result selection.
- Why missing implementation/results/hardware is not structurally fatal: Stage 0 does not require a result. Public CPU/CUDA/DirectML routes make the first falsifier finite. The problem is contract ambiguity, not unavailable hardware.

## Discovery provenance

- Opportunity origins: `O1 / O6 / O8`
- Domain tags: `ONNX Runtime`, `execution providers`, `graph partitioning`, `metamorphic testing`, `benchmark validity`
- Paper genealogy: ONNX/ORT graph optimization and EP partitioning → general DL-compiler differential/fuzz testing (NNSmith) → ModelMeta model-level metamorphic testing → OODTE/DiTOX ONNX-optimizer differential testing → OATest optimization-aware ONNXRuntime test synthesis → current ORT assignment/profiling/manual partition controls, Mobius EP-aware rewrites and QNN provenance tooling.
- Discovery method revision: `RQ_REFINEMENT_STAGED_EVIDENCE_V1 + EXACT_PUBLIC_CARRIER_FIRST`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `OF-S122-S1-ORT-EP-ASSIGNMENT-STABILITY-01`
- Contribution type and type-contract verdict: `BENCHMARK_DATASET / MEASUREMENT_CHARACTERIZATION` is plausible; `COMPILER_TOOL` is not yet justified because current first-party/tooling already supplies most infrastructure.
- Independently audited A/C/D/E coordinates: `A1 / C0 narrowed / D1 / E1-static-only`
- Backtest reference and status: method calibration only; no candidate evidence.

## Frozen object and claim

Exact object remains ORT EP partitioning and assignment metadata for equivalent ONNX graphs under frozen ORT version, EP order/options, optimizer level, input set and output-quality threshold.

The only defensible residual claim is:

> A precommitted deployment choice learned from one ONNX representation may incur measurable held-out regret on semantics-equivalent representations because pre-partition normalization, fusion and EP capability boundaries alter assignment and full cost; assignment-lineage features may explain or predict this failure better than output-only, node-count or raw-timing baselines.

The current packet is not precise enough because “EP or optimizer-level deployment decision” names two different decision problems. The revision must select one. Recommended primary endpoint is optimizer-level selection on one fixed public stack: choose among `ORT_ENABLE_BASIC / ORT_ENABLE_EXTENDED / ORT_ENABLE_ALL` for fixed `CUDAExecutionProvider, CPUExecutionProvider`, minimizing a frozen full-cost objective under an output threshold. Cross-EP selection may remain an external-validity stratum, not a co-primary endpoint.

## Claim-package completeness audit

- Atomic action and mechanism: generate only preregistered canonical equivalent variants; collect legality, semantic-region lineage, post-optimization assignment and full cost; train/tune on source representations; make one frozen optimizer-level choice; measure held-out regret/rank flip on unseen variants.
- Information/assumption contract: public graph and rewrite manifest, ORT assignment metadata and measured profile only. No private EP telemetry, post-hoc deletion of failed cells or test-set oracle choice.
- Effect target/output/guarantee: decision-regret and rank-stability characterization, not a universal fault claim or universal best EP.
- Boundary/failure region/competing explanation: variants normalized by ORT before partition should not differ; assignment differences can be decision-neutral; timing variance, warmup, cache and observer overhead can explain apparent flips; current first-party manual/capacity assignment may dominate a learned selector.
- Minimum falsifier: no surviving assignment difference after canonical normalization; all differences are full-cost/decision neutral; raw timing or simple structural counts predict the decision equally well; lineage is ambiguous; or final breadth cannot exceed a tiny hand-picked panel.
- Dependencies and evidence ceiling: public ORT/ONNX wheels and models, CPU plus RTX 4070. Closed QNN device/SDK evidence cannot raise the public ceiling.
- Opportunity-family relation audit: ModelMeta/OODTE/OATest/NNSmith are methodology/deployment baselines; Mobius and QNN tooling are first-party direct subtractors; current ORT controls are native baselines.
- Independent search identity/scope: official ORT/ONNX docs, release/tag source, PyPI packages, official Mobius/QNN repositories, primary papers/author artifacts; cutoff 2026-08-30.
- Evidence-ledger integrity and contradiction disclosure: the Discovery claim that assignment visibility exists is confirmed. The suggestion that stable lineage and tooling are largely absent is narrowed by current QNN provenance and Mobius trace tooling. No candidate effect was observed.

## Decisive public source ledger

- ORT v1.29 release and exact tag: <https://github.com/microsoft/onnxruntime/releases/tag/v1.29.0>
- ORT v1.26 Python assignment API: <https://github.com/microsoft/onnxruntime/blob/v1.26.0/onnxruntime/python/onnxruntime_inference_collection.py>
- Current session options, including assignment recording and partition controls: <https://github.com/microsoft/onnxruntime/blob/main/include/onnxruntime/core/session/onnxruntime_session_options_config_keys.h>
- ORT EP and graph-optimization design: <https://onnxruntime.ai/docs/execution-providers/>, <https://onnxruntime.ai/docs/performance/model-optimizations/graph-optimizations.html>
- ONNX checker and function semantics: <https://onnx.ai/onnx/api/checker.html>, <https://onnx.ai/onnx/repo-docs/IR.html>
- Public CUDA/DirectML install routes: <https://onnxruntime.ai/docs/install/>, <https://onnxruntime.ai/docs/execution-providers/CUDA-ExecutionProvider.html>
- ModelMeta (ISSTA 2025): <https://doi.org/10.1145/3728972>
- OODTE/DiTOX: <https://arxiv.org/abs/2505.01892>, <https://github.com/luludak/DiTOX>
- OATest (ICSE 2026): <https://arxiv.org/abs/2511.18918>
- NNSmith (ASPLOS 2023): <https://doi.org/10.1145/3575693.3575707>
- Mobius EP-aware building and benchmark design: <https://onnxruntime.github.io/mobius/execution_providers.html>, <https://onnxruntime.github.io/mobius/design/perf-benchmarking.html>
- QNN EP input graph/provenance/profiling: <https://github.com/onnxruntime/onnxruntime-qnn/blob/main/docs/execution_providers/QNN-ExecutionProvider.md>

## Positive opportunity map

- Canonical workloads: version-pinned official ONNX Model Zoo/Hugging Face `onnxmodelzoo` models and ORT test models; all remain canonical benchmark evidence, not natural deployment evidence.
- Source-grounded headroom: ORT performs provider-independent semantics-preserving rewrites before partition, EP-specific optimizations after partition, and maximal-subgraph assignment by ordered `GetCapability`. The current API records EP/subgraph/node name/domain/op type but does not itself test cross-representation decision stability.
- Mechanism-specific prediction: rewrite families that survive pre-partition normalization and cross a fusion/capability boundary should have larger semantic-region assignment distance and decision regret than variants normalized away; output-only equivalence should not explain those flips.

## Semantic rewrite legality and lineage audit

### Required legality levels

1. `L0_PROTO_LEGAL`: `onnx.checker.check_model(full_check=true)` plus strict shape/type/opset checks. This proves graph consistency only, not semantic equivalence.
2. `L1_RELATION_JUSTIFIED`: each rewrite has a spec/function-body proof, exact tensor rearrangement identity, or exhaustive finite-domain proof for the stated dtype/shape domain.
3. `L2_NUMERIC_ORACLE`: matched outputs on preregistered canonical inputs under dtype-specific absolute/relative/ULP tolerances, with NaN/Inf/signed-zero policy. This is empirical support, not universal semantic proof.
4. Cells failing any required level remain in the denominator as `ILLEGAL / UNPROVEN / NUMERIC_FAIL`; they are never silently removed.

`Identity`, inverse `Transpose`, inverse `Reshape`, `Split→Concat`, official ONNX Function expansion and carefully constrained `Gemm ↔ MatMul+Add` are candidate relation families. Identity and inverse pairs are also essential negative controls because ORT basic optimization may normalize them before partition. Approximate GELU, QDQ relocation, reassociation and quantization-format changes are not semantics-preserving by default and must not enter the primary panel without a narrower quality contract.

### Required lineage quotient

- Assign a stable `semantic_region_id` to each source region before rewriting.
- Each variant manifest maps a region to zero/one/many nodes and values; `NORMALIZED_AWAY`, `FUSED_MANY_TO_ONE`, `EXPANDED_ONE_TO_MANY`, `UNSUPPORTED`, `SESSION_FAIL` and `UNMATCHED` are explicit outcomes.
- Compare assignments over semantic regions, not raw node-name Jaccard. Raw names are only diagnostic because current assignment APIs expose name/domain/op-type and graph optimizers may eliminate or fuse source nodes.
- Record all `GetCapability` passes when a provider may repartition after layout transformations; current QNN documentation explicitly demonstrates multi-pass EP-input graphs.
- QNN's `source_to_optimized_matcher` directly subtracts a generic claim to have invented source→optimized/backend lineage. The candidate may reuse the concept as a baseline but must show a cross-variant decision-validity contribution on public local EPs.

## Public EP route

- `onnxruntime-gpu==1.26.x` is an official CUDA 12.8/cuDNN 9 route compatible with the local RTX 4070 class and already contains `get_provider_graph_assignment_info()`.
- `onnxruntime-directml==1.24.4` is an official Windows x64 wheel and the assignment API was introduced in the 1.24 API family; DirectML is now sustained-engineering, so it is an optional external-validity stratum.
- Current PyPI `onnxruntime-gpu==1.29.0` defaults to CUDA 13.0. It cannot be assumed compatible with the local software stack without a future resource preflight.
- Primary revision recommendation: freeze ORT 1.26.x + CUDA/CPU and one optimizer-selection endpoint. A same-version DirectML/CUDA cross-EP block may use 1.24.4 in isolated environments, but must not mix wheel versions inside one ranking denominator.
- QNN HTP is not a public local route without the appropriate Snapdragon device/SDK; its current provenance tools are literature/current-union subtractors only.

## Named baselines and fairness contract

1. `OUTPUT_ONLY_DIFFERENTIAL`: ModelMeta/OODTE-style legality and output oracle with no assignment features.
2. `RAW_TIMING_ONLY`: full warmup and repeated timing on each variant, choosing from the frozen optimizer grid without assignment features.
3. `SIMPLE_STRUCTURE`: original node/op histogram, assigned-node count, subgraph count and CPU fallback count.
4. `NATIVE_ASSIGNMENT`: current ORT `get_provider_graph_assignment_info()` plus strict fallback as a diagnostic control; no candidate lineage or held-out stability model.
5. `CURRENT_CONTROL_UNION`: optimizer-level grid, current capacity-aware/name/annotation assignment where version-compatible, and Mobius EP-aware build/trace for supported models.
6. Optional post-hoc oracle over all test cells is an upper bound only and cannot be presented as deployable.

All methods use identical models, variants, inputs, tolerances, provider order/options, warmup, repetition count, process isolation, cache policy and failed-cell denominator. Tuning is performed only on training models/variants; test variants and models remain held out.

## Full-cost contract

Mandatory dimensions:

- rewrite generation, legality and lineage-validation time;
- model and external-data bytes;
- process/environment start and provider load;
- session construction, graph optimization, EP compile, engine/context/cache creation and first-run warmup;
- steady-state latency distribution and throughput;
- host peak RSS, GPU memory, persistent cache bytes;
- host↔device transfer and synchronization where observable from public-wheel profiles;
- assignment recording/profiling observer effect, measured by paired runs with instrumentation disabled;
- unsupported, timeout, crash, numeric-fail and fallback cells;
- decision metric: regret versus the within-cell valid optimum under the frozen objective and quality constraint.

Profiling cannot replace end-to-end measurement. CUDA kernel-level CUPTI tracing requires a source build according to current ORT docs, so it is outside the initial public-wheel Stage A route; absence of kernel traces lowers the explanation ceiling but does not block the first assignment-stability falsifier.

## Collision analysis

### Eight-predicate direct-coverage audit

No single source passes all predicates.

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | OATest directly includes ONNXRuntime; native ORT/QNN/Mobius are same ecosystem. ModelMeta tests ONNX but not ORT EP assignment. | PARTIAL → FAIL_DIRECT |
| Same scenario/workload | Current works manipulate equivalent/optimization-aware graphs and measure runtime behavior. | PASS |
| Same or weaker information | ModelMeta uses model/runtime metrics; OATest uses optimization patterns; Mobius/QNN use EP-specific rewrite/provenance. None uses exactly the frozen held-out decision protocol. | FAIL |
| Atomic action covered | Mutation, rewrite tracing, assignment recording and lineage are covered separately; no source executes the full train-on-one-representation deployment choice and held-out regret test. | FAIL |
| Same/stronger legality, quality and guarantee | Existing work targets bugs, correctness, optimization or profiling—not representation-stable deployment decision validity. | FAIL |
| Same non-worse full-cost boundary | ModelMeta includes time/memory; Mobius has build metrics; ORT profiles runtime. None joins all initialization/cache/transfer/observer/failure/decision costs in the frozen conjunction. | FAIL |
| Comparable scale/platform/version/config | Existing papers use large panels, but not the current ORT assignment API and frozen public local EP route together. | FAIL |
| Sufficient full-text/implementation/reproduction depth | Primary full text and current official source/tool docs were checked. | PASS |

### Direct subtraction

- `ModelMeta`: equivalent model-level structural mutations, ONNX support, time/memory/resource/efficiency anomaly detection and 17-model/10-task evaluation.
- `OODTE/DiTOX`: official Model Hub corpus, optimized/original ONNX differential execution, per-pass localization and 130-model scale.
- `OATest`: ORT optimization-aware patterns, graph synthesis, crash/inconsistency oracles and large-scale bug discovery.
- `NNSmith`: valid diverse DL-compiler tests, floating-exception avoidance and differential testing across ONNXRuntime and other compilers.
- `ORT native`: assignment/subgraph/node visibility, provider priority, strict fallback, profiling, offline optimization, capacity-aware and explicit name/annotation assignment.
- `Mobius`: EP-specific graph emission/rewrites, per-pass trace and build/regression benchmark infrastructure.
- `QNN`: source→EP-input→backend-op provenance, multi-pass graph dumps and profile-source correlation.

### Nearest-prior facet matrix

| Facet | Candidate residual | Current strongest coverage | Residual |
|---|---|---|---|
| Graph variants | canonical semantics-equivalent exporter/optimizer forms | ModelMeta/OATest/Mobius | no generic mutation claim remains |
| Assignment | semantic-region assignment stability | ORT assignment API, QNN lineage | cross-variant quotient and stability remain |
| Endpoint | precommitted optimizer/config deployment choice | ORT/Mobius tune or generate per target | held-out decision regret remains |
| Evidence | canonical public panel with all-cell denominator | large bug-testing panels, tool-specific benchmarks | decision-validity benchmark remains conditional |
| Mechanism | fusion/capability-boundary sensitivity after normalization | ORT docs/source expose ordering and fusions | empirical cross-variant mechanism remains unobserved |

### Seed-distance and method-name deletion test

Deleting “assignment stability” leaves an identifiable estimand: a deployment choice made on one representation should generalize to semantically equivalent representations. Deleting “ORT” collapses the work toward generic metamorphic testing/performance portability already covered by ModelMeta/NNSmith/OATest. Therefore the paper must remain anchored to current ORT partition/fusion semantics and cannot claim a generic testing framework.

## Competing mechanism decision

- Selected mechanism: pre-partition normalization/fusion and EP capability boundaries alter semantic-region placement, transfers and compile/runtime costs.
- Registered backup: none. Pure output bugs, generic graph diversity and EP-aware model generation are existing-method baselines, not pivots.
- Pivot boundary: if assignment-aware features do not improve held-out decision validity beyond raw timing/structure, stop; do not switch to bug finding under the same ID.

## Residual paper kernel

The remaining kernel is a narrow benchmark-validity/measurement contribution, not a new ORT profiler or metamorphic generator: quantify the regret of choosing an ORT optimizer configuration from a single graph representation, explain flips through semantic-region assignment lineage, and release the legality/lineage/decision panel.

## Evidence route

- `MEASUREMENT_MECHANISM / PERFORMANCE`

## Performance-optimization admissibility

- Same-function contract: fixed ONNX function, opset/domain, inputs, tolerance, ORT/EP/device and task metric.
- Algorithmic delta: only a quotient-lineage decision-validity estimator could support N2; otherwise the paper is N3 characterization/benchmark.
- Full-cost ledger: frozen above.
- Strong-implementation fairness: native ORT controls and current first-party tools are mandatory, not optional weak baselines.
- Generality and failure boundary: variants normalized before partition and all-CPU/all-supported graphs are explicit stable/no-gain regions.
- Why not routine tuning: the claim concerns whether a tuning decision generalizes across equivalent representations; post-hoc per-variant retuning is an oracle baseline and cannot establish validity.

## Q1/Q2 paper shape

- Problem: current deployment tuning often treats one serialized ONNX graph as the model identity even though exporter/function/fusion choices can produce equivalent forms and alter partition boundaries.
- Contribution: a legality-graded rewrite panel, semantic-region lineage quotient, held-out decision-regret estimand, current native baseline suite and all-cell full-cost artifact.
- Evidence plan: Stage A first kills or supports the phenomenon on a small controlled panel; a Q2 paper then requires broad multi-family/model/rewrite/version evidence.
- Expected narrative: distinguish legality from equivalence; show which variants ORT normalizes; measure surviving assignment changes; test whether they change a precommitted choice; explain only reproducible flips and report stable/no-gain regions.

## Minimum Q2 breadth

The Discovery proposal's `3–5 models × 4–8 rewrites` is sufficient for a Stage A killer but not for a complete Q2 measurement paper after subtracting ModelMeta/OODTE/OATest. Revised final evidence plan must precommit at least:

- `≥12` models from `≥3` model/task families;
- `≥4` canonical rewrite families, including at least one official function-expansion family and one negative-control family normalized away by ORT;
- one primary public EP stack at one exact ORT release plus either a second ORT release or a second same-version public EP route;
- held-out models and held-out rewrite instances;
- all legality/failure/unsupported cells retained;
- decision-regret, assignment quotient, full cost, observer effect and failure-region analysis.

Q1 parity would additionally require broader EP/platform generalization, stronger natural exporter provenance, stable cross-version mechanism and independent artifact reproduction. It is not claimed.

## Q1/Q2 shape calibration

- Comparator file: `q1_calibration.md`
- Reference set: ModelMeta (ISSTA 2025), OATest (ICSE 2026), NNSmith (ASPLOS 2023), with OODTE/DiTOX, Mobius and current ORT/QNN as boundary sources.
- Status: `PARITY_CONDITIONAL_WITH_EXECUTABLE_GAP`
- Contribution-shape gap: the frozen decision endpoint and non-generic residual are not yet singular.
- Evidence-shape gap: no observed phenomenon, small proposed panel, no exact versions/models/rewrite ledger or independent reproduction.
- Stage A closure plan: unavailable until the one-time revision fixes the contract; after closing, run only the small killer below.

## Non-relaxable quality audit

- Same-object: preserved as versioned ORT assignment/full-cost behavior under equivalent ONNX representations.
- Latest collision: complete enough; no direct fatal, but substantial current-source/tool subtraction.
- Strong fair baselines: current ORT controls, output-only differential, timing/structure, Mobius/QNN lineage where compatible.
- Natural input/evidence: canonical benchmark only. Official/repository models are canonical; synthetic ModelMeta-like variants cannot support natural exporter prevalence.
- Full-cost: explicit and includes observer/failure denominator.
- Reproducibility: exact wheel/source/model hashes, rewrite manifests, legality certificates, lineage quotient, process controls and raw traces required.
- Evidence/claim honesty: zero candidate output; instability and regret remain hypotheses.

## Evidence path and AI completion

- E1/E2 execution-readiness audit; scientific inference explicitly excluded: `E1_STATIC_PREFLIGHT` only. No resource or E2 action was run.
- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.88`
- 72-hour first evidence after a valid closing: one exact wheel stack, two model families, two canonical relation families and the full optimizer-level grid; no broad corpus until the killer survives.
- Human-only items and why they are non-decisive: none for the first public CPU/CUDA route. QNN/NPU evidence is optional ceiling expansion.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`, but the scientific decision endpoint itself also needs one Stage 0 revision before Stage A.
- Complete action and native semantics are finite and same-object: yes after choosing the single optimizer-selection endpoint.
- Comparator, denominator, full-cost and small-witness plan: finite and specified above.
- Why the unimplemented checker/lineage is not fatal: current public APIs expose enough metadata; the killer can determine whether the quotient is unambiguous before any claim-bearing run.

## Independent current upstream reality check

- Frozen/current releases checked: v1.26.0 and v1.29.0; current main source checked 2026-08-30.
- Current official documentation checked: EP architecture, graph optimizations, install/CUDA compatibility, profiling, troubleshooting, Mobius and QNN EP docs.
- Actual source/API checked: `get_provider_graph_assignment_info`, `session.record_ep_graph_assignment_info`, `session.disable_cpu_ep_fallback`, `session.collect_node_memory_stats_to_file`, `session.resource_cuda_partitioning_settings`, `session.layer_assignment_settings`, `session.name_based_layer_assignment`, graph optimization levels and profiling.
- Default/non-default controls checked: provider priority, CPU fallback, optimizer levels, offline optimized model, assignment recording disabled by default, profiling, capacity/manual assignment and AOT function inlining.
- Discovery absence claim confirmed, narrowed or contradicted: assignment observability is present as stated; generic lineage/tooling gap is contradicted for QNN and heavily narrowed by Mobius; cross-variant held-out decision validity remains unimplemented in the checked union.
- Current native mechanism and finite configuration grid: optimizer levels `{BASIC, EXTENDED, ALL}` plus `DISABLE_ALL` diagnostic, fixed provider order/options, strict fallback diagnostic, capacity/manual assignment where version-compatible.
- Any non-tuning residual that remains: only representation-generalization of a precommitted decision and semantic-region explanation.

## Stage A highest-risk probe plan

- Risk-bearing premise: at least two canonical, independently justified equivalent rewrite families survive ORT normalization, yield unambiguous semantic-region lineage, change assignment, and sometimes change the frozen optimizer choice under matched full cost.
- Cheap discriminating probe: two model families × two canonical rewrite families × `{BASIC, EXTENDED, ALL}` on one exact CUDA/CPU wheel stack; include one normalized-away negative relation. Freeze train/test variants before running. Build the semantic-region oracle from rewrite manifests and assignment API; pair instrumented and uninstrumented timing.
- Negative result that kills the direction: no assignment change survives normalization; lineage is ambiguous; all changes are decision-neutral; any flip disappears with paired process controls; or raw timing/simple structure matches the assignment-aware held-out decision.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Allowed one-time revision

- Preserve: exact ORT/ONNX object, semantics-equivalent representation question, held-out deployment-decision validity, output-quality constraint and canonical benchmark ceiling.
- Required delta: choose one primary decision endpoint; freeze exact ORT wheel/commit and EP order; freeze four legal relation families and legality levels; define semantic-region quotient and all-cell denominator; raise final Q2 breadth to the minimum above.
- Forbidden delta: switch to generic bug finding, invent new mutations after results, change to arbitrary synthetic graphs as main evidence, mix incompatible wheel versions in one ranking denominator, drop failures, add private hardware/telemetry, or enter Stage A before independent closing.
- Revision consumption: `false` at this review; consumption begins only if MAINLINE dispatches and executes the revision.

## Stop conditions

- No canonical relation survives current ORT normalization with unambiguous lineage.
- Observed assignment differences do not alter the frozen decision after full cost.
- The contribution collapses to ModelMeta/OODTE/OATest-style mutation/differential testing or Mobius-style EP-aware building.
- Final evidence cannot meet minimum Q2 breadth without private hardware or result-dependent corpus selection.
- A future same-object source directly covers the held-out decision-validity conjunction.

## Discovery repair vector

- Codes: `OMITTED_FIRST_PARTY_FEATURE`, `OMITTED_GENERIC_KERNEL`, `ATOMIC_ACTION_UNCLEAR`, `EVIDENCE_LOCATOR_OR_VERSION_GAP`, `NATURAL_CARRIER_GAP`, `FULL_COST_GAP`, `Q2_SHAPE_GAP`.
- Materiality: high. Current ORT manual/capacity assignment, Mobius EP-aware trace, QNN provenance and OATest substantially narrow the contribution and expose the dual-endpoint ambiguity.
- Was the missing information available before the frozen cutoff?: `YES`.
- Does this feedback alter the independent scientific decision?: `NO`; the repair vector is non-decisional and was produced after the verdict.

## Dual-axis score

- Academic value: `43/70`
- AI executability bonus: `26/30`
- Total: `69/100`

## Human research reserve

Not applicable; the first killer is publicly executable.

## User-action blocker

None.

