# Source111 S1 pre-evidence RQs

| RQ | denylist before lookup | Primary question / minimum falsifier |
|---|---|---|
| RQ-S111-01 | DISTINCT | Does a current KernelBench task verifier omit a documented LLM-kernel semantic invariant? Falsifier: source/reference already checks it. |
| RQ-S111-02 | DISTINCT | Does a TritonBench evaluator accept a kernel that violates a source-defined stride/aliasing contract? Falsifier: no such contract or test already covers it. |
| RQ-S111-03 | RELATED_ONLY with verifier-validity discriminator | Can a finite semantic witness change one exact corpus ranking/validity conclusion? Falsifier: current evaluator already uses equivalent witness. |
| RQ-S111-04 | DISTINCT | Is one TileLang/ThunderKittens public task's layout/output contract under-specified relative to its reference oracle? Falsifier: task source defines and tests it. |
| RQ-S111-05 | RELATED_ONLY with corpus semantic-endpoint discriminator | Is tolerance-only comparison insufficient for one documented kernel semantic endpoint? Falsifier: no endpoint or routine numerical test. |
| RQ-S111-06 | DISTINCT | Does an exact corpus ranking omit a verifier-defined cost/validity component that reverses its stated decision? Falsifier: no exact result artifact. |
