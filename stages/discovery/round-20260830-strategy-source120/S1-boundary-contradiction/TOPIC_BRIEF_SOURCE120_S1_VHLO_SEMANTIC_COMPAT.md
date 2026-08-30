# SOURCE120-S1-VHLO-SEMANTIC-COMPAT Versioned semantic witnesses for StableHLO portable-artifact compatibility

## 中文摘要

- 研究机会：StableHLO 的可移植 artifact 兼容保证是“语义相同”，但当前官方兼容套件记录的是跨版本序列化/反序列化后的语法一致。
- 为什么可能值得做：把版本化 VHLO compendium 转换为可执行 witness，并以规范分层 oracle 判定 exact、tolerance、implementation-defined、unsupported 等语义区，可形成可复现的兼容 benchmark/tool。
- 为什么保留：exact object、canonical carrier、决策端点和有限 falsifier 均已冻结；但官方 #1245 已吸收“直接用解释器”这一泛化动作，因此只保留 witness + oracle taxonomy + cross-consumer protocol 的严格 residual。
- 下一步：Stage 0 独立审查近期论文/工具是否已覆盖这一三件套，并核对其是否足以构成 Q2 benchmark/tool；未通过则直接 DROP。

- Status: `PROPOSE_STAGE0`
- Quality tier: `TIER_B_Q2_VIABLE`
- Opportunity origins: `O4 / O7`
- Domain tags: `StableHLO, MLIR, compiler interoperability, semantic compatibility, benchmark`
- Contribution route: `N1 / N2`
- Discovery date: `2026-08-30`
- Discovery method revision: `SOURCE120_EXACT_PUBLIC_CARRIER_FIRST`
- Discovery claim-pack mode: `OFF`
- Discovery RQ frontend mode/revision: `PRODUCTION; RQ_REFINEMENT_STAGED_EVIDENCE_V1`
- Opportunity family ID: `OF-S120-S1-VHLO-SEMANTIC-COMPAT-01`
- Contribution type: `BENCHMARK_DATASET / COMPILER_TOOL`
- Local audit coordinates: `A1/C0/D1/E1`
- Discovery divergence seed ID/path: `S120-S1-02 / DIVERGENCE_SEED_POOL.md`
- Discovery RQ candidate ID/path: `RQ02 / RQ_CANDIDATES.md`
- Discovery question card ID/path: `QC-RQ02 / QUESTION_CARDS.md`
- Front-end disposition before deep review: `EVIDENCE_QUALIFIED_RAW`
- Carrier kind: `CANONICAL_FORMAL_ORACLE`

## Research question

Can a versioned, input-bearing StableHLO witness corpus with specification-typed oracles distinguish semantic compatibility from syntactic identity across supported portable-artifact versions and current consumers, while charging all generation, conversion, execution, exclusion and triage cost?

## Canonical research claim package

- Exact object and same-function/protocol/quality contract: StableHLO portable artifacts produced and consumed through official compatibility APIs inside the documented version windows; the quality contract is preservation of specification-defined semantics, not text identity or unrestricted numerical accuracy.
- Natural/canonical scenario or workload: official versioned `stablehlo/tests/vhlo` compendium, stratified with official interpreter/quantization fixtures.
- Observed problem/opportunity and quantitative/static anchor: the official documentation states a semantic guarantee but describes syntactic-identity testing and explicitly lists semantic reference testing as future work.
- Intervention and atomic action: derive executable inputs and expected-relation classes from each eligible compendium entry; run pre/post-version and consumer executions; classify outcomes with a specification-aware oracle.
- Claimed mechanism and mechanism-specific prediction: syntax is an imperfect proxy for semantic preservation; typed execution witnesses should accept some benign syntactic changes and/or expose semantic discrepancies hidden by successful roundtrip, with failures clustering at spec or support boundaries.
- Available/unavailable information and assumptions: public source/spec/tests and consumer tooling are available; actual disagreement incidence and cross-consumer support are unknown and must not be assumed.
- Named comparator and fairness contract: current syntactic compatibility suite; plain reference-interpreter execution; consumer-native tests, on identical artifacts/inputs/version support and identical exclusion rules.
- Expected effect target, output or guarantee: a reproducible compatibility decision matrix and coverage/error taxonomy, not a claim that all consumers are bit-exact.
- Full-cost boundary: witness generation, artifact conversion, interpreter and consumer compile/run, oracle normalization, unsupported/undefined classification, setup, and triage.
- Scope, no-gain/failure region and competing explanation: no gain if syntax identity plus plain interpreter already yields identical valid decisions; disagreements may be consumer bugs, interpreter gaps, or legitimate implementation-defined accuracy.
- Minimum falsifier: a representative stratified version/operation set yields no additional valid decision coverage and no distinct compatibility classification beyond the named comparators.
- Dependencies/resources and claim ceiling: public CPU route first; optional single GPU only for supported consumer strata. Discovery ceiling is proposal-only with zero observed results.
- Contribution-type contract closure: benchmark identity, estimand, oracle taxonomy, comparators, cost, and falsifier are frozen; independent novelty and corpus sufficiency remain Stage 0 debt.

## Opportunity-family graph

| Related family ID | Relation | Evidence | Disposition |
|---|---|---|---|
| STABLEHLO-ISSUE-1245 | contains generic interpreter-use action | official compatibility future work and issue #1245 | direct subtract; residual must include witness/oracle/consumer conjunction |
| S120-S1-RQ01-QUANT | conditional specialization | official quantized golden tests | merge as one oracle stratum |
| S120-S1-RQ03-INTERPRETER-GAP | conditional specialization | interpreter coverage/status | merge as unsupported/exclusion stratum |

## Paper genealogy

- Anchor paper: none claimed at Discovery; canonical anchor is the StableHLO compatibility contract.
- Key predecessors: current syntactic VHLO compatibility suite and official reference interpreter.
- Follow-up / competing papers: `SEARCH_BOUNDED_OPEN` for independent Stage 0.
- Counter-evidence / negative source: official future-work item and issue #1245.
- Artifact / benchmark / specification: StableHLO compatibility docs, VHLO compendium, spec, interpreter/check dialect, quantized golden tests.
- Search boundary: 24/24 official source calls; no build/experiment.

## Importance and group fit

- Strategic alignment: `TRANSFERABLE`
- Local executable carrier: public StableHLO source/tests; CPU-first semantic validation route, exact commit to be frozen by a later authorized assignment.
- Decision endpoint changed by the answer: whether a version/consumer pair can be accepted under the native semantic compatibility contract.
- Mechanism-specific prediction: decision deltas concentrate where syntax changes but semantics are preserved, or where successful roundtrip masks execution-level divergence.
- Intended paper artifact: `BENCHMARK / COMPILER_TOOL`
- Public-to-group bridge and evidence ceiling: transferable to compiler/backend conformance for GPU/NPU deployment; no closed hardware or private resource assumed.
- Resource realism: local/public CPU-first; optional single GPU conditional.

## Named fair baselines

- Deployment/default baseline: official syntactic VHLO compatibility roundtrip.
- Closest recent-paper baseline: unresolved; Stage 0 must name it.
- Competitive simple baseline: execute unchanged/roundtripped modules with the reference interpreter using manually supplied fixtures.
- Optional offline ceiling: exhaustive small-state enumeration for bounded integer/tensor witnesses where deterministic and result-independent.

## Mechanism hypothesis and signature

The mechanism is proxy mismatch between syntax identity and specification-defined semantic equivalence. Its signature is a stable, reviewable split among `SYNTAX_ONLY_FAIL_SEMANTIC_PASS`, `SYNTAX_PASS_SEMANTIC_FAIL`, `BOTH_PASS`, and `OUTSIDE_GUARANTEE`, with the first two surviving repeat runs and oracle review.

## Current collision classification

| Predicate | Evidence/locator | Result |
|---|---|---|
| Same object/function/protocol | StableHLO compatibility docs | PASS |
| Same scenario/workload | versioned VHLO compendium | PASS |
| Same or weaker information | public spec/tests/APIs | PASS |
| Atomic action covered | #1245 covers interpreter use, not proven full residual | UNKNOWN |
| Same/stronger legality, quality and guarantee | typed witness/oracle conjunction not independently audited | UNKNOWN |
| Same non-worse full-cost boundary | no complete current comparator located | UNKNOWN |
| Comparable scale/platform/version/config | version/consumer matrix not yet frozen | UNKNOWN |
| Sufficient full-text/implementation/reproduction depth | no execution and no independent literature audit | FAIL |

- DIRECT_FATAL: none established within the bound for the full three-part residual.
- DIRECT_SUBTRACT: official #1245 removes interpreter integration as a contribution by itself.
- METHODOLOGICAL_ADJACENT: ONNX backend tests and IREE comparative artifacts.
- DEPLOYMENT_BASELINE: current StableHLO syntactic suite and consumer-native validation.
- SEARCH_BOUNDED_OPEN: independent current paper/tool union and exact current commit matrix.
- Why finite: Stage 0 needs at most four decisive questions—same-object current tool, same residual current paper, strongest comparator, and minimum publishable matrix.

## Decisive falsifier

The topic fails if a current artifact/paper already implements the three-part residual under a non-worse cost/guarantee boundary, or if a small stratified witness set shows the oracle cannot make a valid decision beyond current syntax checks plus plain interpreter execution.

## Executable evidence path

### Current upstream reality check

- Checked current upstream/date: StableHLO `main` as rendered on 2026-08-30; exact commit not exposed and must be frozen later.
- Official current documentation: `docs/compatibility.md`, `docs/reference.md`, `docs/spec.md`.
- Actual source paths: `stablehlo/tests/vhlo`, Python compatibility tests, interpreter/check facilities.
- Flags/configurations checked: official target-version APIs and documented compatibility windows; consumer feature grids remain open.
- Contrary evidence: #1245 explicitly plans interpreter-backed testing; treated as direct subtraction.
- Residual boundary: automated versioned witness derivation, spec-aware oracle classes and cross-consumer decision protocol, not the native future-work item alone.

### Fidelity closure plan

- Status: `FINITE_FIDELITY_GAP`
- Complete atomic action and action interface: compendium entry → legal input witness → target-version serialize/deserialize → reference and consumer execution → typed semantic verdict.
- Real comparator and native semantics: official compatibility APIs, StableHLO spec, interpreter/check dialect and consumer-native execution.
- Same-object/same-function/guarantee boundary: identical portable artifact semantics within supported compatibility windows; no substitution with generic MLIR bytecode or unrestricted numerical equivalence.
- Common denominator and full-cost dimensions: successful eligible artifact-version-input triples; time/bytes for generation, conversion, compile/run, oracle and triage; exclusions reported separately.
- Small pre-corpus legality/equivalence witness: at least one exact integer case, one tolerance-governed floating case, one implementation-defined exclusion, and one unsupported/interpreter-gap case.
- Finite closure steps and required resources: freeze commits; implement/inspect four witness classes; cross-check reference oracle; run two consumer paths; seal matrix and costs. Public CPU route first.
- Structural failure condition: legal witness/oracle formation requires changing StableHLO semantics, ignoring documented exclusions, or reducing the guarantee to parse success.

### Front-end closure-debt transfer

- Complete current-union debt: same-object papers/tools beyond first-party union.
- Strongest-collision/genealogy debt: independent Stage 0 search for the full three-part residual.
- Witness/interface/corpus debt: exact commit, eligible-entry coverage and two-consumer support matrix.
- Full-cost protocol debt: denominator and unsupported/triage accounting validation.
- Maximum decisive questions and owner stage: four, Stage 0; implementation closure at Stage A pre-claim gate only if Stage 0 passes.
- Claim ceiling while debt remains open: no novelty or empirical-effect claim.

### 72-hour first evidence

After authorization, freeze one current and one older supported artifact version, construct the four precommitted witness classes, and determine whether the verdict taxonomy is legal and decision-distinct from syntax plus plain interpreter baselines. This is a future plan, not an executed result.

### Execution readiness

- E1 static preflight: official APIs, corpus, specification and interpreter/check entry points are visible.
- E2: `NOT_RUN_NOT_REQUIRED_FOR_STAGE0`; no scientific inference permitted.
- EB/EH: no current external-resource blocker; unresolved novelty/fidelity questions are scientific gates, not user blockers.

## Q1/Q2 sufficiency hypothesis

- Q2: plausible only as a complete benchmark/tool paper with reusable corpus transformation, validated oracle taxonomy, multi-version/multi-consumer matrix, decision-changing outcomes and full-cost reporting.
- Q1: not currently claimed; would need a broadly important failure taxonomy or mechanism transferable beyond one IR ecosystem.
- Stage B requirement: comprehensive public reproducibility package and independent claim audit after Stage A evidence; no Stage B is authorized here.

## Non-relaxable quality audit

- Same-object: frozen to StableHLO portable artifacts and native semantics.
- Latest collision: first-party union checked; independent union remains explicit Stage 0 debt.
- Strong fair baselines: syntax suite, plain reference evaluation, consumer-native validation.
- Natural/canonical evidence: official versioned compendium.
- Full-cost: generation through triage included.
- Reproducibility: exact versions, witness manifests and verdict rules required.
- Evidence honesty: zero build/experiment/result; all effect statements are hypotheses.

## AI and researcher boundary

AI can perform public-source implementation, witness generation, bounded execution and ledgering after authorization. Human judgment may be needed only for ambiguous specification interpretation and publication positioning; this does not change the scientific gate.
