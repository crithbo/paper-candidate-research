# Exact public anchors — Source70

| RQ | Fixed object / oracle | Primary official anchor | Role |
|---|---|---|---|
| RQ-S70-01 | Fixed C++20 translation-unit/module-interface set, target and stock compiler/importer result | https://clang.llvm.org/docs/StandardCPlusPlusModules.html | Defines `clang-scan-deps` P1689 dependency extraction, compilation database input and module ordering boundary. |
| RQ-S70-02 | Fixed OpenMP program, mapped objects, target device and host/device observable result | https://www.openmp.org/spec-html/5.2/openmpse82.html | Defines stock target-data mapping semantics and legal map actions. |
| RQ-S70-03 | Fixed host program, CUDA code variants, target architecture and stock module execution | https://docs.nvidia.com/cuda/nvfatbin/index.html | Defines fatbin construction from cubin/PTX/LTO-IR and stock loader endpoint. |

Anchor facts locate a problem/action surface only; they are not novelty or absence evidence.
