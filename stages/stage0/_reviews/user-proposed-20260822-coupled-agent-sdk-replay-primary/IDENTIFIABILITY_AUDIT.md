# Identifiability and marginal-correctness audit

For each fixed state `s`, native terminal outcome `Y(a)` is defined under the frozen arm `a∈{I0,I1}`. CoARSE may use a shared indexed Gumbel field only if each branch applies its own transformed logits to the same field, so each categorical draw retains the native branch marginal. Following divergence, common noise alone does not establish state validity.

| Requirement | Failure mode | Required static proof / check |
|---|---|---|
| State identity | shared workspace/process/tool mutation | field-by-field copy/reset/read-only/forbidden-alias manifest |
| Marginal sampling | same seed applied to non-identical logits without Gumbel-Max argument | branch-local categorical law induction |
| Tool transition | sharing mutable observation/state | immutable byte-identical keep-share predicate; otherwise split or fallback |
| Fallback | drop difficult pairs or change arm law | two independent valid native continuations retained in estimator and cost ledger |
| Terminal / censoring | future outcome deletes a pair | absorbing terminal and failures recorded as valid outcome categories |
| Evaluator | hidden label guides branch | evaluator offline only, after both branch states freeze |

The currently described paired mean is unbiased only conditional on those requirements. A simple covariance identity does not establish lower variance: `Var(Y1-Y0)=Var(Y1)+Var(Y0)-2Cov(Y1,Y0)`. The proposed method must therefore either prove a target-specific covariance/fallback frontier or make no universal variance claim; “same seed” is insufficient.
