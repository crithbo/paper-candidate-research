# Discovery log

## Outcome

`COMPLETE_ZERO_PROPOSALS`.

Current Chromium source closes an important negative boundary: changing resource IDs or disturbing resource-table order is incompatible with stock binary-search/alias semantics. This avoids treating ID reordering as an N2. A complete legal non-ID joint constructor, its full current union and the direct primary collision matrix remain unclosed, therefore the residual is `NOT_ADMITTED_UNFROZEN`.

## Finite reopening route

1. Pin current Chromium revision and enumerate DataPack/GRIT/repack/build pipeline paths and all flags.
2. Freeze a versioned Chromium resource corpus and stock load/lookup/full scan oracle.
3. Define a complete target-specific legal layout/version constructor with exact/FPT/Pareto/approximation/formal guarantee, excluding generic delta/packing.
4. Close primary collisions and run the two-layout fidelity gate with full pack/build/delta/load/query costs.
