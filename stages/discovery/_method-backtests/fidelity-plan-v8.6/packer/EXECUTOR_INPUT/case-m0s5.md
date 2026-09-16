# Case m0s5

Cutoff: 2026-08-02. A runtime query optimizer is allowed to repair a join plan
after receiving cardinality feedback. The current adaptive optimization action
family already owns legal plan repair under that feedback contract.

The contemplated contribution chooses when or which existing repair to apply,
without a distinct guarantee, optimization object, or union-external action.
Decide whether this is more than a feedback selector with a finite same-object
closure route.
