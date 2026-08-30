# Raw screen row events

| Row | Exact candidate action | Initial action-divergence witness | Result |
|---|---|---|---|
| R01 | choose a complete filter sequence `f[0..h-1]` jointly for fixed decoded rows and a frozen libpng/zlib setting tuple, then emit one standard PNG stream | two correlated rows: two legal filter choices can have identical row-local heuristic score yet create different second-row DEFLATE history | DEEP_REDTEAM |

The witness proves only that the proposed decision variable is whole-image rather than a single-row setting. It does **not** prove novelty or a performance/size residual.
