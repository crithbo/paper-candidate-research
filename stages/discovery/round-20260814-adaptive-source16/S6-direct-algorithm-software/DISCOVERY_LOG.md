# Discovery log — Source16 semantic-residual triage

## Frozen contract and result

Assignment `DISCOVERY-S6-20260814-ADAPTIVE-SOURCE16-SEMANTIC-RESIDUAL-V1`
uses canonical v8.7 potential/readiness separation; `DISCOVERY_CLAIM_PACK_MODE` is
`OFF`. This is the R21 `SEMANTIC_RESIDUAL_SOURCE_TRIAGE_V1` pilot. Network
security, vulnerability, attack/defense, exploit, protocol-security, and
malicious-traffic families were excluded before screening.

**Result: `COMPLETE_ZERO_PROPOSALS`.** Six independent non-security families
received an opportunity-anchor / current-union / strongest-subtractor /
carrier-or-oracle card before any depth decision. Two met the pre-outcome
two-plan skeleton requirement and were deeply reviewed. Neither left a
target-specific, same-object N2 guarantee after subtraction. The third-depth
trigger (three role-complete D1 cards) was not met, so no outcome-aware
replacement or extra depth was performed.

## Current-source reality check

The neutral snapshot was 2026-08-14. LLVM current documentation was read for
SME, SPIR-V, RVV, DirectX and target-independent code generation [S1–S5]. The
official documentation exposes the relevant semantic contracts and options;
LLVM's published doxygen also records target source loci. A read-only attempt
to pin upstream `llvm-project` HEAD failed locally with
`schannel: AcquireCredentialsHandle failed: SEC_E_NO_CREDENTIALS`. This is an
environmental source-fetch limitation, not absence evidence. No conclusion in
this package relies on that failure. For each source-unclosed raw facet, this
is the one permitted source-only closure; it is not carried forward as an
absence claim.

## Funnel

| Stage | Count | Result |
|---|---:|---|
| Unique opportunity families | 6 | Triad complete at screening level |
| Candidate-grade deep reviews | 2 | D1 SME; D2 SPIR-V cooperative matrix |
| Third-depth trigger | 0 | Fewer than three pre-outcome D1-witnessable cards |
| PROPOSE_STAGE0 | 0 | No clean same-object residual |
| Structural drops | 4 | Fixed contract/current union/generic residual |
| NOT_ADMITTED_UNFROZEN | 0 | No repeated missing facet was pursued |

## Triage cards

| ID | Opportunity anchor and exact object | Current native union | Strongest subtractor | Carrier / oracle | Triage disposition |
|---|---|---|---|---|---|
| R1 | LLVM AArch64 SME: fixed IR, call graph, ACLE attributes and ABI-visible PSTATE.SM/ZA behavior; joint placement of legal mode transitions and preservation actions. | Attribute/callsite lowering, `SMSTART/SMSTOP`, conditional pseudos, SelectionDAG chains/glue, register allocation and ABI lowering [S1]. | SME ABI itself plus LLVM `SMEABIPass`; any schedule must preserve call-boundary state. | LLVM AArch64 tests; assembly plus ABI/call-result equivalence. | Deep D1. |
| R2 | LLVM SPIR-V cooperative matrix: fixed kernel, capability set, matrix dimensions/types and SPIR-V observable result; candidate joint capability/operation construction. | SPIR-V target capability/extensions, LLVM lowering and SPIR-V validation contract [S2]. | SPIR-V cooperative-matrix specification/capability semantics and current target lowering. | SPIR-V validator plus OpenCL kernel corpus. | Deep D2. |
| R3 | LLVM RVV: fixed vector IR and `AVL`, mask, tail/mask policy semantics; joint `vsetvli` state construction. | RVV intrinsics, VL/VTYPE pseudos and `RISCVVLOptimizer` [S3]. | Current VLOptimizer and target-independent vector combines. | LLVM RVV tests; IR/assembly and scalar-reference oracle. | `STRUCTURAL_DROP__CURRENT_VL_OPTIMIZER_OR_GENERIC_STATE_SCHEDULING`. |
| R4 | LLVM DirectX: fixed DXIL resource set, aliases and shader behavior; resource-binding/handle construction. | DXIL target resource handling, root-signature and semantic-signature paths [S4]. | DXIL resource contract and current lowering; arbitrary binding changes resource-interface identity. | DXIL validator/runtime reader. | `STRUCTURAL_DROP__RESOURCE_INTERFACE_OR_GENERIC_BINDING_LAYOUT`. |
| R5 | MLIR ArmSME: fixed ArmSME operations, tile state and result; tile-load/store/outer-product lowering. | ArmSME dialect operations and lowering surface [S5]. | AArch64 SME ABI/lowering family R1; same action/mechanism identity. | MLIR verifier plus LLVM lowering. | `EXCLUDED_REPEATED__AARCH64_SME_FAMILY_CONTAINMENT`. |
| R6 | LLVM SystemZ: fixed MIR and z/Architecture result; post-RA scheduling after branch relaxation. | Target-specific post-RA scheduler and branch-relaxation composition [S6]. | Current SystemZ post-RA scheduling plus established target scheduling literature. | LLVM SystemZ MIR tests and code/result oracle. | `STRUCTURAL_DROP__GENERIC_SCHEDULING`. |

## No scientific inference from readiness

No candidate was dropped because of unavailable hardware, unimplemented code,
missing experiment, or AI readiness. The zero result follows only from
same-object semantic restriction, current-union absorption, repeated-family
containment, or a generic non-target-specific residual.

## Sources

* [S1] LLVM, *Support for AArch64 Scalable Matrix Extension in LLVM*, current
  documentation: https://llvm.org/docs/AArch64SME.html
* [S2] LLVM, *User Guide for SPIR-V Target*, current documentation:
  https://llvm.org/docs/SPIRVUsage.html
* [S3] LLVM, *RISC-V Vector Extension*, current documentation:
  https://llvm.org/docs/RISCV/RISCVVectorExtension.html
* [S4] LLVM, *User Guide for the DirectX Target*, current documentation:
  https://llvm.org/docs/DirectXUsage.html
* [S5] MLIR, *ArmSME Dialect*, current documentation:
  https://mlir.llvm.org/docs/Dialects/ArmSME/
* [S6] LLVM current SystemZ target source API (post-RA scheduler declaration):
  https://llvm.org/docs/doxygen/SystemZTargetMachine_8h_source.html
