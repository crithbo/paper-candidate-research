# Current UST Family and Non-product Residual Audit

## Audit scope

- Same object: one exact SpMM with fixed `A`, fixed repeated `B`, fixed `C` semantics.
- Source pin: `NVIDIA/nvmath-python v1.0.0`, commit `bb27be436099b36559bae15a307c94d76b12e902`.
- Candidate action: at most `K` disjoint contiguous row intervals; one legal UST action per interval.
- Excluded: row permutation, approximation, changed tensor semantics, custom kernel/format protocol, cross-object controller.

## Finite action catalog

| Dimension | Comparator-owned legal choice | Candidate residual? |
|---|---|---|
| Segment boundary | any legal contiguous `[i,j)` under `K` | no |
| Storage representation | every pinned UST-expressible sparse representation and fixed legal parameters | no |
| Conversion | every pinned legal conversion path with bytes/time/RSS charged | no |
| Dispatch | pinned library/codegen choices available for the same tensor contract | no |
| Algorithm/kernel selector | every legal native selector/configuration | no |
| Plan signature | all legal plan/compile/setup signatures | no |
| Output | exact row-disjoint assembly into the fixed `C` | no |
| Reuse | fixed `R`, including cold/warm setup amortization | no |
| Memory | workspace, materialized representations, directories and peak budget | no |
| History | previous label, used-plan set, cache state, reuse round and ordinary transition state | no |
| Full cost | conversion + planning/compile + launch + execution + assembly + fallback | no |

The catalog is complete relative to the frozen native object. A new format or kernel would not close the gate; it would change the object.

## Strengthened comparator

Use a layered resource-constrained shortest-path/label-setting construction with node

`v = (row, segments_used, memory_state, q)`

and edge

`e = ([row,next_row), action, state_update, full_incremental_cost)`.

The comparator receives exactly the candidate's matrix statistics, action catalog, `K`, reuse count, memory cap and cost tables. It has the same numerical and output guarantees. Offline exact solution is a ceiling, while an equal-budget label-setting/beam/DP implementation is the deployable comparator; the structural audit depends on action equality, not on granting the baseline unlimited time.

## Non-product candidates tested

| Proposed coupling | Why it does not survive |
|---|---|
| One-time plan/JIT cost shared by segments | used-signature bitset is finite state |
| `B` reuse and cache warmth | reuse/cache state is finite |
| Format-switch penalty | previous-label transition cost |
| Peak memory/workspace sharing | bounded resource state |
| Cold/warm trade-off | vector/Pareto label cost |
| More formats/features/weights/thresholds | expands catalog or cost model only |
| Parallel overlap/interference | generic co-scheduler/controller; changes frozen object |
| Multiple covers by query phase | materialization/online policy; changes frozen action |
| Fused converter or assembler | custom emitter/postprocessor; outside native path |
| Approximation/error coupling | changes exact numerical contract |
| Row reorder/custom kernel | changes object and overlaps structured SpMM work |

## Formal property

`Finite-State Cover Equivalence`: under the frozen assumptions, candidate covers and comparator paths have a legality- and cost-preserving bijection. The property rules out a non-product residual inside the allowed action boundary; it is not a claimed new positive theorem for publication.

## Source/collision boundary inherited and rechecked

The revision uses only the frozen Discovery, PRIMARY and confirmation packages. Those packages record the current-source reality check and primary-source boundaries for:

- NVIDIA UST / nvmath-python v1.0.0 source and API;
- Ahrens and Boman's 1D-VBR partitioning;
- Yang, Li and Li (2018), DOI `10.1016/j.jcss.2017.09.010`;
- HR-SpMM, ICS 2025, DOI `10.1145/3721145.3725770`;
- GeneralSparse, USENIX ATC 2025;
- RSH-SpMM, arXiv `2603.08734`.

No exact-identical single paper is asserted. The STOP follows from same-object action-space absorption after fair normalization, not from a universal literature union or unavailable hardware.

