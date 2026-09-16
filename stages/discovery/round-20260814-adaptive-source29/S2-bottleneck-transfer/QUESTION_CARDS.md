# Source29 question cards

## QC-01 ESIMD ABI/accessor lowering

Fixed object: an Intel ESIMD kernel's source-visible values, ESIMD ABI and stock SYCL runtime invocation. Official ESIMD notes provide current loci (`SYCLLowerESIMDPass`, `sycl-post-link`, runtime accessor argument setting) and show ESIMD's specialized accessor representation and split/lower path. A target-specific joint algorithm is conceivable only if it changes more than ABI/lowering composition; minimum falsifier is that the documented current composition expresses every proposed legal action. Initial full cost: compile/link CPU/RSS, image bytes, invocation setup, device memory traffic and kernel latency. `EVIDENCE_QUALIFIED_RAW`; complete union/collision are bounded C0 debt.

## QC-02 MLIR-AIE DMA/lifetime

Fixed object: a versioned MLIR-AIE program, instruction stream and output values. Current official runtime reference exposes `aiex.npu.dma_wait`, locks and runtime-parameter writes, but the initially formulated action is either DMA order or a buffer-lifetime controller. `EXCLUDED_BEFORE_RAW__GENERIC_CONTROLLER`.

## QC-03 XRT AIE ping-pong BO

Fixed object: XRT AIE graph, BO values and stock output. XRT officially provides `sync`, `async`, `wait` and ping/pong external-buffer forms. The candidate is a native configuration/composition, not a target-specific whole constructor. `EXCLUDED_BEFORE_RAW__CURRENT_UNION_CONFIGURATION`.

## QC-04 SYCL command graph memory

Current design documents graph buffers/accessors, memcpy and dynamic node updates, but explicitly records unimplemented graph-specific allocation/lifetime support. The surviving idea is a graph planner/controller with no frozen target-specific action. `LOCATOR_ONLY`; no scientific absence inference.
