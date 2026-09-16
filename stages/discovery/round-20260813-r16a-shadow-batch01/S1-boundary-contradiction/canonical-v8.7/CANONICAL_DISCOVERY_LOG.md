# Canonical v8.7 discovery log

The canonical review used only `neutral-source-snapshot/` and the authoritative v8.7 rules. It was completed before creating `shadow-v9/`.

| Family | Canonical disposition | Reason |
|---|---|---|
| S1-R16A-F01 CPython import rollback | `DROP` | A proposed atomic-import SCC/batch mechanism necessarily changes observable import timing/recursion behavior, or reduces to loader policy around the existing insert-before-exec/remove-on-failure union. |
| S1-R16A-F02 glibc dlopen scope reserve/update | `DROP` | Current glibc already made the relevant two-phase reserve/update construction to prevent late constructor-boundary failure. A re-labelling is direct absorption; alternative ordering changes loader semantics. |
| S1-R16A-F03 Rust Once poison recovery | `DROP` | `call_once_force` already exposes forced recovery with the documented poison/complete guarantee. A selection over recovery closures is user policy; a generic dependency planner lacks a frozen same-object target-specific action. |
| S1-R16A-F04 POSIX robust mutex recovery | `NOT_ADMITTED_UNFROZEN` | The fixed mutex primitive deliberately delegates shared-state repair to the application. A cross-mutex repair algorithm needs a separately frozen application invariant/object; without it, no same-object N2 can be stated. This is not an implementation/result/resource negative. |

No canonical `PROPOSE_STAGE0` was produced. The bounded search is not a novelty conclusion for F04.
