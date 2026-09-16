# Evidence-qualified question card

## QC-S2-84-01

| Gate | Frozen content |
|---|---|
| Exact identity | `OPENXLA_XLA_GPU__FIXED_HLO_GPU_EXECUTABLE__CAPTURE_STABLE_BUFFER_SLICE_AND_CONTIGUOUS_COMMAND_GROUP_CONSTRUCTOR` |
| Same-object problem | Construct an identical-output, stock-XLA-legal executable for one fixed HLO module and GPU target. No changed frontend, reader, runtime contract, tensor values, or memory model. |
| Claim endpoint | Full-cost Pareto over peak allocation, compile/record/replay launch CPU, temporary/cache bytes, device execution time, and host/device bytes. |
| Counterfactual consequence | A separately chosen buffer allocation or capture grouping can be dominated by a joint capture-stable construction only if the latter preserves all lifetimes, dependencies, and stock command legality. |
| Non-generic discriminator | The algorithm state must couple HLO liveness/alias intervals with legal contiguous-thunk capture boundaries and capture-stable allocation constraints; generic bin packing, a flag grid, or a scheduler/controller is inadmissible. |
| Current-source locus | Official HLO-to-thunks page; current `buffer_assignment.*`, GPU command-buffer conversion sources, and debug flags at one resolved `openxla/xla` commit. |
| Minimum falsifier | At the pinned commit, either (a) stock composition already jointly optimizes the same allocation/capture action with the same information and objective, or (b) every legal two-plan witness collapses to a configuration-only difference. |
| Finite closure | One commit-resolution call; read the named pass sources and flag definitions; construct one small HLO/thunk trace with two stock-legal allocation/capture plans; use one version-pinned upstream test module. |
| Full-cost initial boundary | buffer-assignment/scheduling/compiler CPU and RSS; record/replay and launch CPU; GPU execution; peak device allocation; host/device bytes; temporary and cache bytes. |
| Known fatal | None established. |
| Closure debt | Exact source commit, complete action composition, one legal two-plan witness, target-specific guarantee, and direct-collision search. |
| Raw disposition | `EVIDENCE_QUALIFIED_RAW__NOT_READY_FOR_C0__PENDING_UNEXECUTED_SOURCE_CLOSURE` |

This card is not a brief and makes no Q2, novelty, implementation, or performance claim.
