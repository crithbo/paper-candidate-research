# Source32 non-product coupling survival note

Applies to `RVV_LMUL_REGISTER_ALLOCATION_VSETVLI_PARETO`.

- Factor A: legal LMUL-group register allocation/spill decisions.
- Factor B: `RISCVInsertVSETVLI` configuration placement and vtype/VL transition minimization.
- Strongest sequential composition: LLVM allocates vectors first, then runs `RISCVInsertVSETVLI`; stock pass minimizes vsetvli dataflow after allocation.
- Shared endogenous variable/cross-term: each pseudo's LMUL register class, mask-v0 constraint and its required `(SEW, LMUL, policy, AVL)` vtype state. Changing a group assignment can create spills/rematerialized pseudos and changes which configuration states must be live; it is not the Cartesian product of an independent allocator and independent instruction scheduler.
- Source dependency trace (two loci): LLVM RVV documentation's “Register allocation” says allocation is intentionally before `RISCVInsertVSETVLI`; its “RISCVInsertVSETVLI” section says the pass consumes pseudo requirements and emits dataflow-minimal configurations. The ratified RVV specification fixes LMUL group alignment/size legality.
- State-erasure result: `SURVIVES` at the action-skeleton level: erasing the shared `(LMUL,vtype,AVL)` state destroys the legality/dependency trace. This does not establish a novel algorithm or current-union externality.
- Disposition: `SURVIVES_TO_EXISTING_C0_DEEP`, but `NOT_READY_FOR_CLEAN_BRIEF__NON_PRODUCT_UNPROVEN` because collision/current-union/witness debts remain bounded. No scientific DROP.
