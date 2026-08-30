# Source-closure report — Batch1 Item1 / S5-96-CQ01

## Scope and disposition

- Assignment: `SOURCE-CLOSURE-RESUME-BATCH01-ITEM01-SOURCE96-S5-PERSISTENT-TERM-V1`.
- Frozen identity: Erlang/OTP `OTP-29.0.1`, fixed `persistent_term` API and constant-time lookup semantics, preserving update/delete visibility, process/VM termination behavior, and the stated full-cost endpoint.
- Disposition: `UNRESOLVED_BACKLOG__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`.
- Authority: source closure only; this is not a candidate, clean-brief, Q2, PASS, STOP, or stage decision.

## Immutable pin and bounded acquisition

The official `OTP-29.0.1` tag resolved to `f26c7e590c5d1b3afa0dee38093442df117822e3`. One official recursive tree deterministically selected the smallest ERTS loci for the required ownership boundaries: `erl_bif_persistent.c`, `erl_global_literals.c`, and `persistent_term_SUITE.erl`; the specified official documentation route was also retained. Six of eight permitted official calls were consumed. Persisted response bytes were 3,476,163, below the 32 MiB envelope.

The documentation endpoint currently identifies itself as OTP 29.0.5, not OTP 29.0.1. It is therefore recorded as official API/reclamation-context telemetry, not as proof that defaults or controls at the exact tag are identical.

## Current union and witness route

The pinned ERTS code exposes a serialized persistent-term update path with copy-table contexts, update permission, scheduled deletion, table/tuple deletion and trapping put/erase states. The literal source exposes a globally locked bump allocator and literal-area registration. The in-tree suite supplies a two-process route: a complex term is placed, erased or replaced; a process retaining a pointer is checked to have the old term copied through its heap scan/fullsweep path while later lookups observe the new/erased value.

The official documentation describes lock-free constant-time lookup, hash-table copying on updates, and global garbage collection/copying for deleted complex terms. It also distinguishes one-word values and describes the `+MIscs` literal reservation option, which is a reservation control rather than evidence of a distinct reclamation action.

## Closure boundary

The retained union is a strong subtractor for a proposal that merely schedules the existing global scan/copy/deletion protocol, changes literal-area reservation, or wraps the current update permission/table-copy machinery. But the frozen queue does not name an exact union-external BEAM-native versioned-literal action, a fair information boundary, or a finite guarantee. Nor does it freeze a complete alternative two-plan construction differing only in that action. A generic epoch/lifetime-controller objection is consequently unresolved—not assumed fatal.

## Finite falsifier and full-cost route

A future, separately authorized candidate-grade route must use the retained two-process carrier to reject any construction that changes lookup/update visibility, leaves retained old literals unreconciled, changes process/VM termination behavior, or is expressible by current global scan/copy/table deletion actions. Its ledger must include update CPU/latency, process scan or deferred work, retained literal memory/literal area/peak RSS, lookup cost, and recovery/termination semantics.
