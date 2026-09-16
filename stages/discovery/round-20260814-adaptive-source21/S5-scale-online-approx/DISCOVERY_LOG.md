# Discovery log — S5 Source21

## Frozen execution

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE21-AFFIRMATIVE-CLIFF-PRIMITIVE-V5`.
- Method: canonical v8.7 potential/readiness separation; `DISCOVERY_CLAIM_PACK_MODE=OFF`.
- Funnel actually executed: locator (8) → fresh raw (4) → C0 source closure (2) → D1 (0) → deep (0) → brief (0).
- Result: `COMPLETE_ZERO_PROPOSALS__AFFIRMATIVE_CLIFF_PRIMITIVES_ABSORBED_OR_FAIL_D1`.

The screen began with affirmative evidence of a current native primitive, not an inferred implementation absence.  Recent papers and issue reports were used only as problem locators or strongest subtractors; no paper-owned constructor or future-work statement was promoted as a residual.

## Locator and fresh-raw funnel

| Locator | Current affirmative primitive / source snapshot | Funnel disposition | Reason |
|---|---|---|---|
| L1 OpenROAD timing/electrical repair | OpenROAD master `src/rsz/README.md`, retrieved 2026-08-14: `repair_design`, `repair_timing`, buffering, sizing, reroute and optimization configuration | `FRESH_RAW → C0` | Native partial repair primitives and a stock timing checker exist. |
| L2 OpenSTA incremental timing | OpenSTA master README/API, retrieved 2026-08-14: query-based incremental timing update after a netlist edit | `FRESH_RAW → C0` | Native checker-backed incremental primitive and exact timing-report object exist. |
| L3 Icarus compilation/elaboration | Icarus master README, retrieved 2026-08-14: preprocessing, parsing, elaboration, optimization and selected code generation | `FRESH_RAW → NOT_ADMITTED` | The proposed retained-state compilation action is not a current native partial primitive; a historical issue is not absence evidence. |
| L4 GHDL analysis/elaboration | GHDL master README, retrieved 2026-08-14: analysis, elaboration and native-code execution; public testsuite | `FRESH_RAW → NOT_ADMITTED` | Compiler/library surface is real, but no target-specific bounded-recourse action skeleton was frozen. |
| L5 Verilator simulation | Current source locator | `EXCLUDED_BEFORE_RAW` | Source17 active identity. |
| L6 QEMU code-cache recourse | Current source locator | `EXCLUDED_BEFORE_RAW` | Source18 active identity. |
| L7 nextpnr P&R | Current repository | `EXCLUDED_BEFORE_RAW` | Source20 saturated generic layout-solver facet. |
| L8 ngspice adaptive transient stepping | Current upstream discussion/manual locator | `EXCLUDED_BEFORE_RAW` | Time-step adaptation is a controller/accuracy-configuration family, expressly excluded. |

## C0 source closure and D1 decision

### C0-1: OpenROAD repair primitive

Exact object: a fixed placed netlist, technology/library, constraints and legal OpenDB/DEF result accepted by the stock OpenROAD flow; the quality boundary is the same timing/electrical legality reported by the native timing engine.

Current union, source-pinned to the master documentation read on 2026-08-14, contains global placement, resize, detailed placement, `repair_design`, `repair_timing`, wire-length/slew/capacitance margins, utilization, cell-footprint selection, optional reroute and explicit iteration/repair limits.  The flow script further composes these native actions around timing repair.  A two-output witness (e.g., buffer a long wire versus resize/swap a driving cell while preserving the same netlist/constraints) is already representable by this union.

Therefore the apparent cliff is an implementation/order/configuration question in a broad place-and-route optimizer, not an unrepresented target-specific whole action.  No same-object union-external atomic action survives C0, so it cannot reach D1.

Disposition: `DROP__CURRENT_UNION_DIRECT_ABSORPTION__GENERIC_PNR_REPAIR`.

### C0-2: OpenSTA incremental primitive

Exact object: fixed Verilog/Liberty/SDC/SDF/SPEF input and the stock timing reports.  OpenSTA documents query-based incremental updates of delay, arrival and required times after netlist edits; its API describes the same propagation and the exposed incremental-delay tolerance.  The default tolerance is zero for maximum accuracy; increasing it changes the accuracy boundary and is therefore not a same-guarantee improvement.

The minimal two-action witness (two legal `swap_cell` edits followed by incremental propagation) is already a native union action, while a tolerance-only proposal changes the quality contract.  No new whole maintenance/recourse action or target-specific formal guarantee was identified without replacing the object by a generic netlist optimizer.

Disposition: `DROP__CURRENT_UNION_INCREMENTAL_ACTION__QUALITY_BOUNDARY_CHANGE_OR_GENERIC_OPTIMIZER`.

## D1/deep/brief accounting

Both C0 cards have a natural carrier and stock oracle, but neither has a union-external atomic action with a same-object target-specific guarantee.  D1 therefore admits zero items; the two deep slots expire and are not backfilled.  This is not a result, resource, implementation or AI-readiness inference.

No current-absence claim is made.  The upstream checks intentionally include documented default and non-default controls where they control the alleged gap.  No experiment, benchmark, build, installation, E2 probe, large download or downstream stage was run.

## Primary sources

- [OpenROAD Resizer current documentation](https://github.com/The-OpenROAD-Project/OpenROAD/blob/master/src/rsz/README.md).
- [OpenROAD Flow Scripts current Makefile](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts/blob/master/flow/Makefile).
- [OpenSTA current repository](https://github.com/The-OpenROAD-Project/OpenSTA).
- [OpenSTA current API documentation](https://github.com/The-OpenROAD-Project/OpenSTA/blob/master/doc/StaApi.txt).
- [Icarus Verilog current repository](https://github.com/steveicarus/iverilog).
- [GHDL current repository](https://github.com/ghdl/ghdl).
- [OpenROAD current determinism report](https://github.com/The-OpenROAD-Project/OpenROAD/issues/9781), used only as a current counterexample/locator, not as gap proof.
