# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S2-103-RQ03`
- Discovery lane / assignment: `DISCOVERY_S2` / `DISCOVERY-S2-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S2-103-07` / `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: public single-GPU LLM inference benchmark/carrier with kernel and end-to-end latency accounting.
- Exact public anchor and version/date: `https://github.com/vllm-project/vllm` (release/commit must be frozen from first-party source before source closure).
- Stable object and immutable guarantee envelope: one named serving/inference path with identical generated output, request/input conditions and fixed inclusion/exclusion denominator.
- Decision-relevant counterfactual consequence: an engineer changes which optimization is selected when kernel-local and end-to-end full-cost rankings diverge.
- Single anchor question: does a first-party public carrier expose both a traceable kernel-side and end-to-end denominator with a finite, non-dashboard measurement endpoint?
- Co-defined field bundle to close: `carrier / estimand / decision threshold`.
- Contribution type hypothesis: `MEASUREMENT_CHARACTERIZATION`.

## Candidate research questions

1. Primary RQ: On one version-pinned public single-GPU LLM inference carrier, can an attribution protocol identify a repeatable ranking reversal or no-gain boundary between a low-bit/NDP-adjacent local optimization and a fully charged end-to-end metric, with a decision threshold and held-out falsifier?
2. Optional same-object alternative B and the genuine ambiguity requiring it: none.
3. Optional same-object alternative C and the genuine ambiguity requiring it: none.

## Scope and answerability

- Selected or merged RQ: primary RQ.
- Exact phenomenon, decision or estimand being asked about: the relationship between a kernel-side metric and a specified end-to-end latency/cost denominator for one public carrier.
- In scope: public benchmark/trace, measurement methodology, confound accounting and a decision-changing threshold.
- Out of scope: dashboard-only profiling, private serving traces, uncalibrated NDP performance claims or broad deployment generalization.
- Immutable semantic/quality boundary: identical request/model/output scenario and declared metric denominator.
- Candidate methodology or evidence route: first-party runtime/docs plus a public benchmark/trace and a held-out condition.
- Minimum public carrier/oracle route: version-pinned runtime source with an executable or documented latency boundary.
- Earliest observation that could falsify the question's motivating premise: no stable end-to-end boundary exists, or the task is merely collecting metrics without a testable decision consequence.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL` — requires a canonical public carrier and a finite CPU/single-GPU measurement route.
- Interesting: `CONDITIONAL` — only if attribution changes an optimization or evaluation decision.
- Novelty threat: `HIGH` — existing serving benchmarks or runtime profilers may already make the same conclusion.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL` — result must be a bounded characterization, not a deployment claim.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Selection reason in plain Chinese: 保留一条独立的 measurement/characterization 入口，以检验“端到端分母遗漏”是否能形成结论而非把 profiler 改名成论文。
- Alternative explanation or null hypothesis to test: established runtime metrics or benchmarks already cover the same attribution/threshold, or no stable law exists.
- Precommitted primary evidence route: first-party release/docs and benchmark/profiling documentation; then strongest current benchmark/comparator and a contrary characterization source.
- Precommitted fallback route for transport/resource failure only: archived official release notes and public repository documentation at the frozen revision.
- Forbidden outcome-aware reformulation: switching workloads after results, treating a single profile as a stable law, or claiming hardware benefit from a benchmark-only result.

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`
- Exact anchor and stable object/guarantee frozen: `YES`
- One outcome-independent anchor question: can the first-party public carrier define both local and end-to-end metrics and a decision consequence without an unbounded data collection program?
- Co-defined `carrier/action/estimand` bundle: `carrier/estimand`
- Named primary sources: `TWO` — first-party runtime release/documentation and its benchmark/profiling interface.
- Known direct fatal: `NO_KNOWN_FATAL`
- Finite stop condition: no canonical carrier/denominator, or an existing current benchmark already expresses the same measurement conclusion.
- Requested model route: `TERRA_HIGH_ORDINARY`
- Frozen nomination timestamp: `2026-08-24T02:30:00+08:00`
- Packet result: `CLOSED_TO_TYPED_RQ__NO_NON_GENERIC_RESIDUAL`
- Evidence locators / provenance: current vLLM Metrics and `vllm bench serve` documentation exposes request queue, prefill, decode, TTFT, TPOT/ITL, E2E and per-request detailed results under the same public runtime carrier.

## Disposition

`EXCLUDED_BEFORE_LOCATOR__CURRENT_NATIVE_OBSERVABILITY_COVERS_PROPOSED_ESTIMAND`
