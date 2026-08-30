# DISCOVERY_QUESTION_CARD — SC100-01

- Exact identity: PHP_OPCACHE_EXACT_MEMORY_FILE_CACHE__JOINT_VERSIONED_INVALIDATION_RECOURSE.
- Anchor/current locus: official PHP OPcache function and configuration manuals, accessed 2026-08-15.
- Carrier: IMPLEMENTATION_CARRIER_ONLY. A versioned public PHP deployment/source history is bounded later debt.
- Same-object contract: fixed PHP script execution result, source-version visibility, OPcache in-memory/file-cache acceptance, and stock disabled/restart semantics.
- Problem: the official API states that `opcache_invalidate` invalidates only the in-memory cache; `opcache_reset` resets only in-memory cache. The official configuration separately supports a second-level file cache, its consistency checks, timestamp validation, update-protection and restart thresholds.
- Proposed insight: a PHP-native joint memory/file-cache generation transition may give a bounded-recourse invalidation/reclamation guarantee while retaining exact script execution and stock cache-validity semantics. It must update both semantic tiers as one action, not select reset times or eviction thresholds.
- Contribution: METHOD_ALGORITHM / N2. Endpoint: target-native joint transition plus explicit recourse/full-cost guarantee.
- Current union: compile-file; script invalidation with force/timestamp behavior; reset; timestamp/revalidate controls; in-memory status; file-cache only/consistency/fallback; restart-related configuration.
- Strongest skeptic: current source may already coordinate both tiers internally, or any joint transition may be a generic cache invalidation/compaction scheme rather than a PHP-specific action.
- Full-cost: compiled bytecode correctness, in-memory/file-cache bytes, stale-version residency, lock/restart work, update latency, request execution cost, timestamp/checksum validation, CPU/RSS/temp and cross-process semantics.
- Minimum falsifier: source-level union already exposes atomic cross-tier generation/invalidation with same output semantics, or a two-tier version transition necessarily changes script/version visibility.

| Debt | Status | Finite route |
|---|---|---|
| Current source + all flags | OPEN_BOUNDED | One official php/php-src released tag: Zend Accelerator invalidation/reset/file-cache/restart paths and documented defaults/non-defaults. |
| Small stock oracle witness | OPEN_BOUNDED | One script/version across memory/file caches, checking stock execution and status APIs. |
| Natural carrier | OPEN_BOUNDED | Public versioned PHP application deployment history. |
| Current collision/genealogy | OPEN_BOUNDED | One bounded primary mechanism/current source route. |

- Identity preflight: no exact/terminal match on allowed registry surface; no-match is not novelty evidence.
- RAW_REQUIRED audit: COMPLETE. Disposition: EVIDENCE_QUALIFIED_RAW.
- Claim ceiling: raw mechanism hypothesis only; no novelty/current-absence/correctness/performance/Q2/Stage0 claim.
