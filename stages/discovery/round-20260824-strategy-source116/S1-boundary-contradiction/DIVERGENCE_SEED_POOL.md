# Source116 S1 offline merged-patch lineage seeds

All seeds pass Source115 predecessor denylist before lookup. A merged patch is only a locator.

| Seed | Patch-lineage hypothesis |
|---|---|
| S116-01 | A merged Triton patch/test may reveal a more general current semantic invariant beyond the patched input, only if current source still lacks the invariant. |
| S116-02 | An LLVM/MLIR merged miscompile fix may leave a same-object alias/dependence residual under a different canonical program class. |
| S116-03 | An OpenXLA merged regression test may expose a non-default flag interaction not covered by current documentation/source. |
| S116-04 | A merged patch may move correctness cost to a fallback/guard; retain only if full-cost changes a fixed deployment/compiler decision. |
| S116-05 | Multiple patches may share a natural structural invariant; require exact parent/current tests and a finite falsifier. |
| S116-06 | A current test could verify a local patch but not a public canonical carrier; no carrier means pre-RQ nonadmission. |

Selected RQs S116-01..06; no outcome-aware replacement.
