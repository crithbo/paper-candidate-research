# Same-object RQ candidates

## S41-01 — NCCL registered collective buffers

Fixed object: the same rank set, tensor values, collective operation and output values.  
RQ versions: (a) can registration/window construction be a target-specific whole action with a bounded communication/setup guarantee; (b) can it alter the same collective full-cost optimum without changing NCCL semantics; (c) is the residual only configuration and allocator selection?  
Convergence: (c). The current native registration/window/VMM actions already expose the relevant construction boundary.

## S41-02 — CUDA device graph launch

Fixed object: one executable graph with identical nodes, dependencies, outputs, device and launch semantics.  
RQ versions: (a) can graph construction and device launch form a new bounded whole-graph action; (b) can that action improve setup-plus-launch full cost while retaining graph semantics; (c) is it only selection among current graph upload/launch modes?  
Convergence: (c). No source-supported union-external target-specific action was identified.

## S41-03 — OpenMP target completion

Fixed object: the same target regions, mapped values, task dependences and program-observable results.  
RQ versions: (a) can completion-materialization be jointly constructed with offload; (b) can it preserve OpenMP task semantics with a bounded guarantee; (c) is it merely `nowait`/task synchronization selection?  
Convergence: (c). The official semantics make the candidate a pragma-level synchronization choice, not an N1/N2 action.
