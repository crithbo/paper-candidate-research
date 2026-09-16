# Candidate-grade depth review — Arrow-RS lexsort/interleave

## Fixed semantics and oracle

Inputs are fixed Arrow arrays/record batches, `SortColumn` options, null ordering and requested output shape. The result must equal stock Arrow-RS lexsort/interleave output; array equality/digest is the oracle. No IPC, dictionary-stream or serialization semantics are involved.

## Current source/action union

Current Arrow-RS documents `lexsort(columns, limit)`, `lexsort_to_indices`, `sort_to_indices` and `take`. The documented record-batch sort route computes indices and applies them to columns, explicitly avoiding copying during sorting and allowing value copying to be deferred. Multi-column lexsort has a documented row-format route. Current interleave exposes primitive, bytes, dictionary, list, list-view, struct, run-end and record-batch specializations as well as a `MutableArrayData` fallback. List-view actions include concatenation with adjusted offsets and per-row copies.

The strongest fair composition is therefore the executable lexsort/index/take path, row-format alternative, optional limit, type-specialized interleave paths and fallback—not merely an eager generic materializer.

## Minimum native-legal divergence witness

For a fixed two-column record batch, (i) compute `lexsort_to_indices` and apply `take` to every column, or (ii) invoke `lexsort`; both are stock legal ways of obtaining the same sorted arrays. For a list-view child, concatenation-adjust-offset and per-row-copy are also native candidate interleave constructions when semantics permit. This demonstrates current compositional freedom, but none is union-external.

## N2/guarantee test

A valid candidate would have to define a target-specific multicolumn/nested-array constructor with an exact/FPT/approximation/certified memory-latency frontier that preserves full null/order semantics. The available proposal merely chooses when to materialize indices/values or which extant kernel to dispatch. Its combinatorial kernel is generic sort/materialization or dispatch selection. No Arrow-specific structural parameter or formal recurrence was frozen that makes this a new whole constructor.

## Collision and fairness

The official Arrow multi-column sort explanation and current `arrow-ord`/`arrow-select` APIs directly subtract the delayed-materialisation and specialized-kernel components. The May 2026 upstream performance entries reinforce that small-limit lexsort materialisation and primitive list interleave are actively implemented paths, but are leads only. They do not create an absence claim or a new research residual.

## Natural route, full cost and killer

- **Carrier:** versioned public Arrow tables with multicolumn and nested/list arrays.
- **Oracle:** stock equality/digest, null/order checks and record-batch schema equality.
- **Full cost:** indices/row format, sort/interleave/take, CPU/wall/RSS/temp, materialized bytes and downstream scan latency.
- **72h killer:** a small nested multi-key batch must show a stated invariant not reproduced by index+take/row format/specialized interleave. Without such an invariant, it is a dispatch/materialisation choice. The current proposition fails this static test.

## Disposition

`STRUCTURAL_DROP`. It is not based on missing implementation, results or resources. The stated residual is generic sorting/materialisation or kernel dispatch, already covered by the current strong composition; no target-specific N2 guarantee remains.

