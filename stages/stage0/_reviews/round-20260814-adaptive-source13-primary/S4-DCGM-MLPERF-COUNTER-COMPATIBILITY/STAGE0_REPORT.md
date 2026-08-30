# Stage 0 PRIMARY — S4-DCGM-MLPERF-COUNTER-COMPATIBILITY

## Decision

- Assignment: `STAGE0-P1-20260814-S4-DCGM-MLPERF-COUNTER-COMPATIBILITY-PRIMARY-V8.7`
- Decision: `REVISE_ONCE`
- Structural paper potential: `TIER_B_Q2_VIABLE` (conditional)
- Current evidence readiness: `E1_STATIC_PREFLIGHT`; no claim-bearing observation was run.
- Confidence: medium (current-source boundary is clear; no frozen device/workload instantiation yet).
- Stage A/B: not authorized.  A revision recommendation requires independent confirmation.

This is an N3 measurement-characterization question, not a counter scheduler or a dashboard.  Its conditional Q2 shape is a versioned natural MLPerf dataset plus a repeatable validity protocol that establishes either (i) a held-out-stable boundary in which multiplexed utilization evidence changes a bottleneck/ranking conclusion, or (ii) the equally useful scoped no-effect boundary.  It must not claim kernel attribution: DCGM defines these values as interval averages, not a trace of source, kernel, or instruction [NVIDIA DCGM Profiling](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/profiling.html).

## Exact object and current-union finding

The intended object is still under-frozen.  It must name one MLPerf Inference release and closed workload/model, accuracy target, LoadGen scenario and recorded request stream; one SUT, GPU SKU/architecture, driver and DCGM version; and a single reproducible power path.  MLPerf's current documentation exposes distinct v6.0 workloads and submission inputs, so “MLPerf workload” alone is not a unique object [MLPerf Inference documentation](https://docs.mlcommons.org/inference/index_gh/).

Current DCGM is a strong deployment baseline, not an exact absorber.  It discovers per-GPU groups, provides automatic multiplexing, defaults to 1 Hz, and documents both resource conflicts on older devices and zero values at high multiplexed frequencies.  Conversely, Hopper-and-newer GPM metrics are documented as concurrently watchable; this is a preregistered no-gain stratum, not evidence for a general claim [NVIDIA DCGM profiling API](https://docs.nvidia.com/datacenter/dcgm/latest/dcgm-api/dcgm-api-profiling.html).  Therefore, a proposed action that merely enumerates groups or chooses a field set is absorbed.  A valid residual is only the paired, randomized repeated-window *estimand* that tests whether same-workload scientific conclusions survive native-compatible versus automatic-multiplex collection after all measurement cost is charged.

CounterPoint is the closest methodological subtractor: it uses counter confidence regions to confront multiplexing noise, but its stated case study is Haswell MMU model reconciliation, not a DCGM-native compatible-group / MLPerf quality-and-wall-power conclusion contract [CounterPoint](https://arxiv.org/abs/2601.01265).  This bounded result is `SEARCH_BOUNDED_OPEN`, not an absence claim.

## Atomic revision gate

`PINNED_DCGM_NATIVE_GROUP_CONTRACT__MLPERF_PAIRED_WINDOW_CONCLUSION_STABILITY_CERTIFICATE`

Single proposition: for one pinned non-GPM GPU and one exact MLPerf object, an auditable pairing/randomization protocol compares (A) one stock DCGM automatic-multiplex profile with (B) a complete partition of the *runtime-enumerated* compatible groups, while preserving LoadGen/quality outputs and estimating the same declared bottleneck or design-ranking functional.  It must state a materiality interval and a held-out model–scenario–GPU falsifier.

Refutation conditions are atomic: (1) group enumeration shows the requested metrics are concurrently compatible, (2) B cannot preserve the same MLPerf observation contract, (3) the full-cost paired estimator shows no material conclusion difference on the preregistered held-out stratum, or (4) CounterPoint/current tooling is shown to implement the same DCGM-native+MLPerf contract.  Any of these removes the N3 claim for that scope.

## Fair comparisons and full cost

| Arm | Information/action boundary | Role |
|---|---|---|
| Stock DCGM automatic multiplex | Same fields; `dcgmi profile --list` and normal multiplexed watch; fixed sample delay | strongest same-object deployment baseline |
| Native-compatible repeated groups | Same public group catalogue; a complete, predeclared compatible partition and randomized equal windows | candidate protocol |
| DCGM compatible single group | Same workload, only one group at a time | negative control: tests whether any result is merely field choice |
| CounterPoint | generalized counter-noise/model-consistency methodology | methodological subtractor, not a same-object baseline |

The ledger must include SUT wall energy, throughput and tail, window count/duration and warmup policy, DCGM field/group/delay, host-engine CPU/RSS, collection/analysis time and RSS, power-server and quality/output checks.  Host-engine cost must be measured separately: DCGM introspection reports whole-host-engine CPU/memory, not per-client or per-watch cost [DCGM Introspection](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/introspection.html).  MLPerf power itself uses a physical analyzer/PTDaemon path, so it is not legitimate to replace wall-energy accounting with GPU-only watts [MLPerf power measurement](https://docs.mlcommons.org/inference/power/).

## Stage A preclaim fidelity route and killer

No experiment is authorized here.  The finite next-route is: pin the object above; archive `dcgmi profile --list` output; pre-register field partitions, order randomization, repeats, exclusion/blank/zero policy, estimator and materiality interval; then replay the unchanged small MLPerf witness under A/B and an untouched held-out stratum.  Preclaim fidelity fails if LoadGen/quality/request-stream equality, native group catalogue, raw counter schema, or full-cost ledger cannot be checked.

The killer is a held-out model–scenario–GPU stratum whose paired full-cost interval leaves the same declared bottleneck/ranking conclusion under A and B.  A positive result can support only the pinned protocol boundary; it cannot establish kernel-level causality or a universal counter reliability law.

## Why not STOP

There is no current direct collision on the full object+method+guarantee+cost contract, no object-inherent impossibility, and a finite CPU/physical-instrumentation closure path exists.  The absent SUT, power equipment and observations are readiness limits, not scientific negative evidence.  The present failure is narrower: the candidate has not selected the one exact observation object or written the shared conclusion functional needed to make the promised comparison fair.  That is a single repairable Stage 0 gate.

