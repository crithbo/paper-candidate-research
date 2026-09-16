# Discovery Research Question Card

## Identity

- Card ID: `S2-103-QC03`
- Discovery lane / assignment: `DISCOVERY_S2` / `DISCOVERY-S2-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Source divergence seed ID/path: `S2-103-07` / `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- RQ candidate ID/path: `S2-103-RQ03` / `RQ_CANDIDATE_S2-103-RQ03.md`
- Exact public identity: vLLM current first-party Metrics and `vllm bench serve` documentation, retrieved 2026-08-24.
- Carrier kind: `IMPLEMENTATION_CARRIER_ONLY`.
- Network-security exclusion check: `PASS`.

## Global canonical identity preflight

- Frozen lookup surface / version / SHA256: `registry.yaml` snapshot `F91F2ACE60F7AC2871AA9EEB502A0A15CAF14CD06A171504C1E058048143B13B`.
- Prior canonical identity or certificate matched: low-bit packing and routing terminal identities are `RELATED_ONLY`; no five-field exact match was used for exclusion.
- Five-field relation — object: `RELATED_ONLY`.
- Five-field relation — action or estimand: `RELATED_ONLY`.
- Five-field relation — claim endpoint: `RELATED_ONLY`.
- Five-field relation — semantic guarantee: `RELATED_ONLY`.
- Five-field relation — full-cost boundary: `RELATED_ONLY`.
- Frozen direct current collision hit: `YES` for the proposed observability/attribution surface.
- Mechanical identity disposition: `RELATED_ONLY_DO_NOT_EXCLUDE`; direct current coverage below determines the substantive disposition.

## Two-sentence problem and insight

- Problem: a local optimization can be misread as an end-to-end gain if queue, prefill, decode and request-completion terms are omitted.
- Proposed insight: no residual was established because the current native carrier already exposes those intervals and benchmark results at the requested observation granularity.

## Research contract

- Exact object and immutable semantics/quality contract: one version-pinned vLLM serving path and identical request/model/output condition.
- Same-object problem or estimand: request-level queue, prefill, decode, TTFT, TPOT/ITL and E2E timing attribution.
- Contribution type: `MEASUREMENT_CHARACTERIZATION`.
- Contribution route: `N3` hypothesized, not established.
- Claim endpoint: `measurement conclusion`.
- Counterfactual consequence if the claim is true: choose a different optimization target when rankings reverse under full cost.
- Non-generic discriminator hypothesis and its source: failed — current native metrics and benchmark interfaces already provide the proposed decomposition.
- Initial full-cost boundary: queue, prefill, decode/inference, request E2E and the documented benchmark denominator.

## RAW_REQUIRED evidence minimum

- Opportunity/problem anchor: vLLM first-party Metrics documentation.
- One versioned current native/official source or specification locus: vLLM Metrics and `vllm bench serve` current docs.
- Known direct-fatal check at this locus: `FOUND` — native observability covers queue, prefill, decode/inference, TTFT and E2E; bench supports detailed request results and TTFT/TPOT/ITL/E2E percentiles.
- Strongest immediately known skeptic objection: composing existing exported metrics into a plot or report is a generic dashboard/profiler wrapper.
- Preliminary residual hypothesis: none that is target-specific and source-supported.
- Search and source boundary so far: current first-party documentation only.

## Cheapest decisive test

- Minimum falsifier: current native source documents the complete requested metric decomposition and benchmark carrier.
- Stop/narrow condition: satisfied by current native documentation.

## Front-end disposition

- RQ audit: `RQ_COMPLETE`.
- RAW_REQUIRED audit: `INCOMPLETE` because a non-generic discriminator and atomic action are absent.
- Closure debt: `STRUCTURALLY_UNCLOSABLE` for the frozen proposed contribution; any residual would require a new object/action and a new ID.
- Identity relation: `RELATED_ONLY` in historical registry; `CURRENT_NATIVE_DIRECT_COVERAGE` for the proposed observability action.
- Disposition: `EXCLUDED_BEFORE_RAW`.
- Reason in plain Chinese: vLLM 已原生提供完整的请求级时序拆分与 bench 结果接口；本轮只剩把既有指标聚合为 dashboard/profile 的通用包装，不能进入 raw。
- Eligible for C0: `NO`.
