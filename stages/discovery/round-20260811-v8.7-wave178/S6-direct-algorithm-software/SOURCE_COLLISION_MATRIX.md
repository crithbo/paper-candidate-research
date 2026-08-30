# Source collision matrix

| official/primary source | relevance | collision judgment |
|---|---|---|
| [lld COFF `PDB.cpp`](https://raw.githubusercontent.com/llvm/llvm-project/main/lld/COFF/PDB.cpp) | Current native producer merges/re-maps CodeView type references, assembles PDB streams and collects publics. | Direct same-object writer; excludes local-emitter framing. |
| [LLVM `TpiStreamBuilder.cpp`](https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/DebugInfo/PDB/Native/TpiStreamBuilder.cpp) | Type record/hash/index-offset serialization. | Fixed existing TPI/IPI action is a direct subtractor. |
| [LLVM `GSIStreamBuilder.cpp`](https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/DebugInfo/PDB/Native/GSIStreamBuilder.cpp) | Public/global record sorting, bucket hashing and serialized stream formation. | Direct same-object hash/ordering subtractor. |
| [LLVM `PDBFileBuilder.cpp`](https://raw.githubusercontent.com/llvm/llvm-project/main/llvm/lib/DebugInfo/PDB/Native/PDBFileBuilder.cpp) | MSF layout and ordered stream commit. | Direct stream-layout subtractor. |
| [LLVM PDB documentation root](https://llvm.org/docs/PDB/index.html) | Official LLVM PDB reader/writer documentation. | Reader/format source, not sufficient to prove Microsoft reference-writer absence. |

**Current-upstream reality result:** the candidate cannot rely on a claim that writers only emit fixed local records: lld demonstrably does whole-file reference repair, sorting, hashing and MSF construction. A remaining global joint algorithm is not directly absorbed by the cited actions, but it is also not certified outside the complete current union.

