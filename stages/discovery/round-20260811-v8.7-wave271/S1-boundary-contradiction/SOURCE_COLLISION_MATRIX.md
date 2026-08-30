# Source / collision matrix — Wave271

| family | primary current source | fair subtraction | outcome |
|---|---|---|---|
| SPARC V9 | [ISel/call window](https://llvm.org/docs/doxygen/SparcISelLowering_8cpp_source.html), [subtarget](https://llvm.org/doxygen/classllvm_1_1SparcSubtarget.html), [frame source](https://llvm.org/doxygen/SparcFrameLowering_8cpp_source.html) | current ISA/ABI frame lowering plus generic RA; no direct LoongArch-style carryover | `DROP` |
| AVR | [frame source](https://llvm.org/doxygen/AVRFrameLowering_8cpp_source.html), [register API](https://llvm.org/doxygen/classllvm_1_1AVRRegisterInfo.html) | current callee-save/frame-index/RA union | `DROP` |
| MSP430 | [register header](https://llvm.org/doxygen/MSP430RegisterInfo_8h_source.html) | union not source-pinned across forms/MC/linker | `NOT_ADMITTED_UNFROZEN` |
| AArch32 interworking | [LLVM LangRef ARM/Thumb constraints](https://www.llvm.org/docs/LangRef.html) | current full target union not frozen in this bounded scan | raw only |
| Lanai | LLVM target is present but no first-party natural/collision closure retrieved | no candidate-grade subtraction | raw only |
| XCore | LLVM target is present but no first-party natural/collision closure retrieved | no candidate-grade subtraction | raw only |

Search refreshed 2026-08-11. Absence was not inferred from the bounded search.
