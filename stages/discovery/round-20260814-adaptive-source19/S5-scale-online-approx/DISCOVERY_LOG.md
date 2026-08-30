# Discovery log — S5 Source19

## Frozen assignment

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE19-CROSS-DOMAIN-PROBLEM-EVIDENCE-V3`
- Profile: `CROSS_DOMAIN_PROBLEM_EVIDENCE_ROTATION_V3`; canonical v8.7 and V9 OFF.
- Result: `COMPLETE_ZERO_PROPOSALS__NO_PREOUTCOME_D1_AFTER_CROSS_DOMAIN_FILTER`.

## Raw locator table (6 / ceiling 8)

| ID | Rotated origin / independent anchor | Current native union and strongest subtractor | Carrier/oracle | Disposition before depth |
|---|---|---|---|---|
| R1 nextpnr FPGA place-route | official current project is a timing-driven FPGA place-route tool with a generic backend | packing, placement, routing and device constraints; bitstream/architecture checks | public iCE40/ECP5 examples | `DROP__GENERIC_LAYOUT_SOLVER` |
| R2 SymbiYosys hardware formal | official project identifies itself as a front-end driver for Yosys-based formal flows | BMC/prove/cover engines, solvers and assertion semantics | SBY tests / assertion result | `DROP__GENERIC_FORMAL_WRAPPER` |
| R3 Verilator MTask | prior Source17 current union and brief | active Stage-0 candidate identity | prior natural carrier/oracle | `DROP__ACTIVE_IDENTITY` |
| R4 QEMU TCG code-cache | prior Source18 current union and brief | active Stage-0 candidate identity | prior natural carrier/oracle | `DROP__ACTIVE_IDENTITY` |
| R5 ChampSim cache-management update | replacement and prefetch policy surface | stock simulator/oracle | trace suite | `DROP__GENERIC_POLICY_OR_CACHE_SELECTOR` |
| R6 Yosys/ABC logic synthesis | source-pinned existing mapping and equivalence union | prior Yosys/ABC review | equivalence tests | `DROP__HISTORICAL_OR_ACTIVE_IDENTITY` |

No entry reached pre-outcome D1 because none simultaneously retained a target-specific whole action, same-object guarantee, independent subtractor, natural carrier, and stock checker after identity and generic-action filters.  Hence the contract’s depth capacity expired without a deep review and no replacement was introduced.

## Current-source notes

The current nextpnr README explicitly presents a portable, timing-driven place-and-route tool and a generic backend. Its potential placement/route transition is therefore a generic layout/solver action rather than the required target-specific construction. The current SymbiYosys README identifies a front-end driver for Yosys formal flows; its BMC/prove/cover configuration is a formal wrapper, excluded by the assignment.

## Evidence boundary

Only official current project documentation/source pages and the frozen registry were read. No build, experiment, download, benchmark, E2 activity, or performance inference occurred. Missing implementation or results did not determine any disposition; generic/active/repeated identity did.

## Primary sources

- YosysHQ, [nextpnr current repository](https://github.com/YosysHQ/nextpnr).
- YosysHQ, [SymbiYosys current repository](https://github.com/YosysHQ/sby) and [formal Verilog semantics](https://github.com/YosysHQ/sby/blob/main/docs/source/verilog.rst).
