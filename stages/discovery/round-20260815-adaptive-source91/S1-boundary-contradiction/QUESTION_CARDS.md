# Discovery question card

## QC01 — C11 TSS destruction time and bounded iteration

| field | frozen content |
|---|---|
| signature | `GLIBC_C11_TSS__THREAD_EXIT_DESTRUCTOR_ITERATION_LIFETIME_ENDPOINT__FIXED_THREAD_KEY_VALUE_SEMANTICS__CLEANUP_CPU_RSS_LATENCY` |
| exact identity | Current glibc ISO C `tss_t`, `tss_dtor_t`, `tss_delete`, and `thrd_exit` semantics. |
| same-object contract | Same thread/key/value trace, destructor effects, lifecycle, and `TSS_DTOR_ITERATIONS` bound. |
| native action | create key with destructor, set thread-local value, delete key or call `thrd_exit`; stock runtime invokes destructor only on current-thread exit. |
| current union | glibc documents that a destructor runs on `thrd_exit`, never on `tss_delete` or `exit`; key values persist for thread life and bounded iterations already handle destructors that recreate TSS. |
| strongest skeptic | Earlier/other-thread cleanup changes the lifecycle endpoint; preserving it leaves generic runtime implementation or ordinary loop scheduling rather than target-specific N2. |
| minimum falsifier | Set a TSS value with visible destructor, call `tss_delete` while thread lives, then call `thrd_exit`. A candidate that invokes it on delete or omits it at exit fails. |
| carrier/oracle | Public C11 thread program; destructor side effect and `thrd_exit` are native semantics oracle. |
| full-cost | destructor CPU/latency, thread/TSS RSS, runtime metadata, iteration work, and coordination overhead. |
| finite route | 72h Stage0 could inspect the documented delete-vs-exit trace before performance testing. No experiment occurred. |
| identity preflight | `NO_MATCH__NOT_NOVELTY_PROOF` over frozen registry/plan; broad runtime similarity is related only. |
| disposition | `EXCLUDED_BEFORE_RAW__FIXED_THREAD_LIFETIME_DESTRUCTOR_ENDPOINT_OR_GENERIC_RUNTIME_LOOP` |

This exclusion is structural. It is not a conclusion from lack of source, implementation, result, resource, hardware, or AI readiness.
