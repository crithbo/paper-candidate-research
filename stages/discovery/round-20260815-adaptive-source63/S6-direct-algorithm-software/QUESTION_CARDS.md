# Source63 evidence-qualified question cards

## QC01 — OCaml Flambda2 closure-set/group construction

- **Exact public anchor:** `ocaml/ocaml` Flambda2 source tree, with an official OCaml closure-conversion documentation route. The fixed object is a Lambda/Closure program and OCaml runtime semantics, not the older pattern-match compiler family.
- **Same-object endpoint:** code bytes, closure allocation and direct-entry cost while preserving executable result and runtime calling semantics; stock OCaml execution is the oracle.
- **Candidate mechanism:** a whole group/environment constructor choosing legal closure-set grouping and captured-variable representation, with a target-specific bounded-context frontier.
- **Current source / action debt:** historical official documentation establishes `Set_of_closures`, `Project_closure` and the separation of closure conversion from eventual runtime layout. The exact current Flambda2 `from_lambda` source route was attempted once and returned cache-miss/unavailable from this bounded retrieval surface. Current producer union, defaults/nondefaults, and direct collision are therefore not frozen.
- **Falsifier / finite closure:** read one exact `ocaml/ocaml` trunk source locus and one matching current Flambda2 documentation/source path; reject if the producer already jointly constructs the claimed group/environment decision, or if the only frontier is generic closure conversion/layout.
- **Natural carrier / full cost:** versioned OCaml compiler tests and public OCaml modules; compile CPU/RSS/temp, object/interface bytes, closure allocation, code-size and entry/runtime cost.
- **72h killer:** one fixed compiler test should show the candidate action is already emitted or that a supposedly distinct group transformation changes closure/runtime semantics.
- **Disposition:** `NOT_ADMITTED_UNFROZEN__CURRENT_FLAMBDA2_UNION_AND_DIRECT_COLLISION_PENDING` — no absence, novelty, implementation, or resource inference.

## QC02 — GCC loop-distribution partition construction

- **Exact public anchor:** GCC 15.2 optimisation manual plus official `gcc/tree-loop-distribution.cc` change records; fixed GIMPLE loop, dependence/alias facts, target features and program behavior.
- **Same-object endpoint:** code size, compile time/RSS, loop runtime/cache/vectorization consequence, with stock executable behavior as oracle.
- **Current union:** `-ftree-loop-distribution` is enabled at `-O3`. Official current-source records expose `loop_distribution`, reduced dependence graphs, dependence classification, partition merge/finalize, memory-reuse cost and protection for vectorizable vs non-vectorizable partitions. The pass composes with loop vectorization under the same compiler configuration.
- **Minimum witness:** two legal partitions of independent statements can exist, but choosing a different partition is exactly the current loop-distribution decision class. No target-specific action or guarantee beyond generic dependence-graph partitioning was identified.
- **Contrary / direct collision:** official GCC implementation records make the generic partition kernel and its vectorization/memory-reuse coupling explicit. The proposal is not a non-generic S6 residual.
- **Natural carrier / full cost:** GCC test-suite loop-distribution tests and public C/Fortran loops; compile CPU/RSS/temp, object bytes, runtime/cache/vectorization metrics, and any code-size/loop-count cost.
- **72h killer:** one `gcc.dg/vect` loop test confirms that the proposed partition differs only in generic RDG partition/cost policy or is already expressible by current distribution.
- **Disposition:** `STRUCTURAL_DROP__CURRENT_RDG_PARTITION_UNION_AND_GENERIC_LOOP_KERNEL`.
