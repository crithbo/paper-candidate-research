# S2 adaptive-source06 — current-source / collision matrix

| family | first-party evidence / current comparator | result |
|---|---|---|
| HWASan AArch64 stack tags | [HWASan design](https://clang.llvm.org/docs/HardwareAssistedAddressSanitizerDesign.html) states that stack frames align allocas to tag granules and use one base tag plus `ReTag(BaseTag,M)` because independent tags increase register pressure. [Clang options](https://clang.llvm.org/docs/ClangCommandLineReference.html) exposes HWASan ABI and mode entries. Comparator includes current HWASan instrumentation, AArch64 RA/frame lowering and compiler-rt. | No direct source found in bounded review that states the proposed target-specific same-report Pareto construction; `SEARCH_BOUNDED_OPEN`, to be independently attacked at Stage0. |
| Other raw rows | Official current sources identify fixed check/runtime/ABI actions or fail to freeze one exact object. | No second brief. |

Reality date: 2026-08-14. No absence is inferred from an old issue, missing implementation or lack of results.
