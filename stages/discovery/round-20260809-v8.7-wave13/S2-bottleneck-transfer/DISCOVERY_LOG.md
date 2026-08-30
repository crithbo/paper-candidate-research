# DISCOVERY-S2-20260809-V8.7-WAVE13 — Discovery log

## Result

- Method: production `v2/v8.1`, calibrated v8.6 fidelity-plan admission, and v8.7 `CURRENT_UPSTREAM_REALITY_CHECK`; blocked two-axis `v8.2r2` was not used.
- Latest-collision cut-off: 2026-08-09.
- Proposed: one grounded brief, `PARQUET-PAGE-COSEGMENT` (`TIER_B_Q2_VIABLE`, `FINITE_FIDELITY_GAP`).
- Not proposed: proof/checker and eBPF compilation routes, because their relevant joint actions were directly covered by current mechanisms screened in Wave12; no terminal topic was revived.

## Three-pass convergence

| Pass | Finding | Outcome |
|---|---|---|
| Genealogy / seed distance | Existing Parquet improvements focus on reader pruning/decode overlap or fixed writer settings; the candidate changes the construction decision into a constrained joint algorithm. | Retained for collision attack. |
| Competing mechanism / same-object union | Parquet PageIndex, Arrow late materialization, fixed page/codec/Bloom settings, and Oasis are frozen as the strongest union. | No union member constructs nonuniform workload-conditioned page representation under the specified full-cost objective; this remains a hypothesis for Stage 0 to attack. |
| Artifact / natural input / AI path | Parquet format supplies checker semantics; Apache writer/Arrow/DataFusion/DuckDB and public NYC TLC Parquet are CPU-accessible; a 20-file finite killer is defined. | `FINITE_FIDELITY_GAP`, not implementation-based rejection. |

## v8.7 audit notes

Reality check used official docs, current source snapshots, source symbols and defaults. The checked source proves that current facilities already expose page sizing, row caps, codecs, dictionary and Bloom controls, and the reader already performs PageIndex-driven pruning/late materialization. The brief does not claim any action is absent merely because a past paper or issue said so. A local Git transport TLS credential error is recorded as a non-scientific resource limitation; immutable release tag `apache-parquet-1.17.0` anchors the baseline.

## Source record

- Apache Parquet specification / current documentation: <https://parquet.apache.org/docs/file-format/data-pages/compression/> and <https://github.com/apache/parquet-format/>.
- Apache Parquet Java current source snapshot: <https://raw.githubusercontent.com/apache/parquet-java/master/parquet-hadoop/src/main/java/org/apache/parquet/hadoop/ParquetWriter.java>.
- Apache Arrow reader semantics: <https://arrow.apache.org/blog/2025/12/11/parquet-late-materialization-deep-dive/>.
- Durner et al. (2025): <https://link.springer.com/article/10.1007/s00778-025-00911-1>.
- Oasis (2026): <https://arxiv.org/abs/2608.02268>.
- Natural corpus: <https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page>.

Lane state after this handoff: `IDLE_REUSABLE_AWAITING_MAINLINE`.
