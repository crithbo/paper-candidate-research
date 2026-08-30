# Source/collision matrix — S5 Source17

| Family | Exact same-object signature | Current union reality | Direct subtractor | Disposition |
|---|---|---|---|---|
| Verilator epoch-bound MTask rebinding | `FIXED_SYSTEMVERILOG_DESIGN__VERILATOR_SCHEDULING_AND_GENERATED_MODEL_INTERFACE__SAME_TRACE_OUTPUTS` | Current source/docs: `V3Sched`, `V3Order`, `V3Partition`; static MTask order/assignment; `--threads`, `--threads-max-mtasks`, execution and Thread-PGO profiles | static threaded union, serial evaluation, Thread-PGO, fixed MTask-count configurations | `PROPOSE_STAGE0__FINITE_FIDELITY_GAP` |
| Yosys/ABC mapping | `FIXED_RTL__SAME_NETLIST_AND_EQUIVALENCE_CONTRACT` | Prior Yosys/ABC union and active historical contracts | prior current-union review | `DROP__HISTORICAL_OR_ACTIVE_IDENTITY` |
| OpenROAD placement | `FIXED_LEF_DEF_NETLIST__LEGAL_PLACEMENT_AND_DRC_CONTRACT` | placement/legalization union | native placement tools | `DROP__GENERIC_SOLVER_OR_ILP` |
| CUTLASS grouped schedule | `FIXED_GROUPED_GEMM__EXACT_TILE_OUTPUTS` | documented device/host scheduling modes | stock scheduler modes | `DROP__CONTROLLER_POLICY` |
| Kafka tiered storage | `FIXED_TOPIC_PARTITION_LOG__SAME_PUBLICATION_RECOVERY` | historical Wave43 family | current tier/rebalance union | `DROP__HISTORICAL_REPEAT` |
| Tree-sitter incremental parser | `FIXED_GRAMMAR_AND_EDIT_SEQUENCE__SAME_PARSE_TREE` | historical Tree-sitter family | stock incremental parser | `DROP__HISTORICAL_REPEAT` |

For Verilator, current source supports the description of its static action union; it does **not** establish a performance absence claim. The claimed residual is a Stage-0-testable construction hypothesis, bounded by the fidelity plan.
