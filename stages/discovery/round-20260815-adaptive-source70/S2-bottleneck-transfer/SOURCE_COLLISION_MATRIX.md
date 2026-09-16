# Source / collision matrix — Source70

| Family | Current evidence | Strong contrary/direct subtractor | Decision |
|---|---|---|---|
| Clang C++20 module dependency/BMI path | Official Clang documents P1689 scanning and topological module build order; current source emits dependency data for explicit build. | The only specified next step is generic graph ordering/build scheduling, not a target-specific compiler constructor with a distinct guarantee. | `STRUCTURAL_DROP__GENERIC_DAG_SCHEDULING_OUTSIDE_FIXED_COMPILER_CONSTRUCTOR` |
| LLVM OpenMP target map/lowering | Official OpenMP specification exposes map types/modifiers and device environments; LLVM runtime documents mapping-related controls. | Prior exact same-program mapping/lowering endpoint was structurally screened; current union already includes the contemplated clauses/runtime paths. | `EXCLUDED_REPEATED__EXACT_OPENMP_MAP_LOWERING_ENDPOINT` |
| CUDA fatbinary materialization | Official nvFatbin constructs multi-architecture variants; CUDA docs expose lazy/eager code/data loading and loader-thread controls. | Prior exact fatbinary endpoint found the complete target/code action expressed by current options; changing selection/loading is a controller/configuration path. | `EXCLUDED_REPEATED__EXACT_CUDA_FATBINARY_ENDPOINT` |

No source was used to claim current implementation absence. `SEARCH_BOUNDED_OPEN` is not asserted because no candidate survived to a collision/deep review.
