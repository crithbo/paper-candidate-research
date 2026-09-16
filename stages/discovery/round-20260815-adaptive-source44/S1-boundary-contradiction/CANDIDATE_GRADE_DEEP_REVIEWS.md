# Source44 — candidate-grade deep review

## D01 — RVV `vxrm` interprocedural transition construction

**Whole action.** For each internal non-recursive function, summarize the minimum cost of every `(entry vxrm, exit vxrm)` pair over the four architected modes.  Compose summaries over call edges and required fixed-point mode nodes by min-plus dynamic programming.  The output fixes emitted CSR transitions and call-edge preservation choices; it does not select an ABI, change an intrinsic’s constant mode or assume a result from an unknown callee.

**Native-legal divergence witness.** A caller emits RNE-required vector fixed-point work, calls a known internal callee whose only fixed-point work also requires RNE, then executes another RNE-required operation.  The psABI makes `vxrm` unspecified after a call, so a local plan can legally write RNE after the call.  A candidate plan emits an RNE-preserving callee exit and omits that write.  Both plans retain the ABI and identical numerical outputs; the candidate must pay any callee transition/frame cost.  If a current LLVM plan already performs this exact legal two-plan choice, the residual fails.

**Current comparator and alternative.** Comparator is current LLVM RVV IR/SelectionDAG/RA/VSETVLI pipeline (`SRC03`) with physical VXRM/VXSAT reservation (`SRC04`), same target, calling convention and fixed-point input.  Strong alternative: the candidate is merely ordinary interprocedural dataflow or cost tuning.  The Stage0 killer therefore tests whether the four-state ABI semantics add a non-reducible transition/legality structure.

**Fidelity route.** Pin the selected LLVM commit, find the fixed-point RVV test subset, compile two prescribed call traces, and use verifier/assembler/disassembler plus an RVV emulator/simulator to check result equality and emitted CSR transitions.  Account compile CPU/RSS, bytes, CSR writes, frame/spill traffic, static uops and runtime.  No Discovery experiment is run.

**Disposition.** `CLEAN_BRIEF_WITH_STAGE0_DEBT`, not a result, novelty or Q2 finding.
