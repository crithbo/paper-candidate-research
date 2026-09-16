# Same-object RQ candidates

## Exact anchor

OpenXLA XLA GPU compilation: the official HLO-to-thunks documentation states that buffer assignment maps HLO buffers to slices and that compatible contiguous thunks can be converted to a command buffer whose later executions replay recorded GPU commands. The anchor is public, current, and technical; it is not an absence or novelty claim.

## RQ-1 — primary

For a fixed HLO module, target GPU configuration, tensor shapes/values, and stock XLA GPU executable semantics, can a **capture-stable buffer-and-command-group constructor** jointly select legal buffer slices/aliases and contiguous command-buffer groups so as to improve the peak-memory / command-record-and-replay-cost frontier, while preserving stock observable tensor results and command legality?

Contribution route if it survives: `N2`, a target-specific joint algorithm with an explicit Pareto, approximation, or fixed-parameter guarantee. It is not a flag selector or online controller.

## RQ-2 — bounded alternative

For the same fixed object, can capture-boundary-aware interval allocation yield a certified no-regret frontier relative to separately composed stock buffer assignment and command-buffer conversion?

RQ-2 is only a sharpened formulation of RQ-1, not a second family. It was not independently promoted.
