# Source34 RQ candidates

## RQ-01 — RISC-V Zcmp frame-construction protocol

Given a fixed RISC-V function, ABI, unwind/debug semantics and enabled Zcmp
extension, can a target-specific algorithm jointly construct callee-save frame
state and push/pop instruction choice with an exact, FPT, approximation or
certified Pareto guarantee that is not merely generic register allocation or
prologue instruction selection?

Question variants: bytes-only, bytes-plus-unwind equivalence, and
bytes/latency/stack-state frontier. The last is the only potentially legitimate
same-object endpoint, but source closure is insufficient for a clean claim.

## RQ-02 — AArch64 MOPS whole-memory-operation selection

For a fixed `memcpy`/`memmove`/`memset` semantic operation and AArch64 feature
set, can choice among MOPS, scalar/vector lowering and library lowering yield
a target-specific complete constructor rather than an existing code-generation
selector? This is retained as a deliberate contrary control.

