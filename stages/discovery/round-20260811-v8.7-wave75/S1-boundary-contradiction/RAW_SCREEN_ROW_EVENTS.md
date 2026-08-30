# RAW_SCREEN_ROW_EVENT ledger

| ID | Unique family and first-party source | Observable contract screened | Funnel result |
|---|---|---|---|
| R01 | rustc incremental query compilation ([development guide](https://rustc-dev-guide.rust-lang.org/queries/incremental-compilation-in-detail.html), [upstream](https://github.com/rust-lang/rust)) | Incremental compile and clean compile give the same requested crate artifact/diagnostic semantics under fixed toolchain/environment. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R02 | Bazel incremental analysis/execution ([official iteration-speed guide](https://bazel.build/advanced/performance/iteration-speed), [upstream](https://github.com/bazelbuild/bazel)) | Fixed workspace/target/toolchain action graph and declared outputs under an edit sequence. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R03 | TypeScript `--incremental` program build ([TSConfig reference](https://www.typescriptlang.org/tsconfig/incremental.html), [upstream](https://github.com/microsoft/TypeScript)) | Fixed TypeScript project’s emitted program and diagnostics versus clean batch compilation. | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R04 | Nix derivation realization/reproducibility ([official manual](https://nix.dev/manual/nix/latest/), [upstream](https://github.com/NixOS/nix)) | Same derivation/store output under a fixed declared build environment. | `STRUCTURAL_DROP__BUILD_ENVIRONMENT_OR_CONTROLLER` |
| R05 | CMake generation/build boundary ([buildsystem manual](https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html), [user guide](https://cmake.org/cmake/help/latest/guide/user-interaction/index.html)) | Same source/configuration generated build graph and target output. | `STRUCTURAL_DROP__META_BUILD_CONFIGURATION` |
| R06 | GNU Make parallel update order ([official manual](https://www.gnu.org/software/make/manual/html_node/Parallel.html)) | Same dependency graph and declared targets under concurrent execution. | `STRUCTURAL_DROP__SCHEDULER_FLAG_OR_UNDECLARED_DEPENDENCY` |

No missing-feature/current-absence assertion was used to admit any row.
