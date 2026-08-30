# SOURCE122-S1-ORT-EP-ASSIGNMENT-STABILITY Stage 0 SENTRY Report

## 中文摘要

- SENTRY disposition：`CONFIRM`。
- 科学建议：确认 PRIMARY 的 `REVISE_ONCE`；不是 `STOP`，也不能直接进入 Stage A。
- 质量档：只有在一次同对象 contract revision 完成并经独立 closing 后，才保持 `TIER_B_Q2_VIABLE`；当前 packet 仍不是 Stage-A-ready。
- 核心原因：current ORT/Mobius/QNN 与 ModelMeta/OODTE/OATest/OTX 已吸收 assignment observability、optimizer-level profiling、EP-aware rewrite、source-to-backend provenance、等价模型变异与 optimizer differential testing。仍未发现单一来源覆盖“在固定 ORT/EP 栈上，从一个表示预注册选择优化级别，再在语义等价 held-out 表示上测量 full-cost regret，并用 semantic-region quotient 解释”的完整 conjunction。
- 唯一允许的下一步：冻结一个 optimizer-level decision endpoint、exact ORT/EP 栈、合法 rewrite family、semantic-region lineage 与 all-cell denominator，再交独立 Stage 0 closing。任何 Stage A 动作均须等 closing 通过。
- 用户操作：不需要。

- Lane id: `STAGE0_SENTRY`
- Assignment id: `STAGE0-SENTRY-20260830-ORT-EP-ASSIGNMENT-STABILITY`
- START SHA-256: `0E77D28338F6ED0A161FC3A99739A57585DBE3DBED423734EAD0CAA9CCB2E460`
- Model route: `gpt-5.6-sol/high` temporary user-command override
- Cross-assignment contamination: `false`; TorchDynamo queue/input was not read.
- Search/open usage: `20/24` (`9` search-query items + `11` open items; additionally `4` in-page find operations)
- Implementation/build/experiment/Stage A/Stage B/shared write: `0`
- Claim-bearing observation: `false`
- Evidence ceiling: `CURRENT_FIRST_PARTY_SOURCE_AND_PUBLIC_PRIMARY_OR_AUTHORITATIVE_TEXT__ZERO_CANDIDATE_RESULT`
- Confidence: `0.91`

## Independent decision

| Question | SENTRY finding |
|---|---|
| Strict direct fatal? | `NO` |
| Current native/tool subtraction material? | `YES, HEAVY` |
| One bounded revision eligible? | `YES` |
| Single primary endpoint required? | `YES` |
| Legality/lineage/all-cell denominator required before Stage A? | `YES` |
| Conditional Q2 shape survives? | `YES`, after repair only |
| PRIMARY disposition | `CONFIRM` |

The first defect is one coherent contract defect, not several independent scientific pivots: `DUAL_DECISION_ENDPOINT_PLUS_UNFROZEN_EQUIVALENCE_LINEAGE_DENOMINATOR`. Closing it does not change the exact ONNX/ORT object, the held-out representation-generalization question, the output-quality constraint, or the canonical-benchmark claim ceiling.

## Independent current native/tool subtraction

### ORT native union

1. ORT v1.26.0 exposes `get_provider_graph_assignment_info()` and requires the opt-in session key `session.record_ep_graph_assignment_info=1`; it returns assigned EP subgraphs and their nodes. Provider lists are ordered by precedence, so `CUDAExecutionProvider, CPUExecutionProvider` already defines a native assignment policy surface.
2. Current ORT `main` keeps assignment recording disabled by default but exposes it directly. The same config-key source also contains strict CPU fallback, profiling, graph-optimization levels, CUDA capacity-aware partitioning, annotation-based layer assignment and name-based assignment controls.
3. Official ORT documentation states that Basic rewrites are semantics-preserving and run before graph partitioning, while Extended rewrites run after partitioning on assigned CPU/CUDA/ROCm nodes. The official grid is `DISABLE_ALL / BASIC / EXTENDED / ALL`, with all optimizations enabled by default.
4. ORT's EP architecture allocates nodes/subgraphs through `GetCapability()` and provider priority. Therefore assignment observability, provider ordering, optimization-level selection and several manual/capacity controls are baselines, not candidate inventions.

Decisive first-party locators:

- [ORT v1.26 Python assignment API](https://github.com/microsoft/onnxruntime/blob/v1.26.0/onnxruntime/python/onnxruntime_inference_collection.py)
- [Current ORT session config keys](https://github.com/microsoft/onnxruntime/blob/main/include/onnxruntime/core/session/onnxruntime_session_options_config_keys.h)
- [ORT graph optimization levels and ordering](https://onnxruntime.ai/docs/performance/model-optimizations/graph-optimizations.html)
- [ORT Execution Provider architecture](https://onnxruntime.ai/docs/execution-providers/)

### Mobius and QNN tooling

- Mobius already performs EP-aware graph generation/rewrite and exposes stepwise optimization tracing. This directly subtracts a generic claim of inventing EP-aware graph transformation or rewrite tracing. [Mobius EP-aware building](https://onnxruntime.github.io/mobius/execution_providers.html)
- Current QNN tooling emits EP-input/backend graph information and its offline matcher recovers `original ONNX -> EP-input -> QNN op` provenance. The documentation also records repeated `GetCapability()` passes caused by layout transformation. This directly subtracts a generic source-to-optimized/backend lineage claim, although it does not test held-out decision validity on the public CUDA/CPU route. [QNN EP provenance documentation](https://github.com/onnxruntime/onnxruntime-qnn/blob/main/docs/execution_providers/QNN-ExecutionProvider.md)

### Literature and public boundary artifacts

- ModelMeta creates structurally equivalent model variants using four model-level metamorphic relations and checks output/runtime metrics over 17 models and 10 tasks. It absorbs generic equivalent-model mutation plus runtime-anomaly testing. [Author-hosted ModelMeta paper](https://people.cs.umass.edu/~juanzhai/papers/issta25.pdf)
- OODTE/DiTOX differentially compares original and optimized ONNX models, localizes optimizer-pass faults and uses 130 public models. It absorbs broad ONNX optimizer differential testing and large canonical-panel claims. [OODTE paper](https://arxiv.org/abs/2505.01892)
- OATest synthesizes optimization-aware graphs from documented optimizer tests and evaluates ONNXRuntime/TVM for crashes and inconsistencies. It absorbs optimization-aware test synthesis and generic ORT optimizer bug discovery. [ICSE 2026 OATest page](https://conf.researchr.org/details/icse-2026/icse-2026-research-track/174/Optimization-Aware-Test-Generation-for-Deep-Learning-Compilers)
- OTX, a six-page university course report rather than a peer-reviewed anchor, is nevertheless the strongest newly checked same-stack boundary artifact. It compares ORT's four optimization variants on 15 models, reports assignment-percentage changes and ties several performance degradations to CPU placement. It therefore subtracts any claim to be first to show that optimizer level can alter placement/performance. It does **not** use multiple semantics-equivalent source representations, a train/held-out decision protocol, semantic-region quotient, preregistered regret, or an all-cell denominator; it also excludes no-difference models from later result discussion and recomputes >3-sigma runs. It is `PARTIAL_STRONG_SUBTRACTOR`, not `DIRECT_FATAL`. [OTX report](https://www.cs.rochester.edu/~spai4/courses/csc-290-420/fall-2025/static/reports/siddharth-CS_290_Final_Project_Report.pdf)

## Eight-predicate direct-coverage audit

| Predicate | Strongest checked coverage | Direct coverage |
|---|---|---|
| Same object/function/protocol | ORT native APIs and OTX use ORT optimizer/EP placement | `PARTIAL` |
| Same scenario/workload | OTX/OODTE use canonical ONNX models; ModelMeta uses equivalent model variants | `PARTIAL` |
| Same or weaker information | Assignment, profiling, rewrites and provenance exist separately | `PARTIAL` |
| Atomic action | No checked work precommits one representation's optimizer choice and evaluates it on held-out equivalent representations | `FAIL_DIRECT` |
| Same/stronger legality and guarantee | Checker/model validity and differential outputs exist, but no frozen relation proof + held-out decision-validity guarantee | `FAIL_DIRECT` |
| Same non-worse full-cost boundary | Timing/memory/placement are covered piecemeal; no joined init/cache/observer/failure/regret ledger | `FAIL_DIRECT` |
| Comparable scale/version/config | Existing panels are broad, but not under the proposed representation-by-optimizer factorial contract | `PARTIAL` |
| Sufficient read depth | Current first-party source/docs and primary/authoritative paper pages were checked | `PASS` |

No source passes all eight predicates. The residual is narrow but real: `cross-representation generalization validity of one precommitted ORT optimizer-level deployment decision`, not generic optimizer instability, profiling, mutation, lineage or EP-aware rewriting.

## Single-endpoint revision

The current wording “EP-selection or optimizer-level selection” is invalid as a primary estimand because the two choices have different action sets, information, compatibility constraints, failure modes and denominators. Combining them would permit result-dependent endpoint selection.

The revision must choose exactly this primary endpoint:

> On one exact ORT release with fixed `CUDAExecutionProvider, CPUExecutionProvider` order and fixed provider options, choose one of `ORT_ENABLE_BASIC / ORT_ENABLE_EXTENDED / ORT_ENABLE_ALL` using only the source representation's training data and a frozen full-cost objective under a frozen output-quality threshold; evaluate held-out regret/rank stability on preregistered semantics-equivalent representations.

`ORT_DISABLE_ALL` may be a diagnostic reference, not a co-primary action. Cross-EP choice may only be an external-validity stratum. Wheel versions must never be mixed inside one ranking denominator.

## Legality, lineage and all-cell denominator

### Legality ladder

1. `L0_PROTO_LEGAL`: `onnx.checker.check_model(full_check=true)`, strict shape/type inference, released opset/domain and external-data integrity. The checker establishes model consistency, not semantic equivalence. [ONNX checker API](https://onnx.ai/onnx/api/checker.html)
2. `L1_RELATION_JUSTIFIED`: each rewrite instance carries a spec/function-body identity, exact tensor-rearrangement proof, or exhaustive finite-domain certificate under explicit dtype/shape assumptions.
3. `L2_NUMERIC_ORACLE`: preregistered canonical inputs with dtype-specific absolute/relative/ULP tolerance and explicit NaN/Inf/signed-zero policy. This is empirical support, not a universal proof.

The revision must freeze four relation families before any outcome is seen. A defensible family set can include official ONNX Function expansion/inlining, inverse transpose/reshape identities, `Split -> Concat` reconstruction, and tightly constrained `Gemm <-> MatMul + Add`; Identity/inverse pairs must include a negative-control family expected to be normalized away. Approximate GELU, reassociation, QDQ relocation and quantization-format changes are excluded unless a narrower quality contract is separately frozen.

### Semantic-region lineage

- Assign stable `semantic_region_id` values before rewriting.
- Each manifest maps source regions to zero/one/many optimized nodes and values.
- Canonical outcomes include `NORMALIZED_AWAY`, `FUSED_MANY_TO_ONE`, `EXPANDED_ONE_TO_MANY`, `UNMATCHED`, `UNSUPPORTED`, `SESSION_FAIL`, `ILLEGAL`, `UNPROVEN` and `NUMERIC_FAIL`.
- Raw node-name Jaccard is diagnostic only. The primary analysis is over semantic regions and records repeated `GetCapability()` passes where layout transforms repartition the graph.
- QNN's existing matcher is a provenance baseline; the residual artifact is cross-variant quotienting for decision validity on the fixed public stack.

### All-cell denominator

Before execution, freeze the Cartesian denominator:

`model x source representation x held-out relation instance x optimizer action x repetition/process-control arm`.

Every planned cell remains in the denominator. Invalid, unsupported, timeout, crash, session-fail, numeric-fail, ambiguous-lineage and normalized-away cells receive explicit outcome codes; none may be silently deleted, replaced, retried into disappearance or excluded after observing results. The primary estimand reports both decision regret among valid cells and coverage/failure fractions over all frozen cells.

## Minimum Q2 breadth

SENTRY confirms PRIMARY's minimum only as a hard floor, not as evidence of parity:

- at least `12` models balanced across at least `3` model/task families;
- at least `4` preregistered canonical relation families, including official function expansion and a normalized-away negative control;
- one exact primary ORT release/public CUDA+CPU stack plus either a second ORT release or a same-version second public EP route;
- held-out models and held-out rewrite instances;
- complete legality/failure/unsupported denominator, full-cost and observer-effect accounting;
- comparison against output-only differential, raw timing, simple structure, native assignment info, the full per-representation ORT optimizer grid, and the strongest version-compatible Mobius/QNN lineage controls.

OTX's 15-model public panel means the candidate cannot sell model count or optimizer-level profiling as novelty. The `12 x >=4 relations x 3 actions` factorial, held-out decision protocol and all-cell ledger are what preserve conditional Q2 shape. Q1 potential is not established.

## Bounded one-time revision

### Must preserve

- exact ONNX/ORT object and same-function output constraint;
- representation-equivalence question;
- held-out deployment-decision validity endpoint;
- canonical benchmark evidence ceiling;
- zero result-dependent corpus/rewrite selection.

### Required delta

- choose the single optimizer-level endpoint above;
- freeze exact ORT wheel/tag or commit, provider order/options and compatible CUDA stack;
- freeze four rewrite families and L0/L1/L2 legality obligations;
- freeze semantic-region quotient, repeated-partition handling and all-cell denominator;
- freeze the minimum Q2 breadth and strongest baselines.

### Forbidden delta

- switching to generic bug finding, profiler/tool construction or mutation generation;
- choosing endpoint, rewrite, model or exclusion after outcomes;
- mixing incompatible ORT versions in one denominator;
- dropping illegal/failed/unsupported/ambiguous cells;
- adding private QNN hardware/telemetry as a requirement;
- entering Stage A before independent closing.

This is eligible for one `REVISE_ONCE`: it is one pre-observation estimand/denominator defect, is finite, preserves object/RQ/claim ceiling, and consumes no mechanism pivot. The revision is not consumed by this SENTRY report; consumption begins only when MAINLINE dispatches and the revision is executed.

## Post-closing Stage A killer

Only after an independent closing accepts the revised contract:

- `2` model families;
- `2` independently justified relation families plus one normalized-away negative-control family;
- fixed `{BASIC, EXTENDED, ALL}` action grid on one exact CUDA+CPU stack;
- preregistered source/train representations and held-out variants;
- paired instrumentation-on/off process controls, session-build/compile/cache/warmup/steady-state/failure full cost;
- baselines: full per-variant oracle grid, source-only raw timing, simple graph/assignment counts and assignment-aware quotient model.

Kill the direction if any of the following occurs:

1. no legal relation survives ORT normalization with unambiguous lineage;
2. surviving assignment changes never alter the precommitted optimizer choice or full-cost regret;
3. apparent flips disappear under paired process/cache/observer controls;
4. output-only/raw-timing/simple-structure baselines match the assignment-aware held-out decision;
5. the residual collapses to OTX-style per-representation optimizer profiling or ModelMeta/OODTE/OATest-style generic testing.

A positive pilot is preliminary non-falsification only, not proof of the paper's main claim.

## Q1/Q2 and AI route

- Independent quality tier: `TIER_B_Q2_VIABLE` conditional on revision and closing; no Tier-A label.
- Contribution route: `N3` measurement/benchmark primary; `N2` only if a nontrivial quotient-based estimator beats timing/structure under held-out evaluation.
- AI route: `AI_CORE_EXECUTABLE`; estimated `ai_core_fraction=0.86` after contract closing.
- Full public CPU/CUDA route is finite; QNN/NPU evidence is optional ceiling expansion, not a blocker.
- Scientific revision consumed now: `false`.
- Operational disposition: `NONE`.

## Limitations and evidence honesty

- No candidate implementation, run or result was produced; instability and regret remain hypotheses.
- Current ORT `main` was inspected as rendered on 2026-08-30, but the future experiment must use an exact release/tag or commit.
- OTX is a useful current boundary artifact but not a peer-reviewed Q1/Q2 anchor; it changes subtraction and baseline requirements, not venue calibration by itself.
- Search was bounded and cannot prove global absence. The correct novelty state is `SEARCH_BOUNDED_OPEN_WITH_NO_DIRECT_FATAL_FOUND`.
- AI-assisted research tools were used for source discovery, verification and synthesis; all decisive claims above point to public primary or first-party sources.

## Final SENTRY disposition

`CONFIRM__REVISE_ONCE__TIER_B_Q2_VIABLE_AFTER_BOUNDED_CONTRACT_CLOSURE`

