# Raw screen row events

| Row | First-party evidence | Frozen fact / action implication | Outcome |
|---|---|---|---|
| R1 | LLVM Coverage Mapping Format | The mapping stream contains file mappings, counter expressions, and mapping regions. Counter expressions are binary add/subtract nodes indexed from the expression array. | retain for depth |
| R2 | LLVM format + writer source | Counters encode zero, profile counter, subtraction expression, or addition expression in a LEB representation; regions refer to counters/expressions and are source-location ordered. | retain for depth |
| R3 | LLVM `CounterExpressionBuilder` and `CoverageMappingWriter` source documentation | Current producer has a native expression-building and writing path, not merely an unconstrained byte emitter. It is a mandatory same-object comparator component. | retain for depth |
| R4 | LLVM `llvm-cov` guide | `-fprofile-instr-generate` and `-fcoverage-mapping` form the stock instrumentation/reader route. Relevant coverage/MC/DC and writer-option paths still require a pinned source-path audit before an absence conclusion. | retain as closure gap |
| R5 | Primary-source collision screen | No first-party evidence presently identifies a union-external, whole-DAG coverage-map constructor with an independently stated guarantee. The search is not a novelty proof. | `NOT_ADMITTED_UNFROZEN` |

Rows R1–R4 are sources, not experimental observations. No claim that LLVM lacks a particular global factoring action is made.
