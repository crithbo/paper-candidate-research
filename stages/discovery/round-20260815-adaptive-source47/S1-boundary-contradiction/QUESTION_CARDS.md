# Question cards

## RQ01 — AArch64 CASP pair atomics

- **Object/endpoint:** fixed C/C++ pair-atomic program with unchanged memory order, failure value, AArch64 target and ABI.
- **Candidate:** a CASP-specific whole-function construction choosing legal native forms under a new formal/Pareto guarantee.
- **Current locus:** LLVM atomic code-generation documentation: with AArch64 LSE specified, LLVM uses single-instruction atomics rather than out-of-line calls; AArch64 lowering covers atomic operations.
- **Falsifier:** absent a CASP-specific state/recurrence/guarantee, the remaining decision is ordinary atomic lowering/form selection.
- **Disposition:** `EXCLUDED_BEFORE_RAW__GENERIC_ATOMIC_LOWERING`. No absent-feature or performance claim is made.

## RQ02 — PowerPC HTM abort / exception boundary

- **Object/endpoint:** fixed PowerPC HTM program and C++ ABI-visible exception outcome.
- **Candidate:** a target-specific abort/compensation placement invariant.
- **Falsifier:** the RQ specifies no transaction-state construction distinct from generic abort handling, exception cleanup, or runtime wrapping.
- **Disposition:** `EXCLUDED_BEFORE_RAW__GENERIC_ABORT_RECOVERY`. This is an RQ contribution-shape failure, not a source, implementation, hardware, or result failure.
