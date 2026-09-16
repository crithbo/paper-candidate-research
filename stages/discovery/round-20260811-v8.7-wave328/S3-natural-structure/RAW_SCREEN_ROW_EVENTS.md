# RAW_SCREEN_ROW_EVENTS

Official-source breadth screen; cutoff 2026-08-11; no execution/download.

| ID | Fresh public versioned artifact/workload family | Same-object reader / natural-structure schema | Disposition |
|---|---|---|---|
| R1 | Kotlin/Native `.klib` | matching Kotlin/Native ABI/linker; retain ABI/IR units controlling compiler/target/path options | `NOT_ADMITTED_UNFROZEN` |
| R2 | Dart `.aot` snapshot | matching `dartaotruntime` and target architecture; retain compiled-function regions controlling SDK/target/source | `NOT_ADMITTED_UNFROZEN` |
| R3 | Erlang/OTP `.beam` | matching BEAM loader and exported/imported code semantics; retain chunks controlling compiler/debug/OTP options | `NOT_ADMITTED_UNFROZEN` |
| R4 | Julia sysimage | matching Julia runtime/package graph; retain compiled-method regions controlling Julia/CPU/package versions | `NOT_ADMITTED_UNFROZEN` |
| R5 | R lazyload `.rdb/.rdx` package database | matching R namespace lazy-load semantics; retain serialized objects controlling R/package versions | `NOT_ADMITTED_UNFROZEN` |
| R6 | LLVM coverage mapping binary | matching compiler/coverage reader; retain mapping records controlling source/IR/LLVM release | `EXCLUDED__PROFDATA_ADJACENT_COMPILER_PROFILE_FAMILY` |
| R7 | GNU Guix/Nix store archive closure | matching content-addressed store closure semantics; retain paths controlling derivation/input hash | `STRUCTURAL_DROP__CONTENT_ADDRESS_IDENTITY_OR_GENERIC_DELTA` |
| R8 | Clojure AOT JVM class set | matching JVM/class loader semantics; retain class set controlling compiler/JDK/source | `EXCLUDED__JVM_CLASS_ARTIFACT_FAMILY` |

No raw entry is treated as a stable law; each schema requires a three-release train/holdout plus explicit confound controls before deep admission.
