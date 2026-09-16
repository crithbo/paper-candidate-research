# Discovery question card

## QC01 — pthread cancellation cleanup ordering and thread exit

| field | frozen content |
|---|---|
| card/signature | `POSIX_PTHREAD_CANCELLATION_CLEANUP__LIFO_SCOPE_UNWIND_ENDPOINT__FIXED_C_THREAD_EXIT_STATUS__CLEANUP_CPU_LATENCY_RSS` |
| exact public identity | POSIX.1-2024 cancellation cleanup handlers; Linux man-pages 6.18 pthread cleanup interface. |
| same-object contract | Same C thread program and cleanup stack; cleanup side effects, lexical scope validity, LIFO invocation, and `PTHREAD_CANCELED`/`pthread_exit` endpoint are fixed. |
| native actions | `pthread_cleanup_push/pop`, cancellation request, a cancellation point, and `pthread_exit`; cleanup is invoked by stock thread termination/cancellation path. |
| two-sentence problem/insight | Cleanup cost matters at cancellation/exit boundaries. A paper would require a non-generic joint constructor that changes cost without changing the required handler order, scope lifetime, effects, or termination status. |
| current source/spec locus | POSIX 2.9.5.3 and Linux man-pages 6.18 document handler-stack/LIFO/trigger semantics; a glibc runtime source locus is named for any later implementation-only question. |
| strongest skeptic | Any delayed, reordered, cross-thread, or externally coordinated execution changes visible cleanup effects or violates LIFO; preserving it leaves routine runtime/code-generation optimization. |
| minimum falsifier | Two nested handlers with noncommuting effects, then a cancellation request at a cancellation point. If the candidate executes either handler out of LIFO order or after thread termination, it fails the fixed contract. |
| natural carrier/oracle | A public C pthread cleanup program; ordering of its handler side effects and `pthread_join` result are the native oracle. |
| initial full-cost | cancellation/exit CPU latency, handler-call count, runtime code bytes/RSS, synchronization/coordination overhead, and any compiler/runtime work. |
| finite closure route | A 72h Stage0 semantic trace could inspect the nested-handler program against POSIX/Linux semantics; no experiment was run here. |
| identity preflight | Registry/plan canonical surface produced `NO_MATCH__NOT_NOVELTY_PROOF`; no exact identity finding is a novelty claim. |
| disposition | `EXCLUDED_BEFORE_RAW__FIXED_LIFO_CLEANUP_ENDPOINT_OR_GENERIC_RUNTIME_OPTIMIZATION` |

The exclusion is structural: required semantics rule out changed execution placement, and the remaining permitted implementations do not supply a target-specific nontrivial N2. It is not based on missing implementation, results, resources, or AI readiness.
