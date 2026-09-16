# Candidate-grade deep reviews

| Candidate | Same-object and oracle | V6 local survival | Strongest subtractor | Decision |
|---|---|---|---|---|
| Ginkgo bounded block-Jacobi partition | Fixed sparse matrix/right-hand side/numerical tolerance; stock residual and solution check | Survives to selector: two legal bounded block-pointer partitions remain after local normalization | Existing block-Jacobi/preconditioner composition and target-independent partition algorithms | `STRUCTURAL_DROP__GENERIC_PARTITION_SOLVER` |
| LLVM MachineBlockPlacement chain coalescing | Fixed MachineFunction, CFG, probability information and emitted-code semantics; native verifier/object checks | Survives to selector: two legal topological block-chain orders remain | Current MBP plus Codestitcher and ExtTSP same-object block-layout algorithms | `STRUCTURAL_DROP__DIRECT_SAME_OBJECT_ALGORITHM_COLLISION` |

No brief was written.  The witness traces prevented a false “candidate action vanished in the pass” explanation, but they cannot rescue a residual that is generic or directly absorbed.
