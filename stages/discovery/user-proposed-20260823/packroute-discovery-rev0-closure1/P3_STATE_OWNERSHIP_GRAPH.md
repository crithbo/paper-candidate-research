# P3 — state/ownership graph

## Frozen intended graph

`checkpoint source tensors → vLLM routed-expert parameters → native backend
selection → backend-specific prepared representation → execution`

## Evidence-qualified status

- The source artifact and vLLM/FlashInfer version anchors are public.
- The exact creator, cache key, source-retention and destroyer loci for the
  stipulated B12x representation were not found in the frozen version pair.
- The currently inspectable FlashInfer main B12x API cannot be substituted for
  v0.6.13 without changing the frozen object.
- Therefore there is no verified source-plus-prepared simultaneous-residency
  fact and no verified cross-shape shared workspace/state fact.

Result: `OPEN_BOUNDED_DEBT`. This is neither a source-lifetime conclusion nor
an ownership-interface proposal.

