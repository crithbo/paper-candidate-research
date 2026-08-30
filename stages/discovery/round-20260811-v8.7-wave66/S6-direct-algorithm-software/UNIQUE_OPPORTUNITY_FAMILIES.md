# Wave66 unique families

| Family | fixed object/oracle | current union | natural artifact | outcome |
|---|---|---|---|---|
| DUCKDB-SORT | fixed relation to sorted rows | native sort/run/merge | public tables | DROP |
| VELOX-AGG | fixed relation to aggregate result | native hash/sort aggregate union | public query tables | DROP |
| CRANELIFT-CODEGEN | fixed IR to code semantics | current lowering/regalloc/codegen union | Wasmtime tests | DROP |
| DATAFUSION-PLAN | fixed query to SQL result | optimizer/execution union | public SQL suites | DROP |
| TIKV-COMPACTION | fixed KV state to reader result | LSM compaction union | public KV traces | DROP |
| CPSAT-MODEL | fixed model to exact feasibility/objective | solver/presolve union | public models | DROP |
