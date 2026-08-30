# Discovery question card

## QC01 — normal C process termination cleanup ordering

| field | frozen content |
|---|---|
| signature | `GLIBC_ATEXIT__NORMAL_TERMINATION_REVERSE_REGISTRATION_ENDPOINT__FIXED_C_PROCESS_EXIT_STATUS__EXIT_CLEANUP_CPU_RSS_LATENCY` |
| exact public identity | Current glibc normal-termination/`atexit` semantics; POSIX `atexit` compatibility contract. |
| same-object contract | Same process, handler registration trace, normal termination cause, callback-visible side effects, order, and parent-visible status. |
| native action | Register with `atexit`/`on_exit`; terminate with `exit` or return from `main`; execute stock cleanup path. |
| current union | Current glibc documents normal termination cleanup; current glibc/POSIX documents reverse registration order. `_Exit` deliberately does not execute cleanup callbacks, so it is not a same-endpoint alternative. |
| problem/insight | Exit cleanup can have cost, but a publishable construction would need a target-specific algorithm that preserves exact cleanup side effects and order. Reordering/delaying/remoting callbacks changes the fixed endpoint. |
| strongest skeptic | With fixed reverse order and arbitrary callback effects, legal residual work is a generic stack/runtime implementation optimization, not a target-specific N2. |
| minimum falsifier | Register two callbacks with noncommuting observable effects, then call `exit`. Any candidate that changes their reverse order, omits either, or substitutes `_Exit` fails. |
| carrier/oracle | Public C program using `atexit`; its output/effects and parent-observed status form the native oracle. |
| full-cost | process-exit CPU/wall, callback work, runtime code/RSS, synchronization/registration cost, and externally visible termination latency. |
| finite route | A 72h Stage0 trace could use the two-callback carrier to check same-object semantics before measuring cost. No experiment was run. |
| identity preflight | Frozen registry/plan surface: `NO_MATCH__NOT_NOVELTY_PROOF`; any broad process/runtime overlap is only related. |
| disposition | `EXCLUDED_BEFORE_RAW__ORDERED_NORMAL_TERMINATION_ENDPOINT_OR_GENERIC_EXIT_RUNTIME_OPTIMIZATION` |

The exclusion is a direct semantic/generic-kernel finding, not a result, implementation, resource, or AI-readiness finding.
