# Discovery log — DISCOVERY-M1-20260809-V8.4-WAVE9

## Contract and method

- Origin: M1 / `O8`, restricted to `N3`—a stable natural-workload regime **and** its utilization mechanism.
- Method: accepted production discovery method `v2/v8.1`, with v8.4 structural-potential/readiness separation and baseline-residual-first screening. The TLS-blocked two-axis `v8.2r2` method was not used or claimed.
- Cutoff and sources: original papers plus official project/trace/documentation sources through 2026-08-09.
- Boundary: source/artifact design review only. No dataset download, trace parsing, profiling, experiment, benchmark, simulator, or hardware run occurred.
- Exclusion: previously reviewed M1 LLM trace-ranking / CCL-Bench / MLPerf-Endpoints and remote-Parquet/httpfs objects were not reused.

## Outcome

`COMPLETE_ZERO_PROPOSALS`. No object clears the added StageA-yield gate: a `PROPOSE_STAGE0` would require an action-gap certificate showing an atomic same-object action unavailable to the fair strongest-union, plus a finite natural killer. Neither reviewed direction supplies one.

## Reviewed natural-workload directions

### W9-A — GenTD26 cross-layer diffusion-serving regimes

- **Exact object considered:** a stable-diffusion serving deployment represented by the public Alibaba `cluster-trace-v2026-GenAI` / GenTD26 artifact, spanning application requests/end-to-end latency, middleware queue/scheduler/pipeline records, and container/GPU/memory records.
- **Why it is a valid natural source lead:** Alibaba describes GenTD26 as a top-down view of a large-scale production stable-diffusion serving system, and exposes the trace schema/material through its official Cluster Trace Program repository.
- **Potential N3 shape considered:** a stable, cross-layer regime relating request composition, queue state, and GPU utilization that would imply a new legal serving action.
- **Structural paper potential:** not scored as a retained candidate. The corpus is potentially rich enough for a systems paper, but the source metadata alone does not establish a stable regime or its causal/decision consequence.
- **Current evidence readiness:** `DATASET_AVAILABLE__UNMEASURED_BY_THIS_LANE`; this is not an academic negative result.
- **Baseline union:** existing scheduler/action families explicitly named by the trace program (placement/rescheduling, resource allocation, priorities, and collaboration between online and batch schedulers); its referenced GPU-v2023 work already evaluates FGD against classic placement policies. Any future serving-specific baseline union must additionally freeze the trace’s actual legal scheduler controls and the original serving-system action space.
- **Action-gap certificate:** **not obtainable from the inspected source.** The artifact describes observations and layers but does not establish that a proposed action is unavailable to the scheduler/placement/rescheduling action union. Naming “cross-layer scheduling” would be a controller/selector label, not a certificate.
- **Finite natural killer:** not admissible until a precise action is frozen. A future finite test may use pinned GenTD26 slices plus the documented scheduler controls, but a corpus alone cannot make the N3 claim falsifiable.
- **Disposition:** `DROP_NOT_PROPOSED` for this assignment because the mandatory action-gap and finite-killer gates are unsatisfied. This does not state that GenTD26 lacks future structural potential.

### W9-B — BOLT profile-regime / stale-profile code-layout choice

- **Exact object considered:** one eligible ELF binary plus its representative `perf`/instrumented execution profile(s), optimized by BOLT’s code-layout pipeline.
- **Natural source/observation:** BOLT’s official documentation states that profiles can become stale when binary/profile versions differ, lowering expected improvement; it also supports multiple workload profiles and an explicit `merge-fdata` action for one universal binary.
- **Potential N3 shape considered:** identify a recurrent profile-divergence regime and select a layout that preserves multi-mode performance without using a single aggregate profile.
- **Structural paper potential:** rejected as a same-object residual, not for readiness. The anticipated atomic actions—profile collection/aggregation, function/block reordering, cold splitting, and multi-profile merge—are documented BOLT actions.
- **Current evidence readiness:** `OFFICIAL_ARTIFACT_AVAILABLE__UNRUN`; lack of a local profile is not used as negative evidence.
- **Strongest-union:** current BOLT profile collection plus `merge-fdata`, its documented reorder/split options, stale-profile accounting, and any compatible LLVM profile-guided baseline. The union already expresses the proposed aggregate/multi-mode layout action.
- **Action-gap certificate:** **fails.** No identified atomic action lies outside this union. Weighting/filtering profiles without a different legal action is routine tuning; changing the binary/object is not same-object.
- **Finite natural killer:** were a residual action later identified, freeze two public multi-mode BOLT-compatible workloads with pinned binary/profile pairs and kill if native BOLT multi-profile merge reaches the same full-cost frontier. No such residual exists here now.
- **Disposition:** `DIRECT_FATAL → DROP_NOT_PROPOSED` for the generic N3/profile-regime idea.

## Integrity notes

- No stable law is claimed by this lane. “Potential regime” labels above identify hypotheses that were rejected before proposal, not findings.
- No unavailable data, implementation, resource, or AI-readiness condition is used as an academic STOP/DROP reason. W9-A is rejected solely because the required atomic action and finite falsifier are not defined; W9-B because the action union absorbs the generic proposal.
- No terminal candidate was revived or renamed.
