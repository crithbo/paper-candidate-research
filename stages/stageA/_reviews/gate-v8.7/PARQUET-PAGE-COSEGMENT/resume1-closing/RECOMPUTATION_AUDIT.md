# Read-only Recomputation Audit

## Scope

No owner command, query, writer, compiler, download or new experiment was run. The audit parsed frozen JSON/TSV artifacts, recomputed formulas, rehashed files, and inspected frozen source paths.

## Manifest

- Entries: `718`
- Recomputed matches: `718`
- Missing/mismatched: `0`
- Bytes covered: `879390169`
- Manifest SHA-256: `96D84A4C34C1E57441AA0DBDA9BEB446F55B743F258700B5E3FBB914845F24A9`

## Independent aggregation

For each replay, the audit loaded 20 per-file `result.json` records and recomputed action sums, ratios, medians, threshold counts, query-sample sums and full-cost expressions.

| Metric | Replay 1 | Replay 2 |
|---|---:|---:|
| files | 20 | 20 |
| actions / outside / useful | `1608 / 398 / 126` | `1608 / 398 / 126` |
| useful rate | `0.07835820895522388` | `0.07835820895522388` |
| p50 >=10% | 7 | 0 |
| p90 non-worse | 16 | 16 |
| size <=1.05 | 20 | 20 |
| median p50 improvement | `0.06560745612106017` | `0.010654027821331902` |
| median p90 improvement | `0.09246658045247802` | `0.04861008983663867` |
| median size ratio | `0.9694192530333585` | `0.9694192530333585` |
| union write+query ns | `30577723800` | `29839081200` |
| candidate write+query ns | `29903409400` | `30162404900` |
| combined planning ns | `3838103520800` | `3869142532200` |
| reported candidate full ns | `3868006930200` | `3899304937100` |
| reported full-cost ratio | `126.4975429662` | `130.6777816302` |

The owner aggregate is arithmetically correct given its formula.

## Replay hashes and semantics

- 20/20 stable non-timing projections reported equal.
- 17 output Parquet artifacts per file × 20 files = `340` replay pairs.
- Independently rehashed identical: `340/340`.
- Per-file equivalence flags all true: `20/20` in both replays.

## Reproducibility verdict

- Deterministic artifact/layout/semantic result: `VERIFIED_FROM_FROZEN_ARTIFACTS`.
- Timing/full-cost scientific comparison: `NOT_VERIFIED__FROZEN_ORDER_AND_ATTRIBUTION_CONTRACT_NOT_EXECUTED`.
