# Source29 question cards

## QC29-A — nextpnr iCE40 bounded recourse

- Exact identity: `YosysHQ/nextpnr` iCE40, stock JSON + PCF to ASC/bitstream flow; current official README, retrieved 2026-08-14.
- Same-object contract: unchanged iCE40 architecture and stock ASC/bitstream reader semantics.
- Proposed endpoint: target-specific legal local transition with a recourse bound.
- Current source locus: official README exposes the native commands `pack`, `place`, `route`, and output writing; it also offers a generic backend.
- Cheapest falsifier: failure to name a transition beyond stock pack/place/route or dependence on generic backend/matching.
- Result: `LOCATOR_ONLY__CURRENT_NATIVE_UNION_COVERS_NAMED_ACTIONS`; no raw. The action remained a generic P&R repair label, not a target-native primitive.

## QC29-B — OpenROAD local repair

- Exact identity: OpenROAD + public RTL-to-GDS flow, stock ODB/DEF/DRC/timing semantics.
- Current source locus: official flow contains global placement, IO placement, resize, detail placement, timing repair, global route and detailed route.
- Cheapest falsifier: a proposed action being expressible as this existing repair sequence or as a trigger/parameter selection.
- Result: `LOCATOR_ONLY__CURRENT_FLOW_UNION_DIRECTLY_COVERS_REPAIR_CHAIN`; no raw. A new local-repair theorem was not frozen before source evidence.

## QC29-C — RgGen cross-output update

- Exact identity: RgGen register-map specification to RTL/UVM/C-header/Markdown outputs.
- Current source locus: official README declares multiple input formats, generated output families and optional plugins/backends.
- Cheapest falsifier: no fixed stock reader/checker and residual requires cross-backend/plugin selection.
- Result: `EXCLUDED_BEFORE_RAW__GENERIC_MULTI_BACKEND_GENERATOR`; no raw.

All cards pass network-scope exclusion. No raw card was formed; therefore no closure debt or C0 is carried forward.
