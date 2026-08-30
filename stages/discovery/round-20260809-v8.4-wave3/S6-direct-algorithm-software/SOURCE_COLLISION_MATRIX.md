# S6 Wave 3 — source and collision matrix

All retrievals were checked through 2026-08-09 and use paper-original or official/upstream sources.  No experiment was run.

| ID | Exact object | Artifact and natural carrier | Strong fair baseline | Latest collision / evidence | Classification | Decision |
|---|---|---|---|---|---|---|
| `PB-DELETE-SCHEDULE` | Construct checked core-deletion order/batches for a fixed MaxPre WCNF→WCNF equioptimal proof trace | MaxPre, VeriPB/CakePB, MaxSAT Evaluation and PB Competition instances | Trace-order checked deletion; stable/greedy legal order; exact small-trace ceiling | IJCAR 2024 certified preprocessing already uses checked deletion; VeriPB 3.0 implements/checks it; PB 2025 documents checked/unchecked cost tradeoff.  No schedule-construction algorithm found in bounded search. | `DIRECT_SUBTRACT` for rule/checker; residual `SEARCH_BOUNDED_OPEN` | **One `PROPOSE_STAGE0`, Tier B.** |
| `W3-D1` | Dynamic radix-bit choice for DuckDB external aggregation | DuckDB source, TPC-H/benchmark runner | Current DuckDB v1.5.1; fixed-radix historical path | Official v1.5.1 release records “Dynamically determine radix bits for external aggregation.” | `DIRECT_FATAL` | Drop: exact algorithmic object already upstream. |
| `W3-D2` | Generic optimizer that reports/selects slow query plans | DuckDB / DataFusion query corpora | Current optimizers; plan-guidance testing; native profiler | Existing plan-guidance testing and production optimizer routes; unfreezed residual becomes benchmark/diagnostic controller. | `WRAPPER_CONTROLLER` | Drop. |
| `W3-D3` | Faster generic VeriPB/Lean certificate import/checking | VeriPB, CakePB, PBLean, competition proof files | VeriPB 3.0; CakePB; PBLean reflection | PBLean 2026 supports all VeriPB kernel rules and native reflected execution; recent VeriPB release improves propagation/checking. | `DIRECT_SUBTRACT` | Drop: no fixed nontrivial algorithm residual. |
| `W3-D4` | Online trimming of Z3 proof logs | Z3 source and solver logs | Z3 proof trim/self-validator | Z3 release notes explicitly list online trimming as open functionality; no natural same-object contract/algorithm was frozen. | `FUTURE_WORK_ONLY` | Drop: limitation sentence is not a candidate. |

## Semantic and full-cost boundary

For `PB-DELETE-SCHEDULE`, a valid comparison fixes the input, transformation trace, output WCNF/objective, and certificate contract.  It counts proof construction/elaboration/checking CPU, peak memory, bytes, disk I/O, and timeout outcomes.  Faster unchecked deletion is weaker for solution/equioptimality claims and cannot be a same-quality win.  No cross-object universal union is allowed.
