# Source108 S1 divergence seed pool

## Pool metadata

- Assignment / lane: `DISCOVERY-S1-20260824-SOURCE108-ARTIFACT-REPLICATION-MEASUREMENT-V1` / `DISCOVERY_S1`
- Frozen profile: `SOURCE108_PUBLIC_ARTIFACT_REPLICATION_MEASUREMENT_ROTATION_V1`
- Seed ceiling: `<=12`; generated: `8`
- RQ candidate ceiling after convergence: `<=8`
- Network-security exclusion check: `PASS` — public inference artifacts and public documentation/source only.
- Generation completed before evidence lookup: `YES`
- Exclusion handling: predecessor/terminal identities are held only through the frozen registry/control surface. No prohibited handoff, A4 output, group repository, private source, or Stage0 output was read.

## Divergence coverage

| Engine | Used | Seed IDs |
|---|---:|---|
| `BISOCIATION_STRUCTURAL_TRANSFER` | yes | S108-01, S108-06 |
| `PROBLEM_REFRAMING` | yes | S108-02 |
| `CONSTRAINT_MANIPULATION` | yes | S108-03, S108-07 |
| `NEGATION_OR_INVERSION` | yes | S108-04 |
| `ABSTRACTION_LADDER` | yes | S108-05 |
| `JANUSIAN_TENSION` | yes | S108-08 |

### S108-01

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `MEASUREMENT_REVIEWER`
- Starting anchor: FlashInfer paged-KV decode planning separates plan construction from attention execution; this resembles a two-stage query optimizer with hidden setup cost.
- Intended source role: `ANCHOR`.
- Idea sketch: Define an exact public-artifact estimator that attributes prefill/decode latency to plan, page-table/indirection preparation, and kernel execution under a frozen request boundary. A benchmark/measurement contribution is possible only if current artifact measurements collapse these phases and the resulting attribution changes a deployment decision without relabeling generic cold-start work.
- Conclusion-first test: The cautious conclusion is a reproducible validity boundary for a named paged-KV attention artifact, not a universal serving claim.
- Counterfactual / risk: The artifact may already expose the same timing components, or the issue is merely S4-style warm/cold benchmarking.
- Evidence needed before locator: exact current source version/date, plan/run API locus, benchmark harness, and a public LLM request carrier.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S108-02

- Engine / perspective: `PROBLEM_REFRAMING` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: Paged-KV attention APIs encode logical token positions separately from physical page storage.
- Intended source role: `ANCHOR`.
- Idea sketch: Audit whether a public attention wrapper's logical/physical position contract is sufficient to preserve causal/window semantics across page recycling and ragged batch updates. A negative-replication candidate requires a fixed public artifact claim plus a native oracle and a decision-relevant counterexample; a generic page-table checker is not enough.
- Conclusion-first test: At most, the work could delimit an artifact's stated semantic envelope and supply a faithful falsifier.
- Counterfactual / risk: Existing tests/oracles may already cover the contract, or no real mismatch is available.
- Evidence needed before locator: exact API/spec locus, current test/reference path, explicit claimed semantics, and public request sequence carrier.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S108-03

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `HARDWARE_ARCHITECT`
- Starting anchor: FlashInfer supports multiple KV-cache data types/layouts whose attention semantics and cost are coupled to decoding configuration.
- Intended source role: `CURRENT`.
- Idea sketch: Freeze an exact low-bit/FP8 KV artifact configuration and determine whether its published numerical validation misses a configuration-defined semantic region (for example, a page/layout/window combination), with a source-level oracle. This must not be a new quantization format, a broad low-bit compiler route, or a single error report.
- Conclusion-first test: A valid negative result would narrow one public artifact's contract or benchmark coverage, not claim all low-bit KV inference is incorrect.
- Counterfactual / risk: If support matrix and test suite already make the region explicit, or no natural LLM carrier exists, it stops before raw.
- Evidence needed before locator: public compatibility matrix/version, code/test locus, native LLM trace/request input, and existing contrary validation.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S108-04

- Engine / perspective: `NEGATION_OR_INVERSION` / `END_USER`
- Starting anchor: llama.cpp exposes KV-cache quantization and flash-attention options as user-facing execution choices.
- Intended source role: `ANCHOR`.
- Idea sketch: Instead of seeking a speedup, seek a reproducible negative ranking: does a named artifact's kernel-only throughput ordering reverse under the exact model/request/quality/full-cost boundary it recommends? This is valid only if documentation makes a performance claim or decision rule and a public benchmark/trace supplies the same object.
- Conclusion-first test: A replication-negative could correct one recommendation under a specified environment, rather than benchmark a generic runtime.
- Counterfactual / risk: No published recommendation, changed workload, or no exact benchmark makes it ordinary configuration benchmarking.
- Evidence needed before locator: exact release/commit, documented recommendation, canonical benchmark command/carrier, and a contrary full-cost source.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S108-05

- Engine / perspective: `ABSTRACTION_LADDER` / `THEORIST`
- Starting anchor: Attention implementations often return optional log-sum-exp or other auxiliary outputs that can serve as an oracle only under an exact masking convention.
- Intended source role: `ESCAPE`.
- Idea sketch: Formulate a canonical oracle-equivalence boundary for one public FlashInfer attention operator across causal, windowed and ragged modes, then test whether artifact tests establish it. This is a formal/replication route only if a finite checker already exists and identifies a meaningful coverage gap rather than a test-suite extension.
- Conclusion-first test: The conclusion would be a checked semantic coverage theorem or a precise missing-case negative for one operator contract.
- Counterfactual / risk: It becomes a routine checker or merely asserts known attention mathematics.
- Evidence needed before locator: operator signature/version, reference oracle/test locus, supported-mode matrix, and finite mismatch criterion.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S108-06

- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `MAINTAINER`
- Starting anchor: A reproducibility package behaves like a measurement instrument whose calibration can be invalidated by defaults and optional backends.
- Intended source role: `CURRENT`.
- Idea sketch: For an exact public LLM attention artifact, compare the documented benchmark claim boundary against the harness's default/non-default flags and output accounting, then freeze a corrected measurement protocol if the original estimand is not identifiable. It is admissible only if the protocol changes a published/artifact decision and includes a held-out validity test.
- Conclusion-first test: The paper-shaped contribution is a validated benchmark correction, not a README audit.
- Counterfactual / risk: If official harness already reports all relevant components or no decision changes, it is maintenance.
- Evidence needed before locator: versioned benchmark script/config, stated metric, current defaults, and independent oracle/counterexample route.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S108-07

- Engine / perspective: `CONSTRAINT_MANIPULATION` / `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor: An attention artifact may choose backend/layout based on cache/page metadata and hardware features.
- Intended source role: `CONTRARY`.
- Idea sketch: Ask whether the source-level backend predicate includes an unnecessary condition that forces a semantically identical but lower-quality fallback for one public LLM carrier. It remains only if the action is not broad dynamic-shape compilation, generic dispatch selection, or an upstream-supported option.
- Conclusion-first test: A compiler/tool contribution would unlock one fixed semantics-preserving backend action with complete dispatch and conversion cost.
- Counterfactual / risk: Existing backend selection is current, or relaxing predicate changes numerical/ABI contract.
- Evidence needed before locator: exact predicate source, backend semantic contracts, carrier and full-cost comparison.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

### S108-08

- Engine / perspective: `JANUSIAN_TENSION` / `MEASUREMENT_REVIEWER`
- Starting anchor: Exact artifact tests can show numerical agreement while real decode quality and latency boundaries depend on cache precision and request evolution.
- Intended source role: `NATURAL_CARRIER`.
- Idea sketch: Establish whether a public artifact's unit-level numerical tolerance is predictive of a fixed LLM decode-level quality/latency decision under its documented cache configuration. This is measurement characterization only if it yields a stable, falsifiable relation and does not merely run more models.
- Conclusion-first test: The modest result would identify a decision threshold where artifact-unit validation is insufficient for a named deployment choice.
- Counterfactual / risk: It needs unavailable models/evaluation or becomes broad accuracy benchmarking.
- Evidence needed before locator: exact artifact claim/test tolerance, native decode carrier, evaluation oracle and finite confound route.
- Relation / noun-swap / disposition: `FRESH_SKETCH` / `PASS` / `KEEP_FOR_CONVERGENCE`.

## Clustering and genealogy

| Cluster | Seed IDs | Shared object/mechanism | Material differences | Representative seed |
|---|---|---|---|---|
| paged-KV semantic contract | S108-02, S108-03, S108-05 | attention API/test semantics | page mapping, precision mode, oracle coverage | S108-02 |
| artifact measurement validity | S108-01, S108-06, S108-08 | documented artifact metrics vs decision boundary | phase attribution, harness calibration, unit-to-decode relation | S108-06 |
| backend/algorithm boundary | S108-07 | source predicate and fallback | same-function backend selection | S108-07 |
| llama.cpp replication negative | S108-04 | documented choice vs full-cost ranking | exact release recommendation | S108-04 |

## Coverage-constrained convergence

| Selected seed | Why preserved | Intended object/problem boundary | RQ Candidate ID |
|---|---|---|---|
| S108-02 | direct semantic/negative-replication route | paged-KV logical/physical causal contract | RQ-S108-01 |
| S108-03 | precision/support-matrix semantic route | FlashInfer KV dtype/layout configuration | RQ-S108-02 |
| S108-05 | canonical-oracle route | operator auxiliary-output/mask semantics | RQ-S108-03 |
| S108-06 | benchmark validity route | documented metric vs harness estimator | RQ-S108-04 |
| S108-07 | nontrivial source action route | backend predicate versus same semantics | RQ-S108-05 |
| S108-04 | exact public replication-negative alternative | llama.cpp documented cache option/ranking | RQ-S108-06 |

S108-01 and S108-08 are contained by the more specific benchmark/oracle routes. No seed is a locator, raw package or novelty conclusion.

## Advisory

- Engines used: 6
- Perspective roles used: 6
- Largest object/surface share: FlashInfer paged-KV attention (4/8)
- `DIVERGENCE_COVERAGE_ADVISORY`: `PASS`
- Plain-Chinese note: 本轮优先把“源码接口/测试/benchmark 是否足以支撑其精确语义或推荐”变成可反证问题；没有明确 artifact claim、native oracle 与决策后果时，不会把 test 或 README 维护包装成论文。
