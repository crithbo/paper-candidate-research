# Candidate-grade deep review — QC100-03

## SWI-Prolog shared/incremental tabling maintenance

- Same-object contract: fixed tabled program, update trace, query answers and the declared shared/incremental semantics.
- Proposed action skeleton: at a frozen shared-table ownership/update boundary, choose a semantics-preserving local/private maintenance representation rather than only wait/abolish/re-evaluate; compare the table/worklist maintenance frontier.
- Current strongest known composition: private/shared declaration, answer tries and C-core worklists, dynamic SCC completion, invalidation, demand-driven bottom-up re-evaluation, and the documented table-control predicates.
- Natural carrier/oracle: a versioned SWI-Prolog tabled-program corpus; `current_table/2` and query-answer equality, plus the runtime's table-state behavior.
- Full cost: table/worklist bytes, update and reevaluation CPU/RSS, completion/wait latency, synchronization and answer correctness.
- Finite 72-hour killer: inspect the current C-core table ownership/invalidation implementation to test whether it already performs an equivalent shared-to-private maintenance action under the same semantic contract. If it does, direct absorption; if not, decide whether the remaining action is a target-specific constructor or a generic scheduler.
- Current disposition: `NOT_ADMITTED_UNFROZEN__CURRENT_UNION_AND_DIRECT_COLLISION_DEBT`. Documentation alone supports the object and known primitives but does not justify a clean brief or an absence claim.
