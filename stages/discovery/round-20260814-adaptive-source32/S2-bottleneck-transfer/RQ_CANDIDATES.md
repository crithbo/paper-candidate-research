# Source32 RQ candidates

Pre-evidence same-object RQ variants for a fixed RVV LLVM IR program, target feature set, executable semantics and vector output:

1. Can an RVV-targeted algorithm jointly choose legal LMUL-group allocation and `vsetvli` placement to minimize spill plus configuration cost?
2. Can it instead give a bounded Pareto frontier over register-group pressure and vtype-transition count under identical code semantics?
3. Can it guarantee a no-worse `vsetvli` count while respecting mask-v0 and LMUL alignment constraints?

Selected RQ: variant 2, because it names a target-specific finite state variable without changing object or guarantee.
