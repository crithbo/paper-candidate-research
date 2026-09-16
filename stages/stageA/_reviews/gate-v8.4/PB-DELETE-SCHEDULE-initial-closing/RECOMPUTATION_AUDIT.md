# PB-DELETE-SCHEDULE Read-only Recalculation Audit

This audit used only frozen owner outputs and limited read-only recomputation. It did not execute candidate code, generate new positive evidence, or access Stage B.

## Input integrity

| Package | Manifest entries | Verified | Bad | Missing | Manifest SHA-256 |
|---|---:|---:|---:|---:|---|
| Discovery S6 PB package | 4 | 4 | 0 | 0 | `FD232683C16C4A59094E1774B9C650EDD5CFD2B21C62126704EE5E98C965A7E4` |
| Stage 0 PRIMARY | 4 | 4 | 0 | 0 | `8BFA469EDE4F4E123E65ACC557D020A10CE50ECE6BF0A5BB4FFDA4D63A8D7C61` |
| Stage 0 confirmation | 2 | 2 | 0 | 0 | `DAB73ED3DBAEE12DA5FB74D39B12DB2840B6490A1453B51355F974EF908918E1` |
| Stage A owner | 38,525 | 38,525 | 0 | 0 | `B1256B2B631BCE9DBEE27E310F56A9A9F19FFB9C69BAC8A0194293A33757AF11` |

The owner directory contains 38,526 files including the manifest. All four assignment-specified owner root hashes match.

## Action-shape recomputation

Line-by-line comparison of each final proof to its trace's original proof produced:

| Variant | Records | Identical to original | Exactly one adjacent two-line swap | Other transformation | Line-count mismatch |
|---|---:|---:|---:|---:|---:|
| original | 30 | 30 | 0 | 0 | 0 |
| stable_legal | 30 | 19 | 11 | 0 | 0 |
| greedy_earliest_ready | 30 | 17 | 13 | 0 | 0 |
| candidate_frontier | 30 | 6 | 24 | 0 | 0 |

This directly establishes that the package contains no complete ordered-partition or batching output.

## Choice-rate recomputation

- Traces: 30
- Minimum checked deletions: 153
- Maximum checked deletions: 22,789
- Declared adjacent frontier pairs: 31,181
- Trial candidates actually emitted: 57
- Trials accepted by both checkers: 55
- Traces with at least one accepted sampled trial: 24
- Reproduced sampled hit rate: 24/30 = 0.80

The code selects only the first pair under four predicates and deduplicates them. Hence `0.80` is a selector-sample hit rate. It is nevertheless a valid lower bound on the fraction of these records with at least one legal alternate, because every accepted swap is a witness of existence. It is not a choice-density measurement and does not establish action completeness or multi-step scheduling headroom; the 30-natural-trace denominator also fails separately.

## Replay/equivalence recomputation

- Rows: 240
- Trace/method groups: 120
- Groups containing two replays: 120
- VeriPB forced-checked accepted rows: 240
- CakePB equioptimal accepted rows: 240
- Frozen output hash equal rows: 240
- Proof/kernel hash mismatch across replay pairs: 0

These facts validate the one-swap control's same-object execution.

## Aggregate recomputation

Percentiles below use each trace's median across the two replays, matching the owner aggregation:

| Variant | p50 time (ns) | p90 time (ns) | p50 certificate (B) | p90 certificate (B) | Fallback traces |
|---|---:|---:|---:|---:|---:|
| original | 138,996,995.0 | 422,362,570.6 | 666,381.0 | 2,593,017.3 | 0 |
| stable_legal | 210,344,784.5 | 449,634,025.6 | 666,381.0 | 2,593,017.3 | 19 |
| greedy_earliest_ready | 215,443,359.5 | 480,586,830.4 | 666,381.0 | 2,593,017.3 | 17 |
| candidate_frontier | 260,117,345.5 | 813,385,264.8 | 666,406.0 | 2,593,017.3 | 6 |

Candidate time deltas:

| Baseline | p50 delta | p90 delta |
|---|---:|---:|
| original | +87.139% | +92.580% |
| stable_legal proxy | +23.662% | +80.899% |
| greedy proxy | +20.736% | +69.248% |

The candidate is slower than original on all 30 trace-level medians. This is a robust proxy negative, including under favorable under-accounting, but it cannot cross the pre-claim fidelity gate.

## Full-cost audit

The row schema records preprocessing, dependency extraction/graph, order construction, one legality-oracle/fallback cost, both checker times, proof/kernel/certificate bytes, disk I/O, peak RSS, fallback, output hash, and equivalence flags. However:

- aggregate percentiles retain only full time and certificate bytes;
- the Pareto decision uses only those two dimensions;
- the selected candidate is chosen from the accepted trial list but only one selected trial is charged;
- complete schedule planning/exploration does not exist because the action is restricted to one sampled adjacent swap.

Thus row-level instrumentation does not close the preregistered full-cost claim.

## Corpus eligibility audit

The frozen contract requires 30 natural traces and states “No synthetic trace may enter the frozen corpus.” The accepted corpus contains `zenodo__ConsistentQueryAnswering-synthetic-15`. Provenance hashes show which artifact it came from, but provenance identity does not convert a synthetic workload into a natural workload. At least one replacement is therefore mandatory before the natural denominator is closed.
