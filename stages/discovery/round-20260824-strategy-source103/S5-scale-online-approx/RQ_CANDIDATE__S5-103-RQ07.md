# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S5-103-RQ07`
- Discovery lane / assignment: `DISCOVERY_S5` / `DISCOVERY-S5-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S5-103-07` / `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: vLLM prefix/KV cache admission carrier.
- Exact public anchor and version/date: vLLM current prefix-cache implementation and docs; commit/date to be frozen.
- Stable object and immutable guarantee envelope: fixed prefix-cache semantics, capacity and full-cost SLO boundary.
- Decision-relevant counterfactual consequence: admit, retain or revoke a prefix under the same native capacity.
- Single anchor question: does vLLM expose a concrete admission/revocation action distinct from a generic cache configuration?
- Co-defined field bundle to close: `carrier / action / estimand`.
- Contribution type hypothesis: `METHOD_ALGORITHM`

## Candidate research questions

1. For a version-frozen vLLM prefix-cache implementation and named workload family, can an online robust admission-and-bounded-recourse algorithm improve a full-cost SLO criterion over the current native admission policy without changing prefix-cache semantics?

## Scope and answerability

- In scope: native cache admission/revocation, memory and transfer accounting, one public workload route.
- Out of scope: generic popularity prediction and unbounded service-wide claims.
- Candidate methodology or evidence route: `PERFORMANCE`.
- Minimum public carrier/oracle route: current source and a public trace/workload with explicit cache counters.
- Earliest falsifier: no source-defined admission action or native union already covers robust recourse.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL`.
- Interesting: `CONDITIONAL`.
- Novelty threat: `HIGH` — caching theory and existing prefix-cache designs.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL`.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Selection reason in plain Chinese: 该题只在 prefix cache 有可定位的 native admission 行为且 full-cost 分母能固定时成立。
- Alternative explanation or null hypothesis to test: 当前 runtime 已是 deterministic full-cache reuse，剩余只是 generic cache policy。
- Precommitted primary evidence route: vLLM official docs and current source.
- Precommitted fallback route for transport/resource failure only: official tag/archive.
- Forbidden outcome-aware reformulation: 不得在无 native action 时改写成一般 cache admission。

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`
- Exact anchor and stable object/guarantee frozen: `NO`.
- One outcome-independent anchor question: current prefix-cache's retention/admission action and full-cost hooks are what?
- Co-defined `carrier/action/estimand` bundle: `prefix entry / admission recourse / SLO cost`.
- Named primary sources: `TWO`.
- Known direct fatal: `NO_KNOWN_FATAL`
- Finite stop condition: absent action, current direct coverage or frozen residual.
- Requested model route: `TERRA_HIGH_ORDINARY`
- Packet result: `NOT_RUN`

## Disposition

- `PRE_RQ_CLOSURE_NOMINATED`

