# Clang PCH/PCM current-source contract

## Same-object guarantee

The frozen input is a fixed C/C++ translation-unit or module DAG. The output is a matching-version PCH/PCM that stock Clang `ASTReader` loads with the same declarations, types, identifiers, source locations, modules, visibility and lazy-lookup behavior, and that produces equivalent downstream compilation output. Changing `ASTReader`, module semantics, or the AST graph is out of scope.

## Complete scoped writer/reader union at LLVM `3fe75b62…`

| protocol portion | writer side | reader side |
|---|---|---|
| block/record grammar | `ASTBitCodes.h`, `ASTWriter.cpp` emits block and record IDs | `ASTReader.cpp` enters/reads the same bitstream blocks/abbreviations |
| types and declarations | `ASTWriter::WriteDeclAndTypes`, type/decl records and `TYPE_OFFSET`/`DECL_OFFSET` arrays | `getLocalType`, `DeclCursorForID`, `ReadDeclRecord`, lazy `GetDecl` |
| identifiers and visible lookup | writer hash/identifier table and `IDENTIFIER_OFFSET`; lexical/visible declaration blocks | identifier-offset lookup, global/local declaration maps, visible declaration materialization |
| PCH/module composition | module offset maps, submodule metadata, chains and global module-index data | module manager, local-to-global ID/offset translation, transitive imports and global index |
| delayed bodies/updates | declaration update offsets and delayed context blocks | `LazyOffsetPtr`, pending bodies and declaration-update cursor jumps |
| current options | PCH container/reader plus language, preprocessor, header-search, target and codegen options at `ASTReader::ReadAST` | validation and module-cache compatibility are object-defining and included in the union |

Official design documentation confirms that AST files use `ASTReader` lazy deserialization and that module DAGs require local-to-global ID mappings: https://clang.llvm.org/docs/PCHInternals.html.

