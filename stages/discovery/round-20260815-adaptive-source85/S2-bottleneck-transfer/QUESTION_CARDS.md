# Evidence-qualified question card

## QC-S2-85-01

| Gate | Frozen content |
|---|---|
| Same-object boundary | One fixed Relax/TensorIR IRModule, target/configuration, constants, output tensors and stock VMExecutable contract. |
| Contribution shape | N2 joint constructor over fusion boundaries and static allocation lifetimes; target-specific algorithm/guarantee required. |
| Information fairness | Candidate and stock union receive identical IR, target/device attributes, shape bounds and any profile information. |
| Atomic-action sketch | Select a legal fused-region partition and a storage-reuse interval assignment jointly, subject to each operation's dataflow/lifetime and VM/kernel ABI constraints. |
| Non-generic discriminator | A valid method must exploit the Relax/TensorIR fusion-interface/lifetime structure and state a certified Pareto, FPT, exact or approximation result. Generic packing, an ILP black box, pass selector or cache policy fails. |
| Strong union | Documented fusion, StaticPlanBlockMemory, AllocateWorkspace, LowerAllocTensor, VM codegen and runtime allocator settings. |
| Minimal falsifier | Pinned stock source already jointly constructs the exact action/objective with equivalent information, or a two-plan witness is merely pass/config selection. |
| Carrier/oracle | One version-pinned upstream Relax test IRModule; stock VM output equality and executable load/invoke legality. |
| Full cost | compiler CPU/RSS/temp/cache, peak allocation, executable/constant-pool bytes, bytecode/dispatch CPU and end-to-end runtime/device bytes. |
| Finite closure | Resolve one `apache/tvm` commit; inspect named transform/codegen sources; construct one legal two-plan static IR witness; search exact action phrase in primary literature. |
| Status | `EVIDENCE_QUALIFIED_RAW__NOT_READY_FOR_C0__PENDING_UNEXECUTED_SOURCE_CLOSURE` |

No implementation, performance result, absence, novelty or Q2 conclusion is asserted.
