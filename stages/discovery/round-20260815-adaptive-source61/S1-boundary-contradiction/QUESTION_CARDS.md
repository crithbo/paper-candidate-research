# Question card QC01

| Field | Frozen value |
|---|---|
| exact identity | OpenMP 5.2 detached task/event + current LLVM libomp tasking |
| same-object contract | same event destruction, completion, dependence and OMPT-visible early/late fulfillment semantics |
| candidate action | manipulate task completion state processing across the two commit points |
| current source locus | libomp `kmp_tasking.cpp` fulfill/detach path and direct early/late fulfill tests |
| non-generic discriminator | must alter a transition determined by event-completion semantics, not which runnable task the scheduler chooses |
| falsifier | current state machine already handles both orderings and any residual action is generic scheduling |
| full cost | runtime CPU/RSS, task/event metadata, callback sequence, event-to-completion latency and scheduler overhead |

**Known structural fatal:** the fixed specification determines the event state machine, and the current libomp source/tests already implement the two fulfill orderings. Any remaining proposal is a generic task scheduling/controller policy, which is forbidden. Disposition: `EXCLUDED_BEFORE_RAW__GENERIC_SCHEDULER_REMAINDER`.
