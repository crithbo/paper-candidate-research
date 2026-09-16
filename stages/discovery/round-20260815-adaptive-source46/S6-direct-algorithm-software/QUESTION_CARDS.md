# Source46 bounded question cards

## QC-01 — i1/lane-mask lowering

- Exact object: fixed AMDGPU MachineFunction, i1/vreg_1 copy semantics, ISA and stock machine verifier.
- Candidate complete action: jointly lower i1 values and copy/PHI representations to legal lane-mask forms across the CFG.
- Current locus: [SILowerI1Copies.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AMDGPU/SILowerI1Copies.cpp), official llvm-project `main`, inspected 2026-08-15. It states that the pass lowers all `i1` values in `vreg_1`; `runFixI1Copies` consumes machine dominator and post-dominator trees.
- Strong union: current i1-copy lowering plus current MachineFunction pass composition and legality analyses.
- Natural/canonical route: public version-pinned LLVM AMDGPU MIR/test programs.
- Full-cost initial boundary: compilation CPU/RSS/temp, code bytes, lane-mask/register-pressure proxy and machine verification.
- Minimum falsifier: a fixed MIR CFG admitting two lawful i1 lowerings. A changed representation selected inside current lowering would not create a new N2.
- Disposition: `DROP__DIRECT_CURRENT_ACTION_ABSORPTION`.

## QC-02 — WWM physical-register preallocation

- Exact object: fixed AMDGPU MachineFunction, WWM semantics, live intervals and register-allocation constraints.
- Candidate complete action: preassign legal physical registers to WWM-related VGPR definitions and rewrite uses.
- Current locus: [SIPreAllocateWWMRegs.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AMDGPU/SIPreAllocateWWMRegs.cpp), official llvm-project `main`, inspected 2026-08-15. The current pass checks live-range interference, assigns a free physical register and rewrites registers. Its hidden non-default `amdgpu-prealloc-sgpr-spill-vgprs` control defaults false and has a function-attribute counterpart.
- Strong union: current preallocation, registered allocator, live intervals, virtual-register map and interference matrix.
- Natural/canonical route: public version-pinned LLVM AMDGPU MIR/test programs with WWM requirements.
- Full-cost initial boundary: compile CPU/RSS/temp, code bytes, register/occupancy proxy, spill cost and stock verifier.
- Minimum falsifier: one fixed WWM MIR function with two legal physical assignments. Replacing the current ordering with generic allocation or selector logic is not a target-specific research residual.
- Disposition: `DROP__DIRECT_CURRENT_ACTION_ABSORPTION`.

## QC-03 — WQM/Exact region construction

- Exact object: fixed AMDGPU pixel-shader MachineFunction, derivative and side-effect semantics, and stock machine-code verifier.
- Candidate complete action: jointly choose semantically legal regions requiring WQM, Exact, StrictWQM and StrictWWM, and emit save/restore transitions.
- Current locus: [SIWholeQuadMode.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/AMDGPU/SIWholeQuadMode.cpp), official llvm-project `main`, inspected 2026-08-15. The producer already analyzes WQM need, inserts WQM/EXEC save-restore transitions, protects stores/atomics, and exits blocks in WQM where successors require it. Its comments identify possible benefits from better control-flow analysis.
- Strong union known so far: current state analysis, block/successor propagation, transition emission, and AMDGPU machine verifier.
- Natural/canonical route: public LLVM AMDGPU shader/MIR tests is an implementation-carrier route; an exact versioned real shader carrier is not yet selected.
- Full-cost initial boundary: compile CPU/RSS/temp, transitions/code bytes, register-pressure proxy, and later shader semantic validation.
- Minimum falsifier: a fixed CFG with two legal WQM/Exact region decompositions; it must distinguish a target-specific region algorithm from generic graph segmentation.
- Disposition: `NOT_ADMITTED_UNFROZEN__LOCATOR_ONLY`.
- Reason: a current-source comment about possible better analysis is only a locator. No target-specific non-generic algorithm/guarantee, exact natural carrier, or bounded direct-collision subtraction was fixed; this is not a resource or readiness rejection.
