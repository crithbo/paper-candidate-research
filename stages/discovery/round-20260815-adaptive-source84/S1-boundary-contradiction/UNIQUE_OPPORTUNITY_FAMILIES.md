# Unique opportunity families

## F01 — pthread_atfork parent/child callback boundary

- Signature: `POSIX_PTHREAD_ATFORK__PREPARE_PARENT_CHILD_CALLBACK_ORDER__FIXED_POSTFORK_LOCK_STATE_ENDPOINT__GLIBC_FORK_FULL_COST`
- History relation: `NO_MATCH__NOT_NOVELTY_PROOF` in the permitted preflight.
- Strongest union: POSIX callback contract, current glibc manual distinction of `_Fork`, and glibc handler-order source lineage.
- Natural carrier/oracle: multithreaded fork path; handler effects plus parent/child post-fork lock-state trace.
- Disposition: `EXCLUDED_BEFORE_RAW__CALLBACK_ORDER_IS_OBSERVABLE_OR_GENERIC_LOCK_LIFETIME_CONTROL`.
