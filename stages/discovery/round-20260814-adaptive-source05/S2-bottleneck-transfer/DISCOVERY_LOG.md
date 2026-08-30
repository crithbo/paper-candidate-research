# S2 adaptive-source05 — problem-first targeted closure

Canonical v8.7, V9 OFF. Six fresh problem anchors were screened; only two passed to finite witness closure. No proposal quota was used.

| row | problem anchor / fixed object | joint-action promise | disposition |
|---|---|---|---|
| R01 | Go function with fixed source/ABI/pointer visibility and identical GC reachability | Couple compiler live-pointer stack-map construction with spill-slot placement and runtime scan access path. | NOT_ADMITTED_UNFROZEN after depth: complete current compiler/runtime union and a Go-specific frontier are not frozen. |
| R02 | Rust async function with fixed poll outputs, cancellation/drop behavior and executor-visible future contract | Couple generator state placement, drop flags and resume/poll access layout. | NOT_ADMITTED_UNFROZEN after depth: no complete rustc/executor union or target-specific guarantee closed. |
| R03 | Linux KCFI compiled module/loading contract | Type-hash emission with call-site/check metadata. | raw only: known actions appear compiler/configuration controlled; no two-plan promise selected. |
| R04 | GCC Ada exception dispatch/object ABI | EH table/landing-pad encoding with personality runtime access. | raw only: ABI identity not frozen. |
| R05 | Go escape analysis ↔ allocator size-class/GC pacing | Allocation placement plus runtime allocation state. | raw only: changes allocation/GC observables without a fixed equal-object guarantee. |
| R06 | Rust trait-object vtable layout ↔ dynamic-dispatch codegen | Vtable/relative-call representation with code layout. | raw only: ABI/layout compatibility boundary not closed. |

Depth rows R01/R02 each have a two-plan witness sketch, but neither has the complete current union and target-specific exact/FPT/certified-frontier route required by v8.7. Missing implementation or results played no role.

Result: COMPLETE_ZERO_PROPOSALS.
