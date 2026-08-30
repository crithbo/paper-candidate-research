# Source73 RQ convergence

All four RQs below were frozen before their targeted source routes. Each has one primary RQ; no alternative was needed because varying object or guarantee would change the family.

| RQ | Seed | Exact anchor / stable object | Primary RQ | Precommitted source route | Result |
|---|---|---|---|---|---|
| S73-RQ-01 | S73-01 | GCC current AArch64 options; fixed C/C++ `memcpy`/`memmove`/`memset` semantics and AArch64 ABI | Can a target-specific joint copy-form/lowering construction improve code-generation plus copy full cost while retaining those call semantics? | GCC AArch64 options, then current GCC source only if a non-generic action survived | `EXCLUDED_BEFORE_RAW__GENERIC_FLAG_OR_COST_MODEL` |
| S73-RQ-02 | S73-02 | OpenMP target data environment; fixed program map/dependency semantics | Can a program-preserving construction of device mappings and dependencies change whole host-device data movement cost without becoming a runtime controller? | OpenMP official current specification | `EXCLUDED_BEFORE_RAW__NATIVE_MAP_DEPEND_UNION_AND_CONTROLLER_SHELL` |
| S73-RQ-03 | S73-03 | JDK 25 AppCDS; fixed class path, loaded-class set, stock JVM archive acceptance and class-load semantics | Is there a target-specific stock-CDS archive constructor that changes archive build plus cold-start full cost, rather than class-list or flag selection? | JDK 25 `java` specification, then OpenJDK current CDS source locus | `LOCATOR_ONLY__NO_NON_GENERIC_ACTION_SKELETON` |
| S73-RQ-04 | S73-04 | LLVM current RISC-V target with fixed IR semantics and Zicbop-capable target | Can a target-specific prefetch-placement constructor give a guarantee beyond current `llvm.prefetch`/loop-prefetch mechanisms? | LLVM RISC-V user guide and current target-source locus | `EXCLUDED_BEFORE_RAW__GENERIC_PREFETCH_SCHEDULING` |

FINER-lite was scheduling-only: all anchors are public and answerable, but only S73-RQ-03 retained an unresolved non-generic discriminator. No pre-RQ nomination was allowed because selective depth is OFF; all ordinary routes used Terra/high.

