# Same-object RQ candidates

## RQ46-01 — TVM TIRx TMA copy construction

For a fixed TIRx copy, tensor values, layout and CUDA TMA completion contract, does a target-specific joint descriptor/issue construction remain after subtracting the current TIRx planner? It fails if it duplicates the current L1/L2/L3 descriptor-plan plus issue-loop generator.

## RQ46-02 — MSCCL++ GPU collective movement

For a fixed all-reduce buffers, rank set and completion/reduction output, can a target-specific full communication constructor improve transfer/synchronization cost beyond current channel/collective logic? It fails if it is a custom plan written in the existing DSL or a channel/proxy schedule.

## RQ46-03 — PRIVATE_TOOLCHAIN HAL queue-ordered transfer

For a fixed HAL buffer values, queue ordering and device-visible output, can a non-generic transfer/update constructor survive the current command-buffer action union? It fails if it composes queue-ordered update/copy operations.

No RQ was rewritten after evidence.
