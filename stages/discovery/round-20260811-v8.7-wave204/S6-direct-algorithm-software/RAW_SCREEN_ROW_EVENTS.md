# Raw screen row events

| Row | Primary evidence | Question | Finding |
|---|---|---|---|
| R1 | Current `BytecodeWriter.cpp` | How does the writer assign string IDs? | `StringSectionBuilder::insert` assigns a MapVector insertion index and deduplicates equal strings; write order is that insertion order. |
| R2 | Current `BytecodeWriter.cpp` | Are table IDs used in native encodings? | Yes. Dialect writer emits numbering-state numbers for attributes, types, and resource handles; strings are emitted through their table index. |
| R3 | Current `BytecodeWriter.cpp` | Does the stock writer already use sharing? | Yes. Properties are serialized and bytewise deduplicated; string values are shared. |
| R4 | MLIR bytecode specification | Are IDs merely fixed-width local fields? | No. many references, section sizes and relative offsets use varints; attributes/types and resources use offset tables and dialect grouping. |
| R5 | Current config/source and official format | Is the full producer/config union closed? | No. writer options include bytecode version, resource/location elision, dialect-version map, custom attr/type callbacks, and external resource printers; dialect custom encodings may introduce further actions. |
| R6 | Bounded primary collision search | Is a same-object global MLIR bytecode table planner already or not already a direct collision? | Not closed. No absence or novelty conclusion is made. |
