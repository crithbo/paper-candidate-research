# Source38 RQ candidates

## M68k MOVEM spill/reload construction

For a fixed M68k MachineFunction, ABI and code semantics, can a whole
multi-register spill/reload representation be constructed beyond the existing
target pass? RQ variants considered before evidence: bytes-only, ABI-preserving
MOVEM construction, and code-bytes/register-pressure frontier.

## M68k stack adjustment construction

For fixed frame state and ABI semantics, can a whole choice among LEA/SUB/ADD
stack adjustment actions have a target-specific formal endpoint beyond ordinary
frame lowering? RQ variants: single adjustment, paired prologue/epilogue and
full frame representation.

