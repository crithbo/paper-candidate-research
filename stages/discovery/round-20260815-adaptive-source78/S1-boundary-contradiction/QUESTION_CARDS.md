# Question card

## QC01 — Go finalizer reachability / foreign-resource seam

- Exact identity: one Go function with a fixed finalizable wrapper, fixed foreign/syscall resource use, Go runtime finalizer contract, and observable resource endpoint.
- Same-object endpoint: same Go return/result and same admissible finalizer/resource lifecycle; no change to cleanup primitive, external API, or memory model.
- Candidate claim: N2 only if a Go-specific liveness construction proves a safe minimal frontier beyond a manual `KeepAlive` call and ordinary compiler liveness.
- Current locus: runtime documentation/source says `KeepAlive` is a compiler-non-eliminable use and gives the descriptor-close counterexample; current compiler liveness source is the strong generic subtractor.
- Natural carrier: the official `os.File`/syscall-style example and public Go code that wraps external resources with finalizers; later closure could pin a Go release and a standard-library/package trace.
- Full-cost: compiler CPU/RSS; stack-map/liveness metadata; retained heap/GC work; finalizer queue effects; resource release latency; syscall/foreign-call time.
- Minimum falsifier: if insertion delays a finalizer beyond the fixed endpoint or merely emits explicit `KeepAlive`, it changes the observation or is an annotation/wrapper. If its action is generic interprocedural liveness, it lacks the required target-specific contribution.
- Finite fidelity route: pin Go revision; enumerate `SetFinalizer`, manual `KeepAlive`, compiler liveness, and call lowering for an official descriptor witness; compare finalizer/resource lifecycle with a runtime oracle. Kill if no fixed endpoint preserves an automatic choice distinct from explicit use, or if the analysis is ordinary liveness.
- Decision: `NOT_ADMITTED_UNFROZEN__OBSERVABLE_ENDPOINT_AND_NON_GENERIC_ACTION_NOT_CLOSED`. The finite route is clear, but the present sources neither freeze a semantics-preserving automatic frontier nor distinguish it from generic liveness analysis. This is not a resource or implementation negative result.
