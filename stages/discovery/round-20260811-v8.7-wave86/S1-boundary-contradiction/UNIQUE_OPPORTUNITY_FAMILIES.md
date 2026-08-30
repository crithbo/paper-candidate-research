# UNIQUE_OPPORTUNITY_FAMILIES

| Family | Same-object contract / atomic action | Strongest union and natural route | Status |
|---|---|---|---|
| Rust | Same safe API behavior; prove/discharge unsafe obligations at a fixed boundary. | Compiler safety model, unsafe blocks and native codegen; public Rust crates; compile/runtime/memory/behavior. | Deep |
| LLVM | Same IR semantics for well-defined executions; transform deferred-UB values. | LangRef lattice, `freeze`, verifier and legal optimizer transformations; LLVM tests/IR corpus; compile/runtime/IR equivalence. | Deep |
| VarHandle | Same shared-variable result and fixed ordering guarantee; choose implementation action. | Native access modes/fences; concurrent Java workloads; throughput, allocation, contention and linearizability/order. | Deep |
| TypeScript | Same project diagnostics/types under strict null contract. | Current checker; public TS projects; check/emit/memory/error set. | Drop |
| PostgreSQL RLS | Same query result/authorization predicate. | Current policy composition; database workloads; planning/execution/result/authorization. | Drop |
| OpenSSL FIPS | Same requested provider assurance and cryptographic result. | Provider/property mechanism; crypto workloads; init, dispatch, runtime, assurance. | Drop |
