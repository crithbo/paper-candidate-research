# Discovery Question Card: SC91-01

## Identity and contract

- Exact identity: Julia Package Images official documentation, current page; accessed 2026-08-15.
- Carrier: IMPLEMENTATION_CARRIER_ONLY. Network-security exclusion: PASS.
- Historical preflight: object/action/endpoint/full-cost NONE; semantic guarantee RELATED_ONLY to other compiler-cache families. Mechanical disposition: NO_MATCH, which is not novelty/current-absence evidence.
- Same object: a fixed Julia package's precompile/package-image cache and stock cache selection/rejection semantics.
- Immutable guarantee: accepted package images preserve package-defined methods/types/data and only cache native compiled output under compatible flags; no method dispatch or output semantics may change.
- Full cost: cache variant bytes, cache creation/linking, rejection/regeneration, memory allocation, native load time, and exact method/code acceptance.

## Current-source reality and raw gate

- Current source: https://docs.julialang.org/en/v1/devdocs/pkgimg/ and https://docs.julialang.org/en/v1/manual/modules/.
- Current union: package images are generated per package; the runtime provides pkgimage enable/disable/existing modes, a maximum number of precompile variants, CPU-target multi-versioning, and flag-specific compatibility/rejection. Module loading documents automatic precompile cache creation/reuse and flags for compiled-module use.
- Flags checked: --pkgimages yes/no/existing, --compiled-modules yes/no/existing, JULIA_MAX_NUM_PRECOMPILE_FILES, JULIA_CPU_TARGET, -g/--debug-info, --check-bounds, --inline, and -O/--optimize compatibility.
- Contrary: the current union already comprises selection, variant bound, multi-versioning, and exact incompatible-flag rejection.
- Known direct fatal: FOUND for the only concrete action from the seed: it is variant-cap/selection policy or generic cache retention, not a new target-native atomic action with a distinct guarantee.
- Minimum falsifier: a current source/specification of an additional whole package-image state action, outside this union, that retains the same cache acceptance semantics and supplies a target-specific bounded-recourse or approximation guarantee.

## Disposition

- RQ audit: RQ_COMPLETE; RAW_REQUIRED audit: INCOMPLETE.
- Closure debt: NOT_APPLICABLE; no valid non-generic action exists to carry into raw.
- Disposition: EXCLUDED_BEFORE_RAW.
- Reason: Julia 当前文档已细化 package-image 的选择、拒绝、多版本和变体上限。没有证据把普通 variant 保留/淘汰策略提升为同对象的 N2。
- Eligible for C0: NO.
