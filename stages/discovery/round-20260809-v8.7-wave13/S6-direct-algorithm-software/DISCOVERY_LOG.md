# Discovery log — DISCOVERY-S6-20260809-V8.7-WAVE13

## Result

`COMPLETE_ZERO_PROPOSALS`. The only fresh CPU storage-format seed examined, ORC string dictionary construction, is absorbed by the verified current writer action union. No brief is emitted rather than treating an old limitation or a configuration knob as a new constructor.

## Method and frozen boundary

- Method: accepted/calibrated `DISCOVERY_METHOD_V2_V8_1` + calibrated v8.6 fidelity-plan admission + v8.7 `CURRENT_UPSTREAM_REALITY_CHECK`.
- Frozen source cutoff: `2026-08-09`.
- Explicitly not used: blocked two-axis `v8.2r2`.
- Current upstream frozen: Apache ORC `2.3.1`, official release tag `rel/release-2.3.1`, as listed by the official [releases page](https://orc.apache.org/releases/).
- Source classes/doc symbols checked: `OrcFile.WriterOptions` (encoding strategy/direct columns), `WriterContext.getDictionaryKeySizeThreshold(int)` and `WriterContext.setEncoding(...)`, per official [ORC API](https://orc.apache.org/api/orc-core/org/apache/orc/impl/writer/WriterContext.html); current Java configuration is the official [ORC Java configuration](https://orc.apache.org/docs/core-java-config.html).
- Only this directory was written. No E-drive reference, experiment, benchmark, Stage0/A/B creation, Stage B authorization or master-file edit occurred.

## Current-upstream reality check

For a fixed ordered public tabular corpus and a standards-compliant ORC file, the strongest deployable same-information union contains all currently documented writer actions:

1. dictionary/direct encoding selection; `orc.dictionary.key.threshold` (default 0.8), `orc.dictionary.max.size.bytes`, `orc.dictionary.early.check`, and explicit `orc.column.encoding.direct`;
2. dictionary data-structure choice (`rbtree`/`hash`), stripe size/row-count, row-index stride, block/compression-buffer size, encoding/compression strategy and Zstd level;
3. writer's per-stripe `setEncoding` capability and standard ORC reader/index semantics.

The official ORC specification additionally fixes the string dictionary representation: dictionary entries are lexicographically sorted, with `DICTIONARY_DATA`, `LENGTH`, and reference `DATA` streams. The Java writer chooses string encoding after the first row group. Thus a purported “adaptive dictionary threshold,” alternate dictionary data structure, early-check schedule, or page/stripe decision is already an action/configuration in the current union. Reordering records would change ordered-stream/index/statistics semantics or become external pipeline glue.

## Fidelity and evidence honesty

No candidate was rejected because an implementation, natural corpus download, result, hardware resource or AI ability was absent. A finite fidelity plan would be possible for a genuinely residual ORC constructor using an official reader/full scan, but no union-external action was found. No ORC file was generated, read, benchmarked or timed in this assignment.
