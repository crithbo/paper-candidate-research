# PB-DELETE-SCHEDULE Revision-1 Read-only Recalculation Audit

This audit used only the frozen initial gate and revision-1 package. It did not execute candidate code, create new scientific evidence, modify the candidate, or access Stage B.

## Input integrity

| Check | Recomputed value | Expected | Result |
|---|---:|---:|---|
| Revision manifest entries | 2,476/2,476 | 2,476/2,476 | PASS |
| Files including manifest | 2,477 | 2,477 | PASS |
| Total bytes including manifest | 534,000,351 | 534,000,351 | PASS |
| Manifest SHA-256 | `617C59E3EC578FFBE6AB73D0DE86686543309549E9BE282FE8D8C56A0A048A11` | same | PASS |
| `STAGEA_REPORT.md` SHA-256 | `76DCBD151B28CB3DB23B6236E179BE473A778A3190277762816AD36EB19AD6E9` | same | PASS |
| `FULL_COST_RESULTS.json` SHA-256 | `DF6AB7E34160528D696B41B5B3A27D38E277091D358454C061B609B53B4F916E` | same | PASS |
| `handoff.yaml` SHA-256 | `5B9608DAF96168764C15A1A01E5A9B246A4876F7D562EEBA33F03885A45AF430` | same | PASS |

The packaged read-only validator independently completed `21/21` checks when manifest verification was enabled. I additionally parsed and aggregated the frozen rows without invoking the owner runner.

## Pre-claim fidelity recomputation

- Corpus: 30 unique accepted traces; the explicit synthetic-labeled member is absent.
- Checked deletions: total 183,758; minimum 882; maximum 44,043.
- Action: all methods produce a complete ordered partition/permutation of the original deletion records within frozen maximal contiguous blocks.
- Common interface: original, stable, greedy, and candidate use the same parser, action schema, emitter, frozen output/objective, and native checkers.
- Small witness: four methods x two replays = `8/8` pass before the claim run.
- Oracle/fallback: `0/0` across claim rows.
- Cost: preprocessing, extraction, planning/frontier exploration, construction/serialization, VeriPB, CakePB, RSS, logical I/O, observed process I/O, proof/kernel/certificate bytes, fallback, and failure are recorded on a common denominator.

Disposition: `PRE_CLAIM_CONTRACT_FIDELITY_GATE=PASS`.

## Row and replay recomputation

| Property | Count |
|---|---:|
| Rows | 240 |
| Trace/method groups | 120 |
| Groups with replays 1 and 2 | 120 |
| Construction OK | 240/240 |
| Complete-action static valid | 240/240 |
| Block boundaries preserved | 240/240 |
| Exact deletion multiset preserved | 240/240 |
| Output hash equal | 240/240 |
| Objective equal | 240/240 |
| VeriPB forced-checked accept | 216/240 |
| CakePB accept | 216/240 |
| Overall contract accept | 216/240 |
| Original contract accept | 60/60 |
| Nonvolatile replay mismatches | 0 |

The 24 failures are exactly:

| Trace | Methods | Replays | Native failure |
|---|---|---|---|
| `zenodo__bcp-simp-nonunif-75_50.07` | stable, greedy, candidate | 1, 2 | VeriPB forced checked deletion, proofgoal 801 |
| `zenodo__routing-normalized-s3-3-3-4pb` | stable, greedy, candidate | 1, 2 | VeriPB forced checked deletion, proofgoal 541 |
| `mse23__dalculus_wt-f1-DataDisplay_0_order4.seq-A-2-2-irabcde` | stable, greedy, candidate | 1, 2 | VeriPB forced checked deletion, proofgoal 25 |
| `mse23__dalculus_wt-f1-DataDisplay_0_order4.seq-B-2-2-irabcde` | stable, greedy, candidate | 1, 2 | VeriPB forced checked deletion, proofgoal 522 |

CakePB is not run after a VeriPB rejection, so these are VeriPB-stage failures rather than disagreement between two successful checker invocations. Every failed row has successful construction/static validation and fixed output/objective equality. The repeated trace/proofgoal signature across methods and replays, combined with original `60/60`, rules out a generic emission or format corruption. It exposes missing semantic prerequisites in the explicit-reference frontier.

## Independent cost aggregation

Aggregation was recomputed directly from `FULL_COST_ROWS.jsonl`: median across two replays per trace, followed by linear interpolation at p50 and p90 over 30 trace medians.

| Method | p50 full time (ns) | p90 full time (ns) | p50 RSS (B) | p90 RSS (B) | p50 logical I/O (B) | p90 logical I/O (B) | p50/p90 failures |
|---|---:|---:|---:|---:|---:|---:|---:|
| original | 545,591,304.5 | 1,622,073,859.8 | 153,638,912 | 542,107,648 | 3,166,313 | 11,729,099.95 | 0 / 0 |
| stable | 586,031,966.0 | 1,873,183,519.4 | 131,225,600 | 542,101,913.6 | 2,657,341.5 | 11,729,155.8 | 0 / 1 |
| greedy | 583,896,141.0 | 1,866,419,984.6 | 135,034,880 | 542,101,913.6 | 2,657,824.5 | 11,748,002.8 | 0 / 1 |
| candidate | 723,356,700.0 | 2,417,088,104.6 | 135,021,568 | 542,098,432 | 2,579,959 | 11,700,306.7 | 0 / 1 |

Additional candidate/original ledger coordinates:

| Coordinate | Original p50 / p90 | Candidate p50 / p90 |
|---|---:|---:|
| Planning/frontier exploration | 83,707,050 / 777,625,235 ns | 136,498,075 / 1,767,743,860 ns |
| Method process time | 365,042,725 / 1,194,389,040 ns | 434,634,600 / 2,060,394,870 ns |
| Observed process I/O | 5,816,735.5 / 18,892,436 B | 5,013,330.75 / 18,831,773.85 B |
| Kernel bytes | 493,125.5 / 1,699,661.9 B | 295,340.5 / 1,701,188.3 B |
| Certificate bytes | 716,601.5 / 2,593,017.3 B | 554,664.5 / 2,594,543.7 B |

## Pareto recomputation

The preregistered dominance vector is full end-to-end time, peak RSS, logical I/O, augmented-proof bytes, kernel bytes, certificate bytes, and failure count.

| Baseline | p50 no-worse on all dimensions | p50 residual | p90 no-worse on all dimensions | p90 residual |
|---|---|---|---|---|
| original | false | false | false | false |
| stable | false | false | false | false |
| greedy | false | false | false | false |

Candidate is strictly better on selected RSS/I/O/artifact coordinates, but full time is worse at both percentiles and the candidate has failure p90 = 1 against original's 0. Invalid rows remain costed and cannot contribute a positive performance claim. The recomputed all-baseline residual is therefore false.

## Scientific interpretation

The executed construct is valid as a test of the frozen mechanism. The native checker is the adjudicator of deletion legality, while the static graph validator intentionally recognizes only the frozen explicit-reference model. Its acceptance followed by deterministic native rejection is the mechanism counterexample, not a reason to discard the experiment as uninformative. A richer semantic dependency model would change the central mechanism after the unique revision has been consumed.

Audit conclusion: `CONFIRM_STOP`, bounded to the frozen explicit-kernel-reference ready-frontier mechanism. `StageB=false`; `approval=null`.
