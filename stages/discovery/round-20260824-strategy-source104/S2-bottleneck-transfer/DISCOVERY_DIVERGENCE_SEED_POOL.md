# Source104 S2 — Divergence Seed Pool

非证据 seed；生成完成前未检索公开资料，不主张新颖性、缺口或论文质量。

## Pool metadata

- Assignment / lane: `DISCOVERY-S2-20260824-SOURCE104-PUBLIC-CARRIER-DIVERSIFIED-V1` / `DISCOVERY_S2`
- Profile: `SOURCE104_PUBLIC_CARRIER_FIRST_DIVERSIFIED_LLM_VLA_V1`
- Seed ceiling / actual: `12 / 6`
- Network-security exclusion: `PASS`
- Generation completed before evidence lookup: `YES`
- Forbidden inherited identities checked: generic vLLM metrics wrapper, group-repository NDP layout sketch, generic irregular-GEMM selector, low-bit format/packing renames.

## Seed records

### `S2-104-01`
- Engine / perspective: `CONSTRAINT_MANIPULATION` / `COMPILER_OR_BACKEND_ENGINEER`
- Public anchor candidate: vLLM current speculative-decoding source and configuration interface.
- Sketch: A speculative proposal may save target-model forwards but shift cost to verification, KV allocation and scheduling. Ask whether a same-object runtime action jointly selects a verification granularity and KV reservation under an explicit full-cost denominator.
- Conclusion-first test: a bounded runtime decision could improve one fixed carrier’s request-level full cost while preserving generated-token semantics, not merely report acceptance rate.
- Main risk: existing speculative schedulers or a threshold/metrics wrapper already cover it.
- Needed before locator: exact current action, verifier/KV semantics, and a first-party benchmark boundary.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S2-104-02`
- Engine / perspective: `BISOCIATION_STRUCTURAL_TRANSFER` / `MAINTAINER`
- Public anchor candidate: SGLang current RadixAttention/prefix-cache source.
- Sketch: Prefix reuse can move bottlenecks from prefill compute to eviction, cache residency and request admission. Seek a legality-preserving cache action that uses future verification/decode demand rather than a generic lifecycle policy.
- Conclusion-first test: a specified cache action changes a full TTFT/TPOT/E2E decision under a fixed workload and cache contract.
- Main risk: generic prefix-cache lifecycle already covered by vLLM/SGLang.
- Needed before locator: native action semantics, state representation and a finite falsifier.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S2-104-03`
- Engine / perspective: `NEGATION_OR_INVERSION` / `OPERATOR`
- Public anchor candidate: TensorRT-LLM speculative decoding public source/documentation.
- Sketch: Instead of maximising draft acceptance, choose when not to speculate because draft/verification synchronization and memory traffic dominate under short or fragmented requests. The action must preserve the same decoding distribution/contract and charge draft, target, transfer and scheduling costs.
- Conclusion-first test: a current-runtime policy selects a no-speculate region that improves a declared full-cost Pareto frontier.
- Main risk: ordinary acceptance threshold or a documented runtime switch.
- Needed before locator: current configuration/action, exact output guarantee and baseline union.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S2-104-04`
- Engine / perspective: `COMPOSE_DECOMPOSE_SIMPLIFY` / `HARDWARE_ARCHITECT`
- Public anchor candidate: FlashInfer public speculative decoding/KV cache interfaces.
- Sketch: An optimized attention/kernel path may move cost to KV page-table updates or host launch sequencing; a compiler/runtime action could select a page representation jointly with decode batching. No new kernel or format is presumed.
- Conclusion-first test: a target-native representation/batching action changes charged request-level cost on a public carrier.
- Main risk: generic kernel selector or existing paged-KV machinery.
- Needed before locator: exact public action and current source locus.
- Disposition: `KEEP_FOR_CONVERGENCE`

### `S2-104-05`
- Engine / perspective: `PROBLEM_REFRAMING` / `MEASUREMENT_REVIEWER`
- Public anchor candidate: vLLM current benchmark/metrics source.
- Sketch: Test whether speculative-decoding local speed metrics become misleading when verifier queueing and KV residency are charged. This only survives if it has a novel estimator/action beyond current native metric exports.
- Conclusion-first test: a stable, decision-changing characterization rather than a dashboard.
- Main risk: exact Source103 generic-metrics identity.
- Needed before locator: source-supported non-generic estimator and held-out falsifier.
- Disposition: `KEEP_FOR_CONVERGENCE__HIGH_REPEAT_RISK`

### `S2-104-06`
- Engine / perspective: `ADJACENT_POSSIBLE_OR_BOUNDARY` / `END_USER`
- Public anchor candidate: vLLM/SGLang multi-turn prefix-cache + speculative decode interface.
- Sketch: A multi-turn request may benefit from keeping a prefix for reuse yet suffer verifier memory pressure on the next turn. Consider a joint admission action only if one public runtime owns both state transitions and the full-cost semantics.
- Conclusion-first test: a non-product state/action remains after current cache and speculative mechanisms are subtracted.
- Main risk: cross-system wrapper or generic cache policy.
- Needed before locator: a single native carrier that exposes both actions.
- Disposition: `KEEP_FOR_CONVERGENCE`

## Frozen convergence

| Selected seed | Coverage reason | RQ ID |
|---|---|---|
| S2-104-01 | vLLM speculative verification/KV bottleneck | S2-104-RQ01 |
| S2-104-03 | TensorRT-LLM no-speculate full-cost boundary | S2-104-RQ02 |
| S2-104-04 | FlashInfer paged-KV/batching target-native route | S2-104-RQ03 |

Unselected seeds remain non-evidence backlog and cannot replace selected routes after evidence outcomes.
