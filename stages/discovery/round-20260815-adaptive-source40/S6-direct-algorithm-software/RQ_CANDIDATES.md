# Source40 same-object RQ commitments

## VE vector-length region construction

Fixed object: a VE MachineFunction with fixed vector operations, vector-length
semantics, ABI and stock generated-code behavior.

1. What legal vector-length state sequence realizes the fixed operations?
2. Can a target-specific constructor jointly choose legal vector-length regions
   and operation grouping while preserving the same behavior?
3. Can it expose a finite-state cost endpoint rather than generic scheduling?

Contribution type: `COMPILER_TOOL`. Minimum falsifier: current VE lowering
already represents every legal region construction, or the state erases to
generic scheduling. Deterministic carrier rule: first eligible current file in
official `llvm/test/CodeGen/VE/` that uses explicit vector-length state.

## XCore hardware-loop state construction

Fixed object: an XCore MachineFunction with fixed loop/control-flow semantics,
target feature state and stock generated-code behavior.

1. What legal hardware-loop state representation realizes the fixed loop?
2. Can a constructor jointly choose hardware-loop state and fallback boundary
   while preserving behavior?
3. Can it state a target-specific finite-state endpoint beyond generic loop
   selection?

Contribution type: `COMPILER_TOOL`. Minimum falsifier: current XCore lowering
absorbs the construction or state erasure leaves generic loop selection.
Deterministic carrier rule: first eligible current file in official
`llvm/test/CodeGen/XCore/` containing hardware-loop state.

