# Current-source and collision audit — QREFINE-TRITON-W4A16

## Source facts independently checked

| Source | Pin / local hash | Finding | Ceiling |
|---|---|---|---|
| Triton NVIDIA backend | `f797708c`, `D012…9658` | `make_llir` calls `pm.run(...,'make_llir')` then `llvm.to_module`. | Confirms frozen capture boundary only. |
| Triton AMD backend | `f797708c`, `8DF3…65F4` | Same adjacent conversion boundary. | Confirms independently lowered target locus only. |
| Triton NVIDIA main | retrieved 2026-08-21, `C55A…0786` | Same `make_llir` / `llvm.to_module` ordering remains. | Current-reality evidence; main is moving, so not a frozen reproduction pin. |

## Collision decision

No direct-fatal item was established. The close MLIR work validates high-level,
target-independent transformations with an FP abstraction/refinement design;
the candidate must still demonstrate why its exact trace semantics and target
boundary are necessary. General TV and LLVM backend TV are mandatory method
comparators, not evidence of identical coverage. `SEARCH_BOUNDED_OPEN` remains
for unpublished/current work not reached by the bounded primary search.

## Provenance note

The first saved raw source was recorded in the resource ledger immediately after
rather than before the request. It is hashed, pinned and used only for a positive
boundary observation; the defect is logged in the batch inventory and supports
no absence claim.
