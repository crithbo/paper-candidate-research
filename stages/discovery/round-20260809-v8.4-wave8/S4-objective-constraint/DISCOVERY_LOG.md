# Wave8 Discovery log — O4 same-object union residual

Assignment: `DISCOVERY-S4-20260809-V8.4-WAVE8`  
Cutoff: 2026-08-09. Method: accepted `v2/v8.1` with v8.4 two-layer screening and baseline-residual-first. The blocked two-axis `v8.2r2` was not used.

## Result

`COMPLETE_ZERO_PROPOSALS`. Inspected current strong data-structure/graph-storage sources did not expose a same-object, same-information strongest union whose action space left an atomic N1/N2/N3 residual. No experiment, benchmark, Stage 0, Stage A, or Stage B was created or run.

## Screened non-reused objects

| Object family | Primary material | Union-first finding | Decision |
|---|---|---|---|
| Dynamic ordered dictionary / rank-select | *Succinct Dynamic Rank/Select* (SODA 2026 original preprint); *Worst-case Optimal Adaptive Dynamic Bitvectors* (2025 original article) | The former is a dynamic ordered set with a compressed treap and a static lookup-table assumption; the latter is an adaptive bitvector whose bound depends on query/update ratio. Their representations, operations, guarantees, and cost models are not a common deployable action space. | `DROP__SAME_OBJECT_AND_UNION_FAILURE` |
| Dynamic graph storage | RadixGraph (2026 original preprint and author upstream project) | Its snapshot-log edge store and radix vertex index jointly address update throughput and memory. No second current same-semantics graph-store representation fixing a distinct compatible constraint was established from primary sources. | `DROP__INSUFFICIENT_CROSS_PAPER_TENSION` |
| Practical hash table space/latency | TPHT (2026 original preprint) | Chained and flattened designs already form distinct representation choices within one work. Combining them through per-operation or workload selection would be exactly the prohibited selector; no union-external shared action was identified. | `DROP__PROHIBITED_SELECTOR_OR_DIRECT_SUBTRACT` |
| Static graph-database multijoin indexes | 2026 compact BGP index work | Previously screened in Wave5 and excluded by assignment; not reopened. | `EXCLUDED__PRIOR_WAVE_OBJECT` |

## Dual-layer conclusion

Structural-paper-potential was not assessed as negative merely because artifacts/results are incomplete. Each drop is structural: incompatible exact objects/action spaces, an absent two-work tension, or a prohibited selection formulation. Thus no brief, direct subtractor, baseline union, or Stage A killer is declared.

