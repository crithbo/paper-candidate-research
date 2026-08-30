# RAW_SCREEN_ROW_EVENT ledger

All rows were screened on 2026-08-11 from official documentation/source entry points.  They are distinct opportunity families, not candidate claims.

| ID | Family and official primary source | Frozen numeric object | Initial result |
|---|---|---|---|
| R01 | LLVM constrained FP / `strictfp` ([LangRef](https://llvm.org/docs/LangRef.html)) | LLVM IR arithmetic with observable FP environment | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R02 | MLIR `arith` fast-math semantics ([Arith dialect](https://mlir.llvm.org/docs/Dialects/ArithOps/)) | MLIR arithmetic op and lowering | `STRUCTURAL_DROP`: the tempting action is a fast-math attribute change |
| R03 | GCC `-frounding-math`, traps and reassociation ([manual](https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html)) | C/C++ expression under dynamic rounding/exception contract | `STRUCTURAL_DROP`: proposed speed path changes stated flags/assumptions |
| R04 | OpenJDK `strictfp` / HotSpot compilation ([JLS 15](https://docs.oracle.com/javase/specs/jls/se21/html/jls-15.html)) | Java strict floating expression evaluation | `STRUCTURAL_DROP`: no source-supported union-external complete action located; native optimization would require a semantic or VM-policy change |
| R05 | CUDA nvcc FP modes ([current nvcc manual](https://docs.nvidia.com/cuda/cuda-compiler-driver-nvcc/contents.html)) | CUDA kernel preserving denormals, IEEE div/sqrt and chosen contraction rule | `CANDIDATE_GRADE_DEEP_REVIEW` |
| R06 | PyTorch deterministic algorithms ([official API](https://docs.pytorch.org/docs/stable/generated/torch.use_deterministic_algorithms.html)) | fixed-version/hardware tensor operator with deterministic-output guarantee | `CANDIDATE_GRADE_DEEP_REVIEW` |

No repeat/renamed terminal object was admitted.  No current-absence claim is made in this raw ledger.
