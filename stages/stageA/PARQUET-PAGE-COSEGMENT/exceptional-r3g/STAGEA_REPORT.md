# PARQUET-PAGE-COSEGMENT — exceptional Stage A fidelity revision R3G

## Administrative record

- Assignment: `STAGEA-L1-20260811-PARQUET-PAGE-COSEGMENT-EXCEPTIONAL-FIDELITY-R3G`
- Authorization: `POLICY-HOLD-DISPOSITION-20260811-R3G`
- Role/lane: `CANDIDATE_OWNER / CANDIDATE-EXECUTION-LANE-1`
- Decision: `STOP_RECOMMENDED__NARROW_FROZEN_MECHANISM`
- Confidence: `0.99`
- Evidence ceiling: `STAGEA_CORRECTED_FAIR_20_OBJECT_DOUBLE_REPLAY_SCIENTIFIC_NEGATIVE`
- Exceptional scientific revision: `1/1 consumed=true`
- Stage B authorized/started: `false/false`
- `stageb_user_approval_id`: `null`

## Outcome first

The exceptional revision closes all three gate defects, and the repaired comparison is decisively negative for the frozen mechanism. The baseline family is complete under the Stage0 finite contract, shared and arm-specific costs are allocated symmetrically, and query measurements actually execute the preregistered Latin rotation. Nevertheless, the unchanged candidate planner exceeds the same 120-second per-file selection budget on all 20 natural objects in both replays. Its frozen fallback emits the selected strongest-union file. Thus it has identical bytes and semantics but adds the charged planning attempt; strict full-cost residual is zero everywhere.

This supports a narrow scientific STOP recommendation for `GLOBAL_BUDGETED_WORKLOAD_CONDITIONED_COSEGMENT` under the frozen NYC TLC workload/object, not a general claim that workload-aware Parquet page layout is impossible.

## Scope and same-object fidelity

The exact object remains one complete public NYC TLC Green Taxi monthly Parquet file, January 2024 through August 2025. Each arm preserves typed values/nulls, schema metadata, row order, one row group and its boundary, one self-contained standard file, and the unmodified DataFusion SQL scalar results. No reader, SQL, page-size corpus, row order, row group, codec, mechanism or threshold changed.

The candidate is the unchanged frozen whole-file three-column global page-budget DP and workload-conditioned DataPageV2 retention policy. No optimization, algorithm pivot or favorable corpus search was introduced after the exceptional authorization.

## Repairs actually executed

1. **Latin rotation:** for each file/query/round, arm order is determined by `(file_index + query_index + round) mod 2`; both orders occur, including warmups and nine measured repetitions.
2. **Fair cost attribution:** shared preprocessing/verification is split 50/50; family exploration is union-only; candidate DP/retention is candidate-only; writes and queries remain arm-local.
3. **Complete native family:** source original plus 15 fixed/CDC boundary cells crossed with native V1/V2 plain, dictionary with native fallback, V2 byte-stream split with plain fallback, and both frozen custom V2 retention paths: 106 executable points per file. Every point is materialized, parsed, hashed and scored using training information before selecting one executable configuration.

## Preclaim gate

`PASS`. The final non-natural witness checks are enumerated in `PRE_CLAIM_CONTRACT_FIDELITY_GATE.md` and machine-readable in `artifacts/preclaim/PRECLAIM_RESULT.json`. The first natural command started only after this PASS. R3G was marked consumed at `2026-08-11T08:43:20.7045679Z`.

## Claim-bearing evidence

Both replay summaries agree on the decision:

- complete family: `106` points/file, `4,240` point materializations total;
- selected union: `fixed-r1024-b1048576__custom-v2-zstd-threshold-0_9` for all `40/40` records;
- candidate budget fallback: `40/40`;
- semantic equality: `40/40`;
- p50 ≥10%: `0/20` in each replay;
- p90 non-worse: `8/20` and `11/20`;
- strict full-cost residual: `0/20` and `0/20`;
- median full-cost ratio: `6.75683×` and `6.73305×`;
- non-timing replay equality and output hashes: `20/20`.

The old resume1 layout fact `126/1608 = 7.8358%` belongs to the invalid-timing package and is not reused as corrected positive or negative evidence. Under the corrected executable budget contract, the candidate never legally completes selection, so the actual deployed action is fallback and its candidate-action count is zero.

## Full-cost and resources

All registered wall/CPU/RSS/logical I/O/temp/output/fallback fields are retained per file. Completed claim runs used exactly `1.9614279514 CPU-hours` and `1.5594503284 wall-hours`; peak conservative process-sum RSS was `1,380,700,160 B`. Cumulative deleted temporary materialization was `5,498,527,070 B`, while the package remained about 114 MB before reporting. With a conservative `<0.30 CPU-hour` bound for the three explicitly logged interrupted diagnostics, total remains `<2.27 CPU-hours`. No network, GPU, exclusive device, system installation or global environment change occurred.

## Interpretation and claim ceiling

The complete native additions do not change the winning baseline under the frozen training scalar, but they close the family omission. Latin timing shows small signed variation because fallback and union are byte-identical; neither replay reaches the p50 gate, and p90 is not uniformly non-worse. Most decisively, the candidate adds a 120-second attempt before emitting the same output, so every corrected full-cost point is dominated.

Permitted claim: this finite Stage A probe falsifies the frozen mechanism under its exact 20-object, same-information, 120-second and full-cost contract.

Prohibited claims: general Parquet impossibility, cross-workload generality, Q1 readiness, Stage B readiness, or any paper-level main conclusion.

## Owner recommendation

Recommend mainline register the narrow scientific STOP for the frozen mechanism after independent Stage A closing review. Do not start Stage B. This owner recommendation is non-authoritative until mainline/gate acceptance.

