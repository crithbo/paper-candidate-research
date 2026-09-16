# Source55 S5 RQ candidates

Each primary RQ was frozen before the decisive official-source check. No
alternative was added because there was no genuine same-object scope ambiguity.

## S55-01: OCaml separate compilation

- Exact public anchor: OCaml 5.3 reference manual and compiler-backend
  documentation, current public release documentation.
- Stable object/guarantee: a fixed OCaml module graph with the same cmi/cmx
  interface and linked-program semantics.
- Primary RQ: Can a bounded-recourse constructor maintain compatible cmi/cmx
  compilation artifacts across a versioned module-edit sequence while improving
  full compile, interface-read, link, bytes, and memory cost, without merely
  choosing a build order?
- Primary route: official OCaml compiler documentation; fallback is transport
  only.
- Result: RQ_READY_FOR_ORDINARY_CLOSURE, then LOCATOR_ONLY.

## S55-02: Racket compiled modules

- Exact public anchor: Racket Reference, Evaluation and Compilation, current
  public documentation.
- Stable object/guarantee: a fixed Racket module and the same stock module
  declaration/load result.
- Primary RQ: Can a bounded-recourse compiled-module constructor preserve stock
  zo loading and declaration semantics across versioned source revisions while
  improving rebuild and load cost without changing the loader contract?
- Primary route: official Racket reference; fallback is transport only.
- Result: RQ_READY_FOR_ORDINARY_CLOSURE, then STRUCTURAL_DROP.

## S55-03: Idris 2 incremental generation

- Exact public anchor: Idris 2 Incremental Code Generation documentation,
  current public documentation.
- Stable object/guarantee: a fixed Idris package graph and the same executable
  observable results for a fixed backend.
- Primary RQ: Can a whole-constructor with bounded recourse retain the current
  incremental-build semantic contract while improving edit-to-executable
  full-cost without merely assigning compiler mode per module?
- Primary route: official Idris 2 documentation; fallback is transport only.
- Result: RQ_READY_FOR_ORDINARY_CLOSURE, then LOCATOR_ONLY.

