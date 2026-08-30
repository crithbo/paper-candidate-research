# Unique object — Wave287

**Exact object:** fixed RISC-V C/C++ function/call graph, target ISA/Zicfiss features, ABI/ELF relocations, observable values/exceptions, return-CFI guarantee, tail-call eligibility, unwind/runtime contract and stock compiler output semantics.

**Strongest current union:** ratified Zicfiss and RISC-V ABI/ELF; LLVM `-fsanitize=shadow-call-stack` or hardware Zicfiss `-fcf-protection=return`, ISel/call/tail-call lowering, generic RA/coalescing/spill, RISC-V frame/CFI and MC/linker relaxation; GCC Zicfiss prologue/SIBCALL return support; Linux ELF/psABI runtime support. A changed backward-edge guarantee, custom wrapper, manually altered assembly or generic optimizer is outside the object.

**Natural finite route:** LLVM `shadowcallstack.ll`/Zicfiss CodeGen tests plus public C/C++ compiler-test corpus; assembler/disassembler, LLVM verifier, object/ELF relocation, unwind and shadow-stack runtime oracle. Full cost: compile/link CPU/RSS, text/relocation bytes, normal/shadow stack frame bytes, prologue/epilogue/tail-call instructions, static runtime cost and hardware runtime when available. No route was run.
