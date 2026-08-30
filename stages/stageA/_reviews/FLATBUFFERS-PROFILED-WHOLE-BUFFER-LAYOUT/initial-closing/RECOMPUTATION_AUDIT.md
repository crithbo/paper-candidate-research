# Independent Recomputation Audit

- Assignment: `STAGEA-G1-20260811-FLATBUFFERS-PROFILED-WHOLE-BUFFER-LAYOUT-INITIAL-CLOSING-V8.7`
- Mode: read-only arithmetic and hash recomputation; no candidate executable was run.
- Source rows: frozen `results/natural_results.csv`.

## Integrity

- Owner manifest: `11,519/11,519 PASS`
- Missing/format/hash mismatches: `0/0/0`
- Covered bytes: `955,621,867`
- Manifest self SHA-256: `6AD1305983AA337B35267BDA31DD543129952F2B650573D125257775DE3F2C2A`

## Structure and identity

| Check | Independent result |
|---|---:|
| CSV rows | 192 |
| natural models | 24 |
| frozen arms per model | 8 |
| arm-set mismatch | 0 models |
| eligible outputs | 192/192 |
| within-model canonical digest mismatch | 0 models |
| fallback models | 2 |

## Mechanism recomputation

| Quantity | Result |
|---|---:|
| candidate transitions | 156,163 |
| distinct-raw quotient merges | 886 |
| models with at least one strict merge | 22/24 |
| merge incidence | 0.0056735590 |
| candidate/generic equal bytes | 22/24 |
| candidate/generic equal weighted distance | 17/24 |
| candidate/generic equal on both static metrics | 17/24 |

The 886 merges prove non-singleton quotient behavior. They are not the contract's useful residual-action fraction, whose numerator additionally requires a selected continuation outside every B0/B1 plan. That fraction was not computed in the owner analyzer.

## Primary and per-metric residuals

| Count against coordinate-wise eligible union | Result |
|---|---:|
| candidate byte wins | 0/24 |
| candidate byte ties | 0/24 |
| candidate weighted-distance wins | 0/24 |
| candidate weighted-distance ties | 0/24 |
| candidate warm-reader wins | 2/24 |
| candidate cold-reader wins | 6/24 |

Held-out candidate-minus-union deltas, linear percentile interpolation at `(n-1)q`:

| Metric | p50 | p90 |
|---|---:|---:|
| bytes | 2.36220472440945% | 4.18028169014084% |
| weighted distance | 165.979892381762% | 283.060946145704% |
| warm reader | 0.498753117206994% | 1.15375575748511% |
| cold reader | 0.691341370879353% | 1.71064114658317% |
| builder wall | 49.453781512605% | 78.1254964257347% |

Training deltas independently reproduced:

| Metric | p50 | p90 |
|---|---:|---:|
| bytes | 3.10559006211180% | 6.41025641025641% |
| weighted distance | 153.290506780871% | 208.730727859448% |
| warm reader | 1.52671755725191% | 3.23450134770890% |
| cold reader | 0.439621591541458% | 2.52843443354148% |
| builder wall | 47.6354679802956% | 74.7794117647059% |

The owner arithmetic is therefore reproduced.

## Pareto derivation attack

The arithmetic above takes a minimum separately for each metric. It does not prove that one comparator arm realizes all minima. A direct check over the five recorded per-output metrics (`bytes`, `weighted_distance`, warm reader, cold reader, builder wall) found one comparator weakly dominating the candidate with at least one strict improvement on only `6/24` models.

This check is not itself the contract's final full-cost frontier because profile collection, planning, RSS/temp, and fallback must also be typed and aggregated. It is sufficient to show that coordinate-wise minima cannot be relabelled as an executable dominance certificate. The owner analyzer's full-cost qualifying field is a literal constant, not a computed output.

## Reproducibility disposition

Static hashes, CSV structure, identity checks, counts, and arithmetic are reproducible from the frozen package. Native timing is environment-sensitive and was not rerun under this gate's no-new-experiment boundary. The evidence can be audited, but the missing trace-profile artifact and missing executable-vector frontier cannot be reconstructed from the package without a scientific revision.
