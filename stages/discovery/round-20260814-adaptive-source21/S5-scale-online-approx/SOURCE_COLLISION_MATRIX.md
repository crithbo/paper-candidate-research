# Source / collision matrix — S5 Source21

| Family | Same-object contract | Current native union and counterevidence | Natural carrier / stock oracle | C0/D1 result |
|---|---|---|---|---|
| OpenROAD timing/electrical repair | Fixed placed netlist, LEF/Liberty/SDC, legal OpenDB/DEF and stock timing/electrical reports | `repair_design`/`repair_timing`, resize, buffers, reroute, margins, utilization, footprint, repair/iteration limits and ordered flow steps; two legal repair outputs are already expressible | OpenROAD-flow public designs; native report checks | `DROP__CURRENT_UNION_DIRECT_ABSORPTION__GENERIC_PNR_REPAIR` |
| OpenSTA incremental timing | Fixed Verilog/Liberty/SDC/SDF/SPEF and stock timing reports | Query-based incremental update after native netlist edits; `swap_cell` witness; tolerance has default 0 and nonzero values change accuracy | OpenSTA regression/design inputs; timing reports | `DROP__CURRENT_UNION_INCREMENTAL_ACTION__QUALITY_BOUNDARY_CHANGE_OR_GENERIC_OPTIMIZER` |
| Icarus retained elaboration | Fixed Verilog/SystemVerilog compilation output and simulator semantics | Current source exposes whole preprocessing/parse/elaborate/optimization/codegen pipeline, not a frozen partial retained-state action | Icarus testsuite; compiler output | `NOT_ADMITTED__UNFROZEN_ATOMIC_ACTION` |
| GHDL retained analysis library | Fixed VHDL analysis/elaboration/native execution semantics | Current source has analysis, elaboration, native code generation and `libghdl`; no specific bounded-recourse whole action has been named | GHDL testsuite; VHDL output/waveforms | `NOT_ADMITTED__UNFROZEN_ATOMIC_ACTION` |

The table is a collision check, not an implementation-absence catalogue.  All positive current-source facts are tied to official upstream pages read on 2026-08-14.  No candidate reached the five-role D1 contract (source-closed union, strongest subtractor, carrier, oracle, atomic action skeleton with small legal witness).
