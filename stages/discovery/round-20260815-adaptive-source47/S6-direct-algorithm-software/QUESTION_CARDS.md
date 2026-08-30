# Source47 bounded question cards

## QC-01 — RISC-V branch-fact copy removal

- Exact object: fixed post-register-allocation RISC-V MachineFunction, branch semantics and output machine semantics.
- Candidate action: use branch facts to remove a redundant zero/immediate copy in a target block.
- Current locus: [RISCVRedundantCopyElimination.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVRedundantCopyElimination.cpp), official llvm-project `main`, inspected 2026-08-15. The pass removes zero copies in targets of `beqz`/`bnez`, also recognizes Xqcibi branch-immediate forms, and runs post-RA.
- Strong union: current branch-fact predicates, post-RA target pass, feature forms and stock MachineFunction semantics.
- Natural/canonical route: version-pinned public LLVM RISC-V MIR/test-suite route.
- Full-cost initial boundary: compile CPU/RSS/temp, code bytes, branch/copy count and machine verification.
- Minimum falsifier: one post-RA block with two lawful outcomes. A different current fact rule or ordering would be ordinary local peephole engineering.
- Disposition: `DROP__DIRECT_CURRENT_ACTION_ABSORPTION`.

## QC-02 — Wasm irreducible control-flow reduction

- Exact object: fixed WebAssembly MachineFunction/module semantics and stock Wasm validation/runtime behavior.
- Candidate action: replace a multi-entry SCC with a legal single-entry region via dispatch/label construction.
- Current locus: [WebAssemblyFixIrreducibleControlFlow.cpp](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/WebAssembly/WebAssemblyFixIrreducibleControlFlow.cpp), official llvm-project `main`, inspected 2026-08-15. It identifies SCC loop entries, adds a dispatch block and helper label variable, rewrites branches, repeats SCC analysis, and documents an approximate complexity bound.
- Strong union: target-native region recursion, SCC detection, single-entry dispatch construction and stock Wasm validator/runtime.
- Natural/canonical route: version-pinned LLVM WebAssembly tests with irreducible CFGs.
- Full-cost initial boundary: compile CPU/RSS/temp, added blocks/locals/code bytes, validation and runtime startup/execution cost.
- Minimum falsifier: one fixed multi-entry SCC with two legal reductions. The source already owns the defining construction; a generic region-order change is not a new target-specific residual.
- Disposition: `DROP__DIRECT_CURRENT_ACTION_ABSORPTION`.
