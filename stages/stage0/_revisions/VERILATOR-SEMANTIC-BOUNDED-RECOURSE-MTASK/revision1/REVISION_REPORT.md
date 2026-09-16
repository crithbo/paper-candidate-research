# Verilator semantic bounded-recourse MTask — Stage 0 revision 1

## Disposition

- Assignment: `STAGE0-P1-20260814-VERILATOR-SEMANTIC-BOUNDED-RECOURSE-MTASK-REVISION1-V8.7`
- Sole gate: `PINNED_VERILATOR_STATIC_MTASK_ACTION_CATALOG__DEPENDENCY_CLOSED_EPOCH_REPACK_CERTIFICATE`
- Decision: `STOP`
- Quality disposition: `BELOW_Q2_STOP__CURRENT_VERILATOR_REBINDING_ABSORPTION_OR_GENERIC_DYNAMIC_SCHEDULER`
- Scientific revision: **consumed (1/1)**. This package is the required gate-bearing static construction.
- Stage A / Stage B: not authorized.
- Confidence: 0.88.

This is a scientific STOP, not an implementation, hardware, or benchmark finding.  The current upstream has a documented runtime-repack *idea*, so lack of a current implementation is not used as a negative result.  The failure is that the only closed same-interface action is ordinary bounded-recourse assignment of an already dependency-safe MTask DAG to workers.  The Verilator-specific semantics only impose barriers that a generic scheduler must respect; they do not yield a non-product action, recurrence, or guarantee.

## Frozen proposition and falsification result

**Proposition.** At an immutable Verilator pin, an epoch-bound reassignment of dependency-closed MTask bundles can be represented by a finite Verilator-specific state whose recurrence preserves every future legal native action and full cost, and is not reducible to generic dynamic DAG scheduling.

**Falsification.** The rebind action changes only `owner : bundle -> worker` (and the per-worker ready order) after all existing prerequisite counters and semantic regions have quiesced.  Trigger, active, NBA, timing/coroutine, DPI, and generated-model-interface constraints are immutable graph labels or hard barriers.  They neither change the worker-assignment action space nor couple choices beyond the standard precedence constraints.  Therefore the remaining optimization is the generic problem: choose a bounded-recourse mapping/order of a fixed precedence DAG to workers under measured task weights.  Any exact/FPT recurrence for that residual is a generic partition/scheduling recurrence, prohibited by the assignment.

## Immutable source and object boundary

The frozen source is official Verilator release v5.050 commit `848d926ebd4addacacd294dc84e35d9d4ae8078c` (2026-07-01).  Decisive pinned artifacts are:

- `docs/internals.rst` — V3Sched/V3Order/V3Partition, active/NBA regions, MTask atomicity, static thread assignment, and the explicit “Static Scheduling with Runtime Repack” TODO;
- `src/V3Sched.cpp`, `src/V3Order.cpp`, and `src/V3Partition.cpp` — schedule, graph order, and partitioning paths;
- `docs/guide/exe_verilator.rst` — `--threads`, `--threads-max-mtasks`, and `--threads-dpi` action surface;
- `docs/guide/simulating.rst` — `--prof-exec`, profile production, and re-Verilation (`--prof-pgo`).

The same object is one fixed SystemVerilog design compiled with one of these fixed option tuples.  It retains the generated C++ model interface and all SystemVerilog-observable traces.  No semantic mode, DPI policy, timing policy, MTask graph, or model interface may be changed by a proposed rebind.

## Attempted two-plan certificate

Use the fixed design family with two independent clocked updates and a dependent combinational observation:

```systemverilog
module rb(input logic clk, input logic d0, d1, output logic q0, q1, y);
  always_ff @(posedge clk) q0 <= d0;
  always_ff @(posedge clk) q1 <= d1;
  always_comb y = q0 ^ q1;
endmodule
```

For a static multithread compilation that exposes separate MTask bundles, the native region graph is represented symbolically as `A0,A1` (active/RHS preparation), `N0,N1` (NBA commits), then `C` (post-commit dependent evaluation), with `A_i -> N_i -> C`.  The witness freezes `--threads 2`, `--threads-max-mtasks 2`, `--threads-dpi pure`, and `--no-timing`; its timing and DPI traces are therefore the same empty traces in both plans.  The configuration deliberately does **not** claim an unexecuted generated output: it specifies the native graph condition which a later fidelity gate would check.

| Plan | Worker 0 | Worker 1 | Preserved observations |
|---|---|---|---|
| P | `A0,N0,C` | `A1,N1` | identical clock trigger, active sequence, NBA commits, `y`, empty timing/DPI trace |
| P' | `A1,N1,C` | `A0,N0` | identical clock trigger, active sequence, NBA commits, `y`, empty timing/DPI trace |

`P` and `P'` are a legal worker-placement divergence only if the frozen emitted graph has these separable bundles.  But their proof of equivalence is exactly the ordinary topological-schedule argument already relied upon by static MTask assignment.  They provide no Verilator-specific action divergence: swapping independent workers is a generic scheduling symmetry.  Adding a nonempty timing or serial DPI edge merely turns it into an unmovable barrier; it does not create a new coupled selection action.

## Why dependency-closed epochs do not rescue N2

A valid epoch boundary must occur only after the generated model has completed the evaluation epoch: all prerequisite counters are discharged, active/NBA region work has completed in region order, no timing coroutine is resumable in the epoch, no DPI serialization is outstanding, and generated-interface state is stable.  At that point a proposed table update is:

`(owner, worker-ready-order) <- Repack(G, measured_weights, recourse_budget)`.

All state needed for semantic fidelity is already carried by the fixed graph and the ordinary dependency counters.  A sufficient state may list region labels, counters, trigger bits, coroutine state, DPI class, and a worker mapping; however, the first five are feasibility labels rather than decision variables.  Deleting their fixed labels leaves the same worker-assignment problem.  Conversely, retaining them only partitions the generic scheduling instance into regions.  No non-product transition or target-specific recurrence remains.

The current source reinforces this conclusion: it documents static assignment with prerequisite waits, rejects a runtime macro-dataflow graph follower as not useful, and describes runtime repack only as gathering actual task times and dynamically repacking threads periodically.  Thread PGO similarly gathers a profile then re-runs Verilator; it is a strong external static baseline, not a new in-process semantic action.

## Strongest comparison and claim ceiling

The fair comparison set is current static `V3Order -> V3Partition` MTask assignment for the same compiled graph, `--threads` / `--threads-max-mtasks` settings, DPI classes (`pure`, `all`, `none`), `--prof-exec`, and the profile-then-re-Verilate `--prof-pgo` branch.  A generic bounded-recourse scheduler, CP/ILP, load balancer, or controller is a subtractor/oracle, not a candidate method.  The proposed repack is not distinguishable from that subtractor after its correctness conditions are frozen.

Thus the most honest possible future claim would be an engineering implementation of a documented runtime-repack direction, with ordinary scheduler guarantees.  That claim does not reach a credible Q2 N2 shape under the frozen topic.  It cannot be upgraded by adding task weights, a ready queue, a controller, a new profile grid, or a generic solver.

## Pre-registered Stage A falsifier (not run)

If a future new-ID topic claimed a genuinely new native action, it would first need to emit one fixed design with a nonempty trigger/active/NBA/timing/DPI edge case; replay two complete worker plans; verify trace identity and generated-model interface; and charge profiling, rebind, synchronization, and model runtime costs.  For this ID that route is not authorized: the static gate already shows the claimed action is generic.

## Sources

- [Verilator v5.050 release commit](https://github.com/verilator/verilator/commit/848d926ebd4addacacd294dc84e35d9d4ae8078c)
- [Pinned internals documentation](https://github.com/verilator/verilator/blob/848d926ebd4addacacd294dc84e35d9d4ae8078c/docs/internals.rst)
- [Pinned command-line options](https://github.com/verilator/verilator/blob/848d926ebd4addacacd294dc84e35d9d4ae8078c/docs/guide/exe_verilator.rst)
- [Pinned profiling documentation](https://github.com/verilator/verilator/blob/848d926ebd4addacacd294dc84e35d9d4ae8078c/docs/guide/simulating.rst)
