# Question cards

| RQ | Exact state / endpoint | Current union | Outcome |
|---|---|---|---|
| AArch64 FPCR | Fixed strict-FP call graph, FPCR-dependent bit/exception endpoint | LLVM strictfp + constrained FP models dynamic rounding and exception state | `EXCLUDED_BEFORE_RAW__GENERIC_DYNAMIC_FP_ENVIRONMENT` |
| PowerPC FPSCR | Fixed strict-FP call graph, FPSCR-dependent bit/exception endpoint | same current strict-FP contract; source operations explicitly save/restore FPSCR | `EXCLUDED_BEFORE_RAW__GENERIC_DYNAMIC_FP_ENVIRONMENT` |
| LoongArch FCSR | Fixed strict-FP call graph, FCSR-dependent bit/exception endpoint | current LoongArch lowering reads/writes FCSR rounding field | `EXCLUDED_BEFORE_RAW__GENERIC_DYNAMIC_FP_ENVIRONMENT` |

No result relies on missing implementation, performance, hardware, or resources.
