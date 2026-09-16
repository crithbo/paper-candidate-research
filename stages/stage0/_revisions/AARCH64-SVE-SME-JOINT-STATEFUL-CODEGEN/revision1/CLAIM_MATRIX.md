# Claim matrix

| ID | Claim | Static evidence | Status / ceiling | Falsifier or StageA gate |
|---|---|---|---|---|
| C1 | The object fixes IR attributes, ABI/interface, features, and reader/toolchain semantics. | LLVM SME guide and AAPCS64; revision contract. | `CLOSED_STATIC` | Any trace requiring changed attributes, N/S/SC class, ZA ownership, or custom ABI fails. |
| C2 | Same-interface native action divergence exists. | Current source implements `ACTIVE -> LOCAL_SAVED`, TPIDR2 setup/lazy save, `LOCAL_SAVED -> ACTIVE` restore, plus fixed SM transition lowering; diamond construction retains those actions. | `CLOSED_STATIC__WITNESS_NOT_EXECUTED` | Tiny native oracle/assembler rejects either trace or shows changed interface. |
| C3 | The current visible selector is not itself a complete certified joint frontier. | Current source uses deterministic bundle state selection with `ACTIVE` conflict fallback and local insertion; it has no declared Z/P/TPIDR2 Pareto guarantee. | `CLOSED_STATIC__NO_ABSENCE_INFERENCE` | Full pinned union emits/certifies the same frontier: direct absorption. |
| C4 | SAP-FDP is an exact, target-specific FPT Pareto method on the bounded class. | Explicit action grammar, complete state, trace/path bijection, target-specific merge predicate and recurrence. | `CLOSED_STATIC__BOUNDED_ONLY` | Missing action, invalid merge, or cap exceeded.  Unbounded class has no guarantee. |
| C5 | It exceeds generic RA/scheduling/ILP. | State and action semantics require SM/ZA/TPIDR2, AAPCS64, SVL scalable whole spills, and LLVM transition grammar. | `CONDITIONAL_N2` | Removing those components leaves only generic RA/ILP or an identity enumeration. |
| C6 | A finite, same-object fidelity route exists. | Immutable-source pin, tiny exhaustive oracle, stock toolchain validation, natural annotated IR/MIR corpus, and full-cost comparator plan. | `CLOSED_PLAN__STAGEA_REQUIRED` | Native action/table mismatch, comparator mismatch, or direct union collision. |
| C7 | Natural benefit, performance, and implementation are established. | None; not required at Stage0. | `NOT_CLAIMED` | Not a STOP premise. |

## Pre-registered decision rule

Proceed only to independent closing with `TIER_B_Q2_VIABLE` conditional potential.  Closing must return `CONFIRM_STAGE0_PASS` only if it accepts C1–C6 and preserves the ceiling.  It must stop for a real same-object/action/guarantee failure, especially the registered sentinel, rather than for absent implementation or performance results.  No further revision is available.
