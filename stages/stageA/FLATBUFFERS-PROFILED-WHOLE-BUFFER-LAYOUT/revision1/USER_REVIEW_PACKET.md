# FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT Revision 1 User Review Packet

- Stage: `Stage A revision 1 owner handoff`
- Assignment: `STAGEA-L3-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-REVISION1-V8.7`
- Owner recommendation: `STOP_RECOMMENDED__OWNER_NONFINAL`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `CORRECTED_TRACE_PROFILED_SAME_OBJECT_24_MODEL_STAGEA_NEGATIVE__OWNER_NONFINAL`
- Revised preclaim gate: `PASS`
- Claim-bearing observation obtained: `yes`
- Scientific revision consumed: `yes`
- Stage B authorized: `false`

## What was corrected

The revision froze a native generated-reader trace from only the existing 11 training models before any corrected result: 704 requests, 23,936 ordered events and 34 logical endpoints. It kept the existing 24 models, 11/13 split, 8 arms, beam 8, transition cap 20,000, toolchain, reader, format and object.

The native reader now replays the frozen profile under the fixed 5,000 warm / 50 cold denominators. Useful residual actions are computed from strict quotient states and comparable B0/B1/B2 continuations. Pareto membership is derived from whole executable arm vectors rather than a hard-coded flag or a coordinate-spliced union point.

## Fidelity and integrity

- Revised gate PASS before corrected objective rows: 8/8 arms executable, one canonical digest, collector/replay checksum parity, positive profile-to-graph hits.
- Unchanged native 56-byte witness and 1,136-path tiny exact oracle: PASS.
- Corrected natural outputs: 192/192 verifier/reader/equality/identifier/alignment PASS.
- Trace derivation opened no held-out file and no initial result file.
- One preclaim checker attempt failed only on wrapper-metadata comparison and is retained; no natural experiment crossed that failed gate.

## Decisive results

The quotient still occurs: 700 distinct-raw merges on 23/24 models. But useful residual action coverage is `0/1,146`, below the frozen 10% gate.

Held-out candidate-minus-best-union paired results are all adverse:

| Primary metric | p50 | p90 |
|---|---:|---:|
| Raw bytes | +1.376% | +1.937% |
| Profile-trace warm latency | +0.796% | +4.025% |
| Profile-trace cold latency | +0.925% | +1.913% |

The candidate appears on both aggregate whole-arm full-cost frontiers, so the package does not claim full-vector dominance. That membership is insufficient because the registered rule requires a real byte or matched-access benefit at both p50 and p90; none exists.

## Why the owner recommends STOP

Two corrected scientific killers fire after a valid run: useful residual action coverage is zero, and no primary metric has a held-out p50/p90 residual. These are same-object, trace-profiled and full-cost observations, not a resource failure or the old schema-weight proxy.

The recommendation is narrow: it applies only to FB-RCFDP under this frozen 704-request trace, official 24-model corpus and 8-arm union. It does not show that all FlatBuffers layouts or access profiles fail.

## Cost and reproducibility

Natural orchestration took 3.371 seconds; trace collection took 0.403 seconds wall; topic storage stayed below 1 GiB; no download, global install, GPU or exclusive device was used. The package includes raw per-model logs, the 192-row CSV, trace events/mapping/weights, source/executables, full-cost ledger, analysis and an independent mechanical recomputation.

Sub-millisecond writer/verify/warm-reader CPU batches are timer-resolution censored in some rows. This cannot create the negative conclusion: exact bytes, warm/cold wall residuals and useful-action coverage are already adverse, while the frontier test conservatively retains the candidate.

## Requested review action

Submit the frozen package to the independent Stage A gate. The owner cannot finalize STOP, update shared state, authorize Stage B or create a project. `stageb_user_approval_id=null`.
