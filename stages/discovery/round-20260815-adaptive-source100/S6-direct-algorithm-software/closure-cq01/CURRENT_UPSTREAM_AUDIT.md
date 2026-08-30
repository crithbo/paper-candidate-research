# Current upstream audit — SWI-Prolog tabling

## Pin and official surface

The first two official GitHub requests resolved the named default branch `master` to immutable commit `6bbe80c1dead3a3649be72874e2966aa74d44e7f`.  All retained sources and tests use this pin; the two retained SWI-Prolog manual routes state the language-level semantics.

## Action/semantic catalog

| Current native surface | Same-object action | Evidence |
|---|---|---|
| shared and incremental declaration | shared tables plus incremental dynamic dependency contract | `10-test_shared_reeval.pl`; incremental manual |
| IDG invalidation | updates mark dependent tables; access reevaluates in bottom-up order | `07-tabling-incremental.html` 497–556 |
| answer-table/worklist state | answer tries, global/created/delay worklists, answer clusters | `08-pl-tabling.c` 86–197, 545–717 |
| shared ownership/completion | shared-table mutex, worklist completion and per-thread wait registration | `08-pl-tabling.c` 224–293 |
| reclamation/abolishing | destroy/reset worklists and table abolition interfaces | `08-pl-tabling.c` 136–170; decoded `boot/tabling.pl` 39–92, 241–246 |
| same-program witness | two shared incremental mutually recursive tables updated/tested across threads | `10-test_shared_reeval.pl` |

## Two stock plans

For a fixed update trace, one stock plan accesses an invalid shared table and performs the documented IDG-driven reevaluation; another maintains the same endpoint through stock abolition/reset or the core’s worklist/component cleanup.  Both remain within declared shared/incremental semantics, answer correctness and stock waiting behavior.  The test additionally gives a concrete concurrent shared-reevaluation carrier.

## Collision classification

`DIRECT_CURRENT_UNION_CHANGED_TABLE_ENDPOINT_OR_GENERIC_TABLE_CONTROLLER`: PASS.  The exact family’s shared incremental maintenance lifecycle is implemented by current source and specified in the official manual.  The conclusion is limited to the frozen object: a scheduler or controller selecting among those lifecycle actions is generic rather than a new SWI-Prolog-native action/guarantee.  No absence, novelty, paper, or performance claim is made.
