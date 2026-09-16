# Source-closure report — S2-91-CQ01

## Scope and disposition

- Assignment: `SOURCE-CLOSURE-SOURCE91-S2-CQ01-CPYTHON-ADAPTIVE-CACHE-LAYOUT-SPECIALIZATION-STATE-V1`
- Frozen object: one fixed Python source module and input executed by stock CPython with unchanged bytecode, language, exception, adaptive-specialization, deoptimization and output semantics, and the same full-cost endpoint.
- Disposition: `UNRESOLVED_BACKLOG__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`.
- Authority boundary: this is a Discovery prebrief source closure only. It does not decide a candidate, clean brief, Q2 shape, PASS, STOP, or stage state.

## Immutable pin and bounded acquisition

Official `python/cpython` default branch `main` was pinned to `dffac6163e693cf80ed42cdc8e2cb5c0cb9577d7` (committer date 2026-08-14T21:17:23Z). All four source and carrier calls used this same SHA. Six precommitted official calls completed successfully; their persisted response total is 536,434 bytes, below the 16 MiB cap.

## Bounded current-union findings

The retained sources expose a substantial stock baseline.

- `pycore_code.h` defines adaptive code units and opcode-specific inline-cache record shapes. It states that cache-entry-count changes require matching opcode metadata updates.
- `specialize.c` initializes cache counters during quickening, reads opcode cache counts, changes opcodes to specialized forms, uses atomic opcode updates where appropriate, and maps specialized opcodes back through the deoptimization table.
- `bytecodes.c` declares opcode families, cache-entry arities, specializing operations and `DEOPT_IF` conditions. These are current action surfaces, not merely a generic interpreter abstraction.
- `test_dis.py` provides stock in-tree quickening carriers and checks quickened adaptive disassemblies after the specialization threshold, including super-instructions, attribute specialization and calls.

The retained carrier distinguishes ordinary and quickened executable states, but it does not supply two complete, alternative legal **cache-layout-plus-specialization-state** plans whose only difference is a candidate joint construction. Nor does the frozen queue name a union-external CPython action or finite exact/FPT/approximation/certified guarantee against the complete stock action union. Hence candidate-grade input cannot be responsibly frozen from this bounded material alone.

## Bounded collision and generic objection

Current inline-cache layouts, quickening, specialization, counters, backoff and deoptimization are direct subtractors for a proposal that simply retunes these existing controls or re-emits their state machine. A generic cache-layout packing/state-controller objection remains open because the necessary candidate action, legal two-plan divergence, information boundary and guarantee are not fixed in the queue. This is not an absence claim and not a structural-fatal conclusion.

## Closure debt for a later authorized route

1. Freeze one concrete CPython-specific joint action over a fixed code object, preserving all frozen language and deoptimization semantics.
2. Produce two complete stock-legal plans with the same bytecode and external behavior but different cache-layout/specialization state construction, and enumerate the stock action union that fails to express the distinction.
3. State a finite guarantee plus a complete cost ledger: compile/quickening overhead, cache bytes, specialization/deoptimization transitions, interpreter runtime and any metadata/update cost.
4. Use the retained in-tree carrier as a possible semantic oracle, with a falsifier rejecting the route if the action is expressible by current cache metadata/state controls or either plan changes the frozen semantics.
