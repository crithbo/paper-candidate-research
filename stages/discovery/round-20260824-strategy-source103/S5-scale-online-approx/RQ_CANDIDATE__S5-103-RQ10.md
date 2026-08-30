# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S5-103-RQ10`
- Discovery lane / assignment: `DISCOVERY_S5` / `DISCOVERY-S5-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S5-103-10` / `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: public single-GPU/CPU long-context runtime with source-defined KV placement/offload action.
- Exact public anchor and version/date: vLLM current KV offload/CPU-cache implementation; commit/date to be frozen.
- Stable object and immutable guarantee envelope: one runtime's sequence/cache semantics and a named latency/quality/full-cost boundary.
- Decision-relevant counterfactual consequence: legal KV block placement/migration after capacity change.
- Single anchor question: does the public runtime own a multi-tier placement action that survives current offload management?
- Co-defined field bundle to close: `carrier / atomic action / cost boundary`.
- Contribution type hypothesis: `SYSTEM_ARCHITECTURE`

## Candidate research questions

1. For a version-frozen public single-GPU/CPU KV-offload runtime, can a runtime-constrained online bin-packing-with-recourse algorithm reduce complete migration and transfer cost under context growth while preserving the same sequence/cache semantics and named latency-quality boundary?

## Scope and answerability

- In scope: CPU/GPU only, source-defined placement/migration action, metadata/transfer cost and one workload route.
- Out of scope: unavailable multi-node/PIM tiers and generic paging.
- Candidate methodology or evidence route: `PARETO_APPROXIMATION`.
- Minimum public carrier/oracle route: current source-defined offload action and small placement witness.
- Earliest falsifier: source has no independent placement action or native offload manager directly expresses the proposal.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL`.
- Interesting: `CONDITIONAL`.
- Novelty threat: `HIGH`.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL`.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Selection reason in plain Chinese: 仅保留 CPU/单 GPU 范围，先检查 vLLM 当前 offload 是否已有同样的 online placement action。
- Alternative explanation or null hypothesis to test: 现有 offload manager/普通 paging 直接覆盖。
- Precommitted primary evidence route: vLLM first-party docs and current repository source.
- Precommitted fallback route for transport/resource failure only: official tag/archive.
- Forbidden outcome-aware reformulation: 不得把无 native placement 行为改写为 abstract bin packing。

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`
- Exact anchor and stable object/guarantee frozen: `NO`.
- One outcome-independent anchor question: current offload manager exports which legal block placement/migration action?
- Co-defined `carrier/action/estimand` bundle: `KV placement / bounded recourse / transfer cost`.
- Named primary sources: `TWO`.
- Known direct fatal: `NO_KNOWN_FATAL`
- Finite stop condition: no action, direct coverage or exact residual.
- Requested model route: `TERRA_HIGH_ORDINARY`
- Packet result: `NOT_RUN`

## Disposition

- `PRE_RQ_CLOSURE_NOMINATED`
