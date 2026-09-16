# Source89 S5 research-question candidates

## S5-89-RQ01

- Seed: SC89-01.
- Public anchor: Dune Caches, current Dune documentation, accessed 2026-08-15.
- Tentative object: Dune shared build cache mapping a hashed build rule to restorable results.
- Immutable guarantee: for a cache hit, Dune skips rule execution and restores the same cached build result; no rule/dependency/output semantics may be changed.
- Contribution hypothesis: SYSTEM_ARCHITECTURE / N2.

### Primary RQ

For fixed Dune rule-hash cache-hit and restore semantics, is there a non-policy, target-native online bounded-recourse cache-maintenance constructor with an exact reuse/storage guarantee outside the current cache configuration and trim union?

### Scope and pre-evidence selection

- In scope: shared Dune build-cache entries and their storage/restore semantics.
- Out of scope: changing rule hashes, build rules, output semantics, remote service design, generic cache replacement, and cache-size threshold tuning.
- Earliest falsifier: the official current cache mechanism already identifies trimming as removal of old unused entries under a supplied size, leaving no distinct target-native action.
- Selected for lookup: YES, before any source result.
- Primary route: https://dune.readthedocs.io/en/latest/reference/caches.html
- Transport-only fallback: https://dune.readthedocs.io/en/stable/reference/config/cache_storage_mode.html
- Nomination: ORDINARY_CLOSURE / TERRA_HIGH_ORDINARY; selective depth OFF.

### Disposition

RQ_READY_FOR_ORDINARY_CLOSURE
