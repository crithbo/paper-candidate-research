# Cross-lane and registry de-duplication

Registry and plan were read under `RULE_FREEZE.md`. The following are excluded before scoring: ELF/PDB/DWARF/DEX/JVM/Lean/pyc/CDS/LLVM bitcode; active Arrow IPC and Parquet work; S1's OPA-Wasm constructor line; SQLite B-tree/RTREE/FTS work; checked-proof families from S4 Wave199; and every terminal/blocked topic recorded by the registry.

The retained families below are distinct artifact contracts: generic core Wasm module emission, .NET ReadyToRun assemblies, Erlang BEAM files, V8 startup snapshots, GNU gettext MO catalogs, and IANA TZif zoneinfo. They are not proposed as re-named versions of excluded objects. The Wasm row is retained only as a generic specification/engine contract and is explicitly not OPA policy Wasm.

