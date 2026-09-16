# Source closure — PHP OPcache

## Scope and disposition

Assignment: `SOURCE-CLOSURE-RESUME-BATCH02-ITEM02-SOURCE100-S5-PHP-OPCACHE-V1`.

Disposition: `STRUCTURAL_FATAL__DIRECT_CURRENT_UNION_CHANGED_CACHE_ENDPOINT_OR_GENERIC_CACHE_CONTROLLER__RETURN_TO_MAINLINE`.

This is a prebrief source-closure result only.  It does not make a clean-brief, Q2, candidate, PASS, STOP, or stage-state decision.

## Fixed object and bounded acquisition

- Frozen project/version/pin: `php/php-src`, `PHP-8.4.0`, `315fef2c72d172f4f81420e8f64ab2f3cd9e55b1`.
- Frozen endpoint: unchanged request result, cache validity/visibility, cross-process behavior, fallback and restart semantics under one fixed script update.
- All 10 official, precommitted calls completed.  Retained data totals 822,111 bytes, below the 33,554,432-byte envelope.  No PHP execution, cache population, build, benchmark, external search, clone, or substitute route was used.

## Direct current union

The exact in-memory/file-cache lifecycle is already represented by native current actions.

1. `zend_accel_invalidate()` first invalidates the file-cache entry when enabled, finds the shared-memory persistent script, and discards it under the timestamp/force condition (`04-ZendAccelerator.c`, lines 1394–1427).
2. Normal lookup validates a shared-memory script by timestamp, then loads from the second-level file cache if absent/invalid.  On memory exhaustion or pending restart, it falls back to the file cache or original compiler (`04-ZendAccelerator.c`, lines 2125–2155).
3. The file-cache implementation serializes entries, uses exclusive locks on creation, validates timestamp and optional checksum on load, unlinks invalid/corrupt entries, and exposes `zend_file_cache_invalidate()` (`07-zend_file_cache.c`, lines 1089–1171, 1812–2008).
4. Restart/reclamation is coordinated through shared state and process locks, with pending/in-progress states, forced timeout, and a second check under the allocator lock before cleanup (`04-ZendAccelerator.c`, lines 241–326, 2683–2710, 3422–3444).
5. The official configuration surface fixes the relevant controls: timestamp/revalidation, file cache, file-cache-only mode, checksum validation, file-cache fallback, and forced restart timeout (`10-opcache-configuration.html`, lines 993–1028, 1375–1384, 1543–1590).

The deterministic stock test `file_cache_error.phpt` additionally fixes a failure/fallback carrier: a file-cache write error must leave script execution correct and emit the expected warning.

## Structural consequence

The proposed family is `PHP_OPCACHE_EXACT_MEMORY_FILE_CACHE__JOINT_VERSIONED_INVALIDATION_RECOURSE`.  The current union already makes the same cross-tier invalidation, timestamp-version validation, reclamation/restart, visibility and fallback choices under the frozen script-update endpoint.  A supposed remaining policy that only selects generations, reset timing, cache tier, or reclaim ordering is a generic cache-generation/reclamation controller over these native actions; it is not a distinct PHP-native action with a target-specific guarantee.

No union-external PHP-native action or finite non-generic guarantee can be frozen without changing the cache endpoint or adding a new semantics/quality contract.  This is positive current-source absorption, not an absence inference and not a result of any unrun experiment.

## Falsifier and full-cost boundary

For any separately identified future object, the first static falsifier would need to name a same-endpoint action that cannot be expressed by the native invalidate/timestamp/file-cache/restart/fallback catalog while preserving request result and cross-process semantics.  Any fair ledger must retain bytecode correctness, memory/file-cache bytes, stale residency, locking/restart work, update latency, request cost, validation cost, CPU/RSS/temp cost and cross-process behavior.  No performance, correctness, or novelty measurement was performed here.
