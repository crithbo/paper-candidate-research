# Source and collision matrix

| Family | Exact same-object contract | Current primary source and reality check | Strongest fair union | Action result | Full-cost denominator / finite route | Disposition |
|---|---|---|---|---|---|---|
| LLVM Machine Outliner | Machine program, target ABI and emitted object semantics | LLVM 24.0.0git Doxygen: `MachineOutliner.h`, `MachineOutliner.cpp`, `TargetInstrInfo`; checked 2026-08-14. Defaults and non-default controls include benefit threshold, reruns, global outlining and linkonce-ODR outlining. | mapper + suffix tree + legal classification + target hooks + candidate overlap/cost pruning + configuration space | Proposed whole construction is already native. | analysis/temporary mapping/suffix-tree RSS + target work + compile time + code size + call cost; native compile/assembler/linker witness would be finite but non-discriminating. | DROP: direct absorption. |
| rustc incremental dependency graph | Crate graph, compiler output and prior/current incremental-session semantics | Current stable/nightly rustc API/source; checked 2026-08-14. `setup_dep_graph`, `load_query_result_cache`, work-product index/copy and session finalization cover ordinary and invalid-session paths. | persisted dep graph + green marking + work-product reuse + query cache + session publish/fallback | Proposed online reuse transition is already native. | hashes + graph/index bytes + work-product/temp I/O + CPU/RSS + fallback compilation; versioned Rust history plus stock rustc is finite but non-discriminating. | DROP: direct absorption. |
| Linux eBPF verifier state pruning | eBPF verifier acceptance/safety for a fixed program/kernel configuration | Current Kernel docs plus 6.14 versioned docs; checked 2026-08-14. Describes cache creation, state containment/equality, liveness cleanup and branch-count validity conditions. | `regsafe` + `states_equal` + `stacksafe` + `clean_live_states` + state-cache lifecycle | Proposed sound pruning action is already native. | simulated instructions + cached states/register-stack comparisons + verification CPU/RSS; selftest pair/log oracle finite but non-discriminating. | DROP: direct absorption. |

## Latest-collision boundary

These are deployment/current-union subtractors, not claims of global
literature novelty. Official source inspection was used because each rejected
action is directly present. No old issue, future-work sentence or inaccessible
implementation was used as evidence of absence.
