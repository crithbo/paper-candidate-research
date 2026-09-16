# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S5-103-RQ02`
- Discovery lane / assignment: `DISCOVERY_S5` / `DISCOVERY-S5-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S5-103-02` / `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: public heterogeneous quantized inference graph with legal CPU/accelerator cuts.
- Exact public anchor and version/date: ExecuTorch heterogeneous backend path; commit/date to be frozen from current primary source.
- Stable object and immutable guarantee envelope: fixed graph, fixed quantization and fixed native fallback semantics.
- Decision-relevant counterfactual consequence: a runtime maintains a different legal backend cut after one availability/capacity change.
- Single anchor question: Does one public carrier expose multiple legal cut states whose update differs from generic device scheduling?
- Co-defined field bundle to close: `carrier / atomic action / estimand`.
- Contribution type hypothesis: `METHOD_ALGORITHM`

## Candidate research questions

1. For one fixed public heterogeneous quantized graph, can a dynamic Pareto-frontier data structure maintain the native set of legal backend cuts under local capacity updates with lower full control and transfer cost than recomputing the same cut set?

## Scope and answerability

- In scope: fixed legal cuts, capacity update, control/data-transfer cost, same fallback semantics.
- Out of scope: private NPU placement and cross-runtime composition.
- Candidate methodology or evidence route: `COMPLEXITY_THEORY` and a public runtime witness.
- Minimum public carrier/oracle route: source-defined partition representation and legality checker.
- Earliest falsifier: only one cut is legal, or native runtime does not own the choice.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL`.
- Interesting: `CONDITIONAL`.
- Novelty threat: `HIGH` — dynamic graph/placement algorithms.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL`.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Selection reason in plain Chinese: 该题把异构 fallback 固定为同一 runtime 的合法 cut 维护，而非把设备选择改名。
- Alternative explanation or null hypothesis to test: 动作只是普通动态最短路或已有 partition cache。
- Precommitted primary evidence route: official ExecuTorch backend/delegation docs and current source.
- Precommitted fallback route for transport/resource failure only: official version tag archive.
- Forbidden outcome-aware reformulation: 不得扩大到 generic heterogeneous scheduler。

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`
- Exact anchor and stable object/guarantee frozen: `NO`.
- One outcome-independent anchor question: native runtime represents and updates legal cuts how?
- Co-defined `carrier/action/estimand` bundle: `carrier / action / full cost`.
- Named primary sources: `TWO`.
- Known direct fatal: `NO_KNOWN_FATAL`
- Finite stop condition: no source-defined dynamic cut action, direct current coverage, or fixed action/oracle.
- Requested model route: `TERRA_HIGH_ORDINARY`
- Packet result: `NOT_RUN`

## Disposition

- `PRE_RQ_CLOSURE_NOMINATED`

