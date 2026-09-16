# Source-closure report

## Identity and disposition

- Assignment: `SOURCE-CLOSURE-SOURCE86-S2-CQ01-ONNXRUNTIME-PARTITION-MEMORY-PATTERN-V1`
- Frozen object: one fixed ONNX graph and weights in a stock `InferenceSession`,
  with fixed providers/device configuration, inputs, outputs, partition legality
  and repeated-shape execution semantics.
- Immutable current pin: `microsoft/onnxruntime@c5300b71ec44aee30ba0d18190f29372568a8e07`.
- Disposition: `UNRESOLVED_BACKLOG__BOUNDED_SOURCE_OR_CARRIER_CLOSURE_INCOMPLETE`.

This disposition is confined to the assignment's three permitted source-closure
outcomes. It makes no clean-brief, Q2, PASS, STOP, or pipeline-state decision.

## Question closed and result

The frozen question was whether the bounded current ONNX Runtime source surface
can freeze: (1) the relevant EP-partition plus memory-pattern/arena/optimizer
union; (2) a fixed stock carrier and two complete legal partition-allocation
plans; and (3) a provider-specific joint action with a finite non-generic
guarantee.

The first part is materially closed within the selected loci. Current source
contains EP capability/partitioning and layout re-query with resource
accounting; session-state allocation/free tracing and shape-keyed cached
patterns; and a BFC arena. The selected test establishes a current in-tree
partition test carrier locus and a partition-accounting survivor/drop path.

The latter two parts are not closed. The retained carrier locus does not itself
provide the model artifact and two complete whole-session plans, and the
bounded sources do not identify a candidate's provider-specific joint action,
state, guarantee, or direct collision relation. The request budget is exhausted,
so these fields must remain closure debt rather than be supplied by conjecture.

## Evidence ledger

| Requirement | Status | Evidence / boundary |
|---|---|---|
| Immutable current source pin | closed | First official call fixed the commit; all four sources are pinned to it. |
| Current EP partition action union | partially closed | Capability, layered assignment, tentative/second-pass assignment, layout transform and accounting are read from `graph_partitioner.cc`. |
| Current memory-pattern/arena union | partially closed | Static trace/cache/shape and multi-stream disable condition are read from `session_state.cc`; arena management from `bfc_arena.cc`. |
| Fixed carrier locus | closed at locus level | In-tree test names `ep_partitioning_test_1.onnx`; its byte artifact and replay were out of this closure's bounded route. |
| Two complete same-object plans | not closed | The source exposes a partition survivor/drop test, not two complete partition-plus-allocation session plans. |
| ORT-specific joint action + finite guarantee | not closed | No such action or guarantee is defined by the frozen queue item; current sources are subtractors, not evidence that a residual exists. |
| Direct current collision | unadjudicated | No direct fatal is inferred; bounded source inspection does not prove absence. |
| Generic partition/packing/controller objection | unadjudicated | Requires the missing explicit candidate action and complete same-object comparison. |

## Full-cost and finite falsifier boundary for any later authorized review

Any subsequent, separately authorized closure must retain the fixed model and
provider semantics and account for model/session loading, graph optimization
and transformation, capability/partition work, memory-pattern construction and
cache behavior, arena/device allocations, copies/transfers, repeated-shape
latency, peak host/device memory, output equality and provider legality.

A finite falsifier is available only after two complete plans are frozen: a
current stock trace that already expresses the claimed joint action with the
same information/semantics, or a witness in which the claimed action cannot
produce a legal distinct plan under the same output/provider contract. Neither
test has been performed here.

## Search and evidence boundary

Only six official `microsoft/onnxruntime` routes permitted by the contract were
requested. No clone, build, model execution, benchmark, external-project
search, Source87+ material, Source91/R74 material, or Source84/85 output was
read. A zero match, transport error, missing model bytes, or exhausted call cap
is not treated as evidence of absence.

