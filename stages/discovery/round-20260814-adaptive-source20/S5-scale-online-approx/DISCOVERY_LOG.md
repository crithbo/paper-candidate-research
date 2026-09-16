# Discovery log — S5 Source20

## Frozen assignment and actual screen

- Assignment: `DISCOVERY-S5-20260814-ADAPTIVE-SOURCE20-RECENT-LIMITATION-SOURCE-V4`
- Method: canonical v8.7; V9 OFF.
- Result: `COMPLETE_ZERO_PROPOSALS__RECENT_LIMITATION_ANCHORS_FAIL_TARGET_SPECIFIC_D1_OR_REPEAT_FILTER`.
- This is an executed source screen: six independent recent/current anchors were located, deduplicated and assigned dispositions; this file is not a contract-only record.

## Recent limitation → current union cards

| ID | Independent recent problem/limitation anchor | Current first-party union / strongest subtractor | Carrier + stock oracle | Disposition |
|---|---|---|---|---|
| R1 FPGA routing convergence | FCCM 2025 “Guaranteed Yet Hard to Find” reports routing-convergence difficulty, separating architecture from algorithm; 2025 review notes place/route time cost | nextpnr’s current timing-driven pack/place/route flow, including generic backend | iCE40/ECP5 examples; routed-bitstream checks | `DROP__GENERIC_LAYOUT_SOLVER` |
| R2 nextpnr custom-FPGA adoption | 2025 primary report identifies architecture description/onboarding barrier | current nextpnr architecture API and generic target | public custom-FPGA example flow | `DROP__MATURE_TOOL_GENERIC_BACKEND` |
| R3 parallel simulation limitation | 2025 PDES study identifies hardware/topology-dependent scaling | Verilator is the stock RTL candidate but Source17 active identity | regression/semantic oracle | `DROP__ACTIVE_IDENTITY` |
| R4 parallel timing simulation | 2026 parti-gem5 reports parallel timing-simulation accuracy/scalability tension | gem5 family is historical current-union reviewed | gem5 test/SE routes | `DROP__HISTORICAL_CONTAINED` |
| R5 checked proof cost | SAT 2025 formally verified checker study reports overhead/requirements | generic proof/solver/checker construction | proof checker result | `DROP__GENERIC_FORMAL_WRAPPER` |
| R6 noncompiler recourse | QEMU documentation demonstrates capacity/invalidation recourse, but Source18 identity is active | current QEMU capacity flush/invalidation union | QTest/functional tests | `DROP__ACTIVE_IDENTITY` |

No card reached D1 after all five required roles were checked.  R1/R2 have real, recent problem evidence, but their atomic action is generic place/route rather than target-specific. R3/R6 are excluded active identities. R4 is a historical contained simulator family; R5 is forbidden generic formal infrastructure. The two deep slots therefore expired without outcome-aware substitution.

## Current-source and contradiction checks

nextpnr’s official current repository describes it as a portable, timing-driven FPGA place-and-route tool and explicitly offers a generic architecture backend. That evidence defeats, rather than supports, admission of a nextpnr placement/routing residual under this contract. The recent publications supply problem evidence only; they do not turn a generic action into target-specific N2.

No implementation absence was claimed. No build, benchmark, E2, installation, large download or experiment occurred.

## Primary sources

- [Guaranteed Yet Hard to Find: Uncovering FPGA Routing Convergence Paradox](https://infoscience.epfl.ch/entities/product/d6183be4-d925-4c44-bb8c-d63bf8c26902), FCCM 2025 artifact page.
- [Mini-review of post-routing congestion forecasting](https://pure.kfupm.edu.sa/en/publications/a-mini-review-of-methods-for-forecasting-post-routing-congestion-/), 2025.
- [nextpnr current repository](https://github.com/YosysHQ/nextpnr).
- [PDES engine comparison](https://arxiv.org/abs/2503.19857), 2025.
- [parti-gem5](https://link.springer.com/article/10.1007/s10766-026-00819-5), 2026.
- [SAT 2025 proceedings](https://drops.dagstuhl.de/storage/00lipics/lipics-vol341-sat2025/LIPIcs.SAT.2025/LIPIcs.SAT.2025.pdf).
