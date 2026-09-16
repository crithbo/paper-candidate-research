# All-history five-field identity preflight

Before evidence qualification, a bounded `registry.yaml` and `plan.md` search for `pthread_mutex_consistent`, `robust mutex`, `EOWNERDEAD`, and `ENOTRECOVERABLE` found no exact recorded string match. This no-match is not a novelty or absence inference.

The considered signature is:

1. object — POSIX robust mutex plus a specified protected state;
2. action — owner-death acquisition, recovery/consistent or nonrecoverable transition;
3. endpoint — `EOWNERDEAD`, consistency publication and subsequent usability;
4. guarantee — POSIX.1-2024 robust mutex state-machine semantics;
5. full cost — detection, recovery, publication, CPU, RSS and latency.

No historical exact identity exclusion was applied. Assignment-forbidden records remain unopened; broad failure-recovery resemblance is `RELATED_ONLY`.

