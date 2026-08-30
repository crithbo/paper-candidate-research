# All-history five-field identity preflight

`POSIX_PTHREAD_ATFORK__PREPARE_PARENT_CHILD_CALLBACK_ORDER__FIXED_POSTFORK_LOCK_STATE_ENDPOINT__GLIBC_FORK_FULL_COST`

| Field | Frozen value |
|---|---|
| Object | registered pthread_atfork handler sequence |
| Action | callback ordering/grouping around fork |
| Endpoint | same parent/child side effects and post-fork lock state |
| Guarantee | same handler registration and process/fork semantics |
| Full cost | callback CPU, synchronization, fork pause, lock retention, child recovery, end-to-end fork work |

Bounded permitted registry/plan preflight found no exact five-field identity. `NO_MATCH__NOT_NOVELTY_PROOF`; broad runtime/fork overlap is RELATED_ONLY. Prohibited inputs were not opened.
