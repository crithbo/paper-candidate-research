# Source and collision matrix — S5 Source16

| Family | Canonical signature / same-object boundary | Current-upstream reality check | Collision / subtractor result | Status |
|---|---|---|---|---|
| LLVM VPlan | `LLVM_IR_LOOP_NEST__TTI__SAME_IR_LANGUAGE_SEMANTICS__VPLAN_VECTOR_OR_SCALAR_OUTPUT` | Official VPlan docs and current `LoopVectorize.cpp`: legality, cost model, candidate plan creation/optimization/pruning, `computeBestVF`, `selectInterleaveCount`, and `executePlan`; documented user VF/UF flags checked | Stock VPlan planner is the strongest same-object union and directly supplies a complete costed plan action | `DROP__DIRECT_UNION_ABSORPTION` |
| MLIR Vector lowering | `LEGAL_MLIR_VECTOR_PROGRAM__FIXED_TARGET_CONTRACT__EQUIVALENT_LOWERED_OUTPUT` | Official Vector and Pass docs: rewrite/conversion pipeline; target-specific vector lowering options and semantic preconditions checked | No target-specific certified whole-constructor action could be frozen; option/pipeline selection is excluded | `NOT_ADMITTED_UNFROZEN` |
| CUTLASS grouped scheduler | `GROUPED_GEMM_INPUTS__EXACT_TILE_OUTPUTS__CUTLASS_KERNEL_SEMANTICS` | Official current scheduler docs enumerate device-only/default and host-precompute paths | Remaining action is scheduling policy, prohibited; Source13 overlap also blocks promotion | `DROP__CONTROLLER_OR_REPEAT` |
| XLA GPU buffer assignment | `FIXED_HLO_MODULE__SAME_EXECUTABLE_RESULT_AND_MEMORY_SEMANTICS` | Official upstream/source family checked against prior Source13 record | Historical Source13/XLA buffer-assignment family; not fresh | `DROP__REPEAT` |
| OpenVINO NPU mapping | `FIXED_OPENVINO_MODEL__SAME_INFERENCE_OUTPUT_AND_PLUGIN_SEMANTICS` | Current OpenVINO compilation/property union checked against Source13 record | Historical Source13/OpenVINO mapping family; no separate atomic action | `DROP__REPEAT` |
| CIRCT accelerator lowering | `FIXED_CIRCT_DESIGN__SAME_VERIFIED_LOWERED_SEMANTICS` | Official dialect/pipeline material gives no bounded target-specific theorem or canonical natural carrier in one source-only closure | Required card remains unfrozen; no absence claim is made | `NOT_ADMITTED_UNFROZEN` |

No implementation absence is claimed.  For the two non-admitted entries, a missing closure is not a scientific negative inference.
