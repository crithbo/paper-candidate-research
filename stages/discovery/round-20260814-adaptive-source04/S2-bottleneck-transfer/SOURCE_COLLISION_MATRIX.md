# S2 adaptive-source04 — source/action matrix

| family | official current reality | decision |
|---|---|---|
| Clang CFI | [CFI design](https://clang.llvm.org/docs/ControlFlowIntegrityDesign.html) specifies contiguous vtables, overlapping byte arrays, type tests and LTO cooperation; [CFI options](https://clang.llvm.org/docs/ControlFlowIntegrity.html) records required LTO/static-link conditions and current modes. These are the strong producer/linker/checker union. | The two legal layout plans are current native construction choices. A new layout optimizer would be generic packing or a policy selector. DROP. |
| LLVM MemProf | [MemProf](https://llvm.org/docs/MemProf.html) documents instrumentation/runtime/profile use, ThinLTO summary serialization, CallsiteContextGraph, cloning and allocator interface; current [context-disambiguation source](https://llvm.org/doxygen/MemProfContextDisambiguation_8cpp_source.html) implements clone identification/assignment. | Both plans are expressed by current union. DROP. |
| SafeStack | [SafeStack](https://clang.llvm.org/docs/SafeStack.html) defines separate stacks and compiler-rt support. | An all-safe alternative weakens the frozen security property; no legal two-plan witness. |
| HWASan | [HWASan design](https://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html) defines base-tag/re-tag stack construction and notes the register-pressure reason. | Independent tags affect probabilistic detection/collision behavior; no equal-guarantee witness. |
| Clang EH | [Clang EH codegen](https://clang.llvm.org/docs/LLVMExceptionHandlingCodeGen.html) and [LLVM EH](https://llvm.org/docs/ExceptionHandling.html) distinguish personality/ABI-specific landingpad, funclet and SJLJ forms. | Changing form changes the ABI/unwinder object. |
| GCC split stack | [GCC runtime internals](https://gcc.gnu.org/onlinedocs/gccint/Miscellaneous-routines.html) specifies split-stack segment state and runtime APIs. | Split versus fixed stack differs in runtime growth/overflow contract. |

Reality check date: 2026-08-14. Defaults and non-default flag/feature modes are part of each comparator. No current-absence claim was used.
