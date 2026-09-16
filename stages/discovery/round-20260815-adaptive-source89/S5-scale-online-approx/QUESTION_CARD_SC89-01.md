# Discovery Question Card: SC89-01

## Identity and preflight

- Assignment / lane: DISCOVERY-S5-20260815-ADAPTIVE-SOURCE89-R40-ORDINARY-BREADTH-V1 / S5.
- Seed / RQ: SC89-01 / S5-89-RQ01.
- Exact public identity: Dune Caches documentation, current page accessed 2026-08-15.
- Carrier kind: IMPLEMENTATION_CARRIER_ONLY.
- Network-security exclusion: PASS.
- Frozen lookup surface: registry.yaml and plan.md read at assignment entry.
- Five-field relation: object RELATED_ONLY to held OCaml Flambda2 current-union item; action NONE; endpoint NONE; guarantee RELATED_ONLY; full-cost NONE.
- Mechanical identity disposition: RELATED_ONLY_DO_NOT_EXCLUDE. No-match is not a novelty or absence claim.

## Contract

- Exact object: Dune shared build cache for fixed hashed build rules and restorable build results.
- Same-object endpoint: exact cache-hit restoration with bounded local cache overhead.
- Proposed contribution: a target-native exact online bounded-recourse constructor.
- Initial full cost: cache bytes, build-result restore correctness, trim/maintenance CPU and I/O, hardlink/copy storage behavior, and rebuild work.
- Counterfactual: a non-policy Dune-native action could improve recourse without changing which rule result is restored.

## Current-source reality and raw gate

- Official locus: https://dune.readthedocs.io/en/latest/reference/caches.html.
- Current documented union: Dune hashes a build rule, skips execution on a matching shared-cache entry, and restores results. Cache configuration has enabled/disabled modes; storage may use hardlinks or copies; dune cache trim with a supplied size removes oldest unused entries to limit overhead.
- Current flags/configs checked: cache enablement, cache-storage-mode hardlink/copy, DUNE_CACHE and DUNE_CACHE_ROOT, and explicit cache trim size.
- Contrary evidence: the page expressly states cache trimming is needed for infeasible historical retention and defines its state-removal rule.
- Known direct fatal: FOUND. The concrete reachable decision is cache trimming/storage-mode configuration or generic cache maintenance, not a target-specific action with a distinct guarantee.
- Minimum falsifier: a current source/specification of a Dune-native whole-state action beyond cache trim/storage mode that preserves the same rule-hit semantics with a target-specific bounded-recourse/approximation guarantee.
- Finite closure: not initiated because the non-generic discriminator fails before raw admission.

## Front-end disposition

- RQ audit: RQ_COMPLETE.
- RAW_REQUIRED audit: INCOMPLETE; a non-generic atomic action is not named.
- Closure debt: NOT_APPLICABLE.
- Disposition: EXCLUDED_BEFORE_RAW.
- Reason: 官方文档将对象的受限存储操作明确为cache trim、storage mode和configuration；本轮不能把通用清理或阈值策略改名为 Dune 特定算法贡献。
- Eligible for C0: NO.
