# Same-object action-divergence / strongest-union matrix

| Candidate | Divergence witness | Strongest current union | Why union absorbs or boundary fails |
|---|---|---|---|
| rustc query retention | Persist vs recompute one valid query result for identical DAG/revision delta. | Native red-green/try-mark-green dependency validation and incremental work products. | No new information, budget, constraint, or guarantee beyond cache policy. |
| PostgreSQL apply | Apply two apparently independent transactions in a different order. | Native ordered apply plus documented parallel workers/slots. | Reordering weakens the within-subscription transactional-order guarantee. |
| QUIC update | Choose a different cwnd/pacing update under identical feedback. | Existing endpoint CC, QUIC-DC, PEMI, and production optimisation. | Endpoint route collides; middlebox route changes deployment/information object. |
| DAMON operation | Reclaim vs LRU-sort the same sampled cold region. | DAMOS operation schemes and DAMON_STAT auto-tuned monitoring. | It is a native configuration/scheme mapping; no new N2/N3 guarantee. |
| F2FS mode | Cleaning vs threaded-log state transition. | Current F2FS hybrid dynamic policy. | The exact action is implemented upstream; remaining switch threshold is tuning. |
