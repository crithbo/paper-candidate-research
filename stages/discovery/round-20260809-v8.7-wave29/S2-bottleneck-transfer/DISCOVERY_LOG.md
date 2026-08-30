# Discovery log — DISCOVERY-S2-20260809-V8.7-WAVE29

## Scope

- Cutoff: 2026-08-10.  Method: calibrated production v2/v8.1 plus v8.6
  fidelity-plan and v8.7 current-upstream-reality checks; two-axis v8.2r2 was
  not used.
- This is contribution-first raw coverage.  Twelve distinct 2025–2026 system,
  storage, runtime, compiler, and architecture contribution genealogies were
  screened before mapping any residual to a current same-object implementation.
- Active, blocked, terminal, and user-paused objects in the registry/plan were
  excluded.  No experiment, benchmark, artifact download, Stage 0/A/B creation,
  or master-file change occurred.

## Raw opportunity coverage

| # | Contribution genealogy | Transfer/residual tested | Result after same-object subtraction |
|---:|---|---|---|
| 1 | HyCache, ATC 2025 | GPU acceleration → CPU preprocessing/cache admission | DROP: admission/eviction is a selector, not a new complete action. |
| 2 | IRHash, ATC 2025 | compile cache hit improvement → lookup/dependency cost | DROP: compiler-cache wrappers are prohibited; no non-wrapper same-object residual fixed. |
| 3 | ByteCheckpoint, NSDI 2025 | checkpoint I/O → layout/reshard metadata | DROP: current DCP planner/storage union covers the proposed control surface. |
| 4 | ODRP, NSDI 2025 | RDMA paging CPU bypass → RNIC resource coordination | DROP: residual is NIC scheduling/control, with no portable same-object action. |
| 5 | Juneberry, NSDI 2025 | hardware-ACK commit → asynchronous server execution | DROP: follow-on is request scheduling/controller; paper’s object is specialized RDMA storage. |
| 6 | FlacIO, FAST 2025 | image I/O reduction → page-cache/runtime-image metadata | DROP: no non-excluded upstream object and native format/checker contract were fixed. |
| 7 | GogetaFS, FAST 2025 | fast fingerprinting → dedup metadata consistency | DROP: direct metadata merge already is the joint action; next step is filesystem-specific maintenance tuning. |
| 8 | GraCE, OSDI 2026 | CPU launch removal → graph coverage, memory, dynamic-shape cost | DIRECT_SUBTRACT then DROP: current PyTorch CUDA-graph/Inductor modes expose capture, fusion, and configuration paths; remaining idea is a selector. |
| 9 | Syncopate, OSDI 2026 | stream overlap → chunk-level compute/communication tail | DROP: it already supplies the joint chunk schedule/transformation; a follow-on is schedule selection. |
| 10 | VTC, OSDI 2026 | physical data movement elimination → virtual mapping/materialization | DROP: no fair current compiler exact object and finite native fidelity contract survive mapping. |
| 11 | MPK, OSDI 2026 | per-kernel launches → mega-kernel decentralized runtime | DROP: remaining task placement is the in-kernel scheduler/controller already central to the object. |
| 12 | Obscura, ATC 2025 | pipeline memory mitigation → recomputation/swap placement | DROP: its joint optimization already spans recomputation, swapping, and partitioning; residual is tuning/solver selection. |

## Shortlist reality checks

Two lines reached source-reality screening; neither survives to a brief.

1. **DCP / ByteCheckpoint line.** Frozen upstream: PyTorch `v2.13.0`, commit
   `cf30153`, released 2026-07-08; official current DCP documentation observed
   2026-08-10.  It exposes load-time resharding, `SavePlanner`/`LoadPlanner`,
   `SavePlan`/`LoadPlan`, global planning, custom reader/writer, asynchronous
   save, and plan caching.  Defaults and non-default extensions were checked.
   A putative joint layout/load policy is either an opaque custom planner or a
   changed representation, not a frozen union-external DCP action.
2. **PyTorch / GraCE line.** Frozen upstream: PyTorch `v2.13.0`, commit
   `cf30153`; official `torch.compile`/CUDA documentation observed 2026-08-10.
   Default, `reduce-overhead`, `max-autotune`, and
   `max-autotune-no-cudagraphs` modes, `triton.cudagraphs`, fusion, graph
   capture, workspace-memory cost, and dynamic/guard limitations were checked.
   They are affirmative counterevidence to claims that graph capture or its
   relevant configuration is absent.  A residual cost-benefit choice is a
   controller/selector and is not admissible N2.

## Decision

`COMPLETE_ZERO_PROPOSALS`.

No raw line became a grounded brief.  This is not an implementation, artifact,
resource, natural-workload, or AI-readiness rejection.  The concrete reasons
are direct/current-union absorption, controller/wrapper boundary, or inability
to freeze a same-object native fidelity contract without changing semantics.

## Primary / official sources

- [HyCache](https://www.usenix.org/system/files/atc25-jha.pdf), ATC 2025.
- [IRHash](https://www.usenix.org/conference/atc25/presentation/landsberg), ATC 2025.
- [ByteCheckpoint](https://www.usenix.org/conference/nsdi25/presentation/wan-borui), NSDI 2025.
- [NSDI 2025 technical sessions: ODRP and Juneberry](https://www.usenix.org/conference/nsdi25/technical-sessions).
- [FAST 2025 technical sessions: FlacIO and GogetaFS](https://www.usenix.org/conference/fast25/technical-sessions).
- [GraCE](https://www.usenix.org/conference/osdi26/presentation/ghosh), [Syncopate](https://www.usenix.org/conference/osdi26/presentation/qiang), [VTC](https://www.usenix.org/conference/osdi26/presentation/hu-muyan), and [MPK](https://www.usenix.org/conference/osdi26/presentation/cheng), OSDI 2026.
- [Obscura description](https://www.usenix.org/conference/atc25/technical-sessions), ATC 2025.
- [PyTorch DCP current documentation](https://docs.pytorch.org/docs/main/distributed.checkpoint.html) and [torch.compile documentation](https://docs.pytorch.org/docs/stable/generated/torch.compile.html), observed 2026-08-10.
