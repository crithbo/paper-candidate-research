# Research-question candidate

## Identity

- ID: `S1-86-RQ01`
- seed: `S01` in `DIVERGENCE_SEED_POOL.md`
- exact anchor: POSIX.1-2024 cancellation-cleanup semantics and Linux man-pages 6.18 pthread interface.
- stable object/guarantee: fixed C pthread cleanup-stack program, handler side effects, lexical scope, LIFO invocation, and fixed thread termination status.
- contribution hypothesis: `COMPILER_TOOL / N2`, conditional only.

## Primary RQ

For a fixed C pthread program, cleanup-handler stack, cancellation request/cancellation-point trace, and observer-visible handler effects plus join status, can a target-specific constructor reduce cancellation cleanup cost by jointly changing handler execution placement while preserving POSIX LIFO scope order and terminal semantics?

No alternate RQ was added: rephrasing the time of handler execution would change the same fixed observable endpoint.

## Pre-evidence selection

- selected for ordinary closure: yes.
- primary route: POSIX current cancellation-cleanup text; current Linux pthread interface documentation.
- contrary test: distinguish a target-specific constructor from generic batching/controller or changed ordering.
- closure nomination: `ORDINARY_CLOSURE`; no selective packet used.
- outcome-aware reformulation: forbidden.
