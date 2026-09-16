# Current union / collision matrix

| Family | Current evidence | Decision |
|---|---|---|
| AArch64 CASP | LLVM documents LSE single-instruction atomics under the same atomics framework. | Excluded: residual is generic lowering/form selection. |
| PowerPC HTM abort boundary | No non-generic invariant was named at RQ stage. | Excluded: residual is generic abort recovery; no source-absence claim. |
