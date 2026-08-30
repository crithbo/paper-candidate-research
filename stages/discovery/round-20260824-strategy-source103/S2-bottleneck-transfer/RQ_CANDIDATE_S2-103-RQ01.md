# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S2-103-RQ01`
- Discovery lane / assignment: `DISCOVERY_S2` / `DISCOVERY-S2-20260824-SOURCE103-LLM-VLA-STRATEGY-V1`
- Divergence seed ID/path: `S2-103-01` / `DISCOVERY_DIVERGENCE_SEED_POOL.md`
- Tentative public object or source origin: DeepSeek-style NDP stage execution plan and its legal cross-stage tensor layout/remapping boundary.
- Exact public anchor and version/date: `https://github.com/uSFrances/ndp-sim.git`, commit `e299b2804448242d1589b3e58ed7c5a9a5eca09f`.
- Stable object and immutable guarantee envelope: same public execution-plan semantics, tensor values/precision, address legality and declared producer–consumer data dependencies; no assumed RTL or server result.
- Decision-relevant counterfactual consequence: a backend planner either materializes/reuses or changes a legal layout boundary for a fixed cross-stage dependency.
- Single anchor question: does the anchored public carrier expose a complete, legal, observable cross-stage layout/remapping decision with both reuse and transport cost terms?
- Co-defined field bundle to close: `carrier / atomic action / estimand`.
- Contribution type hypothesis: `COMPILER_TOOL`.

## Candidate research questions

1. Primary RQ: For one frozen public DeepSeek-style stage plan, can a compiler choose a legal cross-stage layout/materialization boundary jointly with producer-output reuse so as to lower charged transport, remapping and metadata cost under unchanged tensor semantics compared with a current stage-local baseline?
2. Optional same-object alternative B and the genuine ambiguity requiring it: none.
3. Optional same-object alternative C and the genuine ambiguity requiring it: none.

## Scope and answerability

- Selected or merged RQ: primary RQ.
- Exact phenomenon, decision or estimand being asked about: whether a non-separable cross-stage representation decision changes the complete local planner cost for a fixed public stage-plan carrier.
- In scope: one public plan/configuration family, compiler/backend representation, legal allocation/remapping and full-cost accounting.
- Out of scope: unmeasured NDP hardware PPA, repository/RTL modification, claimed end-to-end server performance, new packing format.
- Immutable semantic/quality boundary: identical operator outputs and declared address/remapping legality.
- Candidate methodology or evidence route: public source/plan semantics plus a finite static/executable planner-model route if later authorized.
- Minimum public carrier/oracle route: version-pinned upstream plan/configuration and its current source/documentation.
- Earliest observation that could falsify the question's motivating premise: the public carrier lacks a cross-stage legal decision, or the current baseline already expresses the same full-cost construction.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL` — depends on public source/plan closure and a finite CPU/single-GPU-equivalent evidence route.
- Interesting: `CONDITIONAL` — matters only if local stage optimization demonstrably leaves a decision-relevant downstream cost.
- Novelty threat: `HIGH` — compiler scheduling/layout and current native union must be checked early.
- Ethical/scope fit: `PASS`.
- Relevant: `CONDITIONAL` — conclusion would only guide a legal representation boundary under the specified carrier.

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Selection reason in plain Chinese: 与 S2 的“瓶颈转移”视角及公开 NDP/编译器资源对齐，同时把组内资料严格限制为 locator，不把其未验证的运行结果当证据。
- Alternative explanation or null hypothesis to test: stage-local or existing remapping mechanisms already express the same action, leaving only a generic layout policy.
- Precommitted primary evidence route: anchored upstream source/documentation at the frozen commit, then current public compiler/runtime comparator and one contrary generic layout mechanism.
- Precommitted fallback route for transport/resource failure only: archived public repository mirror or published specification containing the same pinned plan semantics.
- Forbidden outcome-aware reformulation: changing to a different model, adding server/RTL evidence, or replacing the action with generic graph layout after collision evidence.

## Pre-RQ closure nomination

- Nomination: `PRE_RQ_CLOSURE_NOMINATED`
- Exact anchor and stable object/guarantee frozen: `YES`
- One outcome-independent anchor question: does the public carrier jointly define legal cross-stage layout/remapping, reuse and transport semantics?
- Co-defined `carrier/action/estimand` bundle: `carrier/action/estimand`
- Named primary sources: `TWO` — pinned upstream source and its corresponding public plan/configuration documentation.
- Known direct fatal: `NO_KNOWN_FATAL`
- Finite stop condition: one or both sources show no cross-stage legal choice, or show it is already fully expressed by the current native mechanism.
- Requested model route: `TERRA_HIGH_ORDINARY`
- Frozen nomination timestamp: `2026-08-24T02:30:00+08:00`
- Packet result: `UNRESOLVED_BACKLOG`
- Evidence locators / provenance: the frozen GitHub commit/repository and raw path were queried through the public retrieval surface; the surface returned internal/non-retryable errors and no independently readable primary artifact.

## Disposition

`RQ_BACKLOG__SOURCE_CLOSURE_BLOCKED`
