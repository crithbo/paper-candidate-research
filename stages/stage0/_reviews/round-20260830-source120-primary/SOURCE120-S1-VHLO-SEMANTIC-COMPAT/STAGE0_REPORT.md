# SOURCE120-S1-VHLO-SEMANTIC-COMPAT Stage 0 Report

## 中文摘要

- 结论：`PASS_RECOMMENDED`，但必须把论文主线从泛化的 N1/N2 工具创新收缩为版本窗口与多 consumer 交叉下的 N3 兼容性测量，并保留可复用 benchmark/tool 作为载体。
- 为什么：当前第一方资产已经分别覆盖版本化语法 round-trip、输入/期望值 witness、解释器语义检查与跨 runtime accuracy 基础设施，但有界检索未找到一个实现“版本化 portable artifact witness + 规范分层 oracle + 多 consumer 判定协议”完整 conjunction 的当前论文或工具。没有 `DIRECT_FATAL`，但方法增量已被强烈扣除。
- 下一道门：SENTRY 独立确认；若确认 PASS，Stage A 必须先冻结 exact commits、支持交集、oracle taxonomy、分母和 full-cost，再运行一个能直接杀死“只是 harness glue”的小矩阵。
- 是否需要用户操作：否。本阶段没有资源 blocker；没有创建 Stage A。

- Lane id: `STAGE0_PRIMARY`
- Assignment id: `STAGE0-PRIMARY-20260830-SOURCE120-S1-VHLO-SEMANTIC-COMPAT`
- Input freeze SHA-256: `B019CC9DF09A803BD7731C2B589BF1878408EA7F5206F33A4083DE1077D4C7D4`
- Cross-assignment contamination declaration: `false`
- Scientific verdict: `PASS_RECOMMENDED`
- Operational disposition: `READY`
- Quality tier: `TIER_B_Q2_VIABLE`
- Confidence: `0.73`
- Evidence ceiling: `CONDITIONAL_CANONICAL_FORMAL_ORACLE_COMPATIBILITY_ONLY; NO MAIN RESULT OBSERVED`
- Novelty route: `N3` primary; narrow `N1` only for the decision taxonomy/benchmark interface; no standalone N2 claim for interpreter integration or harness composition.
- Candidate venue family: software testing/compiler infrastructure journals or equivalent artifact-oriented venues (`TOSEM/TSE/JSS` family; venue fit remains conditional on results).
- Stage semantics: conditional paper-potential screen; this report does not establish the main claim.

## Optional process telemetry

- Atomic repair trace mode/artifact path/hash, if assignment-enabled: `SHADOW / NOT_APPLICABLE_NO_REVISE`
- Decision effect while nonproduction: `NONE`
- Authorized source activity: 19 bounded web connector calls; no artifact/code download and no persistent resource creation. Exact network-byte telemetry was not exposed by the runtime and was not estimated.

## Structural paper potential vs current readiness

- Structural paper potential if successful: a reusable, version-pinned semantic-compatibility benchmark plus an empirical map of where the documented StableHLO guarantee survives or breaks across the version window and real consumers. This is publishable only if the matrix changes compatibility decisions beyond the union of existing tests.
- Current evidence-acquisition readiness/risk: static feasibility is good, because serialization/deserialization, interpreter/check operations, input-bearing `testdata`, VHLO version fixtures, PRIVATE_TOOLCHAIN StableHLO ingestion and XLA StableHLO execution loci are public. The dominant risk is novelty/substance, not access.
- Why missing implementation/results/proof/hardware is not structurally fatal: Stage 0 is conditional. CPU-only public artifacts can close the first decisive matrix; no product hardware is required for the canonical claim ceiling.

## Discovery provenance

- Opportunity origins: `O4 / O7`
- Domain tags: `StableHLO, VHLO, MLIR, compiler interoperability, semantic compatibility, benchmark`
- Paper genealogy: StableHLO compatibility contract and VHLO suite → reference interpreter/testdata → consumer-native StableHLO tests and OpenXLA comparative benchmark → generic DL/MLIR differential-testing literature.
- Discovery method revision: `SOURCE120_EXACT_PUBLIC_CARRIER_FIRST`
- Discovery claim-pack mode: `OFF`
- Opportunity family ID: `OF-S120-S1-VHLO-SEMANTIC-COMPAT-01`
- Contribution type and type-contract verdict: `BENCHMARK_DATASET / COMPILER_TOOL`; conditionally complete only when reframed as an N3 measurement artifact with predeclared estimand, oracle classes, denominator, comparators, full-cost and negative boundary.
- Independently audited A/C/D/E coordinates: `A1/C0/D1/E1` remains broadly correct, but C0 is rejected for the full conjunction and multiple strong subtractors are added.
- Backtest reference and status: none used as candidate evidence.
- Reminder: method backtest is calibration, not candidate evidence.

## Frozen object and claim

The exact object is StableHLO portable artifacts created through official compatibility APIs and consumed inside documented version windows. The admissible residual claim is not that StableHLO consumers are bit-exact. It is that a version-pinned, input-bearing corpus with specification-typed oracle classes can produce a reproducible compatibility decision matrix across at least two current consumers, while separating exact, tolerance-governed, implementation-defined, unsupported and outside-guarantee outcomes and charging generation-through-triage cost.

The same-object contract excludes generic MLIR bytecode, pretty-printed StableHLO, CHLO without required legalization, unspecced attributes, bug-compatibility expectations and unrestricted numerical-accuracy claims. These exclusions follow the current official compatibility contract: <https://github.com/openxla/stablehlo/blob/main/docs/compatibility.md>.

## Claim-package completeness audit

- Atomic action and mechanism: generate or adapt a legal input-bearing witness; serialize to a target VHLO version; deserialize under a pinned consumer/version; execute the pre/post artifact through reference and consumer paths; classify the relation by a typed oracle.
- Information/assumption contract: public spec, public artifacts, exact commits, identical inputs and predeclared consumer support. No private implementation knowledge or result-aware exclusion.
- Effect target/output/guarantee: compatibility decision coverage and disagreement taxonomy, not universal correctness or bit-exactness.
- Boundary/failure region/competing explanation: implementation-defined accuracy, unsupported operations, consumer feature gaps, interpreter defects and out-of-contract dialects are separate classes, not silently counted as incompatibility.
- Minimum falsifier: after applying identical support/exclusion rules, the proposed matrix adds no valid decision coverage or stable classification beyond the official syntax suite + StableHLO testdata/interpreter + consumer-native tests + OpenXLA comparative benchmark.
- Dependencies and evidence ceiling: exact source revisions and CPU paths; conditional benchmark/measurement claim only.
- Opportunity-family relation audit: #1245 and current testdata directly subtract interpreter-backed witness/oracle mechanics; the OpenXLA benchmark subtracts generic cross-runtime accuracy comparison. The surviving family relation is a narrower version-window semantic contract audit.
- Independent search identity/scope: current first-party StableHLO/PRIVATE_TOOLCHAIN/XLA/OpenXLA benchmark loci plus bounded paper/tool searches for StableHLO/VHLO semantic compatibility, conformance and differential testing, cutoff 2026-08-30.
- Evidence-ledger integrity and contradiction disclosure: issue #1245 is closed and marked Done, while current compatibility documentation still describes reference-implementation use as future work. Current `testdata` source proves interpreter-backed input/expected-output tests exist; therefore the report treats the generic action as implemented/subtracted and does not rely on the stale wording as an absence claim.

## Positive opportunity map

- Natural/canonical workloads: official `stablehlo/tests/vhlo` version compendium and `stablehlo/testdata` input-bearing semantic cases.
- Observed or expected cost/headroom: no candidate result observed. Static headroom comes from the current separation between VHLO syntax/version tests, StableHLO semantic testdata and consumer-specific suites. PRIVATE_TOOLCHAIN's open test-suite issue still proposes importing StableHLO operator tests, which supports an integration gap but is not proof of novelty: <https://github.com/PRIVATE_TOOLCHAIN-org/PRIVATE_TOOLCHAIN-test-suites/issues/4>.
- Mechanism-specific prediction: valid decision deltas, if any, should cluster at version-conversion boundaries, consumer support boundaries and spec-defined accuracy classes rather than uniformly across ops.

## Named baselines and fairness contract

1. Current StableHLO VHLO compatibility suite: same version window and artifact APIs; syntax round-trip decision.
2. Current StableHLO `testdata` + reference interpreter/check dialect: same inputs and expected outputs; semantic execution oracle. A current example both interprets an input-bearing program and compares current serialization round-trip text: <https://github.com/openxla/stablehlo/blob/main/stablehlo/testdata/add_float32_20_20_float32_20_20.mlir>.
3. PRIVATE_TOOLCHAIN/XLA consumer-native StableHLO tests on the same artifact/input intersection.
4. OpenXLA comparative benchmark: same-workload cross-runtime artifacts and saved I/O accuracy data: <https://github.com/PRIVATE_TOOLCHAIN-org/PRIVATE_TOOLCHAIN-comparative-benchmark/blob/main/README.md>.
5. NNSmith/HirGen/DESIL as methodological ceilings for valid input construction, differential/metamorphic oracles, UB control, coverage and bug attribution.

All baselines must receive identical legal artifacts, inputs, version/support intersection, oracle thresholds and exclusions. Unsupported cases are reported as a denominator component, not deleted. Compilation, execution, normalization, triage and retries are fully charged.

## Collision analysis

### Eight-predicate direct-coverage audit

| Predicate | Independent evidence/locator | PASS / FAIL / UNKNOWN |
|---|---|---|
| Same object/function/protocol | StableHLO compatibility docs and VHLO suite use official portable artifacts/version window | PASS |
| Same scenario/workload | First-party VHLO and testdata cover pieces; OpenXLA benchmark uses model artifacts, but no located source covers the exact versioned-witness × consumer matrix | FAIL |
| Same or weaker information | All candidate information is public and available to the current union | PASS |
| Atomic action covered | #1245/testdata cover interpreter execution; VHLO covers version conversion; OpenXLA covers cross-runtime comparison, but the conjunction is not located | FAIL |
| Same/stronger legality, quality and guarantee | Current sources do not expose one typed oracle that jointly classifies exact/tolerance/implementation-defined/unsupported across versions and consumers | FAIL |
| Same non-worse full-cost boundary | No located current source reports generation, conversion, consumer compile/run, normalization, exclusions and triage together | FAIL |
| Comparable scale/platform/version/config | Individual suites are large/current, but the cross-version cross-consumer matrix is not present | FAIL |
| Sufficient full-text/implementation/reproduction depth | First-party implementation depth is high for subtractors; no implementation/full paper of the full conjunction was located | FAIL |

`DIRECT_FATAL`: `NO`. `SEARCH_BOUNDED_OPEN`: `YES`; this is not a global-first claim.

### Nearest-prior facet matrix

| Prior/current artifact | Same object | Witness | Typed semantic oracle | Version window | Cross-consumer | Full cost | Classification |
|---|---:|---:|---:|---:|---:|---:|---|
| StableHLO VHLO compatibility suite | yes | no/mostly syntax fixture | no | yes | no | no | `DIRECT_SUBTRACT` |
| StableHLO testdata/interpreter/check dialect | yes | yes | exact/close checks | current roundtrip, not full window matrix | no | no | `DIRECT_SUBTRACT` |
| OpenXLA comparative benchmark | adjacent same ecosystem | model I/O | accuracy data | no | yes | performance-focused, partial | `DIRECT_SUBTRACT / DEPLOYMENT_BASELINE` |
| PRIVATE_TOOLCHAIN native StableHLO tests | same consumer surface | yes | native expected output | no | one consumer | no | `DEPLOYMENT_BASELINE` |
| NNSmith / HirGen | DL compiler graphs | generated | differential/metamorphic | no | multiple compilers | evaluation cost partial | `METHODOLOGICAL_ADJACENT` |
| DESIL | MLIR programs | generated/UB-free | differential | no | compiler pipelines | evaluation reported | `METHODOLOGICAL_ADJACENT` |

### Seed-distance and method-name deletion test

After deleting “StableHLO”, “VHLO” and tool names, the residual is still a precise problem: audit a versioned interchange contract by executing identical legal witnesses across independently evolving consumers under specification-typed outcome classes. This is not merely “add tests”. However, without the version dimension, typed guarantee boundary and multi-consumer denominator, it collapses to existing harness composition and fails the test.

## Competing mechanism decision

- Selected mechanism: proxy mismatch and boundary fragmentation—syntax success, reference-semantic success and consumer acceptance are different predicates, and the documented contract contains explicit accuracy/support exclusions.
- Registered backup: none; generic fuzzing or a single-consumer interpreter suite changes the contribution and is not an allowed pivot.
- Pivot boundary: any route that drops the portable-artifact version window, replaces spec-typed decisions with raw numeric equality, or removes multi-consumer execution requires a new ID.

## Residual paper kernel

The only retained kernel is a canonical N3 characterization: quantify decision coverage, disagreement classes and boundary stability for identical StableHLO portable artifacts across pinned versions and at least two consumers, with a released witness/oracle ledger. The benchmark/tool is the reproducibility vehicle. Interpreter integration, generating constants, calling two compilers or reproducing known consumer bugs are not standalone contributions.

## Evidence route

- `MEASUREMENT_MECHANISM`

## Performance-optimization admissibility, if applicable

Not a performance-optimization paper. Performance is reported only as full-cost overhead for the audit.

## Q1/Q2 paper shape

- Problem: a long-lived portable IR promises semantic compatibility, but existing official assets validate syntax, reference semantics and consumers in separate systems.
- Contribution: a versioned, spec-typed, cross-consumer decision benchmark and an empirical compatibility taxonomy.
- Evidence plan: exact version/consumer matrix; support-intersection denominator; reference and native baselines; manually audited small witnesses; stable classifications; real issue confirmation where possible; complete cost and exclusion ledger.
- Expected paper narrative: contract → separated current checks → unified matrix → observed decision deltas and boundary taxonomy → implications for versioning and consumer integration.

## Q1/Q2 shape calibration

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Reference set: NNSmith (ASPLOS 2023), HirGen (ISSTA 2023), DESIL (PACMPL/OOPSLA 2025).
- Status: `PARITY_CONDITIONAL`
- Contribution-shape gap: heavy subtraction by first-party assets means Q1 is not currently plausible; Q2 requires a substantial, reusable matrix and stable findings rather than a wrapper.
- Evidence-shape gap: no candidate outputs, pair counts, failure taxonomy, confirmed issues or costs exist yet.
- Stage A closure plan: a result-independent mini-matrix must first show legal decision coverage distinct from every named baseline.

## Non-relaxable quality audit

- Same-object: PASS; exact portable-artifact contract retained.
- Latest collision: PASS for bounded Stage 0; no direct fatal, but current union is explicitly subtracted.
- Strong fair baselines: PASS conditionally; five baseline families named.
- Natural input/evidence: PASS conditionally; official version/test corpora are canonical, not synthetic convenience cases.
- Full-cost: finite and predeclared; not yet observed.
- Reproducibility: exact-commit and matrix route is finite; not yet executed.
- Evidence/claim honesty: no candidate result, bug, accuracy delta or coverage gain is claimed.

## Evidence path and AI completion

- E1/E2 execution-readiness audit; scientific inference explicitly excluded: E1 static preflight finds public APIs/corpora and consumer entry points. E2 was not run and is not required for Stage 0.
- AI executability class: `AI_CORE_EXECUTABLE`
- Estimated ai_core_fraction: `0.88`
- 72-hour first evidence: after a separately authorized Stage A, freeze the exact matrix and run four oracle-class witnesses through reference, XLA CPU and PRIVATE_TOOLCHAIN CPU paths, then enumerate denominator/decision deltas before expanding.
- Human-only items and why they are non-decisive: ambiguous spec wording may need maintainer interpretation, but the initial oracle classes and falsifier are mechanically auditable.

## Fidelity closure plan audit

- Discovery status: `FINITE_FIDELITY_GAP`
- Complete action and native semantics are finite and same-object: yes.
- Comparator, denominator, full-cost and small-witness plan: finite; must be frozen before any claim-bearing run.
- Why an unimplemented interface/format/checker is not structurally fatal: official serialization, interpreter and consumer paths already exist; the remaining work is bounded integration and classification. Failure to preserve the exact guarantee would be structurally fatal.
- Reminder: Stage 0 audits the plan; Stage A must actually close `PRE_CLAIM_CONTRACT_FIDELITY_GATE` before its first claim-bearing run.

## Independent current upstream reality check

- Frozen upstream commit/tag and check date: StableHLO official commits page exposed `6a5902c7c0f7b3085a502d148b846a62eaa20501` as the latest visible `main` commit on the review snapshot; `Version.h` reports current VHLO `1.20.0`, minimum `0.9.0`. PRIVATE_TOOLCHAIN current snapshot is pinned to `ee89ff3011fb5bfb952d1471fd3b745c8b06b916`. Check date 2026-08-30. Stage A must re-resolve immutable HEADs because web-index freshness is not an execution freeze.
- Current official documentation checked: StableHLO compatibility, VHLO, interpreter status/reference, specification and release notes.
- Actual source paths/symbols checked: `docs/compatibility.md`, `stablehlo/dialect/Version.h`, `stablehlo/tests/vhlo`, `stablehlo/testdata`, `stablehlo/tests/interpret`, `StablehloTranslateMain.cpp`, PRIVATE_TOOLCHAIN `CMakeLists.txt` (`PRIVATE_TOOLCHAIN_INPUT_STABLEHLO`), PRIVATE_TOOLCHAIN StableHLO e2e tests and XLA `run_hlo_module --input_format=stablehlo` evidence.
- Default/non-default flags, thresholds and configurations checked: StableHLO target-version serialization/deserialization APIs; interpreter `--interpret`; PRIVATE_TOOLCHAIN StableHLO input enabled by default when the compiler is built; XLA StableHLO input runner. No build-time support claims were inferred beyond these static loci.
- Discovery absence claim confirmed, narrowed or contradicted: contradicted for generic interpreter-backed semantic witnesses; narrowed but not contradicted for the full versioned typed-oracle cross-consumer conjunction.
- If contradicted, current native mechanism and finite configuration-grid baseline: VHLO roundtrip + StableHLO testdata/interpreter + PRIVATE_TOOLCHAIN/XLA native execution + OpenXLA comparative benchmark.
- Any non-tuning residual that remains: unified contract-level decision taxonomy and empirical matrix across versions and consumers.

## Stage A highest-risk probe plan

- Risk-bearing premise: after subtracting the current union, the unified matrix yields a reproducible, decision-changing compatibility classification rather than only plumbing existing tests together.
- Cheap discriminating probe or counterexample search: predeclare four witness classes (exact integer, tolerance-governed float, implementation-defined/outside guarantee, unsupported), two supported producer versions, two pinned consumers plus reference, and an identical support-intersection denominator. Manually validate one complete artifact/input/oracle trace before expansion.
- Negative result that kills the direction: any of the following: fewer than a useful predeclared number of legal cross-version/consumer triples; no valid decision beyond the union of named baselines; all apparent disagreements are unsupported/out-of-contract or threshold artifacts; classifications are unstable under replay; or the only deliverable is glue code without a stable empirical taxonomy.
- Positive-result ceiling: preliminary support/non-falsification only; not main-claim proof.

## Stop conditions

1. A current source is found that directly implements the full conjunction under non-worse guarantee, version scale and full cost.
2. The denominator cannot preserve exact portable-artifact semantics and identical support/exclusion rules across consumers.
3. The typed oracle cannot distinguish documented implementation-defined behavior from semantic incompatibility without post-hoc judgment.
4. The mini-matrix yields no decision coverage or stable taxonomy beyond the named current union.
5. Reproducibility requires private consumers, unpublished artifacts or unbounded hardware.

## Discovery repair vector

- Codes: `OMITTED_CURRENT_SAME_OBJECT`, `OMITTED_FIRST_PARTY_FEATURE`
- Materiality: HIGH. Discovery mentioned #1245 as subtraction but did not fully account for current input-bearing `testdata` with interpreter/check or the OpenXLA comparative benchmark. This removes generic witness/oracle and cross-runtime comparison as standalone novelty and forces an N3 residual.
- Was the missing information available before the frozen cutoff?: yes.
- Does this feedback alter the independent scientific decision?: `NO`; it materially narrows the claim but leaves a conditional Tier-B residual.

## Dual-axis score

- Academic value: `46/70`
- AI executability bonus: `27/30`
- Total: `73/100`

## Human research reserve, if applicable

Not applicable.

## User-action blocker, if applicable

Not applicable. `Claim-bearing observation obtained before failure: no`; no failure or blocker occurred, and no scientific revision was consumed.

## Source verification note

This review used AI-assisted source search and synthesis. Claims are limited to the cited official repositories/docs and identified papers. The negative collision statement is search-bounded, not exhaustive.
