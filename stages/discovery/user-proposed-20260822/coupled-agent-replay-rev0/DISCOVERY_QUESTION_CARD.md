# Discovery Question Card — COUPLED-AGENT-REPLAY-REV0

## Frozen scope before source use

- Topic identity: `COUPLED-AGENT-REPLAY-REV0`.
- Candidate contribution: an N2, target-specific algorithm for paired counterfactual branch evaluation of one coding agent under shared exogenous randomness.
- Same-object endpoint: the difference in native absorbing terminal outcome of two fixed interventions starting at the same complete agent state.
- Non-generic discriminator: after either branch produces different tokens or tool effects, the method must decide whether exogenous randomness can be coupled, must track the complete agent state, and must conservatively split, stop, or label the pair uncomparable. Same-seed replay, CAR plus token coupling, a paired mean, static-log splicing, and routing are excluded.

## Required pre-evidence identity freeze

Before reading collision evidence, this assignment required one exact OpenHands commit, one exact public model revision with sampling/logit control, one exact SWE-bench Verified subset with task-list hash, and one fixed intervention pair.

That complete identity freeze was **not sealed** before collision material was encountered during this run. In particular, no exact OpenHands commit and no task-list hash had been committed to a canonical artifact at that point. Selecting them now would be post-observation selection.

## Canonical gate

`NOT_READY_WITH_ONE_BOUNDED_REASON` — `PRE_EVIDENCE_EXACT_OBJECT_FREEZE_NOT_SEALED`.

This is a provenance/sequence blocker, not a scientific negative result, resource conclusion, novelty finding, or judgement about the proposed mechanism. No raw candidate, clean brief, or Stage 0 recommendation is issued.

## Permitted restart condition

A future, newly frozen assignment may start from a clean state by first sealing all required exact identities and the sole intervention pair, then conducting collision/comparator review from that snapshot. It must not reuse this run's unsealed source observations as canonical evidence.
