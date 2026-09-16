# Cross-lane / registry de-duplication

Excluded before review: the accepted V8 snapshot proposal; FlatBuffers, Cap’n Proto, EROFS, GNU ld, LLVM APX/RVV, Arrow/Parquet, all DB/checked-certificate/ELF/PDB/DWARF/DEX/JVM/Lean/pyc/CDS/bitcode objects, and every active or terminal registry object. None of the six rows below renames an excluded object.

The selected scope is compiler/runtime reader artifacts whose size, import/load latency and reader RSS make a changed hard objective meaningful: Clang PCH/PCM, Rust rmeta, ICU `.dat`, Qt QML cache, Go unified export data, and GNU MO.

