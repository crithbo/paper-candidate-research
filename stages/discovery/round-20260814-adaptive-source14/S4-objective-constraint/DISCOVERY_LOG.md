# S4 Source14 — Accelerator Measurement-Interference Screen

Assignment `DISCOVERY-S4-20260814-ADAPTIVE-SOURCE14`; canonical v8.7; claim-pack `OFF`; source-only review on 2026-08-14.  Measurement and benchmark contributions were evaluated independently of algorithmic novelty.  All network-security, protocol/traffic-security, vulnerability, exploit and attack-related families were excluded before screening.  The Source13 DCGM × MLPerf counter-compatibility family was excluded by assignment identity.

| Raw screen ID | Family / independent contribution shape | Current primary-source basis | Result |
|---|---|---|---|
| R1 | `ROCPROFILER_DISPATCH_SERIALIZATION_TAIL_VALIDITY` — characterize whether dispatch-counter profiling changes a concurrent HIP application's tail/throughput object relative to device counting and unprofiled execution | Current ROCprofiler docs state dispatch counting permits only one kernel at a time; for co-dependent concurrent kernels it can deadlock.  Device counting preserves device-wide execution but loses kernel-specific attribution. | `CANDIDATE_GRADE_DEEP_REVIEW` → `NOT_ADMITTED_UNFROZEN`: exact measurement tension is real, but this bounded source review did not freeze a versioned, public, natural multi-stream HIP corpus, estimand, held-out stratum or full end-to-end carrier. |
| R2 | `NSIGHT_COMPUTE_REPLAY_TAIL_RANKING_VALIDITY` — characterize replay/cache-control induced divergence between profiler duration and application tail ranking | Current Nsight Compute docs say profiling serializes launches unless replay applies; tool overhead prevents deriving workload duration from host/CUDA timing; cache behavior changes across replay options. | `CANDIDATE_GRADE_DEEP_REVIEW` → `NOT_ADMITTED_UNFROZEN`: a mechanism and comparator exist, but no frozen public natural CUDA workload panel, tail estimand, held-out falsifier or conclusion-changing threshold was completed. |
| R3 | ROCprofiler PC-sampling interval choice | Current tool exposes a beta sampling flag/interval. | `STRUCTURAL_DROP__CONFIGURATION_SELECTOR`. |
| R4 | Nsight cache-control/replay mode picking | Existing cache/replay options are part of the current profiler union. | `STRUCTURAL_DROP__CONFIGURATION_SELECTOR`. |
| R5 | DCGM × MLPerf counter compatibility | Source13 proposed family. | `EXCLUDED_SOURCE13_IDENTITY`. |
| R6 | Accelerator profiler dashboard/export report | A report surface does not freeze a validity gap, natural sample, falsifier or consequence. | `STRUCTURAL_DROP__DASHBOARD_OR_REPORTING_ONLY`. |

Counts: `RAW_SCREEN_ROW_EVENT=6`; `UNIQUE_OPPORTUNITY_FAMILY=4` (R1–R4); `CANDIDATE_GRADE_DEEP_REVIEW=2`; `STAGE0_BRIEF=0`; `PROPOSE_STAGE0=0`.

## Deep-review conclusion

R1 exposes a concrete same-object measurement incompatibility: dispatch attribution serializes execution, whereas device counting observes a time range but cannot attribute counters to individual kernels.  R2 exposes a distinct CUDA-side issue: replay/flush choices and profiler overhead change what time can validly mean.  These are legitimate prospective measurement questions.  They are not clean briefs here because the assignment requires a versioned public **natural** panel, a pre-specified tail/energy estimand, confounds, full-cost denominator and held-out falsifier.  A sample program, a tool option, or an unmeasured documentation caveat cannot replace that contract.  No missing hardware, implementation, result, resource, or AI-readiness fact was used as a scientific negative.

## Primary-source search record

- AMD ROCm, [ROCprofiler-SDK counter collection services](https://rocm.docs.amd.com/projects/rocprofiler-sdk/en/latest/api-reference/counter_collection_services.html), current docs accessed 2026-08-14: dispatch versus device counting, agent-specific profiles and serialization/deadlock boundary.
- AMD ROCm, [rocprofv3 profiling](https://rocm.docs.amd.com/projects/rocprofiler-sdk/en/develop/how-to/using-rocprofv3.html) and [quick guide](https://rocm.docs.amd.com/projects/rocprofiler-sdk/en/latest/quick-reference/quick_guide.html), accessed 2026-08-14: per-GPU counters, multi-pass collection and current flags.
- NVIDIA, [Nsight Compute Profiling Guide](https://docs.nvidia.com/nsight-compute/ProfilingGuide/index.html), current docs accessed 2026-08-14: serialization, replay, cache control and duration/overhead limitation.

Search boundary: current official AMD and NVIDIA documentation plus assignment exclusions.  `SEARCH_BOUNDED_OPEN` is not a global novelty claim.
