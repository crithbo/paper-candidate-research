# PARQUET-PAGE-COSEGMENT Stage A Report

- Lane id: `CANDIDATE_EXECUTION_LANE_1`
- Assignment id: `STAGEA-L1-20260811-PARQUET-PAGE-COSEGMENT-RESUME1-V8.7`
- Parent input freeze SHA-256: `8F0FC9EF326FBA31EEED824CD45642A9D6AC36F0B547950B5F44AB6485DFC66D`
- Cross-assignment contamination declaration: `false`
- Decision: `STOP` (`STOP_NARROW_FROZEN_MECHANISM`)
- Quality tier: `BELOW_Q2_STOP`
- Evidence ceiling: `STAGEA_SCIENTIFIC_NEGATIVE__NARROW_FROZEN_MECHANISM`
- Novelty route tested: `N2`
- Stage semantics: a bounded real pilot of the highest-risk premise; no Stage B or paper-project work was run.

## Outcome

The frozen workload-conditioned, globally budgeted standard-Parquet page co-segmentation mechanism should stop in its present narrow form. It is legal, deterministic, same-object, and reproducible, but its natural useful residual action rate is `126/1608 = 7.8358208955%`, below the preregistered `10%` gate. It also fails the query gates in both independent replays: p50 improvement of at least 10% occurs on `7/20` files in replay1 and `0/20` in replay2, while candidate p90 is no worse on only `16/20` in each replay rather than `20/20`.

All twenty candidate outputs remain within the size ceiling in both replays; the median candidate/union whole-file ratio is `0.9694192530`. This approximately 3.06% size reduction makes the candidate formally non-dominated in the raw four-tuple on all files, but it does not establish the frozen query-performance claim. After conservative full-cost charging, no file has the preregistered joint p50, p90, size, and full-cost residual (`0/20` in each replay).

## Continuity and interruption recovery

Before any continuation write, the checkpoint hash, 10/10 checkpoint core/result hashes, all 20 corpus hashes, and the old replay1 canonical tree were recomputed. The old replay1 tree matched exactly at `BB6EC296E6019CF476DBFAAAE778DA5D0EC2EB291DD353FDAA746E682AEBD64E` over 105 files and 143,771,739 bytes. The paused 2024-06 boundary-oracle set passed 15/15 semantic and format checks.

After the desktop application closed during 2024-09, no Python process remained. The complete 2024-06/07/08 results were hash-verified and preserved; the incomplete 2024-09 tree contained only 15 boundary oracles and no candidate, strongest-union, or result observation. Those 15 oracles passed independent revalidation before copying into a new tail tree. No verified result was overwritten. Details are in `CONTINUITY_MANIFEST.yaml` and `INTERRUPTION_RECOVERY.yaml`.

## Pre-claim contract fidelity gate

- Gate status: `PASS`, inherited only after hash and continuity verification.
- Atomic action: joint row-aligned data-page cuts and legal DataPageV2 compressed/uncompressed retention under one column-chunk Zstd codec.
- Exact object: ordered typed Arrow values, nulls, schema, row order, row groups, standard single-file Parquet, standard indexes, and unchanged reader semantics.
- Strongest baseline: training-selected executable union of source/default, complete frozen fixed-writer grid, and complete frozen current Arrow CDC grid; no held-out oracle.
- Native parity: pinned PyArrow 25.0.0 writer and unmodified DataFusion 54.0.0 reader; the parent 32-row witness and independent page/index parsing remained hash-frozen.
- Metric parity: complete file bytes, p50/p90 query wall time, planning/search, write, measured queries, CPU/RSS/I/O, correctness, and fallback/failure.
- Claim-bearing continuation started only after continuity PASS: `true`.

The frozen scientific implementation was not modified: `scripts/parquet_stagea.py` SHA-256 is `38E7BC74352BFD235709BD383E087BF5CEDF978DE2017BBC65BD9764A083EFF6`. The resume wrapper only validated/copy-isolated inputs, invoked that implementation, and measured process resources.

## Frozen contract and natural workload

The natural corpus is the 20 complete official NYC TLC Green Taxi monthly Parquet files from 2024-01 through 2025-08, one file per natural object. Training and held-out query templates, the fixed/CDC grids, legal actions, three eligible predicate columns, selection budget, reader/writer versions, and thresholds are identical to parent contract SHA-256 `843E55559486640B79D86A9E184429E9B191D0F2640FF9597C57FC8BECF5BD2E`.

No corpus/configuration search, mechanism pivot, or scientific revision occurred. `scientific_revision_consumed=false`.

## Highest-risk probe result

| Frozen gate | Replay1 | Replay2 | Required | Result |
|---|---:|---:|---:|---|
| Exact semantics | 20/20 | 20/20 | 20/20 | PASS |
| Useful retained residual actions | 126/1608 (7.8358%) | 126/1608 (7.8358%) | >=10% | FAIL |
| Files with p50 improvement >=10% | 7/20 | 0/20 | >=12/20 | FAIL |
| Files with p90 not erased | 16/20 | 16/20 | 20/20 | FAIL |
| Files with size ratio <=1.05 | 20/20 | 20/20 | 20/20 | PASS |
| Strict query+full-cost residual | 0/20 | 0/20 | at least one | FAIL |

The non-timing result projection matches exactly for 20/20 objects, and all 17 output Parquet artifacts per object match by SHA-256 across replays (340/340). Timing variability is therefore separated from deterministic action, layout, bytes, and semantic equality.

## Full-cost and Pareto result

The conservative denominator charges `planning_wall_ns + candidate_write + every measured candidate query sample` to the candidate and charges only `union_write + every measured union query sample` to the union. Warmups are excluded symmetrically because the frozen harness did not time them.

| Replay | Union full-cost wall | Candidate full-cost wall | Ratio | Median p50 improvement | Median p90 improvement |
|---|---:|---:|---:|---:|---:|
| replay1 | 30.5777238 s | 3868.0069302 s | 126.4975x | 6.5607% | 9.2467% |
| replay2 | 29.8390812 s | 3899.3049371 s | 130.6778x | 1.0654% | 4.8610% |

The raw size/p50/p90/full-cost tuple is technically non-dominated on 20/20 files because candidate bytes are smaller. That observation is reported but cannot substitute for the frozen directional query gate: the candidate never simultaneously meets p50 >=10%, non-erased p90, size <=1.05, and candidate full cost <= union (`0/20` in both runs). Construction cost absorbs the intended query-performance residual.

## Resource and execution ledger

- replay1 resumed tail (12 files): CPU `2,223,015,625,000 ns`, wall `2,283,532,688,100 ns`, peak RSS `321,269,760 B`, read `1,205,482,763 B`, write `247,624,044 B`.
- replay2 (20 files): CPU `3,854,250,000,000 ns`, wall `3,938,743,437,700 ns`, peak RSS `336,072,704 B`, read `2,092,625,217 B`, write `460,756,645 B`.
- The application-close interval that completed 2024-06/07/08 and prepared only the 2024-09 oracles lacks a process-final cost record; it is disclosed rather than imputed. All completed per-arm scientific costs are present in the 40 result ledgers.
- Final topic tree before manifest generation: 2,008,149,028 bytes; resume1: 879,356,038 bytes, both below 4 GiB. No GPU, exclusive device, system install, global environment change, or network transfer was used in resume1.

## Mechanism and contribution assessment

The candidate remains more than a configuration selector: its deterministic DP constructs page allocations outside the selected native union. However, only `7.8358%` of complete actions retain positive preregistered contribution after marginal byte/planning charge, and the two natural replays do not support the required stable p50/p90 benefit. Thus the tested N2 mechanism does not retain a credible Tier-B result shape under its own frozen killer.

This STOP is scientific and narrow: it applies to `GLOBAL_BUDGETED_WORKLOAD_CONDITIONED_COSEGMENT` on the frozen standard-Parquet object, workload, action set, and strongest union. It is not based on readiness, download failure, sample count, or lack of production deployment, and it does not archive or generalize against unrelated Parquet research questions.

## Non-relaxable quality audit

- Same-object: PASS, 40/40 candidate results and all union results retain exact table/schema/row-group/SQL/index semantics.
- Latest collision: PASS for the frozen current Arrow CDC subtraction; no new absence claim was introduced.
- Strong fair baseline: PASS, executable training-selected complete fixed/CDC union.
- Natural input/evidence: PASS, 20 hash-frozen official monthly files, double replay.
- Full-cost: PASS in collection and FAIL for candidate directional residual.
- Reproducibility: PASS, stable projection 20/20 and output Parquet hashes 340/340.
- Evidence/claim honesty: PASS; the size-only Pareto non-dominance is not represented as optimizer or query support.

## Supported and unsupported claims

Supported: the frozen implementation is legal and deterministic; natural outside-union actions exist; the candidate produces approximately 3% smaller whole files; the useful residual and query/full-cost killer fail reproducibly.

Unsupported: Q2/Q1 paper viability, general Parquet benefit, production workload benefit, p50/p90 acceleration, full-cost optimizer improvement, optimality beyond the frozen DP contract, or any Stage B claim.

## Stage transition

- Owner recommendation: `STOP_NARROW_FROZEN_MECHANISM` and independent Stage A closing review by mainline if required.
- `PENDING_USER_STAGEB_REVIEW`: no.
- Stage B authorized: false.
- Stage B user approval id: null.
- Lane disposition after handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.

