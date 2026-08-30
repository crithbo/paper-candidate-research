# Current-union and collision matrix

| Family | Version-pinned official locus and contrary check | Complete current native union relevant to RQ | Minimum action-divergence test | Result |
|---|---|---|---|---|
| NCCL registered buffer/window collective | NVIDIA NCCL current buffer-registration guide; includes normal buffer registration, collective registration, window registration, VMM allocation, enablement and compatibility flags | registration/unregistration; window/register-window; `ncclMemAlloc`; collective registration; documented flags including `NCCL_WIN_ENABLE` and PXN compatibility | Proposed change must be more than choosing registrations/windows/flags for the same buffers and collective | no divergence; absorbed |
| CUDA device graph launch | CUDA Programming Guide current CUDA Graphs special topic; device-launch eligibility, instantiation flag, upload and launch modes checked | graph construction; instantiate with device-launch capability; upload; host/device launch; tail, fire-and-forget and sibling modes within documented constraints | Proposed plan must alter a whole graph construction with a nontrivial guarantee rather than select/upload/launch an existing graph | no divergence; absorbed |
| OpenMP target completion | OpenMP 5.2 `nowait` clause; contrary semantics checked | target/task completion, dependences, barriers and `nowait` as specified synchronization choices | Proposed plan must preserve the same task observation while not merely selecting task/barrier timing | no divergence; synchronization selector |

Latest-collision ceiling: `SEARCH_BOUNDED_OPEN`. No candidate crossed raw gates, so a paper-level novelty claim was neither made nor needed.
