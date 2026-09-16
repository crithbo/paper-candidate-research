# All-history five-field identity preflight

Bounded project-wide `registry.yaml` and `plan.md` search was run for `ExecutorService`, `shutdownNow`, `awaitTermination`, and virtual-thread-executor terms before evidence qualification. It found no exact recorded string match. This is **not** a novelty result.

The five-field signature considered for the selected seed is:

1. object — Java SE 25 `ExecutorService` lifecycle;
2. action — whole executor shutdown/close/termination behavior;
3. endpoint — fixed submitted-task completion/cancellation plus termination observability;
4. guarantee — Java SE 25 documented shutdown and interrupt semantics;
5. full cost — task, wait, CPU, RSS, latency, and resource-reclamation cost.

No exact identity exclusion was applied. The assignment's forbidden held/terminal and closure identities were respected without opening their materials. Related concurrency families are not treated as exclusions.

