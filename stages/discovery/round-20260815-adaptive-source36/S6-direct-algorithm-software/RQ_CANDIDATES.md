# Source36 RQ candidates

## RQ-01 — Zilsd pre/post-allocation pair construction

For fixed RISC-V MachineFunction semantics and enabled Zilsd extension, could
joint pre-allocation rescheduling, pair formation and post-allocation repair be
a new target-specific constructor? Current LLVM source states that its Zilsd
optimizer already performs exactly these two phases. This is a contrary control.

## RQ-02 — Zacas ABI legalization

For fixed atomic compare-exchange semantics and ABI, could construction of an
ABI-compatible Zacas sequence be an independent target-specific algorithm? LLVM
already exposes a named Zacas ABI-fix pass, while current target documentation
sets ABI constraints on compiler generation. This is also a contrary control.

