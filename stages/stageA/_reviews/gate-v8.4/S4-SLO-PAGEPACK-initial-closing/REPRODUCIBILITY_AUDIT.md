# Reproducibility Audit

## Mechanical result

- Owner manifest: `28/28` matched.
- Primary and replay nonvolatile files are byte-identical, both 18,345 bytes and both SHA-256 `C4FB253A84F118D828CDACCF7E5F8024EA5FA939C1CD79C86EFBBDE64D942F6E`.
- Removing the final line feed from the canonical stable file and independently hashing it yields `55A97297FB0A00465CB6414EC7C6F4F2B3BFD57A1BE3F0FFF6AAE8B0FBFB2FFA`, matching the declared stable digest.
- Recorded counters, layouts, residuals and file hashes are internally stable across the two owner runs.

Verdict: `REPRODUCIBLE_AS_A_DETERMINISTIC_PROXY_PROGRAM`.

## Scientific-validation limitation

Reproducibility does not establish construct validity. Static inspection finds that:

1. `semanticAndLegality` computes one transcript/final-state digest and later assigns that same digest to original, candidate, composition and ceiling; it does not execute four distinct layout/relocation semantic transitions.
2. `all_objects_adapter_movable`, `relocation_only_at_epoch_boundary`, and `live_handles_at_relocation=0` are asserted constants, not observations from an OBASE/CacheLib relocation model.
3. Page-capacity arithmetic is checked, but pointer rewrites, guide indirection, backend page promotions, fallback behavior and concurrent handle drainage are not simulated.

Therefore the strong owner phrase `VERIFIED_BY_BYTE_IDENTICAL_DUAL_REPLAY` is valid only for program determinism. The scientific ceiling is `TRACE_LEVEL_PROXY_NEGATIVE__SAME_OBJECT_AND_FAITHFUL_BASELINE_NOT_VERIFIED`.

