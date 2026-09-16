# Source60 S6 — RQ candidates frozen before source lookup

## S60-RQ01 — GCC shrink-wrap frame-state construction

- Seed: `S01`.
- Tentative object: fixed GCC function CFG, target ABI/unwind rules, callee-save set and stock execution/unwinding semantics.
- Anchor question: does current GCC express a whole-function choice of entry/exit frame-state regions beyond its shrink-wrap and separate-shrink-wrap action union, leaving a target-ABI-specific bounded constructor and guarantee?
- Primary RQ: For a fixed ABI, MachineFunction CFG and callee-save obligations, can a bounded cut/interface constructor jointly place prologue, epilogue and CFI-visible frame-state transitions with a target-specific exact/FPT or certified Pareto guarantee beyond GCC's current shrink-wrap composition, while preserving execution and unwinding semantics?
- Excludes: flag selection, changed ABI/unwind rules, generic CFG scheduling, register allocation replacement, and source-code changes.
- Carrier/oracle route: a public GCC regression or target ABI test plus stock execution/unwind oracle.
- Precommitted source route: official GCC optimize documentation and current GCC source; primary backend/unwind literature only for subtraction.
- Pre-RQ closure: `ORDINARY_CLOSURE`; selected for bounded source closure.

## S60-RQ02 — GHC pattern-match decision construction

- Seed: `S05`.
- Tentative object: fixed Haskell module, language/coverage semantics and stock GHC compiler result.
- Anchor question: does the current pattern-match compiler leave a non-generic joint decision-tree/strictness constructor with a formal guarantee, rather than ordinary decision-tree heuristics?
- Primary RQ: For a fixed typed pattern matrix and Haskell semantics, is there a language-specific bounded-state constructor that jointly selects tests and strictness/coverage representation with a non-generic exact/FPT or certified guarantee beyond current GHC compilation?
- Excludes: parser changes, changing accepted programs, generic decision-tree compression and emitter patches.
- Carrier/oracle route: public GHC testsuite patterns and compiler diagnostics/semantics.
- Precommitted source route: official GHC compiler source/docs and primary pattern-match literature.
- Pre-RQ closure: `ORDINARY_CLOSURE`; selected as independent control.

No alternative RQ was added: each has a stable single-object envelope.  S02 is not a reserve candidate unless an identity-only repetition invalidates a selected RQ before source evidence is interpreted.
