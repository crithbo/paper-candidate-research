# Exact public anchors — Source58 S2

| RQ | Exact object / fixed semantics | Official primary anchor | Source role | What it fixes before evidence |
|---|---|---|---|---|
| RQ-S58-01 | A fixed linked ELF executable, fixed profile, unchanged instruction and unwinding behavior | LLVM BOLT documentation, accessed 2026-08-15: https://llvm.org/docs/AdvancedBuilds.html | ANCHOR | BOLT is a post-link optimizer that changes final-binary layout from runtime profile information. |
| RQ-S58-02 | A fixed OpenMP target program and mapping semantics over the same host/device values | LLVM OpenMP runtime documentation, accessed 2026-08-15: https://openmp.llvm.org/design/Runtimes.html | ANCHOR/CURRENT | `libomptarget`, plugins, mapping and relevant default/non-default controls are native parts of the endpoint. |
| RQ-S58-03 | A fixed Level Zero module input, device target and module-executable semantics | oneAPI Level Zero v1.29.0 official release, accessed 2026-08-15: https://github.com/oneapi-src/level-zero/releases/tag/v1.29.0 | ANCHOR | Pins loader/API-header release `b77ced6` and API/spec family; it does not by itself pin the vendor driver construction action. |

These anchors do not establish current absence, novelty, a residual, or a paper-quality conclusion.
