# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S4-103-RQ04`
- Discovery lane / assignment: `DISCOVERY_S4` / `DISCOVERY-S4-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S4-103-09`; `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: public LLM-serving performance/simulation/cost model used to select a runtime configuration.
- Exact public anchor and version/date: DistServe, arXiv:2401.09670 (2024), is the anchor for goodput/SLO decision semantics; a public versioned model/artifact must be selected before raw.
- Stable object and immutable guarantee envelope: one public predictor and one finite same-object configuration-choice task; prediction accuracy alone is not the endpoint.
- Decision-relevant counterfactual consequence: whether a model-guided serving configuration should be selected.
- Single anchor question: does the selected public model provide a versioned input/output contract that can score the regret or SLO/cost consequence of configuration selection?
- Co-defined field bundle to close: `carrier / estimand / action`.
- Contribution type hypothesis: `MEASUREMENT_CHARACTERIZATION` or `SYSTEM_ARCHITECTURE`.

## Candidate research questions

1. For a versioned public single-GPU serving performance model and finite native configuration set, can a decision-calibrated estimator improve configuration choice under fixed TTFT/TPOT/capacity/full-cost constraints beyond the model's current selection rule?
2. Optional same-object alternative B and the genuine ambiguity requiring it: `NONE`.
3. Optional same-object alternative C and the genuine ambiguity requiring it: `NONE`.

## Scope and answerability

- Selected or merged RQ: primary RQ above.
- Exact phenomenon, decision or estimand being asked about: configuration-selection regret, constraint violation and full-cost outcome—not generic prediction error.
- In scope: public model/artifact, single-GPU configuration candidates, one frozen measurement contract.
- Out of scope: multi-GPU placement, unvalidated simulator claims, or a generic learned auto-tuner.
- Immutable semantic/quality boundary: same model/runtime/workload/configuration semantics between estimator and comparator.
- Candidate methodology or evidence route: `MEASUREMENT_MECHANISM` / `PARETO_APPROXIMATION`.
- Minimum public carrier/oracle route: versioned model input/output plus finite candidate configurations and a native metric oracle.
- Earliest observation that could falsify the question's motivating premise: existing public model already optimizes the same decision under the same complete constraints.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL` — depends on an executable or statically inspectable public model contract.
- Interesting: `CLEAR` — deployment decision, not fit score, is the endpoint.
- Novelty threat: `HIGH` — cost/roofline and simulator work are explicit subtractors.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL` — only a finite same-object choice path is relevant.

## Pre-evidence selection

- Selected for evidence lookup: `YES`.
- Selection reason in plain Chinese: 以“选择错误/约束违反”替代相关性，测试 performance model 是否有独立可发表的决策残余。
- Alternative explanation or null hypothesis to test: 现有 model 的 input/action 已覆盖同一选择，或无可访问 native oracle。
- Precommitted primary evidence route: primary paper/artifact plus current official source/model interface.
- Precommitted fallback route for transport/resource failure only: named public artifact release and paper supplement.
- Forbidden outcome-aware reformulation: 若无 same-object selection residual，不改写为泛化的 prediction benchmark。

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`.
- Exact anchor and stable object/guarantee frozen: `YES`.
- One outcome-independent anchor question: public model的 prediction、action、constraints 与 oracle 分别是什么？
- Co-defined `carrier/action/estimand` bundle: `carrier + action + estimand`.
- Named primary sources: `TWO`.
- Known direct fatal: `NO_KNOWN_FATAL`.
- Finite stop condition: 同一模型已经选择同一动作并闭合 full-cost/constraints 则 `EARLY_FATAL`；否则 `CLOSED_TO_TYPED_RQ`。
- Requested model route: `TERRA_HIGH_ORDINARY`.
- Frozen nomination timestamp: 2026-08-24.
- Packet result: `UNRESOLVED_BACKLOG` — Vidur/Vidur-Search is a strong configuration-search subtractor; no same-object residual was frozen.
- Evidence locators / provenance: arXiv:2401.09670 anchors terminology only, not a current-collision conclusion.

## Disposition

- `RQ_BACKLOG__SCOPE_OR_ANSWERABILITY_UNCLEAR`
