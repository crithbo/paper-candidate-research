# Candidate-grade deep reviews

## D1 — ANTLR serialized-ATN constructor: `NOT_ADMITTED_UNFROZEN`

Fixed object is grammar/language and parser behavior under the target ANTLR runtime deserializer. A theorem seed is a version-compatible ATN serialization size/load bound, with a witness of two deserializable ATNs that preserve parsing. Current generator/runtime/version controls and direct parsing-automata collision closure are unpinned. Generic grammar/table compression is excluded. Killer: version-pinned grammar, two generated artifacts, deserialization/parse equality and generation/load/parse CPU-RSS/bytes ledger.

## D2 — Java StackMapTable construction: `NOT_ADMITTED_UNFROZEN`

Fixed object is class behavior, bytecode semantics and stock JVM verification/execution. A theorem seed is a bounded verification-metadata construction with a regenerated-reference witness. Current compiler/bytecode writer/verifier/default-nondefault union and primary direct collision are unpinned. Generic bytecode packing and changed verifier semantics are excluded. Killer: version-pinned class, two verifier-accepted outputs, execution equality and compile/verify/load CPU-RSS/class-byte ledger.

## D3 — Bison LR parser-table construction: `NOT_ADMITTED_UNFROZEN`

Fixed object is grammar language and generated parser acceptance/output. A theorem seed is an exact/FPT parser-table state/action construction bound, witnessed by two generated tables accepted by the same parser runtime. Current Bison generator/options and direct parser-table literature remain unclosed; generic automata/table compression is excluded. Killer: version-pinned grammar, exact parse suite equality and generation/parse CPU-RSS/table-byte ledger.

No row yet has the required complete source union, direct collision matrix and non-generic complete target-specific theorem; no brief is admitted.
