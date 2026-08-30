# Stage 0 revision1 independent closing review

## Frozen scope and independence

- Assignment: `STAGE0-C2-20260814-S4-DCGM-MLPERF-COUNTER-COMPATIBILITY-REVISION1-CLOSING-V8.7`.
- Atomic gate: `PINNED_DCGM_NATIVE_GROUP_CONTRACT__MLPERF_PAIRED_WINDOW_CONCLUSION_STABILITY_CERTIFICATE`.
- Role: independent closing reviewer.  This reviewer did not author the PRIMARY or revision1 packet.
- Verified revision payloads: `STAGE0_REPORT.md`, `ACTION_GUARANTEE_AUDIT.md`, `CLAIM_EVIDENCE_MATRIX.yaml`, and `handoff.yaml` match the four frozen hashes; the revision manifest's self-hash is also the supplied `90DC0BD59B8DF4352CA0D47A11358EDB707DAB596791714DAC6A28EDDA2785CD`.
- No hardware access, MLPerf run, build, installation, download, experiment, Stage A, or Stage B was performed.

## Closing decision

**`INCONCLUSIVE_POLICY_HOLD`** — not a PASS and not a scientific STOP.

Revision1 correctly narrows the object to native DCGM-compatible groups on a non-GPM T4 and has a finite, same-object Stage-A route.  But its decisive paired-conclusion certificate is incomplete: `P(w)` requires `1002`, `1004`, and `1008`, while plan B obtains `1008` in a distinct G2 replay and the other terms (and `D`) in G1.  The packet never defines a B-replicate aggregation, its time index, or a derived `S_B`/`C_B` from those two non-concurrent windows.  Consequently it has not supplied two complete plans that produce comparable values of the declared conclusion functional.

This is not a missing-result objection.  It is a static action-to-conclusion gap.  It also does not establish that every valid T4/DCGM measurement-validity mechanism is impossible or already absorbed; therefore it is not scientific evidence for `BELOW_Q2_STOP`.  Because revision is already `1/1` consumed, this lane may not repair the definition or start another revision.  Stage A is not authorized.

## Decisive findings

### 1. The native group grammar is real, but does not complete the paired conclusion

NVIDIA's DCGM profiling documentation gives the T4 example: `1002/1003/1004` are A.1, `1008` is A.3, and `1005` is B.0.  Thus all requested fields in plan A require automatic multiplexing, while G1=`{1002,1003,1004,1005}` and G2=`{1008}` are a plausible native-compatible partition.  The revision fairly excludes field selection, feedback control, and attribution claims.

However, its conclusion is `S=median_w(mean(sm_active,tensor_active,fp16_active)-dram_active)`.  A plan-B replicate has two distinct timed runs and no rule saying whether it pairs G1/G2 by replicate, which timestamp represents their combined value, whether each field is separately medianed before subtraction, or how a restart-induced workload/thermal difference is treated.  Randomizing G1/G2 order does not define this missing map.  Therefore the proposed plan/path-to-conclusion correspondence is not a total function.

### 2. The declared MLPerf window is not established as a complete Offline observation

The revision fixes each timed window at 60 seconds.  MLPerf's published rules define Offline as one query containing all samples and a 600-second minimum-duration run; LoadGen waits for the query to complete and computes the metric.  The frozen packet does not state how a 60-second window is reconciled with that complete Offline execution, whether it is a separately valid micro-observation rather than a canonical Offline run, or how exactly the `0..49999` QSL is completed under the same contract.

This matters because the claimed contribution compares *benchmark-reporting conclusions* under an identical MLPerf object.  A future Stage-A protocol might make the distinction explicit and finite, but this revision's certificate does not.  Treating an arbitrary interval as the named complete Offline run would silently change the carrier.

### 3. Full-cost and paired inference inherit the undefined unit of analysis

The packet honestly lists quality, throughput, wall power, host-engine CPU/RSS, cooldown, blanks, zero policy, retries, and per-group extra time.  Yet the primary comparison unit remains undefined: one A execution versus two B executions, a pair of blocks, or an aggregate over the 32 blocks.  Without the unit and aggregation map, one cannot mechanically verify the planned materiality event, balance/order analysis, confidence treatment, or whether energy/tail/throughput are charged to the exact value whose label is compared.

The BERT stratum is a legitimate finite falsifier design, but it repeats the same missing definition and hence cannot close it at this stage.

### 4. Current-union and collision conclusion

DCGM absorbs field discovery, group constraints, automatic multiplexing, interval configuration, and shared host-engine introspection.  CounterPoint is a strong methodological subtractor for generic counter-noise/multiplexing claims.  Neither source, on the reviewed record, directly supplies the full T4 group grammar plus the fixed MLPerf paired conclusion protocol; `SEARCH_BOUNDED_OPEN` remains appropriate.  Conversely, the present static defect is not remedied by calling the protocol a generic grouping experiment: its novelty must rest on a fully defined, reproducible paired conclusion and cost unit.

## Claim matrix

| Claim | Closing status | Basis |
|---|---|---|
| T4 non-GPM DCGM group conflict is a same-object native constraint | `ACCEPTED_WITH_STAGEA_PIN` | Official DCGM group table supports the A.1/A.3/B.0 layout; exact deployed catalogue remains a preclaim check. |
| A and B use the same declared fields and delay | `PLAUSIBLE_STATIC_PROTOCOL` | Frozen plan defines this, subject to the runtime catalogue. |
| B is a complete native action plan for the declared activity-balance conclusion | `NOT_CLOSED` | G1/G2 are separate runs but no `S_B`/`C_B` aggregation or time correspondence is defined. |
| MLPerf Offline carrier is identical in every comparison unit | `NOT_CLOSED` | 60-second timed window is not mapped to the complete Offline execution/loadgen contract. |
| Paired full-cost/materiality analysis is mechanically reproducible | `NOT_CLOSED` | Unit of pairing and cost aggregation depend on the absent conclusion map. |
| DCGM/CounterPoint directly absorb the exact residual | `NOT_ESTABLISHED_SEARCH_BOUNDED_OPEN` | Current sources are strong subtractors, not evidence of this complete protocol. |
| Tier-B conditional paper potential | `HOLD` | N3 could be viable only after a closed same-object measurement contract; this revision does not close it. |

## Source basis and evidence ceiling

- NVIDIA, [DCGM Profiling](https://docs.nvidia.com/datacenter/dcgm/latest/learn/modules/profiling.html): T4 counter groups, automatic multiplexing, and interval/blank semantics.
- NVIDIA, [DCGM profiling API](https://docs.nvidia.com/datacenter/dcgm/latest/dcgm-api/dcgm-api-profiling.html): counter-group concurrency constraints.
- MLCommons, [Inference rules](https://github.com/mlcommons/inference_policies/blob/master/inference_rules.adoc): Offline query and complete-run semantics.
- MLCommons, [Inference and Power documentation](https://docs.mlcommons.org/inference/index_gh/): v5.1 carrier and physical-power process.
- CounterPoint, [ASPLOS 2026 record](https://arxiv.org/abs/2601.01265): methodological subtractor only.

The current ceiling remains `E1_STATIC_MEASUREMENT_CONTRACT_AND_FALSIFIER_ONLY`.  No observed difference, hardware result, attribution, causal bottleneck, or general counter-reliability claim is inferred.

## Required policy routing

- Scientific revision: `1/1_CONSUMED`.
- Decision: `INCONCLUSIVE_POLICY_HOLD`.
- Stage A: `false`; Stage B: `false`.
- No automatic same-ID revision, Stage-A creation, reserve transfer, or archival is authorized.
- Only a user-authorized exceptional assignment may reopen this topic, and it would need an explicit complete B-replicate/Offline/conclusion/full-cost map.  That is a policy route, not a request for an automatic second revision.
- Lane terminal state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
