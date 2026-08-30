# Source and collision log

Search window: official project documentation/source and primary papers reachable 2026-08-02; queries included “dynamic sparse tensor format incremental ordered fiber”, “TACO sparse tensor assembly update”, and “MLIR SparseTensor insertion dynamic”. No absence claim exceeds this scope.

| Source | What it establishes | Collision role |
|---|---|---|
| [MLIR SparseTensor dialect](https://mlir.llvm.org/docs/Dialects/SparseTensor/) | Official sparse tensor encodings and compiler operation context. | `DEPLOYMENT_BASELINE` |
| [TACO project](http://tensor-compiler.org/) | Tensor algebra compiler and sparse-format compilation baseline. | `DEPLOYMENT_BASELINE` |
| [TACO source](https://github.com/tensor-compiler/taco) | Reproducible assembly/lowering artifact. | Natural implementation baseline |
| [SuiteSparse Matrix Collection](https://sparse.tamu.edu/) | Public sparse matrices that can supply pinned update traces. | Natural artifact |

Strongest-union contract: native coordinate assembly + sorted COO/recompress + per-fiber tree + offline batch oracle, all charged for update, merge, metadata, conversion, and ordered iteration. No exact same-object primary source was located in this bounded scan; classification: `SEARCH_BOUNDED_OPEN`.
