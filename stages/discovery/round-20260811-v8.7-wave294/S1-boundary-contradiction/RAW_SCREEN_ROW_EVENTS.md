# RAW_SCREEN_ROW_EVENTS — Wave294

| row | fresh ABI/state commitment family | status |
|---|---|---|
| R01 | AArch64 PAuth/arm64e authenticated relocation, call operand and unwind commitment | deep |
| R02 | WebAssembly standardized/legacy EH and SjLj lowering, catch-region stackification | deep |
| R03 | LLVM async coroutine context/resume/tail-call frame commitment | deep |
| R04 | AArch64 Swift async context ABI/frame state | raw: overlapping coroutine union, no separate action |
| R05 | Itanium/DWARF personality/landing-pad/unwind table commitment | raw: generic EH union; no target-specific action |
| R06 | Windows ARM64EC hybrid-call thunk ABI | excluded: adapter/thunk wrapper, not N2 |
