# Discovery Question Card: SC88-01

## Identity

- Card ID: SC88-01
- Assignment / lane: DISCOVERY-S5-20260815-ADAPTIVE-SOURCE88-R40-ORDINARY-BREADTH-V1 / S5
- Source seed / RQ: SC88-01 / S5-88-RQ01
- Exact public identity: Bazel Remote Caching documentation, current public page.
- Project / version / date: Bazel documentation page offering Nightly through 8.6 selectors; accessed 2026-08-15.
- Carrier kind: IMPLEMENTATION_CARRIER_ONLY
- Network-security exclusion: PASS

## Global canonical identity preflight

- Lookup surface: registry.yaml and plan.md, frozen at assignment entry.
- Five-field relation to prior work: object RELATED_ONLY to Source70 Bazel Skyframe/jar update; action NONE; endpoint NONE; guarantee RELATED_ONLY; full-cost NONE.
- Held or terminal identity match: NONE.
- Frozen direct current collision hit: YES for the narrow disk-cache-GC/size action.
- Mechanical disposition: RELATED_ONLY_DO_NOT_EXCLUDE. This no-match for the proposed family is not a novelty claim.

## Research contract

- Exact object and immutable contract: fixed Bazel action metadata and the Action Cache/CAS mapping for a reproducible build; neither action keys nor output semantics may change.
- Same-object problem: bounded local disk-state retention for exact reusable action results.
- Claim endpoint: a target-native online bounded-recourse exact-reuse/storage guarantee.
- Counterfactual consequence: if such an action existed outside the union, identical actions could retain correct reuse with a formal bounded state-transition cost.
- Non-generic discriminator: the action would have to alter Bazel-native action/CAS state, not merely choose a deletion threshold.
- Initial full-cost boundary: action-result reuse correctness, cache bytes, maintenance CPU/I/O, hit latency, and any rebuilding/upload work.

## RAW_REQUIRED evidence minimum

- Opportunity anchor: official Bazel Remote Caching page defines actions by inputs, output names, command line and environment, and describes Action Cache/CAS result reuse.
- Current official locus: https://bazel.build/remote/caching (current page, accessed 2026-08-15); command-line reference at https://bazel.build/reference/command-line-reference.
- Current-union observation: the page exposes disk cache, disable flag, and since Bazel 7.4 maximum-size and maximum-age disk-cache GC controls. The command-line reference exposes remote-cache configuration and asynchronous upload/compression options.
- Strongest skeptic: any residual is generic cache eviction/compaction or a selection of the documented size/age controls, not a target-specific contribution.
- Known direct-fatal check: FOUND. The only concrete action reachable from the seed is cache-size/age garbage collection; no non-generic target-native action was specified.

## Cheapest decisive test

- Minimum falsifier: a current first-party description of a whole-action transformation, beyond size/age GC, that preserves the fixed Action Cache/CAS semantics and supplies a target-specific bounded-recourse or approximation guarantee.
- Finite closure route: not started, because the question fails the non-generic discriminator before raw admission.
- Stop/narrow condition: if the proposed intervention remains eviction/GC policy or cache backend management, do not enter raw.

## Front-end disposition

- RQ audit: RQ_COMPLETE.
- RAW_REQUIRED audit: INCOMPLETE because the proposed atomic action is a generic cache-maintenance policy rather than a target-native discriminated action.
- Closure debt: NOT_APPLICABLE.
- Identity relation: FRESH only in the limited mechanical sense; no novelty claim.
- Disposition: EXCLUDED_BEFORE_RAW.
- Reason: 当前官方文档已把可执行路径落在 disk-cache 的 size/age GC 与 backend maintenance；在不改变对象或保证的前提下，本轮没有命名出超出该机制、且非通用的原子动作。因此不把它包装成 raw 或 brief。
- Eligible for C0: NO.
