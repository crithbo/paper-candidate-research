# Source91 S5 RQ candidates

## S5-91-RQ01

- Seed / anchor: SC91-01 / Julia Package Images documentation, current page, accessed 2026-08-15.
- Fixed object: package-specific Julia package image and precompile cache with unchanged module/type/method metadata and native code acceptance.
- Primary RQ: under fixed Julia package-image loading and method-dispatch semantics, does a target-native online bounded-recourse cache-variant constructor exist outside the documented cache selection, variant cap, and rejection union?
- Out of scope: changing Julia method semantics, using a different runtime/compiler, package choice, cache-cap tuning, or generic cache replacement.
- Earliest falsifier: current documentation shows that the only state decision is package-image selection/rejection, caching enablement, or a maximum number of precompile variants.
- Primary / transport-only fallback: https://docs.julialang.org/en/v1/devdocs/pkgimg/ ; https://docs.julialang.org/en/v1/manual/modules/.
- Pre-RQ closure: ORDINARY_CLOSURE / TERRA_HIGH_ORDINARY; selective depth OFF.
- Disposition: RQ_READY_FOR_ORDINARY_CLOSURE.
