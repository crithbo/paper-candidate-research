# PARQUET-PAGE-COSEGMENT Exceptional R3G Stage A Independent Closing Review

- Review lane id: `STAGEA-GATE-REVIEW-LANE-1`
- Assignment id: `STAGEA-G1-20260811-PARQUET-PAGE-COSEGMENT-EXCEPTIONAL-R3G-CLOSING`
- Owner assignment id: `STAGEA-L1-20260811-PARQUET-PAGE-COSEGMENT-EXCEPTIONAL-FIDELITY-R3G`
- Reviewer non-participation and cross-assignment contamination declaration: `CONFIRMED`
- Decision: `CONFIRM_STOP` (`ROLE_NORMALIZED_DECISION=STOP`)
- Quality tier: `BELOW_Q2_STOP`
- Confidence: `0.97`
- Evidence ceiling: `STAGEA_CORRECTED_FAIR_20_OBJECT_DOUBLE_REPLAY_NEGATIVE__FROZEN_MECHANISM_ONLY`
- Pre-claim contract fidelity gate disposition: `PASS_BEFORE_FIRST_CORRECTED_NATURAL_COMMAND`
- Candidate action completeness / proxy check: `COMPLETE_FROZEN_CANDIDATE_ATTEMPTED__40_OF_40_BUDGET_FALLBACKS__NO_CANDIDATE_ACTION_DEPLOYED`
- Native codec/solver/reader/format parity: `PASS_WITHIN_FROZEN_PYARROW_DATAFUSION_PARQUET_STACK`
- Metric denominator and full-cost dimension completeness: `PASS_FOR_FROZEN_CONJUNCTIVE_KILLER__FULL_WALL_SENTINEL_NOT_GENERAL_MULTIDIMENSIONAL_PARETO_THEOREM`
- Candidate Q1 venue family: `NOT_READY__NARROW_STAGEA_STOP`
- Stage B: `false`
- `stageb_user_approval_id`: `null`

## Outcome first

I independently confirm a scientific STOP for the frozen `GLOBAL_BUDGETED_WORKLOAD_CONDITIONED_COSEGMENT` mechanism under the exceptional R3G contract. The decision is not inherited from the owner recommendation. It follows from raw-result recomputation and static audit of the corrected executor.

The contract-faithful probe is negative in both replays. Every one of the 40 candidate attempts exceeds the frozen 120-second per-file selection budget and executes the preregistered fallback to the exact selected strongest-union file. Consequently the candidate produces no deployable candidate-specific action, has identical output bytes and semantics to the union, and adds the charged planning attempt. The independent success conditions fail on p50, p90 and full-wall cost in both replays.

This STOP is narrow. It does not establish that Parquet page layout, workload-aware segmentation, alternate candidate mechanisms, other workloads, or production systems are generally incapable of improvement.

## Input integrity and frozen controls

All assignment control hashes match:

- `AGENTS.md`: `B7122A5ACC5CF02A602988548E7464BF03362059293B083796BA1687D2CFAC73`
- `plan.md`: `9E27DA1DF73D16088D672D33762B78C047AF753C3F0BF1AAB5041C045E8C1C3B`
- `registry.yaml`: `BAB980E7A7BF8D1E283196C5BD73A16D49641FC623AE90DFF1BF7E35151D4AA8`
- `rules/ROLE_STAGEA_REVIEW.md`: `6E8ACBF78ED30491AF0D8052D34E90B4CBE45DF0B3016F50F9BDC5FAC26A763C`

Owner package hashes match:

- `HASH_MANIFEST.sha256`: `111B6ECE23BD5C50A1D69DE68164A6732383A0ABD49995486FA60353AF6E231E`
- `STAGEA_REPORT.md`: `325496240FCDA7C6F3B6D7AC8ED76E8716FBF134D39D084BF483FE14DD0902C6`
- `RESULTS.md`: `F4F842F9E37B958E6FD588AFFB58930102D0673B7A8509B81C40C5A1EE2D2E56`
- `handoff.yaml`: `82E5E6337511CC8332D9D8C24466328B917615070D6D6D06E5115E167793EC44`

I recomputed all owner-manifest entries: `157/157 PASS`, zero missing, zero mismatches, covering `113,959,634` bytes. The package contains exactly 157 non-manifest files; no unlisted extra or missing listed file was found. The referenced frozen implementation also matches `38E7BC74352BFD235709BD383E087BF5CEDF978DE2017BBC65BD9764A083EFF6`.

## Claim and novelty-route consistency

The exact object remains one frozen standard Parquet file per monthly NYC TLC Green Taxi object, with one self-contained standard Parquet output per arm. The invariants retained by the experiment are typed values and nulls, schema metadata, row order, row-group count and boundaries, and the declared DataFusion SQL scalar results.

The candidate remains the frozen whole-file, three-column global page-budget DP plus workload-conditioned DataPageV2 retention mechanism. R3G changes only execution fidelity: complete finite comparator execution, Latin arm ordering, and typed cost attribution. It does not introduce a new candidate action, workload, corpus, reader, threshold or favorable configuration search.

The structural N2 hypothesis was conditionally credible before the probe. The current evidence does not merely show missing readiness; it shows that the frozen mechanism cannot produce its own legal action within its preregistered budget on any of the 20 natural objects. Therefore the frozen mechanism no longer meets the minimum Q2 paper shape.

## Pre-claim fidelity and exceptional-revision audit

The final preclaim record reports all seven checks passing: frozen implementation hash, witness, 106-point uniqueness, seven representation paths, both Latin orders, eleven executed rounds per arm, and the shared-ledger identity. The final preclaim probe is non-natural. The first corrected natural command begins only after this PASS, at `2026-08-11T08:43:20.7045679Z`, which consumes the authorized exceptional revision.

Three fail-closed natural diagnostics occur before the two completed replays. Serial and two-worker comparator enumeration are stopped without `result.json`; four-worker enumeration closes the same 106-point family and exposes the candidate timeout. The subsequent changes do not alter the scientific object or outcome rule:

- parallel enumeration preserves the exact 106 identifiers, per-point materialization and lexicographic selector;
- worker CPU is summed rather than hidden;
- the fallback to the selected union was frozen before the first natural attempt;
- implementing that already-frozen fallback changes no candidate action or threshold.

This is not an unregistered mechanism pivot or second exceptional revision. It is an execution repair of the preregistered comparator/fallback. The repaired comparator is also cheaper in total CPU, not merely wall time: median baseline selection is `53.609375` CPU-seconds versus `119.1953125` candidate-planning CPU-seconds.

## Latin rotation audit

I checked all `4,400` rotation-trace rows (`40 files × 10 queries × 11 rounds`). Every row obeys:

`union first iff (file_index + query_index + round_index) mod 2 = 0`.

Warmup flags are correct for rounds 0 and 1; measured flags are correct for rounds 2 through 10. Each file has 55 union-first and 55 candidate-first executions, and adjacent file indices invert the order for any fixed query/round. Each arm has 110 records per file: 20 warmups and 90 measured observations. No Latin-order discrepancy was found.

The measured timing difference is small noise around byte-identical fallback outputs. It cannot be interpreted as a candidate action benefit.

## Complete 106-point baseline-family audit

The expected family is:

`1 source-original + ((4 row caps × 3 page-byte caps) + 3 CDC cells) × 7 representations = 106 points`.

For every one of the 40 result records, I independently reconstructed the exact expected identifier set and found:

- `106/106` points present;
- `106/106` identifiers unique;
- no unexpected or missing fixed, CDC, native V1/V2, dictionary/fallback, byte-stream-split/fallback, or frozen custom-retention cell;
- selected point equal to the independent lexicographic minimum of `(training predicted score, whole-file bytes, config_id)`.

All 40 records select `fixed-r1024-b1048576__custom-v2-zstd-threshold-0_9`. This is one executable same-object point, not a metric-wise synthetic envelope.

The comparator uses four workers for independent materializations, while the candidate planner remains its frozen single-process implementation. This does not create a favorable-compute artifact for the comparator: median comparator selection wall/CPU are `16.11043345 s / 53.609375 s`; median candidate planning wall/CPU are `120.14178445 s / 119.1953125 s`. The candidate consumes more than twice the comparator CPU and still fails its equal wall budget.

## Baseline fairness and cost allocation audit

Static inspection and independent arithmetic confirm the registered allocation:

- shared preprocessing and verification wall cost are split exactly 50/50;
- 106-point enumeration/materialization/scoring/selection is charged only to the union arm;
- candidate DP/retention planning is charged only to the candidate arm;
- deploy writes and all Latin warmup/measured query costs remain arm-local;
- every stored `union_full_wall_ns`, `candidate_full_wall_ns`, and ratio equals an independent reconstruction.

The fallback consumes the selected union artifact but the frozen ledger does not charge the union-family enumeration again to the candidate. This is candidate-favorable under-accounting, not a bias capable of creating the negative. A fully deployable fallback accounting that charged its prerequisite union selection would only increase candidate cost.

The owner label `strict full-cost residual` is implemented as the frozen full-wall ratio sentinel. It is not, by itself, a theorem that the union dominates the candidate on every recorded RSS/I/O/temp dimension. I therefore do not endorse a broader multidimensional Pareto impossibility claim. This limitation is non-decisive because the candidate never emits a candidate-specific action and independently fails the p50 and p90 gates. The completed ledger still records CPU, RSS, logical I/O, temporary bytes, output bytes, fallback and failure counts, and no omitted dimension can manufacture a candidate action after a 40/40 timeout.

## Decisive evidence audit

Independent recomputation from the 40 raw `result.json` files gives:

| Metric | Replay 1 | Replay 2 |
|---|---:|---:|
| Natural objects | 20 | 20 |
| Candidate budget fallbacks | 20/20 | 20/20 |
| Semantic-equivalent selected/fallback outputs | 20/20 | 20/20 |
| Files with p50 improvement ≥10% | 0/20 | 0/20 |
| Files with p90 non-worse | 8/20 | 11/20 |
| Files with size ratio ≤1.05 | 20/20 | 20/20 |
| Strict full-wall residual | 0/20 | 0/20 |
| Median p50 improvement | −1.1760247344% | +2.0962936404% |
| Median p90 improvement | −0.9105599960% | +0.7201593305% |
| Median candidate/union full-wall ratio | 6.7568297801× | 6.7330471630× |
| Full-wall ratio range | 5.9975117232×–7.4793036302× | 6.0330776673×–7.5564025755× |

The p50/p90 values were rebuilt from the 90 measured records per arm per file using the frozen median and inclusive p90 definitions. All stored per-file improvements match. The candidate/union SQL results match for every paired query record.

The candidate action denominator is `0/0` after fallback. This should be read as “the candidate produced no own action,” not as a statistically estimated zero-percent useful-action rate. It is a stronger execution failure for this contract: the positive mechanism premise is absent on every object.

## Reproducibility and replay consistency

- Source hashes are unique for all 20 frozen monthly objects.
- `40/40` selected-union and fallback outputs pass table/schema/row-group equality.
- Candidate and union bytes and SHA-256 are equal within every record.
- `20/20` replay pairs agree on file, source hash, selected configuration, output sizes/hashes, fallback and catalog cardinality.
- `20/20` union hashes and `20/20` candidate hashes match across replay.
- The independent recomputation detected zero catalog, selection, Latin, percentile, SQL, ledger, fallback or replay errors.

Resource aggregates also reproduce: completed CPU `7,061,140,625,000 ns` (`1.9614279514 h`), deleted baseline temporary materialization `5,498,527,070 B`, conservative logical query-read upper bound `11,522,287,040 B`, and peak process-sum RSS `1,380,700,160 B`.

## Q1/Q2 sufficiency judgment

- Clear problem: `YES`
- Non-trivial frozen mechanism: `YES_STRUCTURALLY`
- Credible current evidence: `YES_NEGATIVE_FOR_FROZEN_MECHANISM`
- Executable Stage B route: `NO_AFTER_DECISIVE_STAGEA_KILLER`
- Reviewer-recognizable paper narrative: `NO_FOR_THIS_FROZEN_MECHANISM`
- Status: `PARITY_NOT_PLAUSIBLE`

The structural topic should not be generalized away, but this candidate identity and mechanism are scientifically exhausted under the authorized R3G contract. The proper quality label is `BELOW_Q2_STOP`, not reserve or readiness hold.

## Stop kernel and claim ceiling

The authoritative narrow stop kernel is:

1. exact same-object fidelity holds;
2. the complete finite strongest-union comparator is executable and selected without a synthetic envelope;
3. the frozen candidate times out and falls back on `40/40` natural/replay records;
4. p50 ≥10% succeeds on `0/20` files in both replays;
5. p90 non-worse succeeds on only `8/20` and `11/20`, below the frozen `20/20` requirement;
6. candidate-specific actions are absent and full-wall residual is `0/20` in both replays.

Permitted claim:

`THE_FROZEN_GLOBAL_BUDGETED_WORKLOAD_CONDITIONED_COSEGMENT_MECHANISM_IS_FALSIFIED_ON_THE_20_OBJECT_DOUBLE_REPLAY_R3G_CONTRACT`.

Prohibited extrapolations include general Parquet impossibility, all page packing/co-segmentation, other corpora or SQL workloads, alternate planners, different budgets, production Cache/DataFusion behavior outside the pinned stack, and paper-level claims beyond this Stage A probe.

## Authorization boundary

- `StageB=false`.
- `stageb_user_approval_id=null`.
- No new claim-bearing experiment was run by the reviewer.
- No owner or shared-control file was modified.
- No automation, formal project or external submission action occurred.
- Lane end state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
