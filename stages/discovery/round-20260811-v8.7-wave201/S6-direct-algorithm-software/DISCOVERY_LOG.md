# Discovery log

## Scope and result

One source-level depth red-team was completed for ECMA-335 CLI metadata row/heap assignment. Result: `COMPLETE_ZERO_PROPOSALS`.

The core action was fully stated and a minimal complete-reference-regeneration witness was identified. It fails the fixed same-object contract: metadata table rows define tokens, tokens are persisted in IL, and stock .NET APIs expose them. Rewriting every internal reference produces a valid but token-different assembly. Holding tokens fixed removes the row assignment action. This is a structural semantic result, not an implementation/readiness/resource inference.

## Reusable boundary

Future work may study metadata layout only under a deliberately weaker contract that excludes token identity. That would be a new object and cannot revive this assignment. Any same-object work must preserve token identity and show a non-routine residual independent of row permutation.

No experiment, benchmark, corpus download, stage directory, or shared-control modification occurred.
