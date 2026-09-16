# RAW_SCREEN_ROW_EVENTS — Wave191

Assignment: `DISCOVERY-S3-20260811-V8.7-WAVE191-WIKIMEDIA-LINK-CHURN-N3-DEPTH`. Cutoff: 2026-08-11. Authority: v8.7 + R5-P0; `DISCOVERY_QUALITY_MODE=OFF`.

| ID | frozen candidate object | layout-independent phenomenon schema | same-object intended action / minimum witness | disposition |
|---|---|---|---|---|
| RAW-191-01 | A named Wikimedia wiki's monthly MediaWiki History dump version plus an official dated page/revision relation slice; page-link/category/template relations under native namespace/title semantics | For each fixed-duration adjacent pair: relation-edge symmetric-difference rate and changed-neighborhood radius, stratified by namespace, page age, revision volume, page move/rename, deletion and template transclusion class. Invariant under dump row order, shard placement and index layout. | A complete version-delta relation constructor maintains exact `prop=links`, `prop=templates` or `list=categorymembers` results from a frozen base plus typed deltas. Witness: one page has a template/category/link change while a matched unchanged page must reconstruct byte-identical native relation tuples under two input orders. | `DEEP_DIVE_REQUIRED` |

Excluded: edit-count correlation alone; page text cleaning; generic partition/reordering; cache/controller; opaque precomputed result store; change of output to approximate search ranking or a different relation semantics.

