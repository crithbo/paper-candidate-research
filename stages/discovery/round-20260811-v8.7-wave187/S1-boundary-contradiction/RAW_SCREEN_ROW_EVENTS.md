# RAW_SCREEN_ROW_EVENTS

| ID | ABI/state contract | Current union and result |
|---|---|---|
| R01 | RISC-V V `vtype`/`vl` state from LLVM binary to QEMU/Spike execution. | ISA spec, compiler lowering, ABI state, emulator legality; `DEEP_DIVE_REQUIRED`. |
| R02 | RISC-V V calling convention/vector register state at call boundary. | Compiler ABI lowering plus runtime ABI; `DEEP_DIVE_REQUIRED`. |
| R03 | Arm SME streaming/ZA state across compiler call/runtime boundary. | Architecture/compiler ABI state controls; `DEEP_DIVE_REQUIRED`. |
| R04 | CHERI capability provenance/bounds state from compiler to Morello/QEMU execution. | CHERI compiler/runtime/emulator semantics; `STRUCTURAL_DROP__GUARANTEE_CHANGE`. |
| R05 | CXL memory device state from OS/runtime to device/emulator. | CXL protocol/driver/device state; `NOT_ADMITTED_UNFROZEN`. |
| R06 | RISC-V Ztso memory-order state from compiler atomics to runtime/emulator. | ISA model/compiler atomics/emulator; `STRUCTURAL_DROP__FLAG_OR_ISA_CHANGE`. |

Natural carriers are public ISA compliance/vector tests, ABI call tests, SME examples, CHERI tests, CXL Linux/QEMU tests and atomic litmus tests. Every later probe must charge compilation, binary size, emulation, state save/restore, memory/RSS, legality/differential oracle and workload time.
