# Discovery Divergence Seed Pool — SEGMENTK-W4A16

## Pool metadata

- Assignment / lane: `DISCOVERY-S6-20260823-SEGMENTK-W4A16-DISCOVERY-REV0` / S6
- Frozen profile: pre-topic current-union closure only; no Topic ID, raw, or Stage 0 action
- Seed ceiling: `<=12`; actual: `1`
- Network-security exclusion check: `PASS`
- Generation completed before evidence lookup: `YES`

## Seed record

### `S6-SEGMENTK-01`

- Engine: `CONSTRAINT_MANIPULATION`
- Perspective role: `COMPILER_OR_BACKEND_ENGINEER`
- Starting anchor or hunch: grouped W4A16 metadata is normally fetched once for
  a K-group.  A dense M=1 kernel might use a segment containing 2 or 4 adjacent
  groups, stage its metadata once per output tile, and preserve the same packed
  GPTQ/sequential and FP16/FP32 numerical semantics.
- Exact public anchor candidate: `vllm-project/vllm@568afb3a13806beb53bb2e6bd518269357b237c0`,
  `triton_w4a16.py`; target `gfx1151`, `G=32`.
- Intended source role: `CURRENT`
- Two-sentence idea sketch: the possible delta is not per-element global scale
  gathering; it is a segmented metadata pipeline for a multi-group K tile.
  Its relevance depends entirely on whether the current dense or RDNA hybrid
  path already has that exact action.
- Conclusion-first test: if it survived, the strongest cautious conclusion
  would be a same-object dense-M1 metadata-staging constructor with a local
  mapping invariant and a static cost frontier, not a measured speedup.
- Generic/current-union risk: `HIGH`
- Relation to existing family: `FRESH_SKETCH` relative to the forbidden
  QGROUP guard/repair identity; no claim of novelty.
- Generic-shell noun-swap test: `PASS` provisionally — fixed packing, group,
  M=1 regime, target and metadata action are all named.
- Preliminary disposition: `KEEP_FOR_CONVERGENCE`

## Clustering and convergence

One fixed seed only; no fill or outcome-aware replacement.  It is selected for
one bounded source closure because it has an exact public anchor and a direct
current-union falsifier.

## Advisory

`DIVERGENCE_COVERAGE_ADVISORY: SINGLE_PERSPECTIVE`.  This is harmless for the
assignment's one-investigation closure and is not an admission deficiency.
