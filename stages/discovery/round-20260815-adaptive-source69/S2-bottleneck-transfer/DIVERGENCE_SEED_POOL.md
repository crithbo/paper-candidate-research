# Divergence seed pool — Source69

The seed pool was created before evidence lookup; it is non-evidentiary and cannot be backfilled or used as a raw/proposal denominator.

| Seed | Engine | Perspective | Sketch | Selection |
|---|---|---|---|---|
| S69-01 | `BISOCIATION_STRUCTURAL_TRANSFER` | data-format engineer | Cap'n Proto's zero-copy reader can shift write cost to segment/pointer/layout construction. | selected |
| S69-02 | `CONSTRAINT_MANIPULATION` | runtime engineer | Protobuf serialization improvements can shift cost to arena/lifetime/metadata construction. | selected |
| S69-03 | `ADJACENT_POSSIBLE_OR_BOUNDARY` | storage engineer | Avro block encoding can shift payload cost to schema/block/index construction. | selected |
| S69-04 | `NEGATION_OR_INVERSION` | operator | CBOR canonical encoding can move read cost to canonical metadata construction. | backlog |
| S69-05 | `COMPOSE_DECOMPOSE_SIMPLIFY` | compiler engineer | MLIR bytecode loading can move parse cost to dialect-index construction. | backlog |
| S69-06 | `JANUSIAN_TENSION` | measurement reviewer | Message compression can trade payload bytes for validation/materialization cost. | backlog |

The selected formats have separate reader contracts. Backlog entries cannot replace selected RQs after source results.
