# Bounded non-evidence seed pool

| ID | Engine | Perspective | Sketch | Disposition before evidence |
|---|---|---|---|---|
| S01 | COMPOSE_DECOMPOSE_SIMPLIFY | component-runtime engineer | Canonical ABI post-return preserves ownership cleanup after lowering. Is nested cleanup a fixed sequence or a same-semantics structured construction problem? | selected |
| S02 | JANUSIAN_TENSION | producer/consumer maintainer | A producer may allocate/lift a result while the consumer owns post-return cleanup. Does this split admit a whole-call-chain representation? | merged into S01 |
| S03 | CONSTRAINT_MANIPULATION | compiler engineer | The ABI's observable result must remain fixed even when cleanup state is coalesced or delayed. | merged into S01 |
| S04 | NEGATION_OR_INVERSION | formalist | If post-return remains independently callable at every boundary, proposed coalescing is illegal and the idea collapses. | merged into S01 |

Seeds were created before targeted lookup. They make no novelty, absence, or quality claim.
