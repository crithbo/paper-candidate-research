# Source / collision / action-space matrix

Frozen cutoff: `2026-08-09`. Technical sources are official SQLite documentation/source artifacts or original research papers.

| Source | Frozen fact | Action-space consequence | Disposition |
|---|---|---|---|
| SQLite `ANALYZE`, current official docs: <https://www.sqlite.org/lang_analyze.html> | Default `analysis_limit=0` fully scans each index. A non-zero limit approximates work per index and does not compute `sqlite_stat4`; `PRAGMA optimize` uses a temporary analysis limit. | Current deployable union includes full ANALYZE/STAT4 and per-index approximate ANALYZE/optimize; setting the limit is threshold tuning. | `CURRENT_UNION_BASELINE` |
| SQLite query-optimizer overview: <https://sqlite.org/optoverview.html> | STAT3/STAT4 histograms affect range-constraint estimates; STAT4 retains all indexed columns. | Same-function boundary is query results unchanged under the native planner, with plan/latency only as evidence. | `NATIVE_SEMANTICS` |
| SQLite file format, current docs: <https://www.sqlite.org/fileformat.html#stat4tab> | `sqlite_stat4` has `(tbl,idx,nEq,nLt,nDLt,sample)`; arbitrary count is legal but samples of an index must remain index order. | A legal ordered sample constructor could exist, but its action alone is not evidence of a new paper. | `OPEN_FORMAT_INTERFACE` |
| SQLite trunk source artifact describing `IndexSample`: <https://www.sqlite.org/src/artifact/a54f839859> | Runtime samples carry record bytes plus `nEq`, `nLt`, and `nDLt`; points to `analyze.c`. | Native reader/planner can be an oracle; does not itself establish a residual. | `SOURCE_CONFIRMATION` |
| SQLite source release history: <https://sqlite.org/changes.html> | Current `PRAGMA optimize` automatically limits analysis work; STAT4 behavior has continued to receive correctness fixes. | All standard default/non-default analysis controls must remain in any future same-object comparator. | `CONFIG_COUNTEREVIDENCE` |
| Microsoft Research, *Automating Statistics Management for Query Optimizers*: <https://www.microsoft.com/en-us/research/wp-content/uploads/2016/02/stats.pdf> | Original workload-aware statistic-management problem/algorithm family. | Cross-index budget allocation without a new SQLite-native representation/guarantee risks an application rename. | `DIRECT_METHOD_SUBTRACT` |
| QuickSel original paper: <https://arxiv.org/abs/1812.10568> | Workload-driven selectivity models compete with histogram/sample approaches. | A generic selectivity model would change the SQLite native statistics representation/reader and is not a valid direct substitute. | `METHODOLOGICAL_ADJACENT_AND_CHANGED_REPRESENTATION` |

## Admission decision

- Existing-point selector / `analysis_limit` grid: `DROP_ROUTINE_TUNING_CONTROLLER`.
- New external learned/selectivity model: `DROP_CHANGED_NATIVE_STAT4_REPRESENTATION`.
- Cross-index ordered STAT4 allocator: no direct fatal collision was established, but `NOT_ADMITTED__NATURAL_WORKLOAD_AND_SAME_OBJECT_SUBTRACTOR_NOT_FROZEN`; no brief is emitted.
- Synthetic benchmark-only route: `DROP_SYNTHETIC_ONLY`.
