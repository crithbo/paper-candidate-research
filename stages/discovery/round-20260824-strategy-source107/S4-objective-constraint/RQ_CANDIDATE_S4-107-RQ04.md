# Discovery Research Question Candidate

- RQ ID: `S4-107-RQ04`; seed: `S4-107-07`.
- Anchor: PyTorch dynamic-shape and cache artifact documentation.
- Primary RQ: capture/static-shape and dynamic-shape fallback是否存在 native multiple-specialization/cached-dispatch 之外的有限 threshold action？
- Earliest falsifier: current ShapesSpec/case dispatch and PGO/cache design already provide same action class.
- Pre-RQ result: `EARLY_FATAL`.

## Closure audit

- Exact object/action/claim endpoint: `torch.compile` dynamic-shape artifacts for one function; create several specialized artifacts plus a generic fallback and dispatch by explicit shape predicates.
- Current source locus and version/date: `https://docs.pytorch.org/devlogs/dynamic_shapes/2026-06-24-shapes-spec/`, PyTorch Contributors DevLog, published 2026-06-24 and accessed 2026-08-24.
- Direct coverage mapping: ShapesSpec documents multiple specialized artifacts, runtime predicate dispatch, generic fallback and `isolate_recompiles=True` cache buckets.
- Contrary evidence: the page names higher-level dispatch as future work but the frozen RQ action is the explicit dispatch/cached specialization class already shown there; it does not freeze a different compiler action or guarantee.
- Full-cost boundary: shape predicates, artifact count, recompilation isolation and generic-fallback path; excludes claims about an unmeasured serving workload.
- Query/stop boundary: one official PyTorch source page and its concrete reference implementation; stop at direct action coverage. Result: `EARLY_FATAL` only for this proposed dispatcher class.
