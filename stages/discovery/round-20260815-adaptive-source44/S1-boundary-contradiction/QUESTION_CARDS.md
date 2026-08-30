# Source44 — question cards

## QC01 — RVV rounding-mode state across an internal call graph

- **Exact identity:** RISC-V V 1.0 fixed-point intrinsic programs on a fixed RVV target/ABI/VLEN policy and a fixed internal call DAG.  Carrier selection is deterministic: the commit returned for `llvm/llvm-project` default branch at the first authorized Stage0 source closure, restricted to `llvm/test/CodeGen/RISCV/rvv` tests using fixed-point intrinsic `vxrm` operands.
- **Same-object problem / claim endpoint:** preserve every fixed-point vector result and the selected calling convention while constructing native code with fewer `vxrm` CSR writes/transition instructions and their coupled code/frame cost.  The endpoint excludes explicit `vcsr` reads/writes, externally linked or unknown callees, changed ABI, changed VLEN and changed rounding/saturation semantics.
- **Contribution route:** `N2 / COMPILER_TOOL`: a target-specific finite-state interprocedural construction, not a flag, scheduler or generic register allocator.
- **Counterfactual:** local lowering may establish the caller’s requested mode, call an ABI-valid internal callee, then re-establish the same requested mode; the candidate may select an emitted callee exit mode and omit the post-call write while preserving the same numeric endpoint.
- **Non-generic discriminator:** the state space is exactly the four `vxrm` modes, each vector fixed-point intrinsic provides a required mode, and the ABI makes the state unpreserved at a call boundary.  Candidate transfer matrices compose only the target’s CSR transition/call graph semantics; an ordinary instruction scheduler or generic RA has neither this finite state contract nor the numeric-mode legality rule.
- **Current locus / contrary evidence:** `SRC01` records non-preservation; `SRC02` fixes constant mode operands and identifies redundant-write optimization as compiler/system-specific; `SRC03`/`SRC04` give the current LLVM pipeline and physical-state locus.  No claim is made that current LLVM lacks every equivalent algorithm.
- **Carrier, oracle and full cost:** implementation carrier only; official RVV intrinsic tests selected above.  Stage0 oracle: LLVM verifier/assembler/disassembler plus fixed-point output comparison under an RVV emulator/simulator.  Costs: compile CPU/RSS, text bytes, CSR-write count, call-frame/spill traffic, static uop estimate and runtime on an authorized target/simulator.
- **Minimum falsifier and finite route:** create a three-node caller(RNE) → internal callee(RNE-only) → caller(RNE) trace; kill if an ABI-correct current LLVM composition already emits no post-call mode re-establishing transition, if preservation changes the frozen output/ABI contract, or if the four-state construction reduces to an existing general dataflow/cost model.
- **Bounded closure debt:** exhaustive current union, direct same-object paper collision, complete native two-plan witness, Q1/Q2 calibration and target availability belong to independent Stage0.
- **Raw eligibility:** `EVIDENCE_QUALIFIED_RAW`.

## QC02 — ELF IFUNC relocation/call form

- **Exact identity / outcome:** all five fields are terminally contained by Source02’s glibc IFUNC resolver-timing family (`SRC05`).
- **Disposition:** `EXCLUDED_BEFORE_RAW__TERMINAL_IDENTITY_OR_KNOWN_FATAL`; no source closure or bridge routing is permitted.
