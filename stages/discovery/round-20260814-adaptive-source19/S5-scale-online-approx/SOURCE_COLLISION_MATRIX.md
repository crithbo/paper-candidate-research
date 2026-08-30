# Source/collision matrix — S5 Source19

| Family | Same-object signature | Source/collision finding | Result |
|---|---|---|---|
| nextpnr FPGA P&R | `FIXED_FPGA_NETLIST_DEVICE_CONSTRAINTS__LEGAL_ROUTED_BITSTREAM` | current tool includes generic backend; placement/routing is generic layout/solver action | `DROP__GENERIC_LAYOUT_SOLVER` |
| SymbiYosys | `FIXED_RTL_PROPERTIES__BMC_PROVE_COVER_RESULT` | current project is a driver/front-end over Yosys formal engines | `DROP__GENERIC_FORMAL_WRAPPER` |
| Verilator MTask | `FIXED_SYSTEMVERILOG_DESIGN__SAME_TRACE_OUTPUTS` | exact active Source17 identity | `DROP__ACTIVE_IDENTITY` |
| QEMU TCG code cache | `FIXED_QEMU_TCG_GUEST__SAME_EXCEPTION_MAPPING_AND_OUTPUT` | exact active Source18 identity | `DROP__ACTIVE_IDENTITY` |
| ChampSim update | `FIXED_TRACE__SAME_CACHE_RESPONSE_SEMANTICS` | only a cache-policy residual was named | `DROP__GENERIC_POLICY` |
| Yosys/ABC | `FIXED_RTL__SAME_NETLIST_EQUIVALENCE` | historical/active prior union already recorded | `DROP__HISTORICAL_OR_ACTIVE_IDENTITY` |

No `CURRENT_UPSTREAM_REALITY_CHECK` was used to assert an absence.  The two current-source checks instead establish positive generic-wrapper/layout coverage, and the registry establishes active/repeat exclusions.
