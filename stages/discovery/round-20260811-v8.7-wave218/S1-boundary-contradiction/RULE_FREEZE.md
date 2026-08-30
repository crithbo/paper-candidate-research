# Rule freeze — Wave 218

- Assignment: `DISCOVERY-S1-20260811-V8.7-WAVE218-ARM-SVE-PCS-CALLSTATE-JOINTCODEGEN-DEPTH`.
- Scope is exactly the non-SME AArch64 SVE PCS call-state seam from Wave211 D01. This is a fresh depth red-team; no Wave211 negative conclusion is inherited.
- Frozen method: `v8.7 + R5-P0`; `DISCOVERY_QUALITY_MODE=OFF`; R7 behavior is not used.
- Frozen controls: plan `8F5D28A6DEF89374670D8F3195B6422A742B2F15CB5D1F485527BA19B031942C`; registry `8FE2036D9D6DC07274F0EDAE7333B4868444197341DF059ADF8F16675CA0630B`; ROLE_DISCOVERY `FCB9BD73C39F39D31F6C8154E6B48EA23187FF28BDF2BB3D9C59E3D28FA518A3`.
- Evidence cutoff: 2026-08-11. Sources are official Arm ABI material plus current upstream LLVM/GCC source or official documentation.
- No compilation, execution, benchmark, download, Stage0/A/B activity, or shared-control edit occurred.

## Decision rule

The candidate must retain the same source program, AArch64 target, public calling convention, values, exception behavior, and separately compiled ABI. A changed PCS or a transformation that merely selects flags, threshold values, ordinary spill heuristics, generic ILP, inlining, or a tail call is not an N2 constructor.
