# Current-upstream reality check

## Snapshot

Project: `openxla/xla`; public `main` and official documentation observed on 2026-08-15. The immutable commit is deliberately **not inferred** from a branch URL; resolving it is one deterministic closure task below. This means no implementation-absence claim is made in this packet.

## Current documented/source action union

1. Official HLO-to-thunks documentation describes `HloDataflowAnalysis`, `HloAliasAnalysis`, and `BufferAssignment`; the latter maps HLO buffers to slices while honoring overlapping lifetimes.
2. The same official document states that scheduling precedes thunk lowering and that `CommandBufferConversionPass` converts compatible contiguous thunks. First execution records commands; later executions replay them.
3. Current upstream `xla/debug_options_flags.cc` exposes enabled-by-default command-buffer categories (including conditional, CUBLAS/CUBLASLT, CUDNN, custom call, dynamic-slice fusion and fusion), collective filtering, graph-size threshold, command-buffer scheduling mode, loop-unroll switch, and trace-cache size.
4. Current upstream `xla/xla.proto` exposes the command-type/configuration vocabulary. Official XLA architecture documentation identifies buffer analysis/allocation as a built-in compiler concern.

## Fair comparator

The comparator must receive the identical HLO graph, target configuration, static shape/dataflow facts, and any profile information supplied to the proposed method. Its union is: stock HLO scheduling, alias/dataflow analysis, buffer assignment (including legal aliasing), thunk lowering, command-buffer conversion/scheduling, and all documented/default and relevant non-default command-buffer settings.

## Contrary evidence and ceiling

These sources already show that both constituent action families exist in the stock pipeline. They do **not** establish either that their composition is jointly optimized or that it is not. A statement that XLA "lacks capture-aware joint allocation" would therefore be unsupported. Any later proposal must source-pin the precise pass order and implementation behavior, then distinguish a new algorithm from the existing composition.

## Result

`CURRENT_UNION_PARTIALLY_FROZEN__NO_CURRENT_ABSENCE_CLAIM__SOURCE_CLOSURE_REQUIRED`.
