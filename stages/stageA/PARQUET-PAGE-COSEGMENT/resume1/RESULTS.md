# PARQUET-PAGE-COSEGMENT Results

## Decision

`STOP_NARROW_FROZEN_MECHANISM` with evidence ceiling `STAGEA_SCIENTIFIC_NEGATIVE__NARROW_FROZEN_MECHANISM`.

The preclaim gate and resume continuity both passed. The complete 20-object double replay is semantically correct and deterministic, but the frozen natural useful-action, p50, p90, and strict full-cost residual gates fail.

## Aggregate results

| Metric | Replay1 | Replay2 | Frozen condition |
|---|---:|---:|---:|
| Natural files | 20 | 20 | 20 |
| Equivalence | 20/20 | 20/20 | 20/20 |
| Total complete actions | 1608 | 1608 | fixed denominator |
| Outside-union actions | 398 | 398 | descriptive |
| Useful outside actions | 126 | 126 | numerator |
| Useful residual rate | 7.8358208955% | 7.8358208955% | >=10% |
| p50 improvement >=10% | 7/20 | 0/20 | >=12/20 |
| p90 not worse | 16/20 | 16/20 | 20/20 |
| Whole-file ratio <=1.05 | 20/20 | 20/20 | 20/20 |
| Median whole-file ratio | 0.9694192530 | 0.9694192530 | <=1.05 |
| Median p50 improvement | 6.5607456121% | 1.0654027821% | descriptive |
| Median p90 improvement | 9.2466580452% | 4.8610089837% | descriptive |
| Strict p50+p90+size+full-cost residual | 0/20 | 0/20 | >=1 |

The useful-action numerator and denominator include all candidate-selected cut/representation actions across all eligible chunks and all 20 complete files. No file or unfavorable timing sample was removed.

## Full-cost

| Metric | Replay1 | Replay2 |
|---|---:|---:|
| Union full-cost wall ns | 30,577,723,800 | 29,839,081,200 |
| Candidate full-cost wall ns | 3,868,006,930,200 | 3,899,304,937,100 |
| Candidate/union ratio | 126.4975429662 | 130.6777816302 |
| Raw four-dimensional candidate non-dominated files | 20/20 | 20/20 |

The non-dominance is size-only: the candidate is about 3.06% smaller. Once the frozen directional query and full-cost requirements are enforced together, no residual remains. Planning is deliberately charged wholly to candidate; it is not converted to bytes or omitted.

## Replay integrity

- Non-timing `result.json` projection: exact on 20/20 files.
- Output Parquet SHA-256: exact on 17/17 artifacts per file, 340/340 overall.
- Candidate, strongest-union, and every boundary oracle are included in this comparison.
- Exact table, schema-with-metadata, row groups, standard indexes, and frozen SQL results: all true for each arm/file/replay.
- Detailed hashes: `artifacts/aggregate/replay_integrity.json`.
- Per-file costs and effects: `artifacts/aggregate/file_metrics.tsv`.
- Machine-readable aggregate: `artifacts/aggregate/aggregate_results.json`.

## Resource result

The topic tree remained under the 4 GiB ceiling and the observed CPU/RSS stayed within the frozen public-CPU envelope. The application-close interval has no final process ledger and is explicitly retained as a measurement limitation; it did not remove any completed arm-level scientific ledger or alter the decision.

## Claim boundary

The result rejects only the frozen workload-conditioned co-segmentation mechanism on the frozen NYC TLC object/workload and fair union. It does not reject other standard-Parquet mechanisms and does not authorize Stage B.

