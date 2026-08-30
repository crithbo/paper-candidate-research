# SOURCE_COLLISION_MATRIX

| Object | Current official/upstream reality | Strongest-union collision | Final result |
|---|---|---|---|
| rustc incremental compilation | [Development guide](https://rustc-dev-guide.rust-lang.org/queries/incremental-compilation-in-detail.html); [upstream](https://github.com/rust-lang/rust) | Red-green graph, dep-node validation and codegen-unit cache are already the same-information action union. | `DROP` |
| Bazel incremental build | [Official guide](https://bazel.build/advanced/performance/iteration-speed); [upstream](https://github.com/bazelbuild/bazel) | Native graph/action/cache machinery occupies proposed invalidation/execution choices. | `DROP` |
| TypeScript incremental build | [Official TSConfig](https://www.typescriptlang.org/tsconfig/incremental.html); [upstream](https://github.com/microsoft/TypeScript) | Incremental metadata and program reuse are native; cache cleanup is postprocessing. | `DROP` |
| Nix | [Official manual](https://nix.dev/manual/nix/latest/); [upstream](https://github.com/NixOS/nix) | Reproducibility is a declared derivation/environment and store-realization property, not an uncovered incremental algorithm here. | `DROP` |
| CMake | [Buildsystem manual](https://cmake.org/cmake/help/latest/manual/cmake-buildsystem.7.html); [user guide](https://cmake.org/cmake/help/latest/guide/user-interaction/index.html) | Configure/generate cache and native build generator are configuration/metabuild actions. | `DROP` |
| GNU Make | [Official parallel manual](https://www.gnu.org/software/make/manual/html_node/Parallel.html) | Scheduling is native control; nondeterminism from undeclared prerequisites has no same-contract repair via a scheduler flag. | `DROP` |

No old issue/future-work statement was used as a current-absence proof, and no direct paper collision is claimed for a mechanism that did not survive action closure.
