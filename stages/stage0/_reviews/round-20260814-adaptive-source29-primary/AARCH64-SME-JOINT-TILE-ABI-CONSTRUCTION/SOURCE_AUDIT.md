# AARCH64-SME-JOINT-TILE-ABI-CONSTRUCTION — independent source audit

## Current-source pin and acquisition

- Check date: 2026-08-14.
- Official query: `git ls-remote https://github.com/llvm/llvm-project.git refs/heads/main`.
- Pinned commit: `81ac5c7c26efb70ffaffb91b26053437093ee085`.
- Public source only; no build, `llc`/MLIR invocation, candidate code, benchmark or hardware use.

| Source blob | SHA-256 | Finding |
|---|---|---|
| `llvm/lib/Target/AArch64/MachineSMEABIPass.cpp` | `92C0AA3D7BCCDDC12CD6CA9FCAA956667A190B282B76FEF1546089540919063B` | whole-CFG ZA state collection, bundle assignment, state transitions and save-buffer allocation |
| `llvm/lib/Target/AArch64/SMEPeepholeOpt.cpp` | `311045BB2D21CB0780FFF11B37168C150D5F0C9D61C5B94EEA63C9B63EB9E7FB` | current native cleanup of adjacent SM start/stop pairs |
| `llvm/lib/Target/AArch64/AArch64TargetMachine.cpp` | `AADE82478EAFAB847718C3EBDE7031A9EBB9DCE1AF0314CC6DC00CD352347C9A` | pass ordering and default/nondefault streaming controls |
| `llvm/lib/Target/AArch64/AArch64SMEAttributes.{cpp,h}` | `FE2418F699AD9D758314507286A449C06A3925A9885B76AD6D61759626DBE064`; `AED5D783E630D819B85B66C15C274A68C6EAA18EE87B6A124A6ADF4B80BDA61F` | interface state predicates |
| `mlir/lib/Dialect/ArmSME/Transforms/TileAllocation.cpp` | `E5EC418EA05F37AFF1E4AD94B24CC8836A576CFF6D51426FF56730507B7B4F29` | current greedy tile-ID allocation, masks/liveness/spill handling |
| `mlir/lib/Dialect/ArmSME/Transforms/EnableArmStreaming.cpp` | `07DFA012D0837013A6F10287E2AAAB3E60CABE4933EB96A45B248BF3185D5C53` | current function mode preparation |
| `llvm/test/CodeGen/AArch64/aarch64-sme-za-call-lowering.ll` | `6832FD5CD51BD3617374585FC9A5889ED91D58C875D8BA3FC8A264FB9EA43796` | native lazy-save/call-state carrier |
| `llvm/test/CodeGen/AArch64/aarch64-za-clobber.ll` | `B006245D402CF9BD869714F41F4A09846FA4A5AD2D945B990418A37FA2033BEE` | ZA/ZT0 clobber semantics boundary |

## Primary official evidence

- [LLVM SME documentation](https://llvm.org/docs/AArch64SME.html) fixes attributes, compiler-inserted SM changes, private-ZA lazy-save/restore and its pre-SelectionDAG ABI pass.
- [current MachineSMEABI source documentation](https://llvm.org/docs/doxygen/MachineSMEABIPass_8cpp.html) identifies the native ABI pass.
- [Arm SME architecture supplement](https://documentation-service.arm.com/static/6526e1bd9e189a266cef8412) fixes streaming/ZA instruction legality and virtual tile identities.
- [current MLIR ArmSME pass documentation](https://mlir.llvm.org/docs/Passes/) is the official mode/conversion locator.

## Literature and direct-collision boundary

| Source | Role | Result |
|---|---|---|
| Mössenböck & Pfeiffer linear scan work, cited by current TileAllocation source | generic tile-allocation genealogy | subtractor only; not an ABI joint constructor |
| *Hello SME!* (SC Workshops 2024) | SME code-generation/kernels | different object: hand kernel generation, no LLVM/MLIR SME ABI constructor |
| LLVM source/docs | current direct action evidence | enough to establish component absorption/factorization |

No statement of literature absence is made. `SEARCH_BOUNDED_OPEN` remains true for a paper claiming the exact all-facet constructor, but the scientific STOP does not depend on absence: the frozen action lacks a same-object non-product channel in current native semantics.

## Reproducibility route

The correct Stage-A preclaim route would require a single source-level representation carrying both MLIR tile IDs and the backend ABI state, with two stock-native-legal plans. Current public carriers do not furnish that representation, and inventing it changes the contract. No such run is authorized.

