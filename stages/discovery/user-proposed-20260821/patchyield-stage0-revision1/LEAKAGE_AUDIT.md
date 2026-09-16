# PatchYield online-information and leakage audit

## Frozen online information contract

The scheduler may use only information available before dispatch of the selected complete call:

- frozen task/session identity, arrival and ready time, call index, deadline `arrival_i + {30,59,90} minutes`, and public prior tool/LLM history;
- current queue, batch, and KV state exposed by the frozen OpenHands/vLLM object;
- a predictor fixed before the held-out repository fold, with weights and feature schema recorded before evaluation;
- progress predicates computed solely from already returned public tool output, such as a changed patch hash plus an already observed compile/test status.

It may not read a sealed final repair label, post-service test result, held-out repository completion outcome, or any later call/tool event when deciding the present dispatch.

## Predictor target and fold boundary

An admissible future policy could train on repository-disjoint training folds using the offline target `Y_i = 1` only when the frozen run ultimately reaches the corresponding arrival-relative deadline.  That label is a training target, never an online held-out feature.  The held-out predictor input may use only features materialized before its call is scheduled.  Calibration is likewise to be fitted on training repositories and assessed only on repository-held-out data.

This audit does not make the predictor or a policy valid.  It only fixes the information boundary required by the frozen object so a later reviewer cannot conceal sealed-outcome leakage behind a claimed progress signal.

| Candidate datum | Allowed online? | Reason |
| --- | --- | --- |
| Ready timestamp / queue position / call index | Yes | Present before decision. |
| Existing KV/cache metadata | Yes | Present before decision, subject to frozen reader semantics. |
| Earlier tool output and observed patch hash | Yes | Already public in this session's history. |
| Training-fold deadline-success label | Training only | May fit a pre-frozen predictor; not a held-out online feature. |
| Held-out final repair success | No | Sealed outcome and direct target leakage. |
| Post-dispatch tool/test result | No for that dispatch | It does not exist at decision time. |
| Cross-fold repository identity learned from held-out labels | No | Repository-heldout boundary violation. |

## Static finding

The leakage boundary is internally auditable, but it cannot repair the independent all-legal-state fairness impossibility.  No claim of predictive gain or of live scheduler correctness is made here.
