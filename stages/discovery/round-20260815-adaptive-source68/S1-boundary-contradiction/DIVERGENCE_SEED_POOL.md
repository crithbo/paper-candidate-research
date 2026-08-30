# Source68 divergence seed pool

Offline non-evidence pool, completed before source lookup.

| ID | Engine / perspective | Sketch | Anchor | Disposition |
|---|---|---|---|---|
| S68-SEED01 | `JANUSIAN_TENSION`; kernel/runtime engineer | `futex_waitv` couples all-or-nothing enqueue with “wake on any” result visibility. Could a same-object vector construction improve registration cost without changing returned-index/wake semantics? | Linux futex2 docs + current waitwake source | `KEEP_FOR_CONVERGENCE` |
| S68-SEED02 | `BOUNDARY_OR_FAILURE`; compiler engineer | A signal handler resumes a suspended coroutine through a frame whose lifetime is only partly visible. | C++ coroutine ABI | `KEEP_FOR_CONVERGENCE` |
| S68-SEED03 | `COMPOSE_DECOMPOSE_SIMPLIFY`; systems operator | A process gets a pidfd capability before another component observes exit. | Linux pidfd docs | `KEEP_FOR_CONVERGENCE` |
| S68-SEED04 | `ABSTRACTION_LADDER`; compiler/backend engineer | Dynamic linking writes a relocation before the target module lifetime is committed. | ELF dynamic-loader docs | `KEEP_FOR_CONVERGENCE` |

Four engines/perspectives advisory PASS. Only S68-SEED01 selected before lookup; all other ideas are non-evidence backlog.
