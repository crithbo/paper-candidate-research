# NVDLA collision and action-space matrix

| Comparator / source | Same object | Atomic-action coverage | Guarantee / cost | Disposition |
|---|---|---|---|---|
| NVDLA compiler official Primer | Yes: compiler to NVDLA loadable under hardware config | layer-by-layer compilation; CBUF-size-driven operation splitting; weight-region allocation | does not state a bounded local-edit recourse theorem | Native baseline union; prevents calling layer partition alone new. |
| `Memory.cpp` current source | Yes | memory pools, pooled-memory reuse, greedy eviction, CVSRAM allocation | implementation knobs, no advertised recourse bound | Native baseline union; prevents calling allocation/reuse alone new. |
| `DLAResourceManager.cpp` current source | Yes | buffer/surface descriptor directories and copy-state locus | clone FIXME is not an absence claim | Native baseline union; no residual follows from the comment. |
| `CompilerFeatures.md` + `regression/` | Yes carrier domain | supported layer/config surface; verified networks and regression assets | exact selected loadable/runtime pair remains unpinned | Carrier route only; not a proposed mechanism. |
| Independent primary paper/artifact search | Bounded query only | no confirmed direct same-object bounded-recourse constructor found | no global negative claim | `SEARCH_BOUNDED_OPEN`. |

## Action-gap audit

The raw’s nouns are already union dimensions. It did not freeze a new transition rule such as a named local graph-edit operator, a legal before/after state relation, the exact portion allowed to move, or a target-specific bound. Thus the only remaining statement would be “choose/maintain the existing construction better,” which is a prohibited generic policy formulation rather than a research action. No direct-paper collision is needed for that structural disposition.
