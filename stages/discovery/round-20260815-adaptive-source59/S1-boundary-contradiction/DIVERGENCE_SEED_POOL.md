# Bounded non-evidence seed pool

| ID | Engine | Perspective | Sketch | Pre-evidence disposition |
|---|---|---|---|---|
| S01 | BOUNDARY_OR_FAILURE | runtime/loader engineer | A TLS descriptor crosses compiler relocation, dynamic resolver, thread state, and `dlclose` lifetime. Could a same-ABI construction choose legal resolver/materialization states globally rather than per descriptor? | selected |
| S02 | COMPOSE_DECOMPOSE_SIMPLIFY | linker engineer | Descriptor-call relaxation and module lifetime are usually considered separately. Does their composition leave a formally constrained action? | merged into S01 |
| S03 | JANUSIAN_TENSION | operator | Cached resolution reduces hot-path cost but may preserve state past module visibility changes. | merged into S01 |
| S04 | NEGATION_OR_INVERSION | formalist | If the ABI/resolver makes every descriptor lifecycle uniquely determined, a global construction has no legal action space. | merged into S01 |

The seed pool contains no network-security, exploit, or vulnerability topic.
