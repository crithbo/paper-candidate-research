# Source94 S5 RQ

## S5-94-RQ01

- Anchor: Racket raco make dependency files and API for making bytecode, current official documentation.
- Fixed object: source module plus compiled zo/dep files and stock compilation-manager load behavior, with unchanged Racket module/bytecode semantics.
- Primary RQ: is there a target-native exact online bounded-recourse constructor for Racket compilation-dependency state outside the current timestamp/hash, transitive dependency, and compiler/cm caching union?
- Out of scope: changed bytecode or module loading semantics, generic DAG scheduling, timestamp threshold tuning, or an external cache.
- Falsifier: compiler/cm already contains a caching managed-compile action retaining timestamp information across calls while applying the same manager rules.
- Routes: https://docs.racket-lang.org/raco/Dependency_Files.html ; https://docs.racket-lang.org/raco/API_for_Making_Bytecode.html.
- Disposition: RQ_READY_FOR_ORDINARY_CLOSURE.
