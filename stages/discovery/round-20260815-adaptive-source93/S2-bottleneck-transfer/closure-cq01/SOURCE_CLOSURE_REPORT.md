# Source-closure report — S2-93-CQ01

- Assignment: `SOURCE-CLOSURE-SOURCE93-S2-CQ01-POSTGRESQL-EXPRESSION-TUPLE-DEFORM-JIT-V1`.
- Frozen object: one fixed PostgreSQL schema, tuples and SQL query executed with stock LLVM JIT, preserving SQL, transaction, expression, tuple-deform and result semantics and the same full-cost endpoint.
- Disposition: `UNRESOLVED_BACKLOG__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`.
- Authority: Discovery prebrief source closure only; no candidate, clean-brief, Q2, PASS, STOP or stage decision.

## Pin and bounded result

`postgres/postgres` master was pinned to `7e6e294e4e451c55c52caa1ff68df9858912d066` (2026-08-14T20:27:16Z). Five official responses were retained (159,471 bytes); the sixth frozen SQL carrier path returned HTTP 404. That is path-drift telemetry only: no substitute route was used and no absence conclusion is made.

## Visible stock action union

The retained current files expose expression JIT compilation (`llvmjit_expr.c`), tuple-descriptor-specific generated deform functions (`llvmjit_deform.c`) and the LLVM JIT provider/context/module pipeline (`llvmjit.c`). In particular, tuple deforming is already generated from compile-time descriptor knowledge, including fixed widths and nullability. These are concrete subtractors for an ordinary expression-JIT/deform JIT fusion or a controller around existing LLVM module/context choices.

The bounded material does not include the frozen SQL carrier, two complete same-query expression-plus-deform plans with a candidate-specific action difference, or a union-external PostgreSQL action and finite guarantee. Thus generic IR/code-block/layout/controller objections cannot be resolved responsibly, and candidate-grade input is not frozen.

## Closure debt

Freeze a direct official current SQL carrier path at one pin; define two complete stock-legal plans with unchanged SQL/result/transaction semantics; enumerate their expression/deform actions against the current union; then state a finite guarantee and full cost (JIT setup/optimization, module/context lifetime, code bytes, tuple/deform runtime, query runtime and memory) plus a falsifier rejecting current-union expressibility or semantic drift.
