# S4-DF-RQ-01 — Research Question Candidate

## Identity and pre-evidence commitment

- Assignment / lane: `DISCOVERY-S4-20260822-DUALFORK-RUNTIME-REV0` / `S4_OBJECTIVE_CONSTRAINT`.
- Source seeds: `S4-DF-02`, `S4-DF-06`.
- Tentative object: one branch tree whose node state pairs a model KV continuation with a resumable agent sandbox/checkpoint.
- Immutable boundary: identical agent branch semantics, fixed model/inference configuration, fixed sandbox semantics, and a full-cost budget including GPU/CPU/I/O/transfers and abandoned branches.
- Precommitted anchor sequence: (1) frozen `OpenHands/software-agent-sdk@ddac55697c5d15cf8a34495b5ed6d46c86db092a`; (2) one official inference engine source defining KV lifecycle; (3) one official sandbox/checkpoint source defining persisted branch state; (4) one public branching-agent carrier. Identity choices are frozen before comparing outcomes.
- Single anchor question: do the two selected implementations expose a common, semantic branch identity through which a legal paired residency transition can be defined?

## Primary RQ

> Under fixed branch semantics and HBM/host-memory/storage/GPU-time budgets, does a target-specific online algorithm that jointly chooses retain, park, resume, evict, commit, or abort for the paired KV and sandbox state of each branch provide a separation from the same-information deployable union of independent per-plane policies, rather than restating generic multi-resource tree caching/knapsack?

## Scope and answerability

- In scope: branch-state lifecycle, paired-transition legality, full end-to-end resource cost, and an online/approximation or equivalence guarantee.
- Out of scope: causal replay, reward learning, generic scheduler/controller tuning, agent policy/tool-choice optimization, and any stopped coupled-agent family.
- Contribution hypothesis: `METHOD_ALGORITHM` / `SYSTEM_ARCHITECTURE`, `N2` cross-plane branch-runtime algorithm.
- Minimum carrier: a public versioned agent benchmark/workload which actually forks multiple same-root branches and keeps tool/workspace state.
- Earliest falsifier: either no official pair of implementations preserves both planes under a common branch identity, or a same-information independent union can exactly reproduce every legal paired transition.

## FINER-lite

- Feasible: `CONDITIONAL` — source-only identity and lifecycle closure is bounded; no benchmark run is required here.
- Interesting: `CLEAR` — a separation would change branch admission/residency decisions under end-to-end resource caps.
- Novelty threat: `HIGH` — mandatory contrary routes are Shepherd, Crab, ForkKV, Tree-RL, current vLLM/SGLang lifecycle mechanisms, sandbox pooling/scheduling and generic multi-resource tree caching/knapsack.
- Ethical/scope fit: `PASS` — ordinary runtime research; no network-security object.
- Relevant: `CONDITIONAL` — only if a natural carrier and non-generic joint action remain observable.

## Frozen source roles and routes

| Role | Primary source route | Fallback only for transport failure | Field to close |
|---|---|---|---|
| ANCHOR | OpenHands official source at the frozen SDK commit | official repository commit view | agent branch/sandbox identity |
| CURRENT-KV | official vLLM or SGLang current source/docs, chosen before its contents are interpreted | the other official project only if primary transport fails | KV lifecycle/actions/config |
| CURRENT-SANDBOX | official OpenHands sandbox/checkpoint source matching the SDK object | official project documentation for the same implementation | sandbox persistence/restore/actions |
| CARRIER | official benchmark/workload repository or original primary paper with a versioned branch trace | one deterministically named public artifact from the same project | simultaneous branch observability |
| CONTRARY | original papers/repos for Shepherd, Crab, ForkKV and Tree-RL plus a generic multi-resource kernel source | none — unresolved if unavailable | direct absorption/generic collapse |

- Transport fallback is not a scientific fallback and cannot change the RQ/object/guarantee.
- Closure mode: `ORDINARY_CLOSURE`; no selective-depth nomination.
- Known direct fatal before lookup: `NO_KNOWN_FATAL`.
- Finite stop condition: stop at direct paired-action absorption, a demonstrably generic-kernel-only formulation, missing common branch identity, or exhaustion/blocking of the bounded official routes.

## Pre-evidence disposition

`RQ_READY_FOR_ORDINARY_CLOSURE` — this is not a locator, raw item, novelty claim or Stage 0 recommendation.
