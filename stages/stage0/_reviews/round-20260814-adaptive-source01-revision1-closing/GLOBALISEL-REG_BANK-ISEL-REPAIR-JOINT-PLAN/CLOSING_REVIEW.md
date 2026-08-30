# Independent revision-1 closing — GlobalISel RBI joint plan

## Decision

| Field | Result |
|---|---|
| Assignment | `STAGE0-C2-20260814-GLOBALISEL-REG_BANK-ISEL-REPAIR-JOINT-PLAN-REVISION1-CLOSING-V8.7` |
| Revision gate reviewed | `PINNED_RBI_ACTION_CATALOG__NONLOCAL_BOUNDED_REGION_CERTIFICATE` |
| Revision budget | `1/1 consumed` |
| Closing decision | `INCONCLUSIVE_POLICY_HOLD` |
| Scientific STOP | `not established` |
| Stage A / B | `false / false` |

The revision package is internally coherent about the intended same-GMIR action family and about the scope of its claimed exactness, but its decisive witness cost certificate is false.  It therefore cannot support `CONFIRM_STAGE0_PASS`.  This is not evidence that the research object is absorbed or impossible, so it also cannot support a scientific `STOP`.  With the one ordinary revision already consumed, the required disposition is `INCONCLUSIVE_POLICY_HOLD`; no second revision is authorized.

## Immutable-input check

The revision manifest's four canonical files verify against their listed hashes.  I independently attacked the declared AArch64 `s64` two-load / `G_OR` / `G_FADD` witness, the current Fast/Greedy and `RepairingPlacement` union, and the A64-RBI-FDP path/frontier certificate.  An attempted direct retrieval of the immutable GitHub blob encountered a TLS transport failure; that transport failure is not used as an absence, absorption, or scientific-negative inference.  The cost contradiction below is independently reproducible from the current official LLVM source semantics and the revision's own stated API usage.

## Decisive failure: the 4-versus-9 ledger is not the native ledger

The certificate declares four unit mapping costs and one `GPR -> FPR` repair of cost 5, hence `P_local = 4 + 5 = 9` and `P_joint = 4`.  The native cost call used by `RegBankSelect` is instead:

`copyCost(*DesiredRegBank, *CurRegBank, ...)`

For the final `G_FADD`, the desired bank of `%x` is FPR while its current bank in `P_local` is GPR.  The call is consequently `copyCost(FPR, GPR)`, which the AArch64 RBI assigns cost **4** (`FMOVDXr/FMOVSWr`), not 5.  The opposite argument order, `copyCost(GPR, FPR)`, is the cost-5 direction.  The current official source exposes both asymmetric branches, and `RegBankSelect` exposes the desired/current call ordering.  [AArch64 RBI source](https://llvm.org/doxygen/AArch64RegisterBankInfo_8cpp_source.html) [RegBankSelect source](https://llvm.org/doxygen/RegBankSelect_8cpp_source.html)

Thus, under the revision's stated unit costs, the re-computation is:

| Plan | Mapping costs | Repair cost | Declared native total |
|---|---:|---:|---:|
| `P_local` | `1 + 1 + 1 + 1 = 4` | `copyCost(FPR,GPR) = 4` | **8** |
| `P_joint` | `1 + 1 + 1 + 1 = 4` | `0` | **4** |

The difference may still suggest an action divergence, but it is not the frozen `4 vs 9` witness.  This is material: the witness's precise native cost, Pareto member, and exact-frontier proposition are all part of the one gate-bearing certificate, not an optional narrative number.  A closing reviewer cannot silently replace that proposition with a corrected `4 vs 8` variant after the sole revision has been consumed.

## Other closing attacks

The source-supported portions do not cure the failed ledger:

- AArch64 currently provides equal-cost GPR/FPR alternatives for the restricted 64-bit `G_LOAD` and `G_OR` forms in GPR-first order.  Greedy updates only on strict cost improvement, so the stated tie behavior is plausible. [AArch64 RBI source](https://llvm.org/doxygen/AArch64RegisterBankInfo_8cpp_source.html) [RegBankSelect source](https://llvm.org/doxygen/RegBankSelect_8cpp_source.html)
- `RepairingPlacement` is a real mandatory baseline with assignment, insertion, and CFG-sensitive placement behavior.  It does not, on the supplied static evidence, establish a general rollback of already chosen predecessor RBI mappings.  This leaves an action-divergence hypothesis, but does not validate the revision's incorrect cost certificate.
- The A64-RBI-FDP state separation (`B,R,I,H`) is a credible formulation for exactness on its explicitly finite grammar only if every transition is priced from the complete pinned catalog.  Because the witness's catalog-cost use is wrong, the submitted action/path and Pareto certificate is not closed.  Its FPT bound is therefore not accepted as a theorem for the declared cost vector.
- The proposed Stage A preclaim oracle, full-cost ledger, and up-to-20-region killer remain finite and appropriately downstream-facing.  They may not be executed at Stage 0 and cannot retroactively repair the static error.

## Boundary and required disposition

No source establishes that current Fast/Greedy/RepairingPlacement already expresses a complete target-specific bounded-region optimizer, and the collision record remains `SEARCH_BOUNDED_OPEN`.  Therefore this review makes no `BELOW_Q2_STOP` finding.  Conversely, the exact cost certificate required for PASS fails now; lack of a build, native output, corpus result, or performance gain is not part of this decision.

The sole ordinary revision is exhausted.  The mainline must preserve the frozen material and register the exact blocker as `INCONCLUSIVE_POLICY_HOLD__WITNESS_DECLARED_COST_NOT_NATIVE_ACTION_COST`.  It must not automatically create a second revision, Stage A/B assignment, reserve conversion, or scientific STOP.  Only a future user-authorized exceptional assignment with a new explicit gate and write boundary could revisit a corrected static certificate.

Lane terminal state: `IDLE_REUSABLE_AWAITING_MAINLINE`.
