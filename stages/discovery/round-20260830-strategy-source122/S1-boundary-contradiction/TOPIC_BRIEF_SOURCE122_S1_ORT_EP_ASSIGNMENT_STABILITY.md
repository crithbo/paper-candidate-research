# SOURCE122-S1-ORT-EP-ASSIGNMENT-STABILITY Decision-validity of ONNX Runtime EP assignments under equivalent graph rewrites

## 中文摘要

- 研究机会：ONNX Runtime 已公开 `GetCapability`、GraphPartitioner、strict CPU fallback、EP assignment 记录与 profiling，但同一语义模型的不同等价图表达可能触发不同的 EP partition/fallback 结构。
- 为什么可能值得做：可在官方模型上构建结果无关的等价 rewrite panel，联合输出保真、EP assignment lineage 与 full-cost，检验原始图上的 EP/optimizer 选择是否对表示变化稳定。
- 为什么保留：exact carrier、同对象估计量、决策端点、强比较器和有限 falsifier 已冻结；OODTE/ModelMeta 扣除了通用 differential/metamorphic testing，但本次边界内未直接覆盖 ORT assignment stability 与 deployment decision conjunction。
- 下一步：Stage 0 独立全文核验 ModelMeta/OODTE、当前 ORT paper/tool union 和最小 Q2 breadth；如只剩普通 mutation/testing 或无决策变化，直接 DROP。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O1 / O6 / O8`
- Domain tags: `ONNX Runtime, execution providers, graph partitioning, metamorphic testing, benchmark validity`
- Contribution route: `N3 / N2`
- Discovery date: `2026-08-30`
- Discovery method revision: `RQ_REFINEMENT_STAGED_EVIDENCE_V1 + EXACT_PUBLIC_CARRIER_FIRST`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `PRODUCTION; RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Opportunity family ID: `OF-S122-S1-ORT-EP-ASSIGNMENT-STABILITY-01`
- Contribution type: `BENCHMARK_DATASET / COMPILER_TOOL / MEASUREMENT_CHARACTERIZATION`
- Local audit coordinates: `A1/C0/D1/E1`
- Discovery divergence seed ID/path: `S122-S1-02,S122-S1-03 / DIVERGENCE_SEED_POOL.md`
- Discovery RQ candidate ID/path: `RQ02,RQ03 / RQ_CANDIDATES.md`
- Discovery question card ID/path: `QC-RQ02-03 / QUESTION_CARDS.md`
- Front-end disposition before deep review: `EVIDENCE_QUALIFIED_RAW`
- Carrier kind: `CANONICAL_BENCHMARK_ONLY`

## Research question

For fixed ONNX semantics, inputs, output-quality threshold and ORT/EP versions, when do result-independent semantics-preserving rewrites change recorded EP assignments and full cost enough to change a precommitted EP or optimizer-level deployment decision?

## Canonical research claim package

- Exact object: ORT `GetCapability`/GraphPartitioner assignments for identical ONNX semantics under a frozen provider order/configuration.
- Canonical workload: 3-5 official ONNX Model Hub or ORT test models with 4-8 precommitted legal rewrite classes.
- Static anchor: ORT exposes `session.record_ep_graph_assignment_info`, `get_provider_graph_assignment_info`, strict CPU fallback, EP profile events and official FuseExecutionProvider/session fixtures.
- Atomic action: build a lineage-preserving equivalent-graph panel; record output validity, assigned subgraphs, fallback class and full cost; use assignment-aware features only to decide among frozen EP/optimizer configurations.
- Mechanism: EP support uses pattern/fusion/partition boundaries after graph rewriting, so semantically equivalent representations can alter the support surface and boundary costs without changing model outputs.
- Information contract: public graph/rewrite lineage, session assignment metadata and measured profile; no private telemetry.
- Named comparators: unchanged graph; output-only OODTE-style differential; native strict no-fallback; node/subgraph coverage; raw end-to-end timing.
- Expected output: a held-out stability/decision-validity matrix, not a universal fault or “best EP” claim.
- Full cost: rewrite generation/validation, session creation, EP compile/cache, assignment/fallback, transfers/synchronization, runtime latency, artifact bytes, profiling overhead and failed cells.
- No-gain/failure: providers whose support is representation-invariant; rewrite effects fully explained by a current native optimizer/control; changes that improve cost without hurting the frozen decision.
- Minimum falsifier: no decision-changing assignment/full-cost variation and no held-out predictive gain over output-only/node-count baselines.
- Dependencies/ceiling: public CPU + local RTX 4070 routes where packaged EPs are available; no build/experiment occurred here.

## Genealogy and collision

- Anchor: current ORT EP interface, session assignment API and official tests.
- Strongest adjacent paper: OODTE, which detects optimizer crashes/output deviations on ONNX models.
- Generic metamorphic comparator: ModelMeta, requiring independent full-text facet audit.
- DIRECT_SUBTRACT: strict fallback, assignment recording, profiling, compiled compatibility, mutation generation and output comparison alone.
- DIRECT_FATAL: none established for the full ORT-specific conjunction within 24 calls.
- SEARCH_BOUNDED_OPEN: current ORT system/tool work and ModelMeta same-object facets.

## Named fair baselines

- Deployment/default: current ORT optimizer level, registered EP priority and default CPU fallback.
- Native controls: strict no-fallback and `get_provider_graph_assignment_info` + profiling without the proposed validity protocol.
- Recent methodology: OODTE output/crash differential and ModelMeta model-level metamorphic generation.
- Simple baselines: assigned-node/subgraph count and raw end-to-end timing.
- Offline ceiling: post-hoc best configuration from complete measured cost, evaluation only.

## Decisive falsifier

Drop if current work covers the full conjunction; if legal rewrite lineage cannot be frozen; if all assignment changes are cost/decision-neutral; or if assignment-aware features do not improve held-out EP/optimizer decision validity.

## Executable evidence path

### Current upstream reality check

- Current upstream/date: ORT official `main`/current docs observed 2026-08-30; exact commit to be frozen downstream.
- Source/docs: `execution_provider.h`, inference collection assignment API, session option keys, inference-session tests, high-level design.
- Current controls: recorded assignment info, provider priority, strict CPU fallback, profiler, compiled-model compatibility and model-package selection.
- Contrary evidence: these current controls absorb ordinary observability/tooling; residual is only cross-variant decision validity.
- No claim that ORT lacks partition visibility or compatibility checking is made.

### Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Interface: official model → legal rewrite + lineage manifest → ORT session with frozen EP order/config → output oracle + `OrtEpAssignedSubgraph` + profile/full-cost ledger → held-out deployment decision.
- Native semantics: ONNX checker/runtime output contract, ORT provider assignment and strict fallback.
- Same-object boundary: same model function, inputs, tolerances, ORT/EP versions and device; no backend-specific model substitution.
- Denominator: all precommitted model×rewrite×configuration cells, including unsupported/failed cells.
- Small witness: official `abs-id-max.onnx`/Fuse EP-style graph with one identity-elimination or algebraic rewrite whose output equivalence and node lineage are statically reviewable.
- Finite steps: freeze commits/models/rewrites; verify legality; collect assignment and cost pairs on CPU plus one packaged accelerator EP; validate lineage; evaluate held-out decision stability.
- Structural failure: rewrite changes semantics/guarantee, assignment API lacks stable mapping, required EP route is unavailable with no public alternative, or failed cells are removed from denominator.

### Closure debt

- Current union: full ModelMeta/OODTE and current ORT system/tool facet audit.
- Corpus: exact Model Hub/ORT test model versions, public weights and licenses.
- Witness/interface: stable rewrite lineage to assigned-subgraph nodes.
- Full cost: session compile/cache and trace observer effect.
- Maximum questions/owner: four, independent Stage 0; Stage A preclaim closes implementation only after PASS.
- Claim ceiling: Discovery proposal only; no novelty, fault, instability or performance claim.

### 72-hour first evidence

After later authorization, freeze one official model, two reviewable equivalent rewrites and CPU+one packaged EP configuration; establish whether assignment lineage and output equivalence can be measured without ambiguity. This is a future falsifier, not a completed run.

## Q1/Q2 sufficiency hypothesis

- Q2: plausible only with a reusable public panel, cross-model/EP held-out decision result, full-cost accounting and precise boundary taxonomy.
- Q1: not claimed; would require stable cross-version/EP mechanism and broader deployment consequences.
- Below-Q2: one bug, one provider/model/rewrite, support-list expansion, dashboard, or output-only differential testing.

## Non-relaxable audit

- Same-object: fixed ONNX function and ORT/EP/device contract.
- Latest collision: bounded search complete; independent Stage 0 required.
- Strong baselines: native assignment/profiling/strict mode, OODTE, ModelMeta, simple coverage.
- Evidence: canonical benchmark only; no natural deployment extrapolation.
- Full-cost: compile/cache/transfer/runtime/observer/failure denominator included.
- Reproducibility: exact commits, model/rewrite/config/lineage/trace manifests.
- Honesty: zero build, experiment and observed effect.

## AI and researcher boundary

AI can execute public-source panel construction, lineage validation and analysis after authorization. Closed EP SDK/device strata remain conditional and cannot raise the claim ceiling without access.
