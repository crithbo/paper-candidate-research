# FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT Stage A Revision 1 Report

- Lane id: `CANDIDATE_EXECUTION_LANE_3`
- Assignment id: `STAGEA-L3-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-REVISION1-V8.7`
- Input freeze: initial manifest `6AD1305983AA337B35267BDA31DD543129952F2B650573D125257775DE3F2C2A` (`11,519/11,519 PASS`); independent-gate manifest `2C9ECD72A92ECEF7DB4BA8E08EDB6EAE3137D565383D70A45248209E2C1A09A6` (`5/5 PASS`)
- Cross-assignment contamination declaration: `NONE`
- Decision: `STOP_RECOMMENDED__OWNER_NONFINAL`
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `CORRECTED_TRACE_PROFILED_SAME_OBJECT_24_MODEL_STAGEA_NEGATIVE__OWNER_NONFINAL`
- Novelty route: `N2`
- Scientific revision consumed: `true`
- Stage B authorized: `false`
- Stage semantics: a valid bounded corrected pilot; the owner recommendation still requires independent gate/mainline acceptance.

## Pre-claim contract fidelity gate

- Gate: `TRACE_DERIVED_PROFILE_MATCHED_READER_AND_EXECUTABLE_FRONTIER_FIDELITY_GATE`
- Final status: `PASS`
- Claim-bearing rows before PASS: `0`
- Frozen atomic actions mapped to implementation paths: unchanged complete generated/direct public-builder catalog in `NATIVE_ACTION_CATALOG.md`; trace weights map to the exact reflection `Object.field` actions.
- Comparator implementation/parameter/semantic audit: unchanged 24 models, 11/13 split, 8 executable arms, beam 8, cap 20,000, fallback and toolchain; `Q1_COMPARATOR_MATRIX.md`.
- Native codec/reader/format parity: pinned unmodified FlatBuffers `7e1630...`, generated TFLite reader, stock verifier and ordinary raw `TFL3` for all arms.
- Metric denominator/full cost: exact bytes; 5,000 warm and 50 cold requests; fixed 8 MiB eviction; writer/reader/verifier/equality wall/CPU, planner, exact builder capacity/scratch, RSS, temp and fallback.
- Small witness: native 56-byte plans at distance 20/36 plus 1,136-path exhaustive oracle; both replayed and matched frozen expected fields.
- Training trace: 11 models / 704 requests / 23,936 events / 34 endpoints; `TRACE_FREEZE.yaml` SHA-256 `4F6B2CE063D1FFA31B249DB3379ECB83BF46AA9116A189ACC6371706A5F2F832`.
- Native collector/replay checksum parity: `15,744`; profile hit audit: 19 positive graph fields, weight sum 13,376.
- Non-claim-bearing failed preclaim retained: attempt 1 compared native stdout with owner-added wrapper metadata and failed closed; it is preserved under `preclaim/` and did not alter the contract.
- Claim-bearing corrected run started only after final PASS: `true`.

## Frozen contract

Input is the pinned schema, one identity-labelled rooted logical DAG with exact values/nulls/presence/vector-key order/aliases, ordinary TFL3 framing and the frozen training-only logical request profile. Output is one ordinary raw native FlatBuffer accepted by the pinned generated reader and stock verifier with an identical canonical digest and applicable force alignment.

Revision 1 changes only the invalid profile/measurement/frontier realization: hard-coded schema weights are replaced with a frozen native training trace; the matched trace is timed; useful residual actions and whole-arm Pareto are mechanically derived. Object, reader, format, corpus, arms, parameters and primary success rule are unchanged.

## Headroom and minimal mechanism

FB-RCFDP remains a global bounded reuse-closure state quotient over exact native prefix replay, current position, live aliases, vtable histories, field order and profile endpoints. B2 retains the same beam/cap/action/cost budget without the FlatBuffers-specific quotient. Generated Pack, stable/config, hot-first, local and tiny exhaustive ceiling remain present.

The quotient is real: 700 distinct-raw merges across 153,197 expansions and strict activity on 23/24 models. This is a mechanism observation, not a benefit.

## Natural workload and corrected prediction

The unchanged corpus contains 24 official TFLite Micro models at commit `18b9e6...`: 11 training models from four families and 13 held-out models from five disjoint families. The fixed request program produces 704 training descriptors. Every accessor endpoint is touched once per request on these models, yielding a disclosed uniform 704-count profile.

Prediction: a useful quotient state should cause at least 10% retained candidate actions outside mapped B0/B1/B2 continuations and produce a raw-byte or matched-trace access residual at both held-out p50 and p90 while remaining on the complete full-cost frontier.

## Highest-risk probe result

- Corrected natural outputs: `192/192` same-object eligible.
- Useful residual action fraction: `0/1,146 = 0%`, below `10%`.
- Held-out candidate-minus-union raw bytes: `+1.376% p50 / +1.937% p90`.
- Held-out matched trace warm: `+0.796% / +4.025%`.
- Held-out matched trace cold: `+0.925% / +1.913%`.
- Whole-executable-arm frontier: candidate is present at aggregate held-out p50 and p90.
- Scientific interpretation: the candidate's high-dimensional nondominance cannot qualify without a byte/access primary benefit; both useful-action and primary-residual killers fire.

## Performance evidence chain

- Algorithm change: FlatBuffers-specific global reuse-closure quotient in place of a generic bounded beam.
- Mechanism metric: 700 strict distinct-raw merges on 23/24 models.
- State-conditioned residual: zero useful actions under the preregistered comparable-prefix definition.
- End-to-end result: all held-out paired byte and matched-trace latency summaries are adverse at both p50 and p90.
- Full cost: candidate construction is dominated by planning (`41.277/101.285 ms` held-out p50/p90 wall); candidate remains frontier-nondominated only through other vector tradeoffs and timing resolution, which cannot substitute for primary benefit.
- Generality boundary: only this frozen request program and bounded nine-family official TFLite corpus.

## Current critical-cost analysis

The STOP does not rely on planner cost alone. Exact raw bytes and both matched-reader wall metrics are already worse against the comparator union, and useful action coverage is exactly zero. Planner/build cost strengthens the negative but does not create it. CPU measurements below timer resolution are disclosed in `FULL_COST_LEDGER.md`; this censoring is conservative because the candidate is still retained on both aggregate frontiers.

## AI execution ledger

- AI executability class: `AI_CORE_EXECUTABLE_PUBLIC_CPU`
- Measured ai_core_fraction: `1.0` for this bounded implementation, native replay, analysis and package production.
- Reproducible artifacts: frozen trace/mapping, C++ collector/harness, raw 192-row CSV, per-model stdout/stderr, analysis, independent mechanical recomputation and manifest.
- Human-only authority: independent Stage A gate, registry/state transition, any final STOP acceptance and all Stage B/project decisions.

## Mechanism pivot

None. No new corpus, arm, config search, beam/cap change, reader/format/object change or result-conditioned trace/tuning occurred. The one scientific revision was consumed only after the revised preclaim gate passed.

## Current upstream reality and collision boundary

FlatBuffers commit `7e163021e59cca4f8e1e35a7c828b5c6b7915953` / v25.12.19, generated/direct builder actions, `ForceDefaults`, `DedupVtables`, capacity, force alignment, shared string/alias and Offset64 non-applicability are unchanged from the verified initial source audit. Revision 1 makes no new action-absence claim. Latest literature status remains `SEARCH_BOUNDED_OPEN`; no universal novelty or impossibility statement is made.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Status: `PARITY_NOT_PLAUSIBLE`
- Closed: native same-object fidelity, corrected trace provenance, matched reader, useful-action accounting, complete executable frontier and bounded full cost.
- Decisive gap: no useful residual action coverage and no primary held-out p50/p90 benefit.
- Tier disposition: the frozen N2 paper shape falls below Q2 under this corrected bounded evidence.

## Non-relaxable quality audit

- Same-object: `PASS`, 192/192.
- Latest collision: `SEARCH_BOUNDED_OPEN`; no strengthened absence claim.
- Strong fair baselines: `PASS`, all eight frozen arms executable.
- Natural input/evidence: `PASS`, unchanged 24 pinned official models; claim remains bounded to the trace program.
- Full cost: `PASS_WITH_TIMER_RESOLUTION_DISCLOSURE`; all registered fields exist and the candidate is conservatively retained on both frontiers.
- Reproducibility: `PASS`, raw artifacts plus separate recomputation.
- Evidence/claim honesty: `PASS`; uniform trace profile, preclaim failure, cost censoring, frontier membership and narrow owner authority are explicit.

## Supported and unsupported claims

Supported: on this exact request trace/corpus/union, FB-RCFDP's natural quotient is nonvacuous but structurally absorbed at the useful-action gate and has no held-out p50/p90 raw-byte or matched-trace access residual.

Unsupported: universal failure of profile-guided FlatBuffers layout, another request distribution, another schema/corpus/mechanism, hardware-cache effects, a closed latest-collision search, or a final status before independent review.

## Mandatory user gate before Stage B

- Independent Stage A gate decision: `PENDING`.
- User packet: `USER_REVIEW_PACKET.md`.
- `PENDING_USER_STAGEB_REVIEW`: `false`.
- Stage B user approval id: `null`.
- Stage B authorized: `false`.

No blocker or human-reserve condition applies. The owner submits this valid narrow scientific STOP recommendation to the independent gate.
