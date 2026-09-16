# Raw screen row events

| event | result | evidence |
|---|---|---|
| natural carrier freeze | pass | NYC TLC official Yellow Taxi Trip Record Data: January--June 2025 monthly Parquet releases; official March 18, 2025 dictionary fixes pickup/dropoff timestamp and trip fields. |
| same-object union | pass | PostgreSQL official BRIN docs enumerate index build, update of existing summaries, `brin_summarize_new_values`, `brin_summarize_range`, `brin_desummarize_range`, vacuum/autovacuum and optional `autosummarize`; minmax-multi and bloom opclass parameters also exist. |
| static transition schema | pass as a falsifiable schema | For a fixed append prefix and fixed query windows, compare a layout-independent arrival-disorder statistic against BRIN false-positive recheck work per returned row; keep pages-per-range/opclass constant within each arm. |
| residual action | fail | A proposed response—change range size, summary type, schedule summarization/de-summarization, or reorganize table—is configuration/controller/rebuild and is already native union or changed object. |
| decision | STRUCTURAL_DROP | Characterization has a finite route, but no union-external direct utilization action and no already-supported stable transition law sufficient for Q2 characterization claim. |
