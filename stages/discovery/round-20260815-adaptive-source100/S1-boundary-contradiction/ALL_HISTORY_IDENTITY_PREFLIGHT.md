# All-history five-field identity preflight

Before evidence qualification, a bounded `registry.yaml` and `plan.md` search for `pthread_rwlock`, `rwlock`, `reader-writer lock`, and `reader writer lock` found no exact recorded string match. This no-match does not establish novelty or absence.

The frozen signature is:

1. object — POSIX rwlock read acquisition on a fixed lock and trace;
2. action — reader/writer admission and handoff sequence;
3. endpoint — specified read acquisition/block/failure and recursive-read behavior;
4. guarantee — POSIX.1-2024 writer-precedence and scheduling-option conditions;
5. full cost — attempts, metadata, wakeups, CPU, RSS and waiting latency.

No historical exact identity exclusion was applied. Assignment-forbidden records were not opened; broad synchronization resemblance remains `RELATED_ONLY`.

