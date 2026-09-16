# S66-RQ01

- Seed `S66-SEED01`; contribution hypothesis `SYSTEM_ARCHITECTURE / N2`.
- Primary RQ: **For fixed free-threaded CPython object/C-API lifetime semantics, can a non-controller, CPython-specific whole-object merge/deallocation construction jointly reduce reference-count contention and delayed-lifetime cost beyond the current biased/deferred/per-thread reference-count union?**
- No alternative was fixed because changing GIL mode, C-API lifetime, the object class set, or GC semantics changes the object/guarantee.
- FINER-lite: feasible `CLEAR`; interesting `CLEAR`; novelty threat `HIGH`; scope `PASS`; relevance `CLEAR`.
- Null/contrary: choosing when to merge/collect queued or per-thread references is a controller policy, and native current union already covers the actual state transitions.
- Ordinary closure result: `EARLY_FATAL__CURRENT_NATIVE_UNION_PLUS_CONTROLLER_ONLY`.
