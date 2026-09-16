# Identity preflight

## FPMR/FP8 call-boundary raw

- Exact object: AArch64 FP8-call ABI preservation and restoration of the FPMR-related state at an interprocedural boundary, with the same AAPCS64 calling convention, observable values/exceptions, and native code-generation endpoint.
- Relation to cooled identities: `RELATED`, not identity-equivalent. Earlier Arm SME/ZA work concerns scalable-matrix/streaming state; this raw freezes FP8/FPMR ABI state and a distinct fixed-FP8 caller/callee endpoint.
- Relation to broad compiler/ABI work: `RELATED` only. Toolchain or ISA overlap alone is not a terminal-containment certificate.
- Certified exact repeat: none found in the bounded project/assignment material consulted for this selection. This is not a novelty conclusion; direct-collision closure remains a Stage 0 debt.

## CUDA cluster locator

- Exact object: cluster barrier commitment under fixed CUDA kernel-result semantics.
- It is not admitted as an evidence-qualified raw, so no opportunity-family claim or exact-repeat conclusion is made.
