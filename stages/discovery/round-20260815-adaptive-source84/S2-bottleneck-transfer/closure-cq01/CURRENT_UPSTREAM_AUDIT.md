# Pinned OpenXLA buffer/command-buffer audit

## Frozen identity

- Project: `openxla/xla` at official `main` commit `3527e1e6a5a82770e4ad8c8a2d9c64dd30ec91f6`.
- The recursive official tree response was complete (`truncated: false`).
- Retained direct paths are one buffer-assignment implementation, one GPU command-buffer conversion pass, one current debug-options source, and one in-tree conversion test.

## Current stock action/configuration union

| Layer | Pinned action surface | Current composition boundary |
|---|---|---|
| Buffer assignment | `BufferAssigner::Run` performs allocation assignment. The implementation includes liveness/alias-aware `MaybeAssignBuffer`, reuse managers, fast-merge, multi-page and spatial/temporal/fast-split/best-of heap choices. | Allocation is constructed from HLO liveness/order/alias information before later thunk conversion. |
| Command-buffer conversion | `CommandBufferConversionPass::Run` walks the produced thunk sequence, accumulates convertible contiguous thunks, preserves paired async start/done regions, flushes at an ineligible thunk, and wraps a `SequentialThunk` in `CommandBufferThunk`. | Current grouping is a greedy contiguous conversion based on the already-produced thunk sequence and current `CommandBufferConfig`. |
| Default/nondefault controls | Defaults enable command kinds including fusion, libraries, custom calls and conditionals; default minimum graph size is 5, default scheduling mode is `LHS`, with parseable scheduling/update/filter controls. Device/toolkit gating removes unsupported command categories. | Existing flags expose command eligibility, graph threshold, scheduling mode, loop unrolling and update behavior; these remain ordinary stock configuration actions. |

## In-tree carrier and stock oracle

`command_buffer_conversion_pass_test.cc` provides a concrete legal thunk-level stock carrier: explicit `BufferAllocation` objects and a `CopyThunk` are converted under `xla_gpu_graph_min_graph_size=1` and enabled `FUSION` into `SequentialThunk(CommandBufferThunk(CopyThunk))`. This confirms stock command conversion and buffer slices can coexist.

It is not the required fixed HLO-module two-plan carrier: it constructs its own buffers and a one-chunk thunk sequence. It therefore cannot establish two complete, identical-output stock-XLA GPU executable plans whose buffer allocation and capture grouping differ under the frozen object.

## Generic/current-union objection and remaining debt

The current union is already strong on each individual axis: global allocation heuristics and maximum eligible contiguous-thunk command-buffer grouping. The retained code does not show a joint optimization in which allocation decisions are reselected based on capture boundaries, nor does it establish that such coupling is target-specific rather than generic packing/scheduling. A candidate cannot be inferred from the absence of this coupling.

The finite missing closure is one fixed HLO module whose stock lowering yields two complete legal allocation/grouping plans and a static action-divergence argument tied to capture-stable liveness rather than a flag/threshold/grid change. Without that witness and a target-specific guarantee skeleton, this source closure cannot promote the raw input.

## Cost and falsifier boundary

The frozen full-cost ledger remains buffer-assignment/scheduling/compiler CPU and RSS, record/replay and launch CPU, GPU execution time, peak device allocation, host/device bytes, and temporary/cache bytes. A finite falsifier is a pinned HLO/thunk witness showing that all legal allocation/grouping differences reduce to the existing heap or command-buffer configuration surface, or that stock composition already yields the claimed joint action.
