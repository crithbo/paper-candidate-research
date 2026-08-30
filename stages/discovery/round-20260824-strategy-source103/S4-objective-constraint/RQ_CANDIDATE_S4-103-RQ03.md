# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S4-103-RQ03`
- Discovery lane / assignment: `DISCOVERY_S4` / `DISCOVERY-S4-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S4-103-07`; `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: a public single-GPU LLM-serving benchmark plus publicly documented device/host telemetry interface.
- Exact public anchor and version/date: SGLang `bench_serving` documentation on `main`, locator observed 2026-08-24; NVIDIA NVML public API documentation is the intended telemetry anchor.
- Stable object and immutable guarantee envelope: end-to-end request completion under a fixed serving workload; no inference from unavailable board-level instrumentation.
- Decision-relevant counterfactual consequence: a runtime/configuration energy or cost ordering used for deployment could change.
- Single anchor question: what is the lowest public telemetry boundary that yields a reproducible, decision-relevant energy/cost estimand for this benchmark?
- Co-defined field bundle to close: `carrier / estimand`.
- Contribution type hypothesis: `MEASUREMENT_CHARACTERIZATION`.

## Candidate research questions

1. Can a publicly reproducible single-GPU serving energy/cost protocol, with explicit host/device and completion denominators, change a frozen deployment choice relative to device-only sampling without overclaiming total-system energy?
2. Optional same-object alternative B and the genuine ambiguity requiring it: `NONE`.
3. Optional same-object alternative C and the genuine ambiguity requiring it: `NONE`.

## Scope and answerability

- Selected or merged RQ: primary RQ above.
- Exact phenomenon, decision or estimand being asked about: validity of a public energy/cost measurement estimand for a specified serving decision.
- In scope: telemetry accessible on the local single-GPU/CPU route and a declared evidence ceiling.
- Out of scope: energy claims for inaccessible PIM/NPU hardware, fleet carbon accounting, or unsupported wall-power assertions.
- Immutable semantic/quality boundary: same workload, model outputs, warm/cold condition, serving completion and observation window.
- Candidate methodology or evidence route: `MEASUREMENT_MECHANISM`.
- Minimum public carrier/oracle route: official telemetry semantics plus a traceable serving timestamp boundary.
- Earliest observation that could falsify the question's motivating premise: no public observable can distinguish the proposed protocol from device-only sampling at the required decision threshold.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL` — public telemetry must reach a bounded decision ceiling.
- Interesting: `CONDITIONAL` — only if it changes an actual configuration choice.
- Novelty threat: `HIGH` — energy methodology may be existing measurement hygiene.
- Ethical/scope fit: `PASS`.
- Relevant: `CLEAR` only under complete denominators and a natural workload.

## Pre-evidence selection

- Selected for evidence lookup: `YES`.
- Selection reason in plain Chinese: 保留能耗/full-cost 入口，但以“是否改变部署决策”排除仅补充一列指标的方案。
- Alternative explanation or null hypothesis to test: device-only telemetry already supports the same decision, or total-system claim is unobservable under public resources.
- Precommitted primary evidence route: official telemetry API docs + native benchmark timestamp/output path.
- Precommitted fallback route for transport/resource failure only: vendor downloadable API reference and versioned benchmark docs.
- Forbidden outcome-aware reformulation: 无法观测系统边界时不把 device-only 数据升级为 full-system energy 论文。

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`.
- Exact anchor and stable object/guarantee frozen: `YES`.
- One outcome-independent anchor question: official telemetry 的积分量/采样语义与 benchmark completion interval 如何对应？
- Co-defined `carrier/action/estimand` bundle: `carrier + estimand`.
- Named primary sources: `TWO`.
- Known direct fatal: `NO_KNOWN_FATAL`.
- Finite stop condition: 若公开 telemetry 无法达到声明的 decision boundary，则 `UNRESOLVED_BACKLOG` 或 resource/evidence ceiling；若 native protocol 已等价覆盖则 `EARLY_FATAL`。
- Requested model route: `TERRA_HIGH_ORDINARY`.
- Frozen nomination timestamp: 2026-08-24.
- Packet result: `UNRESOLVED_BACKLOG` — public NVML establishes GPU-energy observability but not the stated end-to-end full-cost boundary.
- Evidence locators / provenance: official docs only; no energy claim made.

## Disposition

- `RQ_BACKLOG__SCOPE_OR_ANSWERABILITY_UNCLEAR`
