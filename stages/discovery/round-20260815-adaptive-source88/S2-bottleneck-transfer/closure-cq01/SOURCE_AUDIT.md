# Source audit — JavaScriptCore bytecode / OSR state-map closure

Assignment: `SOURCE-CLOSURE-SOURCE88-S2-CQ01-JSC-BYTECODE-OSR-STATE-MAP-V1`.  
This is a source-only closure and has no brief, Q2, PASS, STOP or stage authority.

## Immutable pin and bounded route

Official repository metadata resolved `WebKit/WebKit` default branch `main`.
The subsequent official commit receipt fixed
`f157dd8681ebabd624b90a8069080b87c7938187`. Four frozen raw requests then
completed as follows:

| Frozen role | Result | Evidence boundary |
|---|---|---|
| Bytecode generation | HTTP 404 | The precommitted `Source/JavaScriptCore/bytecode/BytecodeGenerator.cpp` path did not resolve at the pin. It is recorded as path-drift telemetry only; no substitute search or absence inference was made. |
| CodeBlock / profiles / tiers | [CodeBlock.cpp](https://raw.githubusercontent.com/WebKit/WebKit/f157dd8681ebabd624b90a8069080b87c7938187/Source/JavaScriptCore/bytecode/CodeBlock.cpp) | Current code contains interpreter/baseline vs DFG/FTL code-origin handling, profiling interfaces and JIT threshold actions. |
| DFG OSR exit | [DFGOSRExit.cpp](https://raw.githubusercontent.com/WebKit/WebKit/f157dd8681ebabd624b90a8069080b87c7938187/Source/JavaScriptCore/dfg/DFGOSRExit.cpp) | Current OSR exit reconstructs operands from a variable-event stream, applies speculative recovery, emits/repatches exit code and materializes checkpoint side state. |
| In-tree OSR carrier | HTTP 404 | The precommitted `JSTests/stress/osr-exit.js` path did not resolve at the pin. No renamed test or alternate program was searched. |

The six counted calls retained 218,352 bytes, below the 16 MiB cap. Both 404s
are visible in the monotonic attempt ledger.

## What current source establishes

The two retained source loci already make a generic “state-map is absent” claim
untenable. The current runtime maintains tier and profile-related `CodeBlock`
state, maps optimized tiers back to bytecode origins, and the DFG exit path
reconstructs operands and checkpoint side state before installing/repatching an
exit. These are direct current subtractors for any later same-object action
map.

However, the precommitted bytecode-generator and test-carrier paths both
drifted. The bounded packet therefore cannot establish the complete current
bytecode encoding/default-nondefault option surface, a fixed executable carrier,
or two complete legal bytecode-plus-OSR-state-map plans. It consequently cannot
adjudicate an asserted union-external JSC-specific action, a finite guarantee,
or direct current collision. This is incompleteness, not absence evidence.
