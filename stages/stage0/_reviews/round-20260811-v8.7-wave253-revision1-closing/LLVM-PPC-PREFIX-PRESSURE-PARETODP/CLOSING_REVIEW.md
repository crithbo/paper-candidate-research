# LLVM-PPC-PREFIX-PRESSURE-PARETODP — revision1 independent closing review

## Frozen disposition

- Assignment: `STAGE0-C2-20260811-LLVM-PPC-PREFIX-PRESSURE-PARETODP-REVISION1-CLOSING-V8.7`
- Decision: `CONFIRM_STAGE0_PASS`
- Tier: `TIER_B_Q2_VIABLE__CONDITIONAL_STATIC_CERTIFICATE`
- Revision allowance: consumed (`1/1`); no second revision is created or authorized.
- StageA/B authorization: `false` / `false`
- Evidence ceiling: `STATIC_NATIVE_WITNESS_AND_BOUNDED_INTERFACE_CERTIFICATE_ONLY`. No compiler output, natural occurrence, empirical benefit, or completed theorem is asserted.

## Integrity and search boundary

The frozen controls matched the assignment: `AGENTS.md` `66231F71EF6AB250A1AD9FF576D5840978F09EFC03BF5D2F0527D47F4D82B063`; `plan.md` `F3FAD538DF580A6BC9A70FC2AD5203F0D36B0B31F371BFA5E294BA2D1D25D690`; `registry.yaml` `E958B8A074F222213DCD918CBB20A362A40A09A27040C9F94A2C3CDA41D004D5`; and `ROLE_STAGE0_REVIEW.md` `741EC3544797FF8A5BF337E1E3448B5F683823E5229F818F162834400581626E`.

PRIMARY, independent confirmation, and revision1 were read as the minimal frozen upstream packet. Revision1 report/audit/claim/handoff/manifest match the supplied hashes (`4/4`). Latest collision remains `SEARCH_BOUNDED_OPEN`; a retrieval/cache failure is not used as an absence inference.

## Independent closing attack

### 1. Non-GOT PCREL34 witness

The witness fixes the same object tightly: Power10, ppc64le Linux ELFv2, medium code model, a pre-form MachineIR trace, fixed alias facts and semantics, fixed call-clobber/frame/unwind rules, and a defined non-preemptible `dso_local`/hidden symbol. `D` is a direct loaded-value `PLDpc` access carrying a non-GOT `R_PPC64_PCREL34` action; `M` is `PADDI` address materialization followed by ordinary loads. The two forms are semantically comparable on the declared nonvolatile-load contract, but `M` has an address value whose live range crosses the call and therefore creates distinct legal callee-save/spill/frame choices.

This is not the current GOT relaxation in disguise. The audited `isGOTPLDpc` path requires a `PLDpc` global-symbol case with a GOT target flag; the witness is explicitly non-GOT and local/hidden. The current linker distinction is also retained: a loaded-value `pld` and address-producing `paddi` do not have interchangeable semantics. PCREL34 application is modelled as a typed terminal action, rather than assumed absent. This is a static native action divergence only; Stage A must still assemble, link, inspect relocations/unwind, and run the semantic oracle.

### 2. Complete native grammar and PPC-TPD quotient

The revision's action map contains form/value-kind choice, symbol-binding/relocation pair, legal PPC register-role transition, coalesce/copy, native spill/frame/unwind action, MC emission, and link action, while retaining fixed source/CFG/ABI/linker/object semantics. The strongest current composition includes form selection, greedy/PBQP RA, coalescing/spills/frame handling, default-on PPC pre-emit and late peepholes, typed MC relocation emission, `ld.lld` PCREL34/GOT-PCREL34 handling, and the finite legal configuration grid. Form-fixed/current-RA and form-aware/fixed-RA are included required ablations.

PPC-TPD's state retains value kind, binding/relocation/link labels, fixed operand/register-class constraints, ABI caller/callee status, live interference and remaining ports, spill/frame/unwind obligations, pre-emit/link status and exact Pareto cost. A physical register may be folded only when its *complete* native action signature is identical; any future-distinguishing identity remains labelled and is counted in the interface. Equal states therefore have a label-preserving correspondence for every remaining D/M, RA, copy/coalesce, spill/reload, call, prologue/epilogue, MC, and lld action, as well as the declared cost vector.

This is sufficient to reject the generic-solver/identity-enumeration objection at the Stage 0 ceiling: the algorithm's recurrence depends on direct-value versus address semantics, PCREL/link labels, ELFv2 register/frame duties, and typed relocation actions. Removing those terms yields the pre-registered generic RA/scheduling failure mode. The stated bound, `O(N*f(w,r))`, is honest about exponential visible width/register-role parameters and returns `INTERFACE_CAP_EXCEEDED` instead of a positive heuristic claim. It asserts neither polynomial time nor unrestricted RA exactness.

### 3. Current-union and collision attack

The default-on `ppc-pcrel-linker-opt` and `ppc-late-peephole` controls are inside the baseline union, not omitted alternatives. The GOT `PLDpc` optimization is a direct subtractor for the prohibited GOT witness; it does not reproduce the frozen non-GOT direct-value/materialized-address action pair with its address-across-call pressure. GCC/binutils remain deployment subtractors and generic CP/ILP/Unison remain model/audit subtractors, not automatic equivalents of the frozen LLVM MachineIR action grammar and full-cost guarantee.

No supplied first-party source or bounded latest-collision material establishes a same-object LLVM/lld construction of the complete non-GOT PPCREL34 trace frontier or its future-native-action-preserving exact/certified guarantee. This is not a novelty proof; it supports only `SEARCH_BOUNDED_OPEN` and the narrow static claim ceiling.

### 4. Finite Stage A fidelity/full-cost killer

The proposed first preclaim gate is finite and reviewable: pin LLVM/LLD, Power10 features, triple, ELFv2, code model and binding; validate assembler/MC, `llvm-readobj` relocations/addends, disassembly, `ld.lld`, DWARF/unwind and semantics; then replay the complete union over 10–50 public LLVM PPC tests/Test-Suite functions. The ledger includes model/optimizer and compile/link CPU/RSS, text, relocations, spill/copy/frame effects, verification and runtime.

The kill conditions are concrete: no legal non-GOT direct pair; any object/relocation/unwind/semantic mismatch; union reproduction of the action or guarantee; cap-only/non-action frontier; or no p50/p90 full-cost Pareto residual. Missing implementation or an as-yet unobserved gain is not a STOP basis.

## Decision rationale

`CONFIRM_STAGE0_PASS` is justified. Revision1 statically closes the sole gate with a legal non-GOT witness outside the audited GOT relaxation, a complete native action map/current union, a future-native-action/legality/cost preserving target quotient, an honest bounded exact-or-cap-failure guarantee, and a finite full-cost falsifier.

Neither scientific STOP nor `INCONCLUSIVE_POLICY_HOLD` is warranted: no same-object violation, direct absorption, formal contradiction, or unresolved underdefinition of the consumed gate was established. This PASS must not be mistaken for a compiler or performance result and does not start Stage A/B.

## Mandatory Stage A preclaim fidelity gate

Before any claim-bearing Stage A observation, an authorized owner must:

1. Reproduce the exact direct non-GOT PCREL34 and `PADDI+LD` witness under the frozen ABI/code-model/binding/call contract.
2. Verify assembler, typed relocations/addends, disassembly, `ld.lld`, DWARF/unwind and semantic equivalence.
3. Prove catalog coverage and replay the entire current LLVM/lld union on the same action surface.
4. Check tiny PPC-TPD frontiers and state merges against exhaustive legal native traces.
5. Charge the complete optimizer/model-to-compile/link-to-verification/runtime ledger and enforce the registered no-gain killer.

This closing lane performs none of those runs.
