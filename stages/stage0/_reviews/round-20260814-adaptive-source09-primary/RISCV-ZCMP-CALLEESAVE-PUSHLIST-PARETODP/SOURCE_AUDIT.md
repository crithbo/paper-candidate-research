# Source Audit — RISCV Zcmp callee-save/push-list

## Frozen discovery integrity

| Artifact | Expected SHA-256 | Independent check |
|---|---|---|
| Topic brief | `6B2030A5744AD06F89FF8AC7CE8D40306BF8DEEA4F0883EADE1BBE993A7959B2` | matched |
| Collision matrix | `384899B82FA6E6D7704056EE73A8AF4A3E40EFA773B680400C031227F6BDE096` | matched |
| Discovery log | `5F5053B944EA64762711BBB119ABA83139055EC709F956962958334349877300` | matched |
| Discovery handoff | `5B5725FC6EC679783F7921FC4F79010AFBE483A76890CB1BE0691AF22190E4ED` | matched |

## First-party / authoritative sources reviewed

1. RISC-V International, [Zc/Zcmp specification](https://docs.riscv.org/reference/isa/unpriv/zc.html), current on 2026-08-14. It defines PUSH/POP, legal register lists and stack-adjust semantics; the list is constrained rather than arbitrary.
2. LLVM, [RISC-V target guide](https://llvm.org/docs/RISCVUsage.html), current on 2026-08-14. It establishes current target architecture-string/documentation context.
3. LLVM current [`RISCVPushPopOptimizer.cpp`](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVPushPopOptimizer.cpp), inspected 2026-08-14. The pass checks Zcmp/Xqccmp, runs over existing POP/RET patterns, and preserves implicit list operands already picked by frame lowering.
4. LLVM current [`RISCVTargetMachine.cpp`](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVTargetMachine.cpp), inspected 2026-08-14. It schedules PushPop optimization in `addPreEmitPass2` before pseudo expansion.
5. LLVM current [`RISCVFrameLowering.cpp`](https://github.com/llvm/llvm-project/blob/main/llvm/lib/Target/RISCV/RISCVFrameLowering.cpp), inspected 2026-08-14. It contains current callee-save spill-slot/save-restore paths, which are included in the fair union.

## Reality-check result

`CURRENT_ACTION_CONFIRMED__JOINT_RESIDUAL_NOT_YET_PROVEN`. The current native system contains Zcmp list realization and late POPRET formation. It does not, from inspected source alone, establish a pre-RA joint FPT/Pareto action. A local read-only `git ls-remote` attempt failed with Schannel `SEC_E_NO_CREDENTIALS`; this is logged as a version-pin blocker for the revision gate, never as evidence of source absence.

## Collision classification

| Candidate component | Closest source | Classification |
|---|---|---|
| legal Zcmp list/adjust | RISC-V ISA | direct subtractor |
| selected-list POPRET rewrite | LLVM PushPop optimizer | direct subtractor |
| ordinary RA/frame/spill | LLVM backend | strong same-object baseline |
| generic integrated RA/scheduling | combinatorial codegen literature | methodological subtractor |
| bounded Zcmp-aware CSR/list/frame Pareto frontier | no eight-predicate cover verified | `SEARCH_BOUNDED_OPEN` |

No transport or source-index failure is used to infer novelty.
