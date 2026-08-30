# Divergence seed portfolio

Generated offline before evidence lookup; these entries are not evidence or novelty claims.

| ID | engine | perspective | conclusion-first test | disposition |
|---|---|---|---|---|
| S01 | `JANUSIAN_TENSION` | runtime engineer | Can thread-specific storage cleanup cost fall without changing thread-lifetime destructor effects? | keep |
| S02 | `NEGATION_OR_INVERSION` | application maintainer | What changes if a TSS destructor runs at key deletion rather than thread exit? | merge S01 |
| S03 | `CONSTRAINT_MANIPULATION` | compiler/runtime engineer | Can destructor iterations be jointly scheduled with same TLS lifetime semantics? | merge S01 |
| S04 | `ABSTRACTION_LADDER` | theorist | Does bounded destructor iteration produce a target-specific scheduling residual? | merge S01 |
| S05 | `COMPOSE_DECOMPOSE_SIMPLIFY` | operator | Can a global cleanup manager release per-thread values? | controller risk |
| S06 | `BISOCIATION_STRUCTURAL_TRANSFER` | measurement reviewer | Can `exit` reclaim current-thread TSS without ending the thread? | changed lifetime risk |

C01 (S01–S04) selected through S01; C02 generic/changed contract. Engines used: 5; coverage advisory `PASS`.
