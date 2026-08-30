# Source / collision matrix

| gate | primary official source | finding |
|---|---|---|
| elaboration/kernel semantics | [Lean reference: Elaboration and Compilation](https://lean-lang.org/doc/reference/latest/Elaboration-and-Compilation/) | elaboration and kernel roles, command state and tactic specialization are explicit |
| metavariable/typeclass actions | [Lean MetavarContext API](https://lean-lang.org/doc/api/Lean/MetavarContext.html) | nested `isDefEq`/TC and assignment restrictions forbid assuming arbitrary reordering |
| core representation boundary | [Lean source Expr](https://github.com/leanprover/lean4/blob/master/src/Lean/Expr.lean) | metavariables exist during elaboration but are not kernel objects |
| current contrary evidence | [Lean 4.31 release notes](https://lean-lang.org/doc/reference/latest/releases/v4.31.0/) | app elaborator/metavariable behavior is actively refined; old behavior cannot support a current absence claim |

Direct collision remains incomplete because no source-grounded whole-action witness exists. This is a reason for `NOT_ADMITTED_UNFROZEN`, not a novelty or absence conclusion.

