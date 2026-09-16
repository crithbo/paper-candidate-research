# Cross-lane / registry de-duplication

This is distinct from the terminal Mach-O chained-fixups graph line (Wave168): the present object is only a fixed dylib export set and its export-trie / `__LINKEDIT` serialization. It does not revive Wave168, change dyld fixups, or alter the input export contract.

The registry additionally excludes all active/terminal ELF, PDB, DWARF, DEX, JVM, Lean, pyc, CDS, bitcode, Arrow/Parquet, database, checked-certificate, and prior S4 artifact-constructor objects. No other lane's active object has been reused.

