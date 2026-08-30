# Source closure — SWI-Prolog shared incremental tabling

## Scope and disposition

Assignment: `SOURCE-CLOSURE-RESUME-BATCH03-ITEM01-SOURCE100-S6-SWI-PROLOG-V1`.

Disposition: `STRUCTURAL_FATAL__DIRECT_CURRENT_UNION_CHANGED_TABLE_ENDPOINT_OR_GENERIC_TABLE_CONTROLLER__RETURN_TO_MAINLINE`.

This is source closure only.  It makes no clean-brief, Q2, candidate, PASS, STOP, or stage-state decision.

## Fixed identity and bounded acquisition

- Project/pin: `SWI-Prolog/swipl-devel`, default branch `master`, resolved once to `6bbe80c1dead3a3649be72874e2966aa74d44e7f`.
- Frozen object: fixed pure tabled program, declared shared and incremental semantics, one fixed update trace, and stock query-answer behavior.
- Ten official, precommitted calls completed, retaining 679,877 bytes below the 33,554,432-byte envelope.  No clone, build, Prolog execution, test execution, benchmark, external search, or substitute route occurred.

## Current union closed

The pinned official manual states that incremental tabling connects answer tries and incremental dynamic predicates into an Incremental Dependency Graph; updates mark dependent tables invalid; access triggers bottom-up re-evaluation and can avoid further re-evaluation when answer sets are unchanged (`07-tabling-incremental.html`, lines 497–556).

The current C core provides the corresponding native state/actions: answer tries, worklists, shared-table lock/unlock, completion/wait registration, reevaluation reset/completion, dependency worklist destruction, and table abolishing (`08-pl-tabling.c`, declarations/definitions around lines 86–293 and 586–717).  The boot interface exposes tabled execution and both private/shared table abolition operations (`04-boot-tabling.pl.json`, decoded `boot/tabling.pl`, lines 39–92 and 241–246).

The deterministic stock test `test_shared_reeval.pl` provides a same-program witness.  It declares mutually recursive tables `as (shared, incremental)`, changes an incremental dynamic predicate, starts two threads on the coupled tables, validates answers, and exercises the shared reevaluation/deadlock-recovery path.

## Structural conclusion

The frozen family is `SWI_PROLOG_SHARED_INCREMENTAL_TABLE_MAINTENANCE`.  Current stock semantics already include its stated shared/private ownership, dependency invalidation, on-demand reevaluation, completion/wait coordination and reclamation/abolishing lifecycle under unchanged answers and update visibility.

Consequently, a residual that only chooses per-table ownership, worklist scheduling, invalidation timing, or reclaim order is a generic scheduler/table-controller layered over native actions.  No union-external SWI-Prolog-native per-table shared/private maintenance action with a distinct finite guarantee can be frozen without changing the declared shared/incremental semantics or query-answer endpoint.  This is direct positive current-source absorption, not an inference from an empty search or an unrun experiment.

## Falsifier and full cost

A separately scoped successor would first need to name a same-program action unavailable to the stock shared/incremental/IDG/worklist/completion catalog while preserving answer, visibility and waiting semantics.  Any fair full-cost ledger retains table/worklist bytes, update/reevaluation CPU and RSS, completion/wait latency, synchronization cost and answer correctness.  No performance or correctness observation was executed in this closure.
