# S4-DCGM-MLPERF-COUNTER-COMPATIBILITY — Stage 0 revision1

## Decision

- Assignment: `STAGE0-P1-20260814-S4-DCGM-MLPERF-COUNTER-COMPATIBILITY-REVISION1-V8.7`
- Atomic gate: `PINNED_DCGM_NATIVE_GROUP_CONTRACT__MLPERF_PAIRED_WINDOW_CONCLUSION_STABILITY_CERTIFICATE`
- Decision: `RECOMMEND_STAGE0_PASS_FOR_CLOSING_REVIEW`
- Conditional tier: `TIER_B_Q2_VIABLE`
- Evidence ceiling: `E1_STATIC_MEASUREMENT_CONTRACT_AND_FALSIFIER_ONLY`
- Scientific revision: consumed (`1/1`): yes.
- Stage A/B: not authorized; only independent closing may be requested.

## Single proposition and its refutation

On one non-GPM NVIDIA T4, a single locked MLPerf observation object can compare stock automatic multiplexing with the complete native-compatible partition of **the same requested fields at the same 100 ms delay**.  The study's object is whether a predeclared, non-attribution *activity-balance reporting conclusion* is stable under those plans after quality, tail, throughput, wall energy, shared host-engine and analysis costs are charged.

The proposition is false for this scope if the T4 runtime catalogue does not reproduce the frozen incompatible grouping, if either arm changes the MLPerf contract, if the held-out stratum retains the same conclusion within the materiality interval, or if DCGM/CounterPoint is shown to implement this exact protocol.  None of those has been observed; they are Stage A falsifiers.

## Frozen exact object

| Dimension | Frozen value |
|---|---|
| GPU/SUT | One bare-metal NVIDIA Tesla T4, single GPU, no MIG and no concurrent profiling owner; pre-GPM/non-GPM target. |
| DCGM / driver | DCGM `4.6.1`; NVIDIA Linux datacenter driver `R450.80.02`. NVIDIA's current support documentation states R450+ and Kepler-and-newer datacenter-GPU support. Any version mismatch is a preclaim fidelity failure, not a silent substitution. |
| MLPerf carrier | MLPerf Inference `v5.1`, closed ResNet50-v1.5, edge `Offline`, official ImageNet2012 validation QSL indexed in ascending `0..49,999` order, official v5.1 accuracy verifier PASS and LoadGen Offline rules. |
| Identical request contract | The frozen QSL order, `mlperf.conf`, `user.conf`, model bytes, SUT binary/container and all quality predicates are identical in every timed window.  A later canonical `mlperf_log_detail.txt` is evidence, not a new request plan. |
| Fields and delay | `F={1002 sm_active,1003 sm_occupancy,1004 tensor_active,1005 dram_active,1008 fp16_active}`, DCGM delay `100 ms` in both arms. |

The official T4 example places `1002/1003/1004` in `A.1`, `1008` in `A.3`, and `1005` in `B.0`; `A.1` and `A.3` require multiplexing while the `B` group may accompany either.  The actual `dcgmi profile --list --entity-id gpu:0` output is an immutable Stage A preclaim artifact: if it is not exactly compatible with this action grammar, the candidate stops rather than selecting new fields.

## Two complete native plans

| Plan | Exact action | Prohibited interpretation |
|---|---|---|
| A — stock multiplex | One ordinary DCGM `dmon` watch of all of `F`, `100 ms`; native automatic multiplexing remains enabled. | Not a weakened/default baseline. |
| B — compatibility observation | Same `F`, same delay; complete partition `G1={1002,1003,1004,1005}`, `G2={1008}` according to the runtime catalogue. A B replicate runs both groups in randomized within-block order. | Not manual field search, per-window adaptive choice, controller, or changed workload. |

DCGM owns group discovery and automatic multiplexing.  The residual is only the offline paired observation **contract** that determines whether a multiplexed multi-field statement is reportable.  No arm identifies kernels or claims a causal bottleneck.

## Shared conclusion functional and full-cost ledger

For a window (w), let `P(w)=mean(sm_active,tensor_active,fp16_active)` and `D(w)=dram_active`, after the same predeclared blank/zero policy.  Let `S=median_w(P(w)-D(w))`.  The conclusion function is

`C(S) = PIPE_ACTIVITY_HIGH if S >= +0.05; MEMORY_ACTIVITY_HIGH if S <= -0.05; MIXED_OR_INDETERMINATE otherwise.`

This is a descriptive activity-balance label only.  It is not called a bottleneck, and it supports no source/kernel/instruction attribution.  A material plan difference is a different `C`, or a change of at least `0.05` that crosses an adjacent decision boundary.  The benchmark-validity conclusion is: “may / may not report this vector as a co-observed activity-balance profile under this pinned contract.”

Each of 32 paired blocks uses a 60-second timed window after a fixed 15-second warmup.  Block order is balanced: half start A, half start B; within B, `G1/G2` order is balanced.  Every replay restarts the fixed Offline QSL order.  B's two timed group windows, retries, analysis, collection, and extra elapsed duration are charged rather than normalized away.

The ledger contains: official quality/output status; number/duration/retries of all windows; LoadGen throughput and tail; SUT wall energy through the same MLPerf PTDaemon/power-server path; DCGM group/delay/blank/zero records; whole-host-engine CPU/RSS; collector and analysis CPU/RSS; cooldown/warmup elapsed time; and a co-tenancy/thermal/NVML ownership record.  DCGM introspection is explicitly a shared host-engine measurement, not a per-watch attribution.

## Held-out falsifier and Stage A fidelity killer

The held-out stratum is MLPerf Inference v5.1 BERT/SQuAD-1.1 `Offline` on the same pinned T4/DCGM/driver/SUT class, with the same `F`, delay, group grammar, collection path and conclusion function.  It is not used to tune the threshold, partition, delay or repeat count.

Before any claim-bearing observation, Stage A must verify: the non-GPM mode; exact runtime group listing; A/B fields and delay equality; v5.1 quality and QSL equality; raw-schema completeness; physical wall-power continuity; and the cost ledger.  Stop the mechanism if runtime group compatibility removes multiplexing, either arm drifts from the frozen observation contract, the held-out interval retains `C(A)=C(B)` without a boundary crossing, or a strong source implements the same protocol.  A positive result would support only this T4/v5.1 activity-balance validity boundary.

## Collision, contribution, and paper potential

Current DCGM absorbs all raw actions: metric listing, compatible-group discovery, multiplexing, sampling-rate selection, and host-engine introspection.  CounterPoint absorbs a generic claim that multiplexed counters are noisy.  It does not, in the audited record, supply the T4 runtime-group action grammar plus fixed MLPerf quality/QSL, same fields/delay, paired full-cost conclusion function and held-out benchmark-validity falsifier.  This remains `SEARCH_BOUNDED_OPEN`, not an absence assertion.

The remaining N3 is a reproducible measurement-validity law: under precisely stated native-counter constraints, the benchmark reporting conclusion either survives compatibility stratification or must carry a bounded validity disclaimer.  That is a credible Q2 measurement-characterization shape if the preclaim contract and held-out test close.  Current readiness is still static; no result, ranking reversal or counter effect is claimed.
