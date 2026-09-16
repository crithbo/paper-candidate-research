# Stage A Results

## Outcome

- Recommendation: `STOP_RECOMMENDED`.
- Quality recommendation for the frozen mechanism: `BELOW_Q2_STOP`.
- Evidence ceiling: `STAGEA_SCIENTIFIC_NEGATIVE__FROZEN_OBJECT_AND_MECHANISM_ONLY`.
- Claim-bearing observation produced: `true`.
- Reason: legal scheduling choices exist, but the dependency-frontier candidate has no nonempty full-cost Pareto residual at both p50 and p90 against every fair baseline.
- This is not a resource blocker and does not imply that all possible proof scheduling, new deletion rules, different emitters, unchecked deletion, or parallel deletion semantics fail.

## Corpus and legality gates

- Complete natural traces: `30` (`10` official IJCAR artifact examples + `20` independent official MSE23 exact-weighted WCNFs).
- Split or duplicated examples counted as traces: `0`.
- Minimum checked deletions per accepted trace: `153`.
- Eligibility exclusions: `8` complete WCNFs with zero checked deletions; none counted.
- All 30 original traces: forced checked-deletion VeriPB accepted; CakePB returned output equioptimal.
- Traces with an accepted non-original dependency-frontier order: `24/30`.
- Legal scheduling choice rate: `0.80`.
- Preregistered killer: `<0.20`; not triggered.
- The six no-choice traces were the six FRB traces whose checked deletions formed singleton blocks under the frozen frontier extraction.

## Full-cost aggregates

Per-trace values are medians of two clean replays; p50/p90 are computed across the 30 traces. Time includes fixed preprocessing, method-specific extraction/graph/order, method-specific legality/fallback, VeriPB, and CakePB. Certificate bytes are augmented proof plus elaborated kernel.

| Method | p50 full time | p90 full time | p50 certificate bytes | p90 certificate bytes | Fallback traces |
|---|---:|---:|---:|---:|---:|
| Original trace order | 138.997 ms | 422.363 ms | 666,381 | 2,593,017.3 | 0 |
| Stable legal order | 210.345 ms | 449.634 ms | 666,381 | 2,593,017.3 | 19 |
| Greedy earliest-ready | 215.443 ms | 480.587 ms | 666,381 | 2,593,017.3 | 17 |
| Candidate dependency-frontier | 260.117 ms | 813.385 ms | 666,406 | 2,593,017.3 | 6 |

Relative candidate/full-cost time:

| Baseline | p50 candidate / baseline | p90 candidate / baseline | p50 byte delta | p90 byte delta |
|---|---:|---:|---:|---:|
| Original | 1.8714x | 1.9258x | +25 | 0 |
| Stable legal | 1.2366x | 1.8090x | +25 | 0 |
| Greedy earliest-ready | 1.2074x | 1.6925x | +25 | 0 |

The candidate is slower and no smaller than original at both percentiles. It is also slower and no smaller than both same-information scheduling baselines. Therefore every required Pareto residual is empty.

## Equality, verifier, and replay closure

- Full-cost rows: `240 = 30 traces x 4 methods x 2 replays`.
- Rows with output-hash mismatch, objective mismatch, forced-checked rejection, or CakePB rejection: `0`.
- Proof hashes identical between replays: `120/120` trace-method pairs.
- Elaborated kernel hashes identical between replays: `120/120`.
- Candidate did not change WCNF input/output, objective, deletion set, proof rules, checker, or emitter.
- Unchecked deletion was not used as an equal-guarantee baseline.

## Primary result hashes

- `CORPUS_MANIFEST.json`: `3A1F4255B3EAAE7A02EB948EAF2E4BB409B42D2BB07C1585684B33C166A8C705`.
- `LEGAL_CHOICE_RESULTS.json`: `97F371E8A7ADA04038584FF04F67553747E0D126A4A3A56666A9D71A8BA80CA7`.
- `FULL_COST_RESULTS.json`: `07A8F907343B694DB280BCE06ECDCFFD55B61F815B42DF26E797E0D27E572C59`.
- `FULL_COST_MATRIX.csv`: `9A089076AE15ACEF54F98B207B8723C04DC33F1DD11749EBF5AAFB691076A883`.
- `SOURCE_TREE_HASHES.json`: `402FB2B1349A46BAE7ACE73E84A1AE9120D0C18D46A758C2977A4088D283E7ED`.

## Accounting notes

For the ten packaged traces, exact preprocessing costs come from the artifact's first-party `data_maxpre_default_checked.csv` `solving_time` rows. Local Windows MaxPre replays were valid but not byte-identical and are retained only as portability diagnostics. The 20 locally generated traces use measured local MaxPre costs. This choice avoids silently substituting a different trace while still charging preprocessing.

No optional small-trace exact ceiling was run after the decisive original-order absorption: it was optional in the frozen contract, and cannot rescue a candidate already dominated by a fair zero-scheduling-overhead baseline.
