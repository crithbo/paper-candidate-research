# Discovery log — DISCOVERY-M1-20260809-V8.5-WAVE11

## Scope and method

- Lens: `O8 / N3 measurement-to-action`.
- Method: accepted production discovery method `v2/v8.1`, baseline-residual-first, with v8.5 preclaim-fidelity prior. TLS-blocked two-axis `v8.2r2` was not used or claimed.
- Frozen latest-collision cutoff: 2026-08-09.
- Evidence: original papers and official trace/project documentation only.
- Execution: source review only; no trace download, parsing, benchmark, experiment, simulator, or Stage 0/A/B activity.
- Excluded: terminal and active project objects, including PB, GIT, RocksDB, S4, S1, and prior M1 objects.

## Outcome

`COMPLETE_ZERO_PROPOSALS`. Neither reviewed trace direction can truthfully freeze a stable law **and** a strongest-union-external same-object atomic action. Consequently neither has a preclaim-faithful Stage A contract or finite natural killer.

## W11-A — Azure VM-noise regime to stable configuration choice

- **Exact natural object:** Azure VM Benchmark Noise Data, repeated benchmarks across two VM SKUs/two regions from May 2023 to September 2024, as released by the official Azure Public Dataset project.
- **Reported regularity:** the original [TUNA paper](https://arxiv.org/abs/2503.01801) reports that even low noise slows tuning, can select unstable configurations, and motivates a stability-aware autotuning mechanism.
- **Proposed utilization considered:** select/deploy configurations based on a stable-noise regime rather than the sample winner.
- **Strongest deployable same-information union:** repeated benchmark observations; configuration candidate selection; outlier-configuration removal; denoised-signal inference for the optimizer; and deployment stability evaluation—the action chain TUNA already defines for the same cloud-noise/autotuning object.
- **Action-gap certificate:** **fails.** The contemplated atomic actions are TUNA’s own. A different threshold, metric, dashboard, or controller composition is not a union-external action.
- **Comparator/native semantics/full-cost:** no residual permits a fair Stage A contract. Any future attempt must account for sampling/tuning time, unstable-deployment risk, and target application runtime, exactly as the same-object autotuning task requires.
- **Finite natural killer:** conditional only: on frozen Azure noise traces plus the original workload/configuration contract, kill a new action if TUNA’s existing action chain reaches the same convergence/stability/full-cost frontier. No new action is identified now.
- **Disposition:** `DIRECT_FATAL → DROP_NOT_PROPOSED`.

## W11-B — long-horizon serverless periodicity to reservation/scaling action

- **Exact natural object:** the two Huawei production serverless traces released with [How Does It Function?](https://arxiv.org/abs/2312.10127): more than seven months and 1.4 trillion function invocations, with per-function arrival/execution/cold-start/resource fields at their documented granularities.
- **Reported regularity:** the original paper finds strong periodicity for many functions and aggregate load, alongside extreme diversity in arrival rate, scheduling, execution, and cold-start distributions.
- **Proposed utilization considered:** use a function’s long-horizon periodic regime to reserve warm capacity or change a scaling choice before a cold-start interval.
- **Strongest deployable same-information union:** arrival history/time-series prediction, resource reservation estimation, and serverless autoscaling/cold-start handling. The source paper itself identifies reservation estimation and prediction as the relevant action families, but does not freeze an action outside them.
- **Action-gap certificate:** **fails / undefined.** “Periodic-aware scaling” is a family label, not an atomic action outside prediction plus reservation/autoscaling. The public trace does not expose the provider’s legal capacity/warm-pool/placement controls needed to certify a deployable same-object gap.
- **Comparator/native semantics/full-cost:** no preclaim-faithful comparator can be named from the source alone; using a synthetic or replacement scheduler would change the object. Missing controls are not negative evidence, but they make this proposal inadmissible under the required certificate.
- **Finite natural killer:** not admissible until an actual provider-compatible atomic action and native comparator are frozen. A future corpus-only replay is insufficient.
- **Disposition:** `DROP_NOT_PROPOSED` for absent action-gap/falsifier, not for low readiness or missing results.

## Claim boundaries

- The cited measurements and periodicity findings belong to the cited authors; this lane did not reproduce them.
- No new stable regime is claimed. Both directions are screened pre-proposal and do not create a topic brief.
- Zero proposals follows structural collision/action-gap failure only; no resource/implementation limitation is treated as academic STOP.
