# Current upstream audit — PHP OPcache

## Pin and provenance

The first counted official request resolved `PHP-8.4.0` to `315fef2c72d172f4f81420e8f64ab2f3cd9e55b1`.  Every retained source/test file is a pinned `php/php-src` response.  The official PHP configuration document is retained only for the frozen configuration surface.  Exact hashes are in `RESOURCE_INVENTORY.yaml`.

## Native action catalog

| Native action | Same-object role | Evidence |
|---|---|---|
| Invalidate both tiers | file-cache invalidate followed by shared-memory lookup/discard | `ZendAccelerator.c` 1394–1427 |
| Timestamp version validation | validate in-memory entry; reload second-level file cache if invalid | `ZendAccelerator.c` 2125–2138 |
| Reclamation/restart | shared pending/in-progress state, locks, restart and timeout | `ZendAccelerator.c` 241–326, 2683–2710, 3422–3444 |
| File-cache persistence/validation | lock/create, serialize, timestamp and checksum verification, unlink invalid entry | `zend_file_cache.c` 1089–1171, 1812–2008 |
| Fallback | file-cache-only/restart fallback to file cache or original compile | `ZendAccelerator.c` 2002–2011, 2147–2155 |
| User-visible controls | timestamp/revalidation, reset pressure, cache-only, consistency checks and fallback | official configuration page |

## Two stock plans and witness

For one script update, a stock accepted plan may keep/validate a shared-memory entry and then use its file-cache fallback; another stock accepted plan invalidates the named file-cache entry plus shared-memory script and later recompiles/repopulates.  Reclamation/restart is a further native plan governed by shared lock state.  `file_cache_error.phpt` gives a concrete stock failure carrier: file-cache write failure is tolerated with normal script execution and a warning.

## Collision classification

`DIRECT_CURRENT_UNION_CHANGED_CACHE_ENDPOINT_OR_GENERIC_CACHE_CONTROLLER`: PASS.  The native catalog contains the family’s stated memory/file-cache joint versioned invalidation and recourse lifecycle.  No claim is made about all conceivable cache algorithms; the structural conclusion is limited to this frozen object and endpoint.  Any remaining generic controller or threshold policy does not constitute an independent PHP-native atomic action or guarantee.
