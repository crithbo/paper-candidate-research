# Raw screen-row events

| Row | Event | Evidence and disposition |
|---|---|---|
| R1 | Exact object frozen | The official BlockBasedTable format specifies sorted KV pairs partitioned into data blocks, followed by meta blocks and a footer that points to index/metaindex handles. This supports a same-reader representation problem, not a database-policy problem. |
| R2 | Legal freedom established | For a fixed sorted manifest, different legal data-block cuts and restart placements can be encoded while regenerating block handles, index entries and filters. The result remains a standard SST if all references/checksums are regenerated. This is a legality witness only. |
| R3 | Current actions found | Official materials expose data-block restart intervals, separate index restart intervals, index variants/partitioning, filter variants/partitioning, compression, cache and format choices. Current releases also add per-index-block automatic binary/interpolation selection, so a baseline cannot be reduced to an old fixed binary-index setting. |
| R4 | Candidate mechanism scoped | Conditional N2: a target-specific dynamic program/Pareto algorithm jointly selects legal data-block cuts, restart spacing and index/filter partition boundaries under a frozen lookup/scan trace and construction-cost budget. It must beat the strongest reproducible composition, not merely choose an option value. |
| R5 | Collision warning | Partitioned index/filter is already an official same-object constructor; learned/block-aware indexing and range-filter work are adjacent/direct competing mechanisms. A primary-paper and current-source union audit is therefore essential. |
| R6 | Admission outcome | `NOT_ADMITTED_UNFROZEN`. The available primary material establishes representation freedom but does not close every current producer/configuration path nor the direct collision matrix for the proposed joint planner. No brief is packaged. |
