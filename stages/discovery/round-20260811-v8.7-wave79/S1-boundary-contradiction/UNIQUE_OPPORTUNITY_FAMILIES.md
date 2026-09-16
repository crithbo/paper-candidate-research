# UNIQUE_OPPORTUNITY_FAMILY register

| Family | Atomic action / same-object guarantee | Current strongest union | Natural carrier and full cost | Status |
|---|---|---|---|---|
| LLVM bitcode | Decode/upgrade one compatible bitcode construct while preserving specified IR semantics and reader acceptance. | Current reader/writer/parser, compatibility maintenance and IR verifier. | Upstream bitcode tests and compiler-produced modules; bytes, decode/upgrade/verify, optimization, memory and IR/result equivalence. | Deep. |
| glibc ELF | Resolve one versioned symbol reference in a frozen link map without changing ABI/version/namespace semantics. | Native dynamic linker lookup, version tables, `NEEDED`, namespace and binding rules. | ELF binaries/shared objects; load/relocation, startup, memory, bindings and ABI observables. | Deep. |
| JVM class files | Check/load a fixed class-file version with fixed preview and verifier rules. | JVM class-format/version parser and verifier. | Public Java bytecode/jar artifacts; parse/verify/link/load/runtime, memory and result/error. | Deep. |
| PostgreSQL | Produce/consume a supported logical dump preserving fixed database state. | `pg_dump`/restore/upgrade tools and documented formats. | Public PostgreSQL databases; scan/dump/restore/compression/I/O/state equivalence. | Drop. |
| Python pickle | Encode/decode a fixed object graph under a fixed protocol. | Native protocol implementations and compatibility rules. | Public Python objects/test corpus; serialize/deserialize/bytes/memory/object equivalence. | Drop. |
| Rust editions | Bridge fixed crate semantics across editions. | Compiler edition semantics and migration/lint tooling. | Public crates; parse/typecheck/diagnostics/artifacts/migration cost. | Drop. |
