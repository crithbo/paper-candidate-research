# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S4-103-RQ02`
- Discovery lane / assignment: `DISCOVERY_S4` / `DISCOVERY-S4-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S4-103-03`; `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: a versioned public single-GPU runtime with native KV-cache allocation and admission actions.
- Exact public anchor and version/date: vLLM PagedAttention paper, arXiv:2309.06180 (2023), plus a current `vllm-project/vllm` source version to be frozen before action-gap claims.
- Stable object and immutable guarantee envelope: native serving memory/accounting and admission semantics; no external controller may substitute for the runtime action.
- Decision-relevant counterfactual consequence: capacity admission or configuration would change without changing model output or precision semantics.
- Single anchor question: what exact native state and action determine usable KV capacity, and which non-KV memory terms enter the same admission decision?
- Co-defined field bundle to close: `carrier / atomic action / estimand`.
- Contribution type hypothesis: `SYSTEM_ARCHITECTURE` or `COMPILER_TOOL` only if a target-specific residual survives.

## Candidate research questions

1. For one version-pinned single-GPU serving runtime, is there a native-state-aware capacity decision rule that improves a fixed SLO/capacity Pareto over the runtime's current comparable rule after weights, KV, workspace and admission semantics are fully accounted?
2. Optional same-object alternative B and the genuine ambiguity requiring it: `NONE`.
3. Optional same-object alternative C and the genuine ambiguity requiring it: `NONE`.

## Scope and answerability

- Selected or merged RQ: primary RQ above.
- Exact phenomenon, decision or estimand being asked about: native memory state to same-runtime admission/capacity decision.
- In scope: one GPU, one runtime version, public model/configuration, no model semantic change.
- Out of scope: a generic memory dashboard, multi-node cache system, or new external scheduler wrapper.
- Immutable semantic/quality boundary: same output protocol, model/precision, request semantics and full device/host cost boundary.
- Candidate methodology or evidence route: `PERFORMANCE` / `PARETO_APPROXIMATION`.
- Minimum public carrier/oracle route: current runtime source/configuration plus a small static memory-accounting witness.
- Earliest observation that could falsify the question's motivating premise: current native path already makes the same information-conditioned capacity/admission decision.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL` — current source must expose a finite native state/action witness.
- Interesting: `CLEAR` — capacity errors change single-GPU serving feasibility.
- Novelty threat: `HIGH` — PagedAttention and current memory planners are direct subtractor candidates.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL` — only a target-specific decision residual is relevant.

## Pre-evidence selection

- Selected for evidence lookup: `YES`.
- Selection reason in plain Chinese: 用 native action 和同对象 memory contract 先排除“统计内存”或外部调度包装。
- Alternative explanation or null hypothesis to test: 当前 runtime 已完整计入同一状态并作等价 admission；剩余只是 telemetry 或阈值调参。
- Precommitted primary evidence route: current official documentation plus current upstream source/flags.
- Precommitted fallback route for transport/resource failure only: tagged official release source archive and release documentation.
- Forbidden outcome-aware reformulation: 不把 native action 被吸收后的题目换成另一个 runtime 或泛化 cache scheduler。

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`.
- Exact anchor and stable object/guarantee frozen: `YES`.
- One outcome-independent anchor question: native admission/KV allocation action、输入状态和所有显存成本项分别是什么？
- Co-defined `carrier/action/estimand` bundle: `carrier + action + estimand`.
- Named primary sources: `TWO` — official current docs and current upstream source.
- Known direct fatal: `NO_KNOWN_FATAL`.
- Finite stop condition: current native action 覆盖同一状态与 full-cost decision 则 `EARLY_FATAL`；否则形成 typed RQ。
- Requested model route: `TERRA_HIGH_ORDINARY`.
- Frozen nomination timestamp: 2026-08-24.
- Packet result: `UNRESOLVED_BACKLOG` — current source documents a close native admission/reservation action, but an immutable current commit and a distinct residual were not closed.
- Evidence locators / provenance: arXiv:2309.06180 is locator only; no current-absence claim.

## Disposition

- `RQ_BACKLOG__SCOPE_OR_ANSWERABILITY_UNCLEAR`
