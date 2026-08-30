# Source and current-union audit

## Scope and method

Checked 2026-08-14 using official LLVM upstream/current source and official LLVM/Arm materials. No candidate build, compiler run, benchmark or implementation was performed. `SEARCH_BOUNDED_OPEN` means no absence claim is made for unsearched literature.

## Source pin and local evidence

| Item | Pin / locator | SHA-256 | Finding |
|---|---|---|---|
| LLVM upstream main | `81ac5c7c26efb70ffaffb91b26053437093ee085` | — | source pin used for this audit |
| `MVETailPredication.cpp` | `llvm/lib/Target/ARM/MVETailPredication.cpp` | `89D7BAAD70E1EC9AF175C271391632B6E4923E279693D69A6BE22CDE88BCFF79` | converts active-lane masks to VCTP; `tail-predication` default enabled and exposes five modes |
| `MVETailPredUtils.h` | `llvm/lib/Target/ARM/MVETailPredUtils.h` | `D4CE910F6194FFA557F9DB17F4882961C44529BEC8C2FD8D4C3F402164301814` | maps VCTP widths to DLSTP/WLSTP forms |
| `ARMLowOverheadLoops.cpp` | `llvm/lib/Target/ARM/ARMLowOverheadLoops.cpp` | `0F9E7E386C6ED7922052B37DE124F4C0FD6B53142227BF38D2AB2C9144242265` | validates tail predication, tracks VPT state, repairs/recomputes masks, expands/reverts LOB; current tail-predication condition requires one block |
| `ARMTargetMachine.cpp` | `llvm/lib/Target/ARM/ARMTargetMachine.cpp` | `083C3CA18B05582E61D5D31058E79455BC68602EC67A0F66B8B2FA3C0AE764E5` | pipeline shows HardwareLoops, MVE tail-predication and later VPT/low-overhead-loop passes |

The archived files live under `current-source/`; they are source evidence, not a candidate artifact.

## Current native action union

| Component | Same-object native action | Why it is included |
|---|---|---|
| LoopVectorize / target TTI | creates masked active-lane vector loop and tail-folding opportunity | establishes IR input grammar |
| HardwareLoops | marks/lowers LOB components | creates current LOB candidates |
| `MVETailPredication` | converts `get.active.lane.mask` to VCTP, or reverts when unsafe | has default and non-default tail-predication modes |
| `MVETailPredUtils` | VCTP-width-to-DLSTP/WLSTP selection | complete setup form mapping |
| `MVETPAndVPTOptimisations`, `MVEVPTBlock` | current VPT optimization/block formation | cannot be omitted from baseline |
| `ARMLowOverheadLoops` | checks VCTP equivalence, instruction/LiveOut legality, branch range; rewrites VPT masks; emits LETP or normal/revert fallback | strongest current backend action union |

### Decisive current source facts

1. `IsTailPredicationLegal()` requires `!Revert`, complete LOB components, nonempty VCTP set, no invalid instruction, **and** `ML.getNumBlocks() == 1`. The comment says that current support is deliberately kept to a single block.
2. `AddVCTP()` already recognizes more than one VCTP only when operands and reaching definition match. Thus a candidate cannot call “multiple VCTPs” a new primitive without defining a cross-block reaching-definition invariant.
3. `ValidateLiveOuts()` documents that implicit tail predication can alter false lanes; the candidate must preserve these observable values and cannot claim lane-only equivalence.
4. `Expand()` chooses `MVE_LETP` only when the full legality test passes; otherwise it expands ordinary loop end or reverts. Its VPT conversion and mask recomputation are current baseline actions, not residual.

## Official / primary links

- [LLVM current MVETailPredication source](https://github.com/llvm/llvm-project/blob/81ac5c7c26efb70ffaffb91b26053437093ee085/llvm/lib/Target/ARM/MVETailPredication.cpp)
- [LLVM current ARM low-overhead-loop source](https://github.com/llvm/llvm-project/blob/81ac5c7c26efb70ffaffb91b26053437093ee085/llvm/lib/Target/ARM/ARMLowOverheadLoops.cpp)
- [LLVM current MVE tail-predication utilities](https://github.com/llvm/llvm-project/blob/81ac5c7c26efb70ffaffb91b26053437093ee085/llvm/lib/Target/ARM/MVETailPredUtils.h)
- [LLVM Doxygen: MVE tail predication](https://llvm.org/doxygen/MVETailPredication_8cpp.html)
- [LLVM Doxygen: ARM low-overhead loops](https://llvm.org/docs/doxygen/ARMLowOverheadLoops_8cpp_source.html)
- [Arm Helium programmer guide](https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/Helium%20Programmers%20Guide/Helium%20Programmers%20Guide%20Introduction%20to%20Helium.pdf)
- [LLVM Developers' Meeting: Code Generation for Arm M-Profile Vector Extension](https://llvm.org/devmtg/2019-10/slides/Meijer-Parker-CodeGenForTheArmM-ProfileVectorExt.pdf)

## Direct-collision conclusion

No source found in this bounded audit directly supplies a multi-basic-block, same-semantics MVE tail-predicated plan constructor with the proposed finite state and guarantee. This is `SEARCH_BOUNDED_OPEN`, not proof of absence. Conversely, the common VPT reconstruction, VCTP equivalence, LOB setup/end lowering, validity checks and fallback are directly absorbed by current LLVM and must not be claimed.

## Required revision evidence

The revision must pin an actual public in-tree two-basic-block MIR/IR or create a minimal source-pinned static witness from an existing public source test; enumerate two full native legal plans; show their action divergence is not an existing flag/path; and define an MVE-specific, future-action/legality/cost-preserving state and recurrence. A generic CFG scheduler, a flag change, or a source patch without these is not evidence.

