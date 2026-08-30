# Source and collision matrix

| Family | Current source / official semantic contract | Strongest contrary | Final classification |
|---|---|---|---|
| LLVM freeze | LangRef, UB manual, GlobalISel docs | Definedness distinction itself | `DIRECT_FATAL` for same-object placement claim |
| Clang zero-call-used-regs | option + attribute references | current choice/attribute union | `DIRECT_FATAL` for non-configuration claim |
| membarrier | official UAPI + kernel source | command scope and flags | structural drop |
| robust futex | official recovery protocol + kernel/glibc sources | ABI’s `list_op_pending` recovery protocol | raw-only; no claimed action gap |
| dlmopen | glibc manual/source | namespace identity is semantics | structural drop |
| Zawrs | official ISA + LLVM feature support | normal target form feature selection | structural drop |

No row claims a current implementation is missing. `SEARCH_BOUNDED_OPEN` is not used as a novelty conclusion because no family survived to a brief.

