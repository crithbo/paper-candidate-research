# PRE_CLAIM_CONTRACT_FIDELITY_GATE

- Assignment: `STAGEA-L3-20260814-RISCV-ZCMP-CALLEESAVE-PUSHLIST-PARETODP-INITIAL-V8.7`
- Status: `FAIL_CLOSED__BLOCKED_USER_ACTION_REQUIRED`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing observation started: `false`
- Scientific revision consumed: `false`

## Ordered provenance prerequisite

`PASS_METADATA_ONLY`: the short locator resolves through official GitHub commit/tree metadata to full commit `ba5bccfe01368f76e74d6ff4c35f1330e155b4ba`, verified signature `valid`, and the 13 decisive blob IDs listed in `OFFICIAL_METADATA_PIN.yaml`. No source content or archive was downloaded.

## Obligation results

| Obligation | Required native mapping | Result | Boundary |
|---|---|---|---|
| Full replayable source pin and blob hashes | full commit, RISC-V FrameLowering/Zcmp grammar/MFI/PushPop/pseudo/RegisterInfo/TargetMachine blobs | `PARTIAL_PASS__METADATA_COMPLETE__CONTENT_AND_BUILD_INCOMPLETE` | 11/13 local blob parity; exact `RISCVInstrInfoZc.td` and `RISCVTargetMachine.cpp` content absent |
| Both plans pass MachineVerifier, assembly and CFI/unwind | exact-commit RISC-V `llc`, `llvm-mc`, `llvm-objdump/readobj`, `ld.lld` | `NOT_RUN__EXACT_NATIVE_TOOLCHAIN_MISSING` | no MIR, object, link or unwind output |
| Current union enumeration and point mapping | complete GPR RA/spill, FrameLowering, libcall control, PushPop, expansion, assembler/linker/readers | `NOT_CLOSED` | exact executable configuration grid unavailable |
| Action-path bijection and future-action preservation | every bounded state transition maps to one legal native path and all future predicates/costs preserved | `STATIC_INPUT_ONLY__NOT_EXECUTABLY_CHECKED` | cannot support candidate guarantee |
| Frame/spill/code-size/compile CPU/RSS/runtime boundaries | units and process boundaries in `EXPERIMENT_CONTRACT.yaml` | `SPECIFIED_BUT_COLLECTORS_UNTESTED` | no measurements |
| Small same-object witness | Plan P and Plan S on identical RV32 MachineFunction/behavior/psABI/CFI | `NOT_REPLAYED` | declarative Stage 0 witness only |

## Atomic-action mapping

The frozen candidate maps pre-RA colors and ordinary spill actions into the exact `RISCVFrameLowering` fixed CSR-prefix/pushability/list/adjust/frame/CFI path, then into late `RISCVPushPopOptimizer`, pseudo expansion, assembler/linker and unwind readers. The 13 source blob IDs cover those decisive paths. This mapping is not upgraded to executable parity because the exact writer/verifier chain is absent.

## Native format and comparator parity

No proxy format, hand-authored object, alternative assembler or non-exact LLVM output was used. The complete current union remains frozen without omitted arms. LLVM 22.1.8 and the AMDGPU-only build are marked version/target-mismatch controls and were not run on the witness.

## Common denominator and full cost

Both plans must use the same MachineFunction, call-clobber trace, return behavior, target, ABI and native readers. Text, frame, spill, CFI, planner, compile CPU/wall/RSS, runtime-if-available, verification and fallback boundaries are preregistered. None was measured.

## Gate disposition

The gate is `FAIL_CLOSED__RESOURCE_BLOCKED`, not a scientific failure. The contract forbids proceeding to stock replay, union mapping or the natural denominator. No PASS, STOP, revision or reserve inference is permitted.

