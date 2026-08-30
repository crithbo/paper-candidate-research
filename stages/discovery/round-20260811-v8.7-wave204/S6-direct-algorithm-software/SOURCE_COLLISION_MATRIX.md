# Source and collision matrix

| Source | First-party status | Supports | Limitation / collision effect |
|---|---|---|---|
| [MLIR Bytecode Format](https://mlir.llvm.org/docs/BytecodeFormat/) | Official MLIR specification | Stable/versioned bytecode, string/dialect/attr-type/resource tables, relative offsets, varints, dialect custom encoding and versioning. | Confirms legal local-ID freedom but does not establish a global planner residual. |
| [Current BytecodeWriter.cpp](https://raw.githubusercontent.com/llvm/llvm-project/main/mlir/lib/Bytecode/Writer/BytecodeWriter.cpp) | Current LLVM upstream source | Insertion-order string IDs, numbering-state references, varint implementation, property deduplication, writer config/options. | Strong native same-object union; custom paths mean union not yet exhaustively closed. |
| [Bytecode writer configuration API](https://mlir.llvm.org/doxygen/classmlir_1_1BytecodeWriterConfig.html) | Official LLVM API documentation | Dialect-version and callback configuration surface. | Requires current source enumeration before any absence claim. |
| [Defining Dialects](https://mlir.llvm.org/docs/DefiningDialects/) | Official MLIR documentation | Dialects can define compact custom bytecode encodings. | A generic core-table claim can be absorbed by dialect-specific encoders. |
| [MLIR foundational paper](https://arxiv.org/abs/2002.11054) | Original primary paper | MLIR's compiler-infrastructure context. | Not a direct collision for bytecode table planning. |

## Direct collision status

`COLLISION_NOT_CLOSED`: bounded official/primary searching found the stock writer as the direct executable subtractor but did not close the literature/tool space for a joint same-object table-ID/record planner. This is not a novelty claim and blocks a brief.
