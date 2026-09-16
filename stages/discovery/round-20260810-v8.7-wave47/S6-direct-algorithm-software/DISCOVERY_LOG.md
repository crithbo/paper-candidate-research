# Direct exact-residual Discovery — S6 Wave47

Assignment: `DISCOVERY-S6-20260810-V8.7-WAVE47-DIRECT-EXACT-RESIDUAL`  
Frozen cutoff: `2026-08-10`.

## Screened exact-object lineages

| Object | Current union / source status | Structural potential | Current evidence readiness | Disposition |
|---|---|---|---|---|
| Binary AIGER AND-node label scheduling | Current Yosys and ABC writers; AIGER binary delta semantics; current-source/flags checked. | `TIER_B_Q2_VIABLE`: a fixed-graph precedence-constrained delta-byte schedule is a complete N2 constructor. | `FINITE_FIDELITY_GAP`: native reader, small enumerated witness, natural HWMCC route, full-cost denominator and 72h killer are finite. | `PROPOSE_STAGE0` — [brief](TOPIC_BRIEF_AIGER_DELTA_SCHEDULE.md). |
| DRAT proof-trace reorder/deletion construction | drat-trim HEAD `2e3b2dc0ecf938addbd779d42877b6ed69d9a985`; checker semantics are native. | Not retained: clause reordering/deletion without a fully specified proof producer either changes trace constraints or collapses toward already-excluded proof-trace families. | Not a readiness drop. | `DROP_SAME_GUARANTEE_OR_ACTION_NOT_COMPLETE`. |
| HDF5 chunk-index construction | HDF5 HEAD `57128d33b2fb75bd06dbd08a0555e50e5e7252ac`; `H5B2` is current native index machinery. | Not retained: prospective chunk grouping was a configuration/layout family with no distinct reader-compatible atomic constructor. | Not a readiness drop. | `DROP_ROUTINE_LAYOUT_CONFIGURATION`. |
| DuckDB adaptive-radix-tree index build | DuckDB HEAD `db98709cc2cb41efe5a46bb795f689f5b54f7805`; ART source checked. | Not retained: no same-object action beyond current ART construction was named. | Not a readiness drop. | `DROP_DIRECT_INDEX_CONSTRUCTION_UNION`. |

## Outcome

One conditional `PROPOSE_STAGE0` is retained. It does not assert a current speed/size result or a source absence beyond the checked writer action interface. Its direct literature collision is deliberately `SEARCH_BOUNDED_OPEN` for independent Stage 0. The three drops are structural—changed guarantee, configuration-only construction, or current direct index family—not lack of implementation, results, resources, natural data, or AI readiness.
