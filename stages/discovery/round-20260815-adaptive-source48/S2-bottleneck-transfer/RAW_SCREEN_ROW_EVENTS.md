# Raw screen row events

| Row | Canonical signature | Entry basis | Current-source result | Disposition |
|---|---|---|---|---|
| R48-01 | `CUDNN_FIXED_OPERATION_GRAPH__ENGINE_PLAN_WORKSPACE_CONSTRUCTOR__PLAN_WORKSPACE_EXECUTION_COST` | fixed graph, official source locus, stock execute oracle, finite full-cost plan | graph engine/config/workspace union expresses the proposed action | `STRUCTURAL_DROP__CURRENT_UNION_ABSORBS` |
| R48-02 | `PYTORCH_FIXED_CUDAGRAPH_TREE__POOL_CHECKPOINT_CONSTRUCTOR__CAPTURE_RESIDENCY_REPLAY_COST` | fixed callable tree, official source locus, replay/or-address-safety oracle, finite full-cost plan | current graph-tree pool/liveness construction expresses the proposed action | `STRUCTURAL_DROP__CURRENT_UNION_ABSORBS` |
| R48-03 | `ROCR_FIXED_HSA_QUEUE_SEQUENCE__SCRATCH_RESIDENCY_DISPATCH_CONSTRUCTOR__QUEUE_MEMORY_EXECUTION_COST` | fixed queue sequence, official source locus, runtime/output oracle, finite full-cost plan | action is documented reclaim/retention configuration or controller | `STRUCTURAL_DROP__CONFIGURATION_CONTROLLER` |

No C0, deep review, or brief was manufactured after these structural decisions. Missing implementation, result, resource, or AI readiness was not used.
