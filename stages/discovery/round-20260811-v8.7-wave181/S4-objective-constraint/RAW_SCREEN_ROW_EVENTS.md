# Approximation raw screen

| id | same input/output-quality semantics | full current action union | minimum alleged action witness | disposition |
|---|---|---|---|---|
| R01 KLL | quantiles/CDF with normalized rank-error and confidence contract | update, lazy compaction, retain, merge, heap/off-heap, serialization | a merge/recourse structure preserving the exact error contract outside KLL construction | `DEEP_DIVE_REQUIRED` |
| R02 Theta | distinct/set estimate with valid bounds and seed compatibility | update, theta choosing, retain, union/intersection/A-not-B, compact/serialize | a set-operation construction preserving bounds/seed semantics outside current framework | `DEEP_DIVE_REQUIRED` |
| R03 CPC | distinct estimate under fixed accuracy-space semantics | CPC update/estimate/merge/serialize constructor | a whole recourse/space construction outside native CPC state transition | `DEEP_DIVE_REQUIRED` |
| R04 Frequent items | heavy hitter output with no-false-positive/no-false-negative error mode | weighted update, estimate/lower/upper bound, merge/query | a full error-preserving update/merge action outside current sketch | `DEEP_DIVE_REQUIRED` |
| R05 DuckDB T-Digest | `approx_quantile` value under documented aggregate semantics | T-Digest aggregate state/update/combine/finalize | only compression/threshold variation stated | `NOT_ADMITTED_UNFROZEN__PARAMETER_ONLY` |
| R06 DuckDB top-k | `approx_top_k` filtered-space-saving result semantics | aggregate state/update/combine/finalize | only `k`/threshold variation stated | `NOT_ADMITTED_UNFROZEN__PARAMETER_ONLY` |

No generic heuristic, ILP wrapper, sampling threshold, or changed quality object is treated as a candidate action.
