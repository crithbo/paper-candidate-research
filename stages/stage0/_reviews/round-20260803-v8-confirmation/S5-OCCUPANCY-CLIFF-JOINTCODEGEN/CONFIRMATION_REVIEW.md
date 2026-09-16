# SENTRY Confirmation — S5-OCCUPANCY-CLIFF-JOINTCODEGEN

## Result

**CONFIRM.**  PRIMARY's `NATURAL_CLIFF_CORPUS_AND_FIXED_STACK_DELTA` is an atomic, falsifiable `REVISE_ONCE` gate.  Stage A remains unauthorized.

## Independent check

The object is a pinned LLVM AMDGPU MIR commit/subtarget/optimization level/time budget.  It coordinates scheduling and allocation while preserving the current backend's dependencies, SGPR/VGPR/AGPR accounting and spill semantics.  It is not a claim of a new GPU ISA, a new register allocator in the abstract, or an offline-only optimum.

The fair finite baseline is current `GCNSchedStrategy` with the greedy allocator, the same allocator with a pressure/list control, and a reconstructed min-reg control; bounded CP-SAT is a ceiling only.  LLVM's public scheduler documentation confirms target occupancy and register-pressure accounting, so this source must be pinned, not summarized as a generic compiler baseline.  Unison and min-reg are methodological subtractors but do not implement this fixed-stack AMDGPU object.  No direct-fatal same-stack solver was found.

The gate fixes the stack/target/budget, requires two public MIR inputs with independently checked cliff labels, and asks for a non-dominated delta versus the actual baseline before considering the ceiling.  It has a clear negative outcome: if the current baseline is already within the stipulated ceiling band or there is no non-dominated point, terminate.  That is an appropriate two-day decision screen.

## Gate disposition

- PRIMARY `REVISE_ONCE`: **confirmed**, unchanged.
- Direct-fatal collision found: **no**.
- Natural headroom: explicitly unproven until the two-source cliff corpus and fixed-stack delta exist.
- Q1 / AI route: only conditional.  Learned proposal/ranking can be an AI component only after it improves the fixed, compiler-native decision boundary; it cannot replace the certificate.
- Ownership/resources: all Stage-0 decision evidence is source/MIR based.  GPU access affects later performance ceiling, not whether this gate may run.

## Required status implication

`REVISE_ONCE` remains unexecuted (1/1 available).  No Stage A, revision execution, or status update follows from this confirmation.
