# Case q7m2

Cutoff: 2026-08-09. A fixed certified optimization-preprocessing trace maps one
weighted or unweighted constraint instance to an unchanged output instance.
Every removal must retain the current machine-checkable equioptimality proof
semantics. Existing tooling verifies a supplied removal order but does not
choose a lower-cost legal construction schedule.

Candidate action: maintain live dependency/rederivation obligations and choose
an ordered partition of eligible removals, emitting only existing proof
operations. The object, output, checker, and guarantee remain fixed. A finite
closure path is to replay a small natural trace, confirm identical output and
checker acceptance, then compare stable order and legal greedy order with all
construction, proof-byte, checker, memory, I/O, and timeout costs counted.
