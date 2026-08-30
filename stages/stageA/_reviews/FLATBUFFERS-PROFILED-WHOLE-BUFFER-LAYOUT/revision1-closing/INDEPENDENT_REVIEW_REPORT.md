# Independent Stage A Closing Review

## Assignment

- `assignment_id`: `STAGEA-G1-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-REVISION1-CLOSING-V8.7`
- `topic_id`: `FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT`
- `role`: independent Stage A gate reviewer
- `decision`: `CONFIRM_STOP`
- `confidence`: `0.97`
- `quality_tier`: `BELOW_Q2_STOP`
- `stageb_authorized`: `false`
- `stageb_user_approval_id`: `null`
- `scientific_revision_consumed`: `true`
- `revision_budget`: `1/1_CONSUMED`

## Executive decision

The revision closes the initial fidelity defect before the first claim-bearing natural-corpus row, then produces reproducible same-object negative evidence against the frozen FB-RCFDP mechanism. I independently confirm `STOP` for that narrow mechanism.

Two separately preregistered scientific killers fire:

1. FB-RCFDP contributes `0/383` useful actions on training models, `0/763` on held-out models, and `0/1146` overall. The frozen minimum is 10%; the observed fraction is 0%.
2. On the 13 held-out official models, the candidate has no primary byte/access advantage at both p50 and p90 against the complete executable comparator union. Candidate-minus-union residuals are positive, hence worse: raw bytes `+1.3761%/+1.9366%`, warm trace wall time `+0.7959%/+4.0250%`, and cold trace wall time `+0.9253%/+1.9129%` at p50/p90.

Candidate membership in the aggregate full-cost Pareto frontier does not overturn either killer. The contract explicitly requires primary byte/access benefit and non-vacuous useful actions; nondominance caused by other cost axes is not a positive claim.

## Frozen inputs and integrity

The assigned control files matched their frozen SHA-256 values:

- `plan.md`: `72FB538177B62C51193E832A7C0F5CF3710847874AB125683536D22FAD35A819`
- `registry.yaml`: `EFACA60F60E2AB917BFBCF1F5472DCB8EF38ED024D89E609FCF44B0D1ABE03CC`
- `rules/ROLE_STAGEA_REVIEW.md`: `7403DD87FD0091BA836F782EE215AFDFB231BB5AFBF37570571B09EC524E94A8`

The revision owner package matched the supplied hashes:

- `STAGEA_REPORT.md`: `917AC6F495F65B9898BB25DAAEFC99B3999FF2AB9467DB105A3CE7956F5676F7`
- `EXPERIMENT_CONTRACT.yaml`: `14F752877DCACAC262665E84FFEA50E83AEA346186A0B70E6D9ED9106E70618F`
- `RESULTS.md`: `32485624194671C037F1A87F9999F79C2BDD8141135670A8D7D04D385E9276E7`
- `FULL_COST_LEDGER.md`: `F63D76EAECCB0C54789B61A9EB9C7E3E7577D58F8E569DE45CF9AEDEB0E8E501`
- `USER_REVIEW_PACKET.md`: `8B299F123991CD3D74ADC3CBAAF67C5A064EDECA051F4F2FD59CCFC3F2F42BD3`
- `handoff.yaml`: `BD0A80D6B7E05D1BA78EDB8552B8CEBFD4C63E1A873490FA503768ED233B95A2`
- `HASH_MANIFEST.sha256`: `72A84CA17702E0519DB3C4681E5F2075EBAD58EC3E070E43A1E42040E01EDDD9`

I recomputed all 94 manifest entries: `94/94 PASS`, zero missing, zero mismatches, covering 5,557,846 bytes.

## Preclaim fidelity and revision timing

The corrected preclaim gate passed before the first claim-bearing row. The final gate records zero claim-bearing rows and a single canonical arm-suppressed objective digest across all eight arms. The natural runner independently checks that gate before accepting a model result.

The scientific-revision marker was written only after the first natural model returned eight eligible rows. It identifies model `00_quantize_quantize0` and timestamp `2026-08-11T09:34:45.650613+08:00`. Thus the checker correction and trace freeze occurred before observation; the subsequent 24-model run consumed the sole scientific revision.

The training trace was derived only from the frozen 11 training families: 704 request programs and 23,936 endpoint events across 34 endpoints. The model identifiers in the trace exactly equal the 11 training identifiers and have zero overlap with the 13 held-out identifiers. Static inspection found no access to the initial result table or held-out model files during trace construction.

The trace is deliberately uniform: each endpoint appears 704 times. That is a legitimate frozen probe, but it narrows the claim ceiling to this request distribution; it is not evidence for arbitrary production skew.

## Exactness, object identity, and legality

The natural table contains 24 official TFLite Micro models by eight executable arms, or 192 rows. Independent checks found:

- `192/192` eligible rows;
- `192/192` verifier/equality/identifier/alignment checks passing;
- exactly eight expected arms for every model;
- one canonical object digest per model across arms;
- no reader or output-semantics divergence.

The candidate and comparator arms therefore operate on the same serialized object and are checked by the same reader/verifier path. The corrected signature-aware state covers boundary/state cost and the full signature; the earlier intermediate-backpointer-style fidelity concern is not present in the revision evidence.

## Independent recomputation

From the raw frozen CSV rather than the owner summary, I obtained:

| Quantity | Independent value |
|---|---:|
| rows / models / arms | 192 / 24 / 8 |
| training / held-out models | 11 / 13 |
| candidate distinct-raw merges | 700 |
| candidate expanded transitions | 153,197 |
| models with strict merge | 23/24 |
| candidate fallbacks | 2 |
| useful actions, train | 0/383 |
| useful actions, held-out | 0/763 |
| useful actions, all | 0/1146 |
| useful-action fraction | 0% |
| candidate frontier membership | 15/24 overall; 9/13 held-out |

The useful-action computation credits a candidate decision only when a strict merged state has a comparable completion set and its selected next action is absent from every current comparator action set. Fallbacks receive no useful credit. This matches the frozen definition and cannot be rescued by a denominator reinterpretation.

Held-out candidate-minus-best-union primary residuals were:

| Primary metric | p50 | p90 | Direction |
|---|---:|---:|---|
| raw bytes | +1.3761% | +1.9366% | candidate worse |
| warm trace wall time | +0.7959% | +4.0250% | candidate worse |
| cold trace wall time | +0.9253% | +1.9129% | candidate worse |

All six residual summaries are positive. Consequently no frozen primary metric is improved at both p50 and p90.

## Strong-baseline and full-cost assessment

The comparison uses the eight frozen executable arms under the same object, legality, reader, verifier, and trace. The union is reconstructed per model from eligible comparator arms and is not a subtract-only synthetic envelope. Independent reconstruction of the aggregate p50/p90 Pareto frontiers matches the owner result.

The ledger accounts for bytes, warm/cold traced wall and CPU time, end-to-end construction wall/CPU time, peak RSS, temporary bytes, and fallback. The one-time trace-collection cost is common to profile-aware choices; excluding it from the candidate vector is favorable to FB-RCFDP and therefore cannot explain the negative result. Coarse zero CPU deltas on Windows reduce precision for that dimension but do not affect the exact useful-action count or the adverse raw-byte and wall-time residuals.

The candidate is nondominated for some models because Pareto comparison spans many cost axes. The preregistered rule intentionally prevents that form of nondominance from evading the primary byte/access gate. I find no direction error, denominator swap, same-object drift, or unfair best-of construction.

## Decision boundary and claim ceiling

This decision establishes only:

`FROZEN_FB_RCFDP__24_OFFICIAL_TFLITE_MICRO_MODELS__11_TRAIN_13_HELDOUT__704_REQUEST_UNIFORM_TRACE__8_ARM_EXECUTABLE_UNION__STAGEA_NEGATIVE`

It does not establish that FlatBuffers layout optimization is generally impossible, that all TFLite workloads lack exploitable profile structure, or that another trace, mechanism, state representation, beam/cap, schema family, or implementation must fail. The result applies to the frozen candidate and contract, including the pinned FlatBuffers source, beam 8, cap 20,000, the stated 24-model corpus, and this trace protocol.

The evidence is scientific negative evidence, not a resource/readiness failure. Because the only Stage A scientific revision is consumed and the frozen mechanism has been rejected by two preregistered killers, no second revision is authorized under this assignment.

## Authorization boundary

- `StageB=false`.
- No Stage B approval is present or implied.
- No owner package or shared control file was modified.
- No new claim-bearing experiment was run.
- The lane returns to `IDLE_REUSABLE_AWAITING_MAINLINE`.
