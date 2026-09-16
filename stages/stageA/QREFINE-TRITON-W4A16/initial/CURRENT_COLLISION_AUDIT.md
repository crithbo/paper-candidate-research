# Current collision audit

This Stage A assignment performed no claim-bearing baseline execution. The following is a scope-preserving static carry-forward from the frozen independent Stage 0 packages, checked against the downloaded Triton v3.7.1 source boundary; it is not new collision evidence.

| Comparator | Same frozen endpoint? | Static disposition | Missing executable check |
|---|---:|---|---|
| Triton verifier and native tests | Partial/current native | Strong baseline retained | Run exact frozen operator and both target pipelines |
| FpSan | No, different floating-sanitization endpoint | Strong subtractor/control | Establish exactly which IEEE clauses overlap |
| Pointer-safety verifier | Partial, memory safety only | Strong subtractor | Execute exact address/mask obligations |
| Wang-style MLIR translation validation | Related translation-validation endpoint | Strong algorithmic subtractor | Compare adapters and relation coverage |
| Verified lifting of Triton operators | Related formal semantics | Strong formal subtractor | Audit frozen operation coverage and proof boundary |

The source confirms the requested post-`make_llir`, pre-`llvm.to_module` boundary exists in both NVIDIA and AMD compiler paths. It does not establish that QRefine is outside the current union, nor that any current system absorbs it. Those questions remain blocked behind executable capture and replay.

No PASS, STOP, novelty, or current-absence inference is made.
