# Source audit — ONNX Runtime partition / memory-pattern closure

Assignment: `SOURCE-CLOSURE-SOURCE86-S2-CQ01-ONNXRUNTIME-PARTITION-MEMORY-PATTERN-V1`  
Scope: source closure only; this is not a candidate-grade, Stage 0, or state decision.

## Frozen pin and bounded acquisition

The first counted official request resolved `microsoft/onnxruntime` `main` to
`c5300b71ec44aee30ba0d18190f29372568a8e07`. All retained sources below are
from that pin. The official GitHub tree response was complete (`truncated=false`).

| Role | Pinned official locus | What the bounded read establishes |
|---|---|---|
| EP partition union | [graph_partitioner.cc](https://raw.githubusercontent.com/microsoft/onnxruntime/c5300b71ec44aee30ba0d18190f29372568a8e07/onnxruntime/core/framework/graph_partitioner.cc) | Capability queries, optional layered assignment, NHWC two-pass transform/re-query, tentative tagging, resource accounting and partition placement are current stock actions. |
| Memory-pattern union | [session_state.cc](https://raw.githubusercontent.com/microsoft/onnxruntime/c5300b71ec44aee30ba0d18190f29372568a8e07/onnxruntime/core/framework/session_state.cc) | Fixed-shape session planning traces allocations/frees from an execution plan; patterns are shape-keyed cached and disabled where same-device multi-stream order is not fixed. |
| Arena union | [bfc_arena.cc](https://raw.githubusercontent.com/microsoft/onnxruntime/c5300b71ec44aee30ba0d18190f29372568a8e07/onnxruntime/core/framework/bfc_arena.cc) | The arena independently exposes growth, allocation, split, free and coalescing behavior. |
| Fixed in-tree partition carrier locus | [internal_testing_partitioning_tests.cc](https://raw.githubusercontent.com/microsoft/onnxruntime/c5300b71ec44aee30ba0d18190f29372568a8e07/onnxruntime/test/internal_testing_ep/internal_testing_partitioning_tests.cc) | The test names `testdata/ep_partitioning_test_1.onnx` and exercises capability/partition behavior, including a CUDA resource-accounting setting and a surviving/dropped second-pass case. |

The six allowed calls consumed 3,603,382 persisted response bytes, below the
16 MiB cap. Hashes and the pre-call ledger are retained under `resources/`.

## Current action boundary

The bounded evidence confirms that the current union is already stronger than a
simple EP-selection baseline:

- `GraphPartitioner` queries each EP's capability, can filter or reset layered
  assignments, performs a preferred-layout two-pass workflow, and keeps only
  second-pass survivors before accounting their provisional costs.
- `SessionState` creates allocation/free traces from an execution plan for
  fixed resolved shapes, stores shape-keyed memory-pattern groups, and disables
  the feature when same-device execution order is not fixed across streams.
- `BFCArena` is a separate runtime allocation mechanism with growth policy and
  splitting/coalescing actions.

This establishes relevant current subtractors. It does **not** establish that
the stock code constructs a joint, provider-specific alternative that jointly
optimizes EP partition boundaries and memory-pattern slots under the frozen
whole-session semantics. Conversely, the bounded four-source surface also does
not establish the absence of such an action elsewhere; no absence inference is
made.

## Carrier and two-plan status

The retained test is a legal in-tree carrier *locus*, not a retained model
artifact: it names `ep_partitioning_test_1.onnx` and builds partitioning tests,
but this closure's call budget did not include model bytes or an execution
trace. It exposes a partition survivor/drop distinction but not two complete
same-session partition-plus-allocation plans with fixed provider/device,
identical outputs and repeated-shape behavior.

Therefore this packet cannot yet freeze a comparator-separating two-plan
witness, a union-external ORT-specific joint action, or an exact/FPT/
approximation/certified guarantee. This is incompleteness of the bounded
closure, not a negative inference about the candidate family.

## Direct-collision and generic-objection result

No direct-current-union fatal is registered. The source shows individually
powerful partition, accounting, static-memory-pattern and arena actions, but
the required same-object joint decision/action and its guarantee remain
unclosed. The generic graph-partition/packing/controller objection likewise
cannot be resolved honestly until a candidate action is stated against the
complete current action map. No literature or non-ORT project was queried,
per the assignment boundary.

