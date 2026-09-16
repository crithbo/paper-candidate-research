# Official-source audit — S2-90-CQ01

| Sequence | Frozen official route | Pin / result | Permitted interpretation |
|---:|---|---|---|
| 1 | `api.github.com/repos/swiftlang/swift` | 200; default branch `main` | Version-rule input only. |
| 2 | `api.github.com/repos/swiftlang/swift/commits/main` | 200; `d056c33516f5c5e934dfc45bff945ef3bb2771b3` | Immutable pin for remaining calls. |
| 3 | `lib/SILOptimizer/ARC/ARCSequenceOpts.cpp` | 200; SHA-256 `2e5486b0fb00a57980338a27264b956795648a4a593dbb92674f7265f2a3346e` | Current stock source; scoped subtractor only. |
| 4 | `lib/SILOptimizer/ARC/ARCAnalysis.cpp` | 404 | Frozen-path telemetry; not source absence. |
| 5 | `lib/SILOptimizer/Transforms/AllocBoxToStack.cpp` | 404 | Frozen-path telemetry; not source absence. |
| 6 | `test/SILOptimizer/arc_sequence_opts.sil` | 404 | Frozen-path telemetry; not carrier absence. |

## Current-source observation

The retained ARC sequence optimizer includes sequence matching, retain/release increment-decrement pairing, loop processing, post-dominating release updates, alias analysis, RC identity analysis, and repeated execution after an ARC pairing pass.  This is a strong local baseline for ordinary ARC placement and pairing mechanisms.

It is insufficient to identify the whole same-object action grammar requested by the assignment.  In particular, the fixed route did not expose the required ARC-analysis, allocation/lifetime lowering, or test-carrier loci.  No route substitution was permitted.

## Collision and generic-objection status

- Direct current collision: `SEARCH_BOUNDED_OPEN`. The retained transform is a specific subtractor, not a complete direct collision for an unspecified joint action and guarantee.
- Generic ARC placement/layout-packing/controller objection: unresolved because there is no frozen two-plan carrier or complete current action union.
- No external paper search was authorized or performed; no absence conclusion is drawn.
