# Discovery Research Question Candidate

## Identity

- RQ candidate ID: `S6-02-RQ01`
- Discovery lane / assignment: `DISCOVERY_S6_DIRECT_ALGORITHM_SOFTWARE` / `DMR-V1-PSHADOW-CYCLE-02-S6`
- Divergence seed ID/path: `S6-02-SEED-01` / `CANONICAL_SEED_POOL.md`
- Tentative public object or source origin: `EricLBuehler/mistral.rs` current-main paged-attention/prefix-cache scheduler source
- Exact public anchor and version/date: current-main repository; version/commit to be frozen only from an official source call
- Stable object and immutable guarantee envelope: live paged-attention/prefix-cache state for a single-GPU small multimodal model; preserve cache content and decode semantics; exclude eviction-policy, model, or quality-contract changes.
- Decision-relevant counterfactual consequence: choose whether/when/how to relocate live cache pages based on live block topology.
- Single anchor question: Does current `mistral.rs` define a same-semantics native page-compaction action, and if so does any finite non-generic residual remain beyond eviction/admission or generic allocation?
- Co-defined field bundle to close: `carrier / atomic action / estimand`
- Contribution type hypothesis: `COMPILER_TOOL`

## Candidate research questions

1. Primary RQ: For current `mistral.rs` multimodal prefix caching with fixed eviction and decoding semantics, can a topology-aware live-page compaction decision be defined as a non-generic native action that changes fragmentation/full-cost outcomes?
2. Optional same-object alternative B: none.
3. Optional same-object alternative C: none.

## Scope and answerability

- Selected or merged RQ: primary RQ only.
- In scope: current official scheduler/page/cache interfaces and a public carrier compatible with the frozen single-GPU route.
- Out of scope: modifying model quality, cache admission/eviction objective, synthetic-only allocator benchmarks, implementation or experiments.
- Immutable semantic/quality boundary: cache content and decoding semantics unchanged.
- Candidate methodology or evidence route: current-source closure followed, only if admitted, by a finite static action/estimator audit.
- Earliest observation that could falsify the motivating premise: current native scheduler already expresses compaction/relocation, or no finite public same-object carrier/action bundle exists.

## FINER-lite scheduling assessment

- Feasible: `CONDITIONAL` — depends on current official source and public carrier closure.
- Interesting: `CONDITIONAL` — only if an action changes the specified native decision.
- Novelty threat: `HIGH` — current-union absorption is the first check.
- Ethical/scope fit: `PASS`
- Relevant: `CONDITIONAL`

## Pre-evidence selection

- Selected for evidence lookup: `YES`
- Selection reason in plain Chinese: 冻结 context 指定的 direct-algorithm/software 路线，先检查 current native action 是否已吸收该设想。
- Alternative explanation or null hypothesis to test: 当前实现已有等价 relocation/compaction，或问题仅是通用 allocator/eviction 调参。
- Precommitted primary evidence route: official `mistral.rs` repository/documentation current scheduler and page-cache source.
- Precommitted fallback route for transport/resource failure only: official repository raw/source view or primary project documentation.
- Forbidden outcome-aware reformulation: `YES`

## Pre-RQ closure nomination

- Nomination: `ORDINARY_CLOSURE`
- Exact anchor and stable object/guarantee frozen: `YES`
- One outcome-independent anchor question: `YES`
- Co-defined `carrier/action/estimand` bundle: `YES`
- Named primary sources: `ONE`
- Known direct fatal: `NO_KNOWN_FATAL`
- Finite stop condition: current native action absorption, generic-only residual, or no finite public carrier/action closure.
- Requested model route: `NONE`
- Packet result: `NOT_RUN`

## Disposition

- `RQ_READY_FOR_ORDINARY_CLOSURE`
- Pre-evidence freeze complete before the first official-source call.
