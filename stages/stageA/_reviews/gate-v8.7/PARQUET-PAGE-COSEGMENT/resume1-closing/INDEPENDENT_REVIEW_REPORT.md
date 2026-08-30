# PARQUET-PAGE-COSEGMENT Stage A Independent Review

- Review lane id: `STAGEA-G1`
- Assignment id: `STAGEA-G1-20260811-PARQUET-PAGE-COSEGMENT-RESUME1-CLOSING-V8.7`
- Owner assignment: `STAGEA-L1-20260811-PARQUET-PAGE-COSEGMENT-RESUME1-V8.7`
- Input freeze / owner manifest SHA-256: `96D84A4C34C1E57441AA0DBDA9BEB446F55B743F258700B5E3FBB914845F24A9`
- Reviewer non-participation and cross-assignment contamination declaration: `true / false`
- Decision: `INCONCLUSIVE_POLICY_HOLD`
- Structural paper potential: `TIER_B_Q2_VIABLE_CONDITIONAL`
- Current evidence disposition: `NO_CREDIBLE_PASS_OR_SCIENTIFIC_STOP`
- Confidence: `0.98`
- Evidence ceiling: `INVALID_COMPARATOR_COST_AND_TIMING_CONSTRUCTION__NON_TIMING_LAYOUT_FACTS_ONLY`
- Pre-claim contract fidelity gate disposition: `FAIL_ON_CLAIM_BEARING_COMPARATOR_TIMING_AND_FULL_COST`
- Stage B authorized / started: `false / false`
- `stageb_user_approval_id`: `null`

## Outcome

The owner's arithmetic, semantic-equivalence records, and double-replay layout hashes are internally reproducible. They do not, however, support the recommended scientific STOP because two preregistered, decision-bearing fairness conditions were not executed:

1. the parent contract requires deterministic Latin rotation by file and arm, but the frozen implementation always measures the union first and the candidate second; and
2. the recorded `planning_wall_ns` starts before generation and scoring of the entire fixed/CDC baseline grid, but aggregation charges that combined time entirely to the candidate and charges zero baseline selection/planning time to the union.

The reported `126.4975x / 130.6778x` full-cost ratios are therefore not candidate-versus-union full-cost measurements under the required symmetric ledger. Without the combined planning bucket, candidate/union write-plus-query ratios are `0.97795x` and `1.01084x`, demonstrating that the attribution choice—not an observed 126–131x candidate-only planning burden—creates the reported magnitude.

The timing-order violation also prevents the two p50/p90 replays from closing the frozen performance sentinel. Exact output replay does not repair a deterministic arm-order confound.

This is neither a resource blocker nor a reason to PASS. The valid non-timing facts remain below. Because the resume accounting rule was frozen and executed after five partial natural-file observations, it is an executed comparison/ledger revision despite the label `scientific_revision_consumed=false`. Under the project rule for an exhausted or already-used scientific revision whose construction cannot support either PASS or STOP, the only fail-closed disposition is `INCONCLUSIVE_POLICY_HOLD`.

## Input integrity

- Owner manifest independently rehashed: `718/718 PASS`, `0` missing/mismatched, `879390169` bytes covered.
- Owner handoff: `D800E6ABBA60618CB53925CF55440371546547026780DA41F41774E56B240DE0`.
- Owner report: `8418461F7C5814CF4F4A4DCE5EB016641D454E17646AAD239BA9BD6AAF141890`.
- Owner results: `ADB99D331F707FED9EDDB58B28D01F2E7C0037F74D424DD289BC5E30FC7A2C47`.
- Parent experiment contract: `843E55559486640B79D86A9E184429E9B191D0F2640FF9597C57FC8BECF5BD2E`.
- Pause checkpoint: `C3DA106D6AB8482394B7CDFBDC33ED9BE192AF47A5AB89745F18D424E6424F72`.
- Resume contract: `F7386A29915E5973CB6A12511B3DC1243B3D8EAC49F6B3391485CD4B1E9A04E4`.
- Frozen implementation: `38E7BC74352BFD235709BD383E087BF5CEDF978DE2017BBC65BD9764A083EFF6`.

Continuity and package integrity pass. The defect is scientific-comparison fidelity, not file corruption.

## Claim and novelty-route consistency

The executed object remains one standard self-contained Parquet file per public NYC TLC monthly input, with fixed typed values/nulls, schema, row order and row-group boundaries, and native PyArrow/DataFusion decoding. The candidate implements a deterministic globally budgeted workload-conditioned page-cut constructor with legal DataPageV2 compressed/uncompressed retention. This remains an N2-shaped action, not merely a scalar selector.

The Stage 0 residual was conditional: the candidate had to retain benefit outside a complete current fixed-writer/CDC family under identical information, selection budget and symmetrically charged full cost. The current package does not close those comparison requirements.

## Baseline fairness audit

### Symmetric selection-cost failure

Stage 0 explicitly requires baseline grid/model-selection time under the same selection budget and says planning/search time and memory must be charged symmetrically. In `full_probe`, `planning0` is recorded before construction/loading and scoring of 12 fixed and 3 CDC boundary cells, their two representation modes, and the candidate DP. Only one combined timer is retained. `aggregate_results.py` then adds the entire bucket to the candidate and none to the union.

That attribution is unsuitable for either positive or negative claim-bearing comparison. It prevents separating:

- baseline grid construction and training selection;
- shared decoding/statistics/candidate-generation work;
- candidate-only DP/retention planning; and
- any reusable or amortizable plan component.

Calling the charge “conservative” does not make it fair. A conservative upper bound may cap a positive claim; it cannot create a scientific STOP when the hard gate requires same-budget symmetric accounting.

### Arm-order failure

The parent contract freezes `deterministic Latin rotation by file and arm`. The executable path calls `measure_queries(union_out, queries)` followed by `measure_queries(candidate_out, queries)` for every file. Warmups are symmetric in count but the arm ordering is not rotated. Both replays repeat the same order, so the second replay does not independently eliminate ordering/cache/frequency drift.

### Current-family coverage caveat

Stage 0 requested a complete preregistered native representation family, including relevant V1/V2, encoding/dictionary/fallback and current writer properties. The executed numerical grid is 15 boundary configurations crossed with only `always_compressed` and `threshold_0_9` in a custom plain DataPageV2/Zstd writer path. This is a narrower family. A stronger omitted baseline may absorb the candidate further, but that inference cannot substitute for executing the frozen strongest-union contract.

## Decisive evidence audit

Independent read-only recomputation from the 40 per-file `result.json` records confirms:

| Metric | Replay 1 | Replay 2 |
|---|---:|---:|
| Natural files / semantic-equivalent | `20 / 20` | `20 / 20` |
| Complete actions | `1608` | `1608` |
| Outside-family cut/retention actions | `398` | `398` |
| Useful outside actions | `126` | `126` |
| Useful rate | `7.8358208955%` | `7.8358208955%` |
| Files with p50 improvement >=10% | `7/20` | `0/20` |
| Files with p90 non-worse | `16/20` | `16/20` |
| Files within size +5% | `20/20` | `20/20` |
| Median size ratio | `0.9694192530` | `0.9694192530` |
| Union write+query | `30.5777238 s` | `29.8390812 s` |
| Candidate write+query | `29.9034094 s` | `30.1624049 s` |
| Candidate/union without combined planning | `0.97795x` | `1.01084x` |
| Combined grid+candidate planning bucket | `3838.1035208 s` | `3869.1425322 s` |
| Reported all-to-candidate full-cost ratio | `126.4975x` | `130.6778x` |

All 340 replay-paired Parquet outputs independently rehashed identically. The valid conclusion is that deterministic layout/action/bytes and semantic output reproduce. The reported timing and full-cost STOP sentinel does not.

The `7.8358%` useful-action threshold failure is real within the implemented heuristic, but it is not alone decisive enough to establish a scientific STOP: the mechanism still produces 398 outside-family actions, approximately 3.06% smaller files and raw non-dominance, while the required full-cost/current-union comparison is invalid. A near-threshold action proxy cannot replace the failed native performance ledger.

## Workload and orthogonal-validation sufficiency

Twenty whole public NYC TLC monthly files are natural same-object inputs, not synthetic slices. The two replay trees provide strong deterministic orthogonal validation for layout and semantics. They are one data/workload family and do not establish generality, but sample breadth is not the reason for this hold.

## Cost, ablation and failure-mode audit

The package records write/query samples, bytes, CPU/RSS/I/O and fallback boundaries. The missing element is not data volume; it is typed attribution between baseline/shared/candidate planning components. The application-close process-ledger limitation is secondary and does not cause the hold.

The honest no-gain regions and replay disagreement are retained. No resource failure is converted into a scientific conclusion.

## Latest collision audit

Current Arrow CDC correctly subtracts generic nonuniform/content-conditioned paging. No new direct fatal source is introduced. The candidate-specific workload-conditioned constructor remains search-bounded open; this review makes no firstness claim.

## Independent Q1/Q2 recalibration

- Structural potential: `TIER_B_Q2_VIABLE_CONDITIONAL` remains definable.
- Current evidence readiness: below the minimum PASS line because the decisive comparator ledger is invalid.
- `BELOW_Q2_STOP` is not confirmed because the scientific negative kernel is not fairly measured.
- Q1 parity: `PARITY_NOT_PLAUSIBLE` on current evidence.

## Non-relaxable quality audit

- Same-object: `PASS` for materialized outputs.
- Latest collision: `PASS_WITH_SEARCH_BOUNDED_CEILING`.
- Strong fair baselines: `FAIL` for complete representation coverage and symmetric planning charge.
- Natural input/evidence: `PASS` for the frozen 20-file family.
- Full-cost: `FAIL_CLAIM_BEARING_ATTRIBUTION`.
- Reproducibility: `PASS` for hashes/layout/semantics; `FAIL` for contract-faithful timing order.
- Evidence/claim honesty: owner disclosed the conservative charge, but the resulting STOP inference is not admissible.

## Required policy disposition

No automatic revision is authorized. Mainline should register `INCONCLUSIVE_POLICY_HOLD` and present the user with the policy choice required by project rules. A scientifically valid continuation would require explicit user authority for an exceptional revision that, without changing corpus, workload, object, action, thresholds or primary objective, freezes before rerun:

1. a complete same-object native representation grid consistent with Stage 0;
2. separate typed timers for baseline-only, shared, and candidate-only planning/search;
3. a preregistered allocation/amortization rule applied symmetrically; and
4. deterministic arm-order Latin rotation with the same warmups/repetitions.

This review does not grant that authority, run the correction, start Stage B, or write shared control files. Lane end state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
