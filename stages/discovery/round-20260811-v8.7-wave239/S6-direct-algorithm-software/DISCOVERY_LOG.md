# Discovery log — Wave239

## Outcome

`COMPLETE_ZERO_PROPOSALS` — one source-level depth review, zero grounded briefs. The family remains `NOT_ADMITTED_UNFROZEN`, not terminal.

## Evidence-based reasoning

1. The Linux kernel format permits regular files to consist of compressed blocks and/or a tail fragment, and maps fragment indexes through a native lookup table. This supplies a genuine same-object representation freedom.
2. The official tool's current master source shows a substantially broader construction union than a simple fixed-order heuristic: block size, compressor/options, fragment mode, duplicate checking, sorting, action-based alignment, xattrs, reproducible ordering and parallel/order queues all participate.
3. Therefore a proposed global block/fragment/deduplication planner is only potentially N2 if it has an explicit global objective/guarantee and survives the entire deployable composition. The static two-representation witness does not prove it survives that union.
4. Current call-path/config closure and direct same-object algorithmic collision are unfinished. Under the frozen rules this means `NOT_ADMITTED_UNFROZEN`; it cannot be promoted and cannot be labelled as a current-implementation absence.

## Finite next closure, if assigned

Pin an immutable upstream commit; enumerate producer branches from option parsing through fragment processing, duplicate lookup, sort/action ordering and table emission; construct and validate the small legal tail witness; then compare a formally stated bicriteria algorithm against the complete native composition and an independently sourced direct-collision matrix. This is a bounded fidelity route, not an authorization to run it here.
