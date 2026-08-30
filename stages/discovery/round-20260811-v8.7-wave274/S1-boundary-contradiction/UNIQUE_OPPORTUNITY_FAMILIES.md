# Unique object — Wave274

**Exact object:** fixed LLVM MSP430 MachineIR/liveness, target/CPU/features, EABI calling convention, instruction/relocation semantics, frame/unwind result and observable program behaviour.

**Complete fair union:** current LLVM MSP430 ISel, generic allocation/coalescing/spill/PEI, MSP430 frame lowering and register information, MC lowering/AsmPrinter plus the external GNU/TI EABI/linker relaxation comparator. A changed ABI, changed code model/relocation contract, assembly postprocessor or generic solver is outside the object.

**Natural finite route:** LLVM MSP430 codegen tests plus public TI/GCC embedded test programs; machine verifier, assembler/object/objdump, EABI/DWARF and relocation oracle. Full cost: compile/link CPU/RSS, text/object/relocation bytes, spills/copies/frame instructions, static instruction cycles and RAM/stack. No route was executed.
