# Source collision matrix

| official/primary source | current constraint/collision |
|---|---|
| [LLVM dwarfdump](https://www.llvm.org/docs/CommandGuide/llvm-dwarfdump.html) | Stock verifier checks unit chains, DIE relationships, ranges and more; fixes a same-reader oracle. |
| [LLVM source-level debugging](https://llvm.org/docs/SourceLevelDebugging.html) | Establishes DwarfDebug producer semantics and debugger-facing purpose. |
| [LLVM DIEAbbrev reference](https://llvm.org/doxygen/classllvm_1_1DIEAbbrev.html) | Confirms native abbreviation and ULEB emission action. |
| [MLIR bytecode format](https://mlir.llvm.org/docs/BytecodeFormat/) | Specifies stable PrefixVarInt and indexed table/use-list encodings; current format freedom is not a gap. |
| [MLIR encoding source reference](https://mlir.llvm.org/doxygen/Encoding_8h_source.html) | Current source path for bytecode encoding/version. |
| [Microsoft ECMA-335 metadata API](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.metadata.ecma335?view=net-10.0) | Current reader/writer-facing coded-index API. |
| [Microsoft compressed integer API](https://learn.microsoft.com/en-us/dotnet/api/system.reflection.metadata.blobwriter.writecompressedinteger?view=net-6.0) | Binds compressed encoding to ECMA-335-II §23.2. |
| [AOSP Dalvik/DEX instruction formats](https://source.android.com/docs/core/runtime/instruction-formats) | Current format/ID reference; insufficient alone to claim D8/R8 writer absence. |

No source supports an absence claim. Each deep object has a current native writer/format action; the unclosed part is the whole writer/config union and an external complete N2 guarantee.

