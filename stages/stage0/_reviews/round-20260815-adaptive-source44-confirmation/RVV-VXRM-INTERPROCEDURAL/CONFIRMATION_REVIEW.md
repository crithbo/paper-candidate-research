# RVV-VXRM-INTERPROCEDURAL — independent Stage 0 confirmation

## Verdict

`CONFIRM_REVISE_ONCE`

The sole permitted revision remains atomic:

`SAME_RVV_INTERNAL_CALL_DAG_TWO_NATIVE_PLAN__CALL_AWARE_VXRM_TRANSFER_FRONTIER_CERTIFICATE`

This confirmation neither passes Stage 0 nor authorizes Stage A/B. It confirms a finite static revision because the current union is demonstrably conservative at calls, while the ABI evidence does not prove that a fixed, closed internal DAG must clobber its own compiled exit state.

## Independence and package integrity

- This reviewer did not participate in the primary review.
- The five primary canonical files verify against the supplied primary manifest, including report `34CB0CA…5135F0` and primary manifest `BFF2D83C…F59C19`.
- Independent official pin examined: LLVM `10b4fa5b79eb9d27b4928ad82afa3847762bc72f`.
- No revision, compilation, experiment, benchmark, candidate implementation, Stage A/B work, or shared-control edit occurred.

## Decisive independent findings

1. `RISCVInsertWriteVXRM.cpp:9-25` implements an intraprocedural forward/backward placement pass. Its native abstract state is an immediate 0–3 plus `Unknown`/uninitialized handling, not an interprocedural ABI summary.
2. The same source at `247-253` and `414-416` treats `MI.isCall()`, inline assembly, or a direct VXRM modification as `Unknown`; `runOnMachineFunction` at `440-489` confirms the analysis scope. This is real current-union coverage of local write placement and a real call-edge conservative boundary.
3. The official psABI `riscv-cc.adoc:100-123` and `139-155` state that `vxrm` and `vxsat` are not preserved across calls and are unspecified on entry, in both standard and variant vector conventions. Therefore, the candidate is illegal if it changes the external ABI or lets an arbitrary/escaping caller assume RNE.
4. The ABI rule does **not** alone show that an internal, non-recursive, non-escaping callee compiled in a fixed DAG cannot be made to leave RNE as an implementation fact. Such a summary must remain private to the whole-program construction and cannot alter any caller/callee contract.
5. `RISCVInsertVSETVLI` is present in the current pipeline and must remain inside the revision comparator. Any claimed gain that is only a VL/VTYPE placement difference, inlining, IPRA/LTO effect, flag choice, or a re-expression of current function-local `WriteVXRMImm` is not residual evidence.

## Same-object two-plan boundary

The only admissible witness keeps identical LLVM IR, target triple, ABI, VLEN contract, call graph, numerical output and no-explicit-vcsr-observation contract. It must contain a retained internal call with both plans expressed through stock native actions:

- **Plan L:** call is conservatively unknown and caller writes RNE after it;
- **Plan S:** the internal callee's complete legal action path establishes RNE at its exit and the caller omits that post-call write.

The revision must charge callee writes, VSETVLI interaction, code bytes, compile CPU/RSS, spill/frame effects and runtime/uop proxy. It must also rule out external/indirect/recursive calls, inline asm, explicit VXRM/VXSAT observation, exception/ABI changes, and opaque IPO transformations. psABI non-preservation remains a legality boundary, not an excuse to assume a preserved ABI state.

## Generic-reduction attack

The present mechanism is at serious risk of collapsing to ordinary finite-state interprocedural dataflow: four VXRM modes and a call-DAG recurrence alone are not an N2 contribution. This risk is not yet a direct fatal because the LLVM-specific action grammar includes `WriteVXRMImm`, machine-instruction requirements, call-induced unknowns, VSETVLI composition, pipeline-flush-sensitive placement, ABI isolation, and complete native cost. The revision must establish all of the following or trigger its pre-registered STOP sentinel:

1. a complete current native action/configuration catalog and a genuine two-plan native witness;
2. a transfer relation with an explicit unsafe/unknown class, whose use is restricted to fixed internal call edges;
3. a future-native-action, legality, numerical-semantics, ABI and full-cost preserving quotient/path correspondence;
4. an exact/FPT/certified-Pareto guarantee whose target-specific state/coupling cannot be deleted without changing native legality or declared cost; and
5. a finite Stage-A preclaim oracle and full-cost killer against the complete current composition.

If the construction reduces to a generic four-state call-graph DP, generic solver, CSR scheduling heuristic, cost tuning, or interface/ABI change, it must stop as `BELOW_Q2_STOP__NO_NON_GENERIC_CALL_EDGE_VXRM_FRONTIER_RESIDUAL`.

## Collision and evidence status

No current-source evidence retrieved here directly implements a fixed-internal-callee exit-state transfer frontier. That is not an absence claim: latest-paper coverage remains `SEARCH_BOUNDED_OPEN`, and the failed official intrinsic-spec locator is logged only as HTTP 404. The primary's cited intrinsic semantics is therefore a revision verification obligation, not an independently re-established fact in this confirmation.

The one revision is justified to answer a sharply bounded structural question, not to obtain performance results. The claim ceiling remains static Stage 0 only until a future, independent fidelity gate validates a complete native carrier.
