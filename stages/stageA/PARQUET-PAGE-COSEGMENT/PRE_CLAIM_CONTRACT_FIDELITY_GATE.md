# PRE_CLAIM_CONTRACT_FIDELITY_GATE

Status: **PASS**. The natural-corpus claim-bearing phase was authorized only after the successful witness replay recorded below.

## Atomic-action map

| Frozen action/invariant | Required implementation evidence | Status |
|---|---|---|
| Fixed typed rows/order/row groups | exact Arrow schema/table equality plus per-row-group equality | PASS |
| Row-aligned page cuts | 3 nonuniform pages per column; OffsetIndex row spans independently decoded | PASS |
| One codec per column chunk | footer codec is ZSTD; page headers contain only `is_compressed` | PASS |
| Type-correct standard page encoding | unmodified PyArrow 25.0.0 and DataFusion 54.0.0 decode | PASS |
| Per-page V2 compressed retention | independently observed 8 compressed and 4 retained pages | PASS |
| Standard PageIndex/OffsetIndex | 4 ColumnIndexes and 4 OffsetIndexes independently decoded; 12/12 page references consistent | PASS |
| Globally budgeted joint constructor | implementation path is the deterministic file-level DP registered in the natural probe; it emits new cuts/retention decisions rather than selecting a baseline file | PASS TO NATURAL PROBE |

## Comparator and denominator audit

The complete fixed-writer and Arrow CDC grids, the same two legal representation modes, training workload, per-file selection budget, native reader, PageIndex setting, query repetitions, output-file byte denominator, and full-cost boundaries are frozen in `EXPERIMENT_CONTRACT.yaml`. GSOP and Oasis cannot enter the numerical union because they change the object or deployment setting.

## Fail-closed rule

Natural-corpus results may become claim bearing only after every row above passes on the 32-row witness. Partial writer, proxy reader, synthetic performance, or a baseline-only run is retained as `CODEC_OR_IMPLEMENTATION_CONTROL__NON_CLAIM_BEARING` and cannot support PASS or STOP.

## Witness result

- Replay command: see `COMMAND_LOG.md`.
- Result: `artifacts/witness/witness_result.json`, `all_pass=true`.
- Exact object checks: Arrow table, schema metadata, row-group count and row-group rows all equal.
- Reader checks: PyArrow and unmodified DataFusion SQL results equal.
- Format checks: 12/12 DataPageV2 headers and standard indexes independently reparsed.
- The first run exposed only a reporting bug (`Int64Array.as_py` instead of indexing its sole scalar); it occurred after successful output decoding, was retained in `FAILURE_LOG.md`, and made no scientific observation.
