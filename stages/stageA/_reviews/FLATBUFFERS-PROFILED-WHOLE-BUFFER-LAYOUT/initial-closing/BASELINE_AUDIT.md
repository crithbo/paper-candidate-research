# Baseline and Full-Cost Audit

## Same-object baseline execution

The eight frozen arms are present for every one of the 24 models, and every output passes the same stock verifier, `TFL3` identifier, canonical identity/value/presence/vector-order digest, and applicable alignment checks. Generated `Pack` is therefore eligible on this bounded corpus despite its known potential to erase presence/alias information in other objects.

| Arm | Executable | Same object | Role disposition |
|---|---|---|---|
| `generated_pack_default` | yes | 24/24 | current native default |
| `stable_legal_topo` | yes | 24/24 | deterministic current action plan |
| `stable_dedup_off` | yes | 24/24 | current configuration arm |
| `stable_size_matched_capacity` | yes | 24/24 | current capacity arm |
| `hot_first_ready` | yes | 24/24 | same-profile heuristic |
| `local_field_order` | yes | 24/24 | local subtractor |
| `generic_bounded_beam` | yes | 24/24 | matched-width/cap generic comparator |
| `fb_rcfdp_bounded` | yes | 24/24 | candidate |

The union is not a fictional simultaneous builder configuration at execution time. Each row is independently realizable. However, a coordinate-wise minimum selected from different rows is an envelope, not a single full-cost vector.

## Fair-information finding

All profile-aware arms read the same in-process `ProfileWeight` function, so information parity holds within the executed proxy experiment. It does not hold against the frozen research contract because no training-trace artifact exists. The constants are schema-name heuristics and are applied while extracting every model. The owner package does not show that held-out outcomes influenced them, but it also does not show that the eleven training families produced them.

Disposition: `FAIR_WITHIN_SCHEMA_WEIGHT_PROXY__NOT_FAITHFUL_TO_TRACE_PROFILED_OBJECTIVE`.

## Full-cost finding

Recorded dimensions include graph extraction, planner wall/CPU/RSS/states/transitions/temp, builder wall/RSS/calls, final bytes, verification, generic warm/cold reader, weighted-distance proxy, and fallback. Two hard failures remain:

- `measured_profile_trace_latency_ns`, expressly named in the frozen contract, is not present. `ReaderChecksum` is a general fixed traversal and the static distance metric may not substitute for native trace replay.
- The executable Pareto frontier is not computed. Per-metric minima are used, and the final qualifying Boolean is hard-coded.

Disposition: `DIRECTIONAL_COSTS_MEASURED__CLAIM_DECISIVE_PROFILE_ACCESS_AND_EXECUTABLE_FRONTIER_MISSING`.

## Held-out and provenance

The model files, upstream commit, paths, Git blobs, SHA-256 values, split labels, family labels, schema, compiler, and FlatBuffers source are well pinned. The family-disjoint 11/13 split predates accepted outcomes. The corpus therefore supports a bounded official-TFLite carrier claim.

The access profile has code provenance but not observational provenance. A reproducible profile needs trace events/counts, logical endpoint mapping, source workload, collection command, train-only estimator, and a freeze hash. These are absent.

## Killer disposition

Accepted narrow negative facts:

- no byte or schema-weighted-distance win/tie on 24/24;
- held-out medians/tails are adverse for all reported scalar dimensions;
- planner/build costs are adverse and two models fall back.

Rejected terminal inference:

- `NO_HELDOUT_P50_P90_PRIMARY_OR_FULL_COST_RESIDUAL_AGAINST_COMPLETE_EXECUTABLE_UNION` is not established for the original trace-profiled claim because the relevant profile-matched latency and executable-vector frontier were never computed.

The fair scientific response is the single atomic revision in `INDEPENDENT_REVIEW_REPORT.md`. If that gate produces the same negative outcome, a narrow STOP would be justified. No second corpus, arm, config search, mechanism pivot, or Stage B work is authorized.
