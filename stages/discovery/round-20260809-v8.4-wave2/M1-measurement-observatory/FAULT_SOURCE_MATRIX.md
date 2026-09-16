# Real fault, source, and collision matrix

## Frozen-source ledger

| ID | Object and source type | Upstream fact used | Role in this wave | Evidence status |
|---|---|---|---|---|
| C1 | LLVM issue [#170026](https://github.com/llvm/llvm-project/issues/170026) | A labelled C99/codegen/miscompilation report with two C translation units and an `-O3 -g` end-to-end reproducer. | Genuine compiler-fault anchor. | Direct upstream issue; inspected, not executed. |
| C2 | [llvm-reduce command guide](https://www.llvm.org/docs/CommandGuide/llvm-reduce.html) | Generic reduction driven by an interestingness test, including invalid-reduction handling. | Current reducer baseline. | Official LLVM documentation. |
| C3 | [Alive2 upstream repository](https://github.com/AliveToolkit/alive2) | Translation validation tools/plugins for LLVM `opt` and Clang, plus counterexample-oriented diagnosis; documented scope limitations include no inter-procedural transformations. | Current semantic-validation baseline and scope boundary. | Official project artifact. |
| D1 | DuckDB issue [#21514](https://github.com/duckdb/duckdb/issues/21514) | Title records an ASOF LEFT join empty-right correctness regression. | Genuine DB-regression anchor. | Direct upstream issue; inspected, not executed. |
| D2 | [DuckDB official releases](https://github.com/duckdb/duckdb/releases/) | Release note records “Fix #21514: ASOF join empty right.” | Upstream corroboration that D1 was fixed. | Official release metadata. |
| D3 | [SQLancer repository](https://github.com/sqlancer/sqlancer) | Multiple differential/metamorphic/oracle approaches, generated repro logs, and reducer integration. | Primary current DB-testing/reduction baseline. | Official project artifact. |
| D4 | [SQLancer++ paper](https://arxiv.org/abs/2503.21424) | Adaptive test generation across 17 DBMSs; reports 195 unique bugs. | Latest strong collision for adaptive DB testing. | Original paper record. |
| D5 | [SQLxDiff paper](https://arxiv.org/abs/2501.01236) | Differential testing for emerging SQL-like DBMSs. | Independent differential-testing collision. | Original paper record. |
| D6 | [Squirrel paper](https://arxiv.org/abs/2006.02398) | Validity- and coverage-guided database-engine testing. | Independent input-generation collision. | Original paper record. |

## Candidate-shape collision assessment

| Considered same object | N-route that would be required | Strong current comparison | Collision / residual outcome | Disposition |
|---|---|---|---|---|
| LLVM source-to-IR contract-preserving reducer and semantic oracle | N1 predicate/representation or N3 stable multi-fault property, not generic shrinking | llvm-reduce; Alive2 within its documented scope | C1 is only one genuine fault. Existing tools absorb generic interestingness-based reduction and IR translation validation; no unabsorbed multi-fault property is evidenced. | `DROP_NOT_PROPOSED` |
| DuckDB/DB regression differential evidence reducer | N1 semantic evidence object or N2 reduction/oracle algorithm with a new reusable equivalence class | SQLancer, SQLancer++, SQLxDiff, Squirrel | D1/D2 establish one real regression, while the generic oracle/reducer/generator structure is already directly occupied. No new shared semantic class or full-cost residual was evidenced. | `DROP_NOT_PROPOSED` |

## Fairness and evidence limits

- No baseline was omitted merely because it is inconvenient: llvm-reduce/Alive2 and the SQLancer family are the named current strong comparisons for the two same-object shapes.
- No claim is made that Alive2 covers C1 end-to-end: its upstream documentation explicitly limits it at IR transformation scope. That scope gap alone is not a contribution; it would require a verified family and a new mechanism.
- No claim is made that SQLancer directly reproduces D1. The collision is at the proposed generic differential/reducer mechanism, not an unsupported assertion that it has already found this exact issue.
- All source facts are bounded at 2026-08-09. Artifact pages are treated as metadata/evidence of capability, not as executed results.
