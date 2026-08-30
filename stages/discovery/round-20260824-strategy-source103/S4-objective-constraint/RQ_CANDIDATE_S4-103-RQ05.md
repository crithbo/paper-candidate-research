# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S4-103-RQ05`
- Discovery lane / assignment: `DISCOVERY_S4` / `DISCOVERY-S4-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S4-103-11`; `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: a public serving runtime with native prefix/KV-cache reuse and online scheduling semantics.
- Exact public anchor and version/date: SGLang public `bench_serving` documentation on `main`, locator observed 2026-08-24; current cache/action source locus must be frozen before action-gap claims.
- Stable object and immutable guarantee envelope: native cache reuse and scheduler action for one runtime; output and request semantics cannot change.
- Decision-relevant counterfactual consequence: cache/admission policy changes the feasible SLO/capacity Pareto for a natural or canonical session workload.
- Single anchor question: what native cache-residency/action state and public workload knobs determine reuse, occupancy and request completion?
- Co-defined field bundle to close: `carrier / atomic action / estimand`.
- Contribution type hypothesis: `SYSTEM_ARCHITECTURE` or `METHOD_ALGORITHM` only with a non-generic native residual.

## Candidate research questions

1. Under a frozen public session/prefix workload and one native runtime, can an occupancy–deadline-aware cache action improve a same-output SLO/capacity Pareto beyond the current native cache/scheduler policy after reuse benefit and residency cost are both charged?
2. Optional same-object alternative B and the genuine ambiguity requiring it: `NONE`.
3. Optional same-object alternative C and the genuine ambiguity requiring it: `NONE`.

## Scope and answerability

- Selected or merged RQ: primary RQ above.
- Exact phenomenon, decision or estimand being asked about: native cache action and its full-cost capacity/deadline consequence.
- In scope: one public runtime, one public cache-bearing workload, finite action/configuration set.
- Out of scope: cross-runtime wrapper, generic cache policy, private prompt corpus, or multi-node routing.
- Immutable semantic/quality boundary: same model, output contract, request/session semantics, cache-reuse eligibility and measurement denominator.
- Candidate methodology or evidence route: `PERFORMANCE` / `PARETO_APPROXIMATION`.
- Minimum public carrier/oracle route: current native action source/flags plus a public prefix/session workload and small witness.
- Earliest observation that could falsify the question's motivating premise: native policy already consumes equivalent occupancy/deadline information to express the candidate action.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL` — native cache interface and public carrier must be accessible.
- Interesting: `CLEAR` — cache residency alters single-GPU request feasibility.
- Novelty threat: `HIGH` — prefix caching/scheduling literature and current implementation are direct threats.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL` — only if a same-object action survives, not a general cache tradeoff.

## Pre-evidence selection

- Selected for evidence lookup: `YES`.
- Selection reason in plain Chinese: 这是 S4 的目标/容量约束方向，但先以 current native action 检查避免包装或通用 online scheduling。
- Alternative explanation or null hypothesis to test: 当前 runtime 已有同一信息条件下的 cache/admission action，或公共 workload 无法给出自然/canonical carrier。
- Precommitted primary evidence route: current official cache docs and source/flags; then one public workload route.
- Precommitted fallback route for transport/resource failure only: tagged official release and project paper/docs.
- Forbidden outcome-aware reformulation: native action 被覆盖后，不借换 runtime、换 workload 或改保证保留主题。

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`.
- Exact anchor and stable object/guarantee frozen: `YES`.
- One outcome-independent anchor question: native cache action、可见状态、配置入口及公开 carrier 的最低 requirements 是什么？
- Co-defined `carrier/action/estimand` bundle: `carrier + action + estimand`.
- Named primary sources: `TWO`.
- Known direct fatal: `NO_KNOWN_FATAL`.
- Finite stop condition: current source 完整表达同一信息/action/full-cost boundary 则 `EARLY_FATAL`; 否则形成 typed RQ。
- Requested model route: `TERRA_HIGH_ORDINARY`.
- Frozen nomination timestamp: 2026-08-24.
- Packet result: `UNRESOLVED_BACKLOG` — current automatic-prefix-cache and scheduler surfaces are close subtractors, but commit pinning and a distinct native action were not closed.
- Evidence locators / provenance: official documentation locator only; no absence claim.

## Disposition

- `RQ_BACKLOG__SCOPE_OR_ANSWERABILITY_UNCLEAR`
