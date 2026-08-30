# P01 depth red-team

## Minimal native-legal witness

Consider two independent declaration records `D1` and `D2`. A byte-level permutation is accepted only if every dependent declaration/type/identifier ID, `DECL_OFFSET`/`TYPE_OFFSET` entry, visible/lexical lookup record, module local-to-global map, delayed body/update offset and hash/index reference remains consistent. The stock reader reaches a declaration by its ID through the offset table and then lazily jumps to the record.

Thus there are only two outcomes:

1. Preserve the record/index protocol and recompute locations/IDs: this is a generic record-layout/packing rewrite over the existing `ASTWriter` primitive, expressly excluded by the assignment.
2. Change index granularity, lookup schedule, ID translation or lazy-load protocol: this changes the stock-reader contract, so it is a different object.

No third target-specific whole constructor is established.

## Six-dimensional subtraction

| dimension | finding |
|---|---|
| decision | the apparent degree of freedom is record placement only |
| information | same AST/module graph; no profile/controller is permitted |
| resource | writer CPU/RSS/temp, file bytes, reader load/import RSS/latency all are legitimate but do not create a new action |
| quality/guarantee | same stock reader and downstream compiler output fixes IDs, offsets, lookup and module semantics together |
| full cost | any future measurement would include all writer + file + reader costs |
| generalization/no-gain | natural PCH/PCM carrier exists but cannot rescue a prohibited generic layout action |

## Finite killer (counterfactual, not run)

On 20–50 public Clang PCH/module inputs, generate a single minimal `D1,D2` witness and a full corpus with a pinned Clang. Verify ASTReader acceptance, identifier/decl lookup and downstream object equivalence before measuring writer CPU/RSS/temp, file bytes, import latency and RSS. Stop if the candidate is merely offset/record reordering or if any reader contract differs. This finite route is documented only; no run occurred.

## Decision

`STRUCTURAL_DROP__ONLY_GENERIC_RECORD_LAYOUT_REWRITE_OR_CHANGED_ASTREADER_CONTRACT_REMAINS`.

This is a structural action/contract conclusion. It is not caused by absent implementation, result, resources or AI readiness.

