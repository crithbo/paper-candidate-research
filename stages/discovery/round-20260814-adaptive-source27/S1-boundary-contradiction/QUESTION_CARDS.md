# Pre-lookup question cards

## QC-L01 — OpenMP 6.0 offload completion/data lifetime

- Capsule / exact identity: `S1_OPENMP60_OFFLOAD_SEMANTIC_BOUNDARY`; one OpenMP 6.0 host-device program with target-data mapping, asynchronous device work, and fixed host-visible completion/synchronization semantics.
- Type / endpoint / atomic action: `COMPILER_TOOL`, possible N2; a target-native construction jointly placing data-environment release and completion edge while retaining the standard’s source-level behavior.
- Native/canonical carrier: official OpenMP example or official LLVM offload test with current Clang/libomptarget path.
- Target-specific counterfactual: if two stock-legal producer/runtime constructions have identical values, association and completion semantics but differ in native lifetime/release placement, a joint construction may be distinct from clause selection.
- Cheapest falsifier: current Clang lowering plus libomptarget already jointly owns the only legal release/completion transition, or the proposal changes completion semantics.
- Precommitted source roles: ANCHOR OpenMP 6.0 spec → official examples; CURRENT_UNION Clang OpenMP Support → LLVM current source; CONTRARY official runtime documentation/source or primary offload paper. Order is frozen.
- Before-lookup disposition: `LOCATOR_PENDING_SOURCE_ROLES`; no scientific status yet.

## QC-L02 — RISC-V psABI 1.1 call/unwind boundary

- Capsule / exact identity: `S1_RISCV_PSABI_1_1_CURRENT_CALL_BOUNDARY`; one RISC-V ELF function/call graph with fixed psABI 1.1 calling convention, relocations and unwinder-visible recovery.
- Type / endpoint / atomic action: `COMPILER_TOOL`, possible N2; a target-specific interprocedural frame/save/relocation construction preserving all psABI call and unwind observations.
- Native/canonical carrier: official psABI source plus a small public C/C++ call/unwind program with current compiler, linker and reader paths.
- Target-specific counterfactual: same program and ABI could select two legal frame/save/relocation traces with different byte/restore costs, without changing unwinder outcome.
- Cheapest falsifier: current compiler/linker composition already contains the action, or any allegedly better trace weakens psABI/unwind observability.
- Precommitted source roles: ANCHOR official psABI documentation → official repository release/commit; CURRENT_UNION LLVM/GCC RISC-V ABI/frame sources → binutils/linker source; CONTRARY primary RISC-V ABI/compiler work → existing source composition. Order is frozen.
- Before-lookup disposition: `LOCATOR_PENDING_SOURCE_ROLES`; no scientific status yet.

