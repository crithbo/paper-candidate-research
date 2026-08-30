# U01

Fixed LLVM PowerPC MachineIR/liveness/ABI/ISA/program semantics. Strongest union: prefixed/non-prefixed form selection, greedy/PBQP RA, coalescing/spills, PPC frame handling, post-RA scheduling, MC encoding and legal linker relaxation. Natural route: LLVM PowerPC CodeGen tests and public SPEC/Embench-style address-intensive kernels; oracle: compiler, assembler/objdump, relocations, ABI/unwind. Full cost: compile/link CPU/RSS, bytes/relocs, address temporaries/copies/spills, uops and later runtime.
