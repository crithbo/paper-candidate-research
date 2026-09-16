# All-history five-field identity preflight

Before evidence qualification, a bounded `registry.yaml` and `plan.md` search for `pthread_barrier`, `barrier_wait`, `PTHREAD_BARRIER_SERIAL_THREAD`, and barrier-serial terms found no exact recorded string match. This no-match is not a novelty or absence result.

The frozen signature is:

1. object — POSIX barrier wait on a fixed participant set;
2. action — phase release plus one serial-return selection;
3. endpoint — release, serial return and reusable/reset phase boundary;
4. guarantee — POSIX.1-2024 barrier semantics;
5. full cost — arrivals, wait/release, serial work, CPU, RSS and latency.

No historical exact identity exclusion was applied. Assignment-forbidden records were not opened, and concurrency resemblance alone remains `RELATED_ONLY`.

