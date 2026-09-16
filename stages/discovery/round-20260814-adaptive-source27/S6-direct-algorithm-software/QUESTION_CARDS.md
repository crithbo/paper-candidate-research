# Source27 Question Cards

## QC01 — GFX12 rocWMMA legal fragment lowering

- Capsule / exact object: `S6_AMDGPU_GFX12_ROCWMMA_NATIVE_ACTIONS` / fixed GFX12 rocWMMA wave-matrix kernel, code-object ABI and numerical output.
- Intended contribution: `COMPILER_TOOL`, N2 target-specific constructor choosing between two stock-native legal wave-matrix lowering actions and conversion placements, with a static resource frontier guarantee.
- Same-object carrier / oracle: an official rocWMMA sample or test plus a fixed LLVM AMDGPU code-object path; stock code-object/ABI and numerical output would be the future oracle.
- Cheapest falsifier: official current source proves a single legal action, or the alleged action changes wave program/ABI, or it is existing feature selection.
- Evidence closure: precommitted ANCHOR, CURRENT_UNION and CONTRARY routes were attempted. The research connector returned `HTTP 401 token_expired`; two official small URL requests failed during TLS receive. No response bytes or content were received or persisted.
- Required-field audit: `INCOMPLETE` — current action union and contrary matrix cannot be sourced.
- Disposition: `LOCATOR_ONLY__EXECUTION_TELEMETRY_LIMITED__NO_SCIENTIFIC_INFERENCE`.

## QC02 — LoongArch OpenBLAS bounded kernel construction

- Capsule / exact object: `S6_LOONGARCH_OPENBLAS_NATIVE_KERNEL_ACTIONS` / fixed LoongArch64 OpenBLAS GEMM kernel, BLAS ABI and numerical output.
- Intended contribution: `METHOD_ALGORITHM`, N2 LoongArch-specific bounded kernel construction over LSX/LASX/scalar legal forms, with an exact/certified Pareto guarantee.
- Same-object carrier / oracle: official OpenBLAS kernel test or a small public program under fixed BLAS output equality.
- Cheapest falsifier: the actions are only runtime dispatch/tuning, or current OpenBLAS has already expressed the complete constructor.
- Evidence closure: the same precommitted source paths failed before content retrieval; no current union or primary contrary paper may be claimed from the capsule.
- Required-field audit: `INCOMPLETE`.
- Disposition: `LOCATOR_ONLY__EXECUTION_TELEMETRY_LIMITED__NO_SCIENTIFIC_INFERENCE`.

Neither card is fresh raw, C0, D1, deep, or a Stage 0 brief. Missing telemetry and source access are resource facts only, not evidence against the proposed objects.
