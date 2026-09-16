# Source111 S1 offline seed pool

All seeds completed three-denylist pre-check before lookup: base `1AC56E95…`, Source109 addendum `B241D197…`, Source110 addendum `5CE70057…`.

| Seed | denylist check | Sketch / bounded object |
|---|---|---|
| S111-01 | DISTINCT | KernelBench verifier may compare outputs without exposing a named semantic tolerance/aliasing contract for a public LLM kernel; seek an exact benchmark-validity endpoint, not a generic checker. |
| S111-02 | DISTINCT | TritonBench task/reference pairing may make an in-place or stride contract unobservable; ask whether a source-visible evaluator condition admits a wrong same-name kernel. |
| S111-03 | RELATED_ONLY: distinct object=`KernelBench verifier`, action=`semantic witness`, endpoint=`benchmark validity`, not prior generic benchmark repackaging | Add a minimal witness generator only if current verifier cannot distinguish a documented semantic class. |
| S111-04 | DISTINCT | TileLang/ThunderKittens kernel corpus may encode layout assumptions outside reference tests; seek an exact public task with a finite oracle. |
| S111-05 | RELATED_ONLY: distinct corpus verifier/end-point, not Triton autotune | A compiler-generated kernel could pass output tolerance but violate deterministic/NaN/edge semantics; only retain with a stated artifact contract. |
| S111-06 | DISTINCT | A benchmark ranking may be invalid if verifier/evaluator selects an unsupported output mode; require exact task, result artifact and decision reversal. |

No exact/contains item was generated; related-only records have explicit discriminators. Selected RQs before lookup: S111-01..06 → RQ-S111-01..06. No outcome-aware replacement allowed.
