# Unique opportunity families

## U1 — MLIR bytecode joint table-ID / record planner

- Exact object: MLIR bytecode for a fixed decoded IR, frozen dialect version/resource/property semantics, and stock parser/verifier behavior.
- Candidate whole action: choose table order and IDs for shared strings, dialects, attrs/types/resources/properties and regenerate every bytecode-local reference, relative offset, and group record.
- Minimal native-legal action witness: choose two distinct, table-local strings with unequal reference frequencies; exchange their IDs and regenerate all references. When one crosses a varint length boundary, byte count can differ while decoding to the same IR.
- Known current union: first-insertion MapVector IDs and sharing for strings; numbering-state IDs for attrs/types/resources; property byte deduplication; configurable version/location/resource/custom encoder paths.
- Candidate N2 requirement: prove a joint table/group/order plan with a nontrivial approximation/complexity or guarantee under full writer/read cost. Weighted frequency order or a local emitter adjustment is expressly insufficient.
- Admission: `NOT_ADMITTED_UNFROZEN`; the complete producer union and direct-collision/N2 closure are incomplete.
