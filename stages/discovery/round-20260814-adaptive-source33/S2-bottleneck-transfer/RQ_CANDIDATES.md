# RQ candidates — Source33 S2

## S33-01 — fixed multi-tile DPC++ program

Exact object: one fixed DPC++ program, inputs, kernel semantics, device topology, and observable output; the program uses the documented Level Zero multi-tile model.

1. Can a target-specific whole-program constructor jointly select USM allocation locality and device-queue bindings to reduce end-to-end transfer and execution cost while preserving that program's output and the documented device semantics?
2. Under the same information as a stock programmer has before submission, can such a constructor provide an exact, FPT, approximation, or certified Pareto guarantee over the documented allocation-and-queue action space?
3. Is the alleged joint action distinct from composing documented allocation calls, affinity partitioning, queue creation, and explicit copies?

The current-source check answered (3) adversely for admission: the documentation exposes these choices as ordinary programming-model composition. No target-specific algorithmic state, non-product cross-term, or guarantee was frozen. Therefore this is not a raw candidate and no C0/deep review follows.
