# Current action and frontier audit

## Pin and audit scope

Pinned source: Verilator v5.050, `848d926ebd4addacacd294dc84e35d9d4ae8078c`.  This is a static, source-level audit only: no generator, model, benchmark, or candidate implementation was run.

## Complete relevant native action catalogue

| Surface | Current legal action | Role in same-object comparison | Residual status |
|---|---|---|---|
| Scheduling | V3Sched forms region-aware schedule; V3Order makes dependency graph | fixes trigger/active/NBA/timing precedence | native invariant, not candidate action |
| Partitioning | V3Partition makes MTasks and statically assigns/order them on threads | strongest current static same-graph baseline | direct baseline |
| Thread count | `--threads N`, default one | finite static worker-count choice | direct baseline |
| MTask cap | `--threads-max-mtasks N` | compile-time graph granularity choice | direct baseline |
| DPI | `--threads-dpi pure` default, `all`, `none` | constrains serial/thread-safe legal execution | hard semantic barrier |
| Runtime profiling | `--prof-exec` | collects task-time data | current information path |
| Profile-guided branch | run profile then re-Verilate with `--prof-pgo` | static recompilation and repartitioning | strong non-in-process baseline |
| Runtime dataflow | graph follower experiments documented as ineffective | excludes an already-native dynamic-following action | not a residual |
| Runtime repack | documented TODO: gather actual task times and repack every 10,000 cycles | exact high-level candidate direction | action gap, but generic residual |

No source evidence supports treating profile collection or re-Verilation as an in-process action.  Conversely, the TODO establishes an idea-level action gap, not a target-specific algorithmic residual.

## Semantic boundary and dependency closure

An admissible bundle is contained in one scheduler region and has immutable generated task body, trigger predicates, and incoming/outgoing dependency edges.  A boundary is quiescent only when all of the following hold:

1. every bundle in the current evaluation epoch completed;
2. all prerequisite counters for the epoch are zero;
3. active work precedes NBA work exactly as in the generated graph;
4. no timing coroutine or delayed-event continuation for the epoch is runnable;
5. no DPI call requiring serialized execution is outstanding; and
6. the generated-model observable interface has reached its ordinary evaluation boundary.

At this boundary a worker map can change without changing HDL semantics.  This proves only that a graph scheduler can safely remap an already correct graph.  It does not make remapping a Verilator-specific algorithm.

## Action-divergence witness and collapse

For the fixed `rb` witness in the revision report, the two mappings `P` and `P'` differ only in the worker ownership of independent active/NBA chains.  Their identical trace follows from a standard topological extension theorem for the same region-labelled DAG.  The full transition system factors as:

`Verilator semantic labels + fixed precedence DAG + generic bounded-recourse worker mapping`.

The labels restrict which schedules are legal.  They do not add a decision action beyond precedence-respecting placement/order.  A nonempty timing, DPI, or cross-region edge further restricts the generic feasible set, but does not make the worker mapping non-generic.  Therefore the witness fails the required comparator-separating test.

## Frontier test

The broadest honest finite frontier is

`F = (region, remaining-predecessor-counts, coroutine/DPI barrier bits, owner, per-worker ready order, recourse budget)`.

For an immutable DAG, `region`, counters, and barrier bits are determined by native execution, while `owner`, order, and recourse budget are standard scheduling variables.  An exact recurrence over `F` is a dynamic-DAG scheduling/partition recurrence.  Hiding the generic variables inside a “semantic-aware” label does not create a nontrivial Verilator-specific N2, and an arbitrary CP/ILP/Unison formulation is expressly disallowed.

## Consequence

The sole gate cannot be closed.  It is not blocked by source access, hardware, or a missing experiment; the attempted static certificate exposes the generic-scheduler collapse demanded by the failure sentinel.
