# Source/collision matrix — S5 Source20

| Family | Same-object signature | Recent anchor | Current-source/collision result | Disposition |
|---|---|---|---|---|
| FPGA routing | `FIXED_FPGA_NETLIST_DEVICE_CONSTRAINTS__LEGAL_ROUTED_BITSTREAM` | FCCM 2025 convergence paradox | nextpnr is timing-driven P&R with generic backend; action remains generic solver/layout | `DROP__GENERIC_LAYOUT_SOLVER` |
| Custom-FPGA nextpnr | `FIXED_CUSTOM_FPGA_ARCH_DESC__LEGAL_BITSTREAM_FLOW` | 2025 nextpnr adaptation report | current generic architecture API absorbs framing | `DROP__MATURE_TOOL_GENERIC_BACKEND` |
| Parallel RTL simulation | `FIXED_RTL__SAME_LANGUAGE_TRACE` | 2025 PDES scaling study | active Source17 Verilator identity | `DROP__ACTIVE_IDENTITY` |
| Parallel timing simulation | `FIXED_SIMULATION_CONFIG__SAME_TIMING_OUTPUT` | 2026 parti-gem5 | historical gem5 family already reviewed | `DROP__HISTORICAL_CONTAINED` |
| Checked proof cost | `FIXED_PROOF__SAME_CHECK_RESULT` | SAT 2025 verified-checker study | generic formal checker wrapper | `DROP__GENERIC_FORMAL_WRAPPER` |
| Code-cache recourse | `FIXED_QEMU_TCG_GUEST__SAME_GUEST_OUTPUT` | current QEMU source docs | active Source18 identity | `DROP__ACTIVE_IDENTITY` |

The literature anchors are not treated as proof of absence. Current source was used to classify the existing native union and direct generic/active collisions only.
