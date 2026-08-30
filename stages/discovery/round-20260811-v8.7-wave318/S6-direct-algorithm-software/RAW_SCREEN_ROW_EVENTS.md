# Source-level events

| finding | official source | consequence |
|---|---|---|
| Lean elaboration includes unification, type-class synthesis, type checking and tactic specialization; kernel checks the elaborator output. | Lean language reference | oracle and semantic layers are fixed |
| metavariable context is shared by elaborator, tactic framework, unifier and type-class resolution; nested TC/isDefEq is permitted. | Lean MetavarContext API | arbitrary discharge reordering is not automatically lawful |
| TC must not assign caller/elaborator metavariables and commits to first solution. | Lean MetavarContext API | candidate must preserve ownership/commit invariants |
| kernel rejects declarations with metavariables/free variables. | Lean source/docs | acceptance gives a strong final oracle but not an elaborator action witness |

