# Source100 S5 RQ candidate

## S5-100-RQ01

- Exact anchor candidate: official PHP OPcache API/configuration documentation.
- Stable contract: fixed PHP source/compiled execution semantics, OPcache invalidation acceptance, and stock script cache visibility.
- Primary RQ: Can a PHP-native bounded-recourse OPcache state constructor replace reset-scale invalidation while preserving exact execution and invalidation semantics?
- In scope: target-native bytecode/cache-state transition and explicit recourse/full-cost guarantee. Out: reset timing, deployment policy, TTL tuning, generic cache eviction, or altered PHP execution semantics.
- Contribution hypothesis: METHOD_ALGORITHM/N2.
- Null hypothesis: current `opcache_invalidate`, `opcache_reset`, timestamp validation, and configuration union already expresses the complete legal transition; residual is a controller.
- Precommitted source route: official PHP manual for OPcache functions/configuration; fallback only for transport failure: official PHP source repository documentation.
- Disposition: RQ_READY_FOR_ORDINARY_CLOSURE.
