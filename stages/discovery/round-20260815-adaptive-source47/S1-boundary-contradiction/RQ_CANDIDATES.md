# Converged RQ candidates

## RQ01 — AArch64 CASP pair-atomic construction

For a fixed AArch64 C/C++ pair-atomic program, target and ABI, can a whole-function construction choose legal CASP/ordinary atomic forms while preserving the same memory-order and failure endpoint with a CASP-specific formal or Pareto guarantee beyond stock atomic lowering?

## RQ02 — PowerPC HTM abort / exception transition

For a fixed PowerPC program using transactional-memory regions and fixed C++ exception/ABI-visible outcome, can a target-specific construction place abort, compensation, and transition actions with an invariant beyond ordinary compiler lowering or generic runtime recovery?
