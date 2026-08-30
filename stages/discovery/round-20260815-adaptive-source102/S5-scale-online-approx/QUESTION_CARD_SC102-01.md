# Question Card SC102-01

## Frozen identity

`DENO_EXACT_GLOBAL_MODULE_CACHE_LOCKFILE__BOUNDED_RECOURSE_STATE_TRANSFER`

- Exact object: Deno's resolved remote/npm module cache together with the workspace lockfile, while preserving Deno specifier resolution, integrity-lock semantics, and executed-module semantics.
- Same-object endpoint: a later invocation observes the same valid resolved dependency graph and lock-file behavior as stock Deno for the fixed project and inputs.
- Candidate contribution type: `METHOD_ALGORITHM` / N2, only if a target-native bounded-recourse cache-state constructor remains outside the native action union.

## Exact public anchor and primary RQ

- Anchor snapshot: Deno official runtime documentation, accessed 2026-08-15: https://docs.deno.com/runtime/fundamentals/modules/ ; https://docs.deno.com/runtime/packages/ ; https://docs.deno.com/runtime/reference/cli/info/.
- Primary RQ: Can an update to a Deno dependency graph be realized with a bounded-recourse cache-state transition that preserves the fixed resolution and lock semantics while improving the total update/build/query/space cost?

## Current native union observed from the anchor

- The global cache is a first-party runtime object (`DENO_DIR`); `deno info` exposes cache information.
- `--reload` invalidates/re-fetches and recompiles cache state, including a documented form to reload designated modules.
- `--cached-only` makes the cache boundary explicit; missing dependencies fail instead of silently changing resolution.
- Lock-file handling, including `--frozen`, and vendor/local dependency modes define alternate native dependency-state paths.

## Decision and ceiling

The initially named residual reduces to choosing what to invalidate/reload or clean after a dependency change. That is a cache-maintenance policy, not a separately frozen target-native state-construction action. The current native union already exposes scoped/all reload, cache-only execution, lock enforcement, and vendor alternatives under the same semantics. No union-external complete action, target-specific nontrivial guarantee, or non-generic action witness was identified in this bounded source check.

Disposition: `EXCLUDED_BEFORE_RAW__CURRENT_UNION_AND_GENERIC_CACHE_RESIDUAL`.

This is not a claim that no future Deno algorithm exists, nor a current-absence claim. It only rejects this Source102 RQ as insufficient for evidence-qualified raw admission.

## Cost, carrier, and finite falsifier

- Natural carrier if later independently re-opened with external evidence: a versioned public Deno workspace dependency-update history.
- Required full-cost denominator: update wall/CPU, refetch bytes, compilation work, cache bytes/RSS, lock-file work, and later module-resolution/execution time.
- Minimum falsifier: show that the purported method is expressible by stock scoped/all reload, cache-only/lock controls, or vendor mode at the same endpoint; this source-level review already meets that exclusion test for the stated residual.
