# Divergence seed portfolio

Generated offline before source lookup; none is evidence or a novelty claim.

| ID | engine | perspective | conclusion-first test | disposition |
|---|---|---|---|---|
| S01 | `JANUSIAN_TENSION` | runtime engineer | Can dynamic-object unload cost fall without weakening destructor/refcount/address-space semantics? | keep |
| S02 | `NEGATION_OR_INVERSION` | library maintainer | What fails if a destructor runs before the final `dlclose` release? | merge S01 |
| S03 | `CONSTRAINT_MANIPULATION` | operator | Can dependency closure be jointly scheduled while preserving same `dlclose` visibility? | merge S01 |
| S04 | `ABSTRACTION_LADDER` | theorist | Is shared-object unload a target-specific graph algorithm beyond refcounting? | merge S01 |
| S05 | `COMPOSE_DECOMPOSE_SIMPLIFY` | end user | Can an external plugin manager release objects? | generic controller risk |
| S06 | `BISOCIATION_STRUCTURAL_TRANSFER` | measurement reviewer | Can object residency be reduced without changing whether symbols remain mapped? | changed endpoint risk |

| cluster | seeds | representative |
|---|---|---|
| C01 refcount/destructor/unload visibility | S01–S04 | S01 |
| C02 external residency policy | S05–S06 | none |

Selected seed: S01. Engines used: 5. Coverage advisory: `PASS`.
