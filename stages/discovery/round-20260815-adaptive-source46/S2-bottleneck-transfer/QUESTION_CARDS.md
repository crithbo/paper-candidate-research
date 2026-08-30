# Evidence-qualified question cards

## QC46-01 — TVM TIRx TMA copy

- **Object/endpoint:** fixed global/shared tensor values and layouts, TMA completion/barrier semantics, and output tensor.
- **Candidate action:** descriptor box segmentation plus issue loop with an algorithmic compile/traffic guarantee—not a TMA flag or schedule selector.
- **Current source locus:** Apache TVM current `copy_async → tma` documentation specifies global-to-shared/shared-to-global direction, a three-level descriptor planner, `cuTensorMap` encoding, cached host descriptor and emitted issue loop.
- **Comparator/full cost:** current TVM TIRx planner on same TIR; compilation CPU/RSS, descriptor/cache bytes, shared/register pressure, data traffic, waits and kernel latency.
- **Carrier/oracle/falsifier:** version-pinned TVM TIRx TMA documented function; stock tensor equality and legal TMA/barrier completion. Kill if candidate equals planner's L1/L2/L3 construction.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_COMPILER_ALREADY_OWNS_COMPLETE_CONSTRUCTOR`.

## QC46-02 — MSCCL++ collective data movement

- **Object/endpoint:** fixed all-reduce rank set, buffers, reduction result and collective completion behavior.
- **Candidate action:** target-specific channel-operation constructor with a nontrivial transfer/synchronization guarantee; no proxy/controller or generic schedule.
- **Current source locus:** current MSCCL++ repository exposes GPU-side `put/get/signal/flush/wait`, channel types, memory/port channels, and a user-extensible collective communication stack.
- **Comparator/full cost:** current MSCCL++ channel/DSL construction at equal collective result; initialization, channel metadata, proxy work, bytes, device/host synchronization, GPU memory and end-to-end latency.
- **Carrier/oracle/falsifier:** current repository's collective tests/tutorial carrier and exact reduction result; kill if a candidate is representable by existing channel operations/DSL.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_DSL_COMPLETE_COLLECTIVE_CONSTRUCTOR_OR_GENERIC_SCHEDULE`.

## QC46-03 — IREE HAL transfer

- **Object/endpoint:** fixed HAL buffers and values, queue ordering and device-visible results.
- **Candidate action:** a target-specific buffer-transfer/update construction with a bounded guarantee, not command-buffer replay or a queue policy.
- **Current source locus:** IREE current HAL dialect defines queue-ordered transfer operations and `hal.command_buffer.update_buffer`.
- **Comparator/full cost:** stock HAL command-buffer action sequence with identical queue order; command recording CPU, descriptors/temporary bytes, submission/synchronization, RSS and device transfer latency.
- **Carrier/oracle/falsifier:** current HAL dialect test/module and stock output buffers; kill if only command operation composition survives.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_COMMAND_BUFFER_UNION_OR_WRAPPER`.
