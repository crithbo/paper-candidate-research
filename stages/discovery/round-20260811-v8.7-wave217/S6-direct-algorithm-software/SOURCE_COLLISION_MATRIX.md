# Source and collision matrix

| Purpose | First-party source | What it supports | Limitation |
|---|---|---|---|
| Format semantics | [LLVM Coverage Mapping Format](https://llvm.org/docs/CoverageMappingFormat.html) | Expression-array structure, binary add/sub nodes, counter tags, LEB encoding, file/region records and ordering. | Does not establish current writer action-union completeness or novelty. |
| Native reader contract | [llvm-cov command guide](https://www.llvm.org/docs/CommandGuide/llvm-cov.html) | Stock instrumentation and `llvm-cov` consumption path. | Does not enumerate internal writer behavior. |
| Writer entry point | [CoverageMappingWriter source documentation](https://www.llvm.org/doxygen/CoverageMappingWriter_8cpp_source.html) | Native writer serializes counters using expression data. | A commit-pinned whole-path audit remains required. |
| Builder comparator | [CounterExpressionBuilder documentation](https://llvm.org/doxygen/classllvm_1_1coverage_1_1CounterExpressionBuilder.html) | LLVM already owns a native expression-building abstraction. | Need source-level behavior/config closure before declaring an external action. |

## Direct-collision conclusion

No collision-free conclusion is claimed. Format documents and current upstream documentation demonstrate a nontrivial existing native expression-builder/writer baseline. A future admissible review must pin a current LLVM revision, enumerate all producer/reader options and relevant source paths, and search primary same-object work for DAG factoring/canonicalization before asserting an action gap.
