# Rule freeze

- Assignment: `DISCOVERY-S6-20260811-V8.7-WAVE130-SQLITE-BTREE-PAGE-ASSIGNMENT-REDTEAM`
- Lane: `S6-direct-algorithm-software`
- Frozen date: 2026-08-11
- Rules revision: `v8.7-authoritative-plus-r3-p0-clarity-compatibility__r5-p0-funnel-clarity__r7-p0-repair-vector-dormant-off__discovery-six-lanes-direct-20260811__p1-shadow-not-authoritative`
- `DISCOVERY_QUALITY_MODE: OFF`
- Mode: `DEPTH_REDTEAM`; one inherited near-miss only, no scientific-rule revision.
- Decision vocabulary: `PROPOSE_STAGE0`, `NOT_ADMITTED_UNFROZEN`, `STRUCTURAL_DROP`. Missing implementation, results, resources, or AI readiness is not a drop predicate.
- Scope boundary: fixed logical SQLite database, fixed page size, fixed journal mode, and stock SQLite reader/transaction semantics. Record-key reorder, codec change, external postprocessing, or generic packing oracle is outside the object.
