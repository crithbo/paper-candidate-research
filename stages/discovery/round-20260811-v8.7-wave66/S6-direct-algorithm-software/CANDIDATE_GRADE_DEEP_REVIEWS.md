# Candidate-grade deep reviews — Wave66

| Family | current artifact/whole action | limitation-to-residual check | full-cost/fidelity/72h killer | decision |
|---|---|---|---|---|
| DuckDB sort | current external sort/run/merge produces fixed sorted relation | a limitation about data domain does not name a union-external constructor; “adaptive run policy” is config/controller. | Native SQL equality; charge sort CPU/RAM/temp bytes/merge. Killer: same result plus no full-cost Pareto. | DROP. |
| Velox aggregation | native hash/sort aggregation preserves fixed aggregate result | skew limitation leads to partition/control action, not whole same-object N2. | SQL equality; charge build/merge/spill/query cost. Killer: any changed aggregate/spill contract. | DROP. |
| Cranelift codegen | current IR lowering/regalloc/code emission | coverage limitation changes target/IR/object; local schedule is emitter patch. | executable/IR semantics; charge compile/runtime/code size. Killer: target or IR boundary changes. | DROP. |

No deep row is dropped for missing implementation, result, resources, or AI readiness. Each limitation fails only to become a named same-object union-external whole action.
