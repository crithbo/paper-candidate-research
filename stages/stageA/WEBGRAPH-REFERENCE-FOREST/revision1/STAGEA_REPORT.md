# WEBGRAPH-REFERENCE-FOREST Stage A Revision1 Report

- Lane id: `CANDIDATE_EXECUTION_LANE_1`
- Assignment id: `STAGEA-L1-20260810-WEBGRAPH-REFERENCE-FOREST-REVISION1-V8.7`
- Input freeze: parent manifest `4B9AD7373D306847726B9BDD00820AA29FBCC89528FC46E1CF72A9885150A818`; independent gate report `3094E0CDA179A41B34C57D110328AC3D54D2AAAB2ECBF2E991CF1FA25E7F7DE1`
- Cross-assignment contamination declaration: `false`
- Decision: `STOP` — exact recommendation `STOP_NARROW_FROZEN_MECHANISM`
- Quality tier: `BELOW_Q2_STOP` for the frozen candidate/mechanism boundary
- Evidence ceiling: `VALID_TWO_NATURAL_GRAPH_FULL_COST_NEGATIVE_KILL__FIXED_W4_D3_ONLY__NO_GENERAL_WEBGRAPH_IMPOSSIBILITY`
- Novelty route: `N2`
- Scientific revision consumed: `true`
- Stage semantics: real bounded Stage A risk pilot; this is a narrow scientific negative result, not a claim about all reference-forest algorithms.

## Pre-claim contract fidelity gate

- Gate status: `PASS`
- Frozen atomic action mapping: every root or legal nonempty backward reference in the released native BvCompZ action table is enumerated by dense state transition code in `implementation/candidate/webgraph-0.6.2/src/graphs/bvgraph/comp/bvcompz.rs`.
- Comparator audit: the unmodified released final BvCompZ binary remains the same-object baseline; `W=4`, `D=3`, chunk 128, BE codes, interval 4, input order, native writer and readers are unchanged.
- Native parity: estimator→writer additivity, `.graph/.offsets/.properties/.ef`, sequential equality, random equality and fixed checksums all passed.
- Full-cost dimensions: graph bits, persisted native payload bytes, end-to-end elapsed, process CPU, peak working set, full sequential decode and 100k-query random access.
- Tiny witness: `38,372` legal forests; exact primary optimum `148` bits; independent secondary optimum `(sum depth=3,max depth=1,lex=[0,0,0,0,1,2,0,4,0])`; candidate exact match.
- Complete replay: all 2,048 structural cases retained parent primary costs; strict cases `531`; exact-worse `0`; `case-0043=561→560`.
- Natural replay before consumption: exact totals `8,763,554 / 875,555` bits; parent baseline hashes exact; 1,936 changed chunks all retained equal primary optimum.
- Claim-bearing matched pairs started only after PASS: `true`.
- Preclaim result: `results/preclaim/PRECLAIM_GATE_RESULT.md`.

## Frozen contract

The unique gate was `SCALABLE_DENSE_FRONTIER_AND_EXACT_OPTIMAL_ACCESS_TIEBREAK_GATE`. The only implementation change was a dense base-`D+1` exact DP with rolling arrays and compact backpointers. Primary native graph bits remained the first objective. Equal-bit paths were ordered only by `(sum reference-chain depth, max reference-chain depth, lexicographic delta vector)`; no reader timing, query trace, corpus identity, post-hoc result, fallback, corpus/config search or primary-objective change was permitted.

The scientific revision was atomically consumed at `2026-08-10T19:42:31.8755069+08:00`, immediately before the first natural matched pair. `SCIENTIFIC_REVISION_CONSUMPTION.yaml` was not modified afterward.

## Headroom and minimal mechanism

The exact primary residual survived:

| Corpus | Final BvCompZ bits | Dense exact bits | Persisted payload residual |
|---|---:|---:|---:|
| LAW cnr-2000 | 9,319,309 | 8,763,554 | 72,761 B |
| SNAP Wiki-Vote | 876,503 | 875,555 | 127 B |

The implementation now uses exactly 256 base-4 states at `W=4,D=3`, two rolling arrays and compact `(u16 predecessor,u8 delta)` backpointers. For a full 128-node chunk the logged backpointer footprint is 131,072 B and rolling arrays are 12,288 B. The exact guarantee and native action set are unchanged.

The secondary objective changed 1,891/2,544 CNR chunks and 45/56 Wiki chunks while preserving primary cost. Relative to the parent exact vectors, total reference-chain depth fell by 9,712 on CNR and 118 on Wiki. It nevertheless remained 52,194 and 288 above final BvCompZ respectively, explaining why a static tie-break could reduce but not eliminate access work.

## Highest-risk probe result

- Risk-bearing premise: a compact exact implementation plus exact-optimal static depth tie-break can retain size residual while placing every frozen full-cost dimension at or below `1.05×` final BvCompZ.
- Probe scope: the two frozen natural objects, 11 alternating-order matched pairs each, pair 0 excluded, 10 analyzed; one full native build/validate and one fixed-seed 100k-query reader measurement per variant/pair.
- Fidelity: `PASS`; all 44 build/reader variant runs exited zero; all output hashes were stable; exact bits and cross-variant checksums matched.
- Result: the premise is falsified under the frozen rule.
- Negative-result meaning: `STOP_NARROW_FROZEN_MECHANISM` for `FIXED_W4_D3_TWO_NATURAL_GRAPH_COMPLETE_ACTION_EXACT_OPTIMIZER_UNDER_NO_REGRESSION_FULL_COST_RULE`.
- It does not mean that all WebGraph compressors, all reference forests, approximate solvers, other objectives or other configurations are impossible.

## Directional increment and full-cost evidence chain

The data-structure repair was substantial: CNR candidate end-to-end time fell from the initial one-shot 47.167 s to a matched p50 of 3.802 s; Wiki fell from 1.330 s to 0.205 s. Peak RSS reached parity, and the Wiki random-access regression disappeared. This is not ordinary tuning: it replaces vector-keyed maps and cloned full prefixes with the exact bounded-state recurrence and compact reconstruction.

However, the frozen acceptance threshold applies to the candidate/baseline ratio, not to improvement over the parent implementation:

| Corpus / dimension | p50 ratio | p90 ratio | 1.05 ceiling |
|---|---:|---:|---|
| CNR end-to-end elapsed | 7.632 | 7.825 | FAIL |
| CNR process CPU | 8.241 | 8.333 | FAIL |
| CNR peak RSS | 1.001 | 1.001 | PASS |
| CNR sequential decode | 0.996 | 1.011 | PASS |
| CNR random 100k | 1.072 | 1.144 | FAIL |
| Wiki end-to-end elapsed | 1.843 | 1.852 | FAIL |
| Wiki process CPU | 3.333 | 1.833 | FAIL |
| Wiki peak RSS | 1.012 | 1.004 | PASS |
| Wiki sequential decode | 0.989 | 0.921 | PASS |
| Wiki random 100k | 1.002 | 0.992 | PASS |

Thus the method change produced real mechanism improvements but no full-cost non-dominated point under the preregistered rule. Size-only support cannot override construction and access failures.

## Current critical-cost analysis

The dense formulation removes asymptotically unnecessary prefix-vector cloning, but it still evaluates the complete legal transition relation for every reachable base-4 state at every node. At 325,557 CNR nodes this exact enumeration remains several times more CPU-intensive than released BvCompZ. The static tie-break reduces exact-path depth relative to the parent exact output, but the exact optimum still selects more and deeper references than the baseline; CNR random access therefore remains above the ceiling. No additional heuristic, pruning, approximation, configuration, corpus or objective is authorized in this revision.

## AI execution ledger

- AI executability class: `AI_CORE_EXECUTABLE_WITH_PUBLIC_CPU_ARTIFACTS`
- Measured ai_core_fraction: `0.97`
- Reproducible artifacts: frozen contract; dense Rust source; independent tiny and structural validators; natural parity validator; matched-pair runner/analyzer; raw metrics; exact output hashes; canonical manifest.
- Human-only items: mainline mechanical acceptance and independent Stage A closing judgment.

## Mechanism pivot

Not used. Object, action space, comparator, primary objective, corpora and configuration were unchanged.

## Literature collision update

No new literature search was allowed or performed. The parent current-upstream audit remains controlling: WebGraph `0.6.2`, final `BvCompZ`, `update_references_for_max_length`, `find_additional_references_greedily`, and the frozen non-default `W=4,D=3,chunk=128` configuration. The revision addresses performance/access only; it does not enlarge the novelty claim.

## Q1/Q2 evidence-gap review

- Comparator file: `Q1_COMPARATOR_MATRIX.md`
- Status: `PARITY_NOT_PLAUSIBLE` for the frozen paper mechanism.
- Closed gaps: exact native action fidelity, strongest baseline, natural size residual, compact exact implementation, static exact-optimal tie-break, full matched-pair cost and reproducibility.
- Fatal remaining gap: construction CPU/time and CNR random access fail the only authorized no-regression gate after the unique scientific revision.
- Quality tier: `BELOW_Q2_STOP` for this candidate boundary.

## Non-relaxable quality audit

- Same-object: `PASS`
- Latest collision: `SEARCH_BOUNDED_OPEN`, unchanged from the parent Stage A scope
- Strong fair baseline: `PASS_COMPLETE_FINAL_BVCOMPZ`
- Natural input/evidence: `PASS_TWO_FROZEN_NATURAL_GRAPHS`
- Full-cost: `VALID_MEASUREMENT__FAIL_1.05_CEILING`
- Reproducibility: `PASS_11_MATCHED_PAIRS_STABLE_HASHES_AND_CHECKSUMS`
- Evidence/claim honesty: `PASS_NARROW_STOP_BOUNDARY`

## Supported and unsupported claims

Supported: for the frozen two objects and `W=4,D=3,chunk=128`, dense exact complete-action selection retains a same-object native size residual and greatly improves on the parent exact implementation, but still fails the preregistered construction/access no-regression full-cost rule against final BvCompZ.

Unsupported: general impossibility of reference-forest optimization; behavior at other `W,D`, chunks, graphs or codecs; approximate/pruned solver behavior; paper-level generality; Stage B readiness; Q1/Q2 acceptance.

## Mandatory closing gate

- Requested transition: independent Stage A closing for the narrow STOP recommendation.
- `PENDING_USER_STAGEB_REVIEW`: `no`
- Stage B user approval id: `null`
- Stage B authorized: `false`
- No project write or Stage B work occurred.

