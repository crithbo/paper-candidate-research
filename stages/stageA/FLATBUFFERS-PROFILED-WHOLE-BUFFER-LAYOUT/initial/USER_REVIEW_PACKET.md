# FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT User Review Packet

- Stage: `Stage A`
- Lane id: `CANDIDATE_EXECUTION_LANE_3`
- Assignment id: `STAGEA-L3-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-INITIAL-V8.7`
- Decision: `STOP_RECOMMENDED__OWNER_NONFINAL`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `BOUNDED_NATURAL_NATIVE_STAGEA_NEGATIVE__OWNER_NONFINAL`
- Claim-bearing observation obtained: `yes`
- Scientific revision consumed: `no` in Stage A
- Pending user Stage B review: `no`
- Stage B authorized: `false`
- Stage B user approval id: `null`

## What is established

The implementation is faithful: stock native writer/reader/verifier, exact object identity/presence/key/header, native force alignment, a 56-byte witness and a 1,136-path tiny exact oracle all pass. The global reuse-closure quotient is real, with strict merges on 22/24 official natural models.

The bounded scientific premise is negative. Against the full executable union, the candidate has no raw-byte or weighted-distance win/tie on any model. On the 13 held-out models it is worse at both p50 and p90 for bytes, weighted distance, warm reader, cold reader and builder time, before including 43.7/104.2 ms p50/p90 planning wall and two fallbacks.

## What is not established

This does not prove that all profile-guided FlatBuffers layout algorithms are impossible, nor that another object/format/mechanism lacks value. It does not close the literature search or authorize a renamed revival. It is an owner recommendation awaiting an independent Stage A gate.

## Exact object and narrow claim boundary

One ordinary raw native FlatBuffer from a fixed schema and identity-labelled logical DAG, with exact values/nulls/presence/vector-key order/header and stock reader/verifier semantics. No schema/object mutation, Offset64 TFLite output, byte postprocessing or external compression is admitted.

## Decisive evidence or preclaim boundary

Preclaim gate passed before accepted natural evidence. The decisive held-out candidate-minus-best-union deltas were:

- bytes: +2.362% p50 / +4.180% p90;
- warm reader: +0.499% / +1.154%;
- cold reader: +0.691% / +1.711%;
- builder wall: +49.454% / +78.125%;
- weighted distance: +165.980% / +283.061%.

Positive means worse. Isolated per-model latency minima are preserved but do not survive the registered p50/p90 rule.

## Fair baseline and full-cost status

All 192 natural arm outputs were eligible. Baselines include current generated Pack/default, stable/hot current-native orders, relevant config grid, local field planning and a same-width/cap generic beam. Profile extraction, planning, building, verification, warm/cold reader, RSS/temp, bytes and fallback are recorded.

## Reproducibility and integrity

Official inputs are frozen at exact Git blobs with URL/size/SHA-1/SHA-256/license; compiler, flatc, source blobs, schema, generated headers, C++ sources/executables, raw rows, failed debug notes and analysis scripts are assignment-local. `HASH_MANIFEST.sha256` is the integrity root.

## User action requested, if any

- Why user action is needed: none for execution; mainline should send this package to the independent Stage A gate.
- Minimum action: no Stage B approval should be issued for this assignment.
- Acceptable alternatives: an independently justified new object or mechanism requires a new topic/assignment; it cannot overwrite this negative result.
- Resume directory and frozen contract: not applicable.

## Recommended next state

`STOP`, subject to independent Stage A gate and mainline state transition.

This packet is a review aid. It does not authorize Stage B or a formal paper project.
