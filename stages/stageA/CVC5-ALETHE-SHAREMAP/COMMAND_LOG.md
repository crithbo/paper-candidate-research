# CVC5-ALETHE-SHAREMAP Command Log

- Lane: `CANDIDATE_EXECUTION_LANE_1`
- Assignment: `STAGEA-L1-20260809-CVC5-ALETHE-SHAREMAP-INITIAL-V8.7`
- Unique write directory: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\CVC5-ALETHE-SHAREMAP`
- Cross-assignment contamination: `false`
- Stage B: `false`

## 2026-08-09 — intake and freeze

1. Read the complete minimal role entry, templates, ARS experiment workflow, and only the registered CVC5 Discovery/Stage0 PRIMARY/confirmation/revision1/closing packages.
2. Recomputed frozen manifests: Discovery `4/4`, PRIMARY `4/4`, confirmation `2/2`, revision1 `3/3`, closing `2/2`; all matched registry.
3. Environment probe found no `cvc5`, `carcara`, C/C++ compiler, CMake, Ninja, Cargo, Rust, or system Python on `PATH`; Git, Node, curl, tar and a bundled Python runtime are available.
4. In-sandbox `curl.exe` failed with `SEC_E_NO_CREDENTIALS (0x8009030e)`. An approved outside-sandbox read-only query to official GitHub succeeded; no scientific inference is drawn from the sandbox transport failure.
5. Official release metadata identified cvc5 1.3.4 full commit `f3b21c4483d3b88dc63cb7cd3e5eb092eee5e341` and Windows x86_64 static asset digest `279fe7e95810cfb62433fcfc2932f35325a665f32d3697ff33f75e31d5c6a179`.
6. Official Carcara metadata identified release `carcara-1.1.0`; it provides a Linux binary only, so a release-matched Windows checker build remains required.
7. Frozen `EXPERIMENT_CONTRACT.yaml` before any claim-bearing natural corpus run.

No natural claim-bearing corpus run has started.

## 2026-08-09 — native preclaim subgate

8. Acquired only the bounded official assets needed to determine feasibility: cvc5 1.3.4 Windows static binary, exact full-commit source archive, Carcara 1.1.0 tag source, and the Alethe specification. Total network payload: `62,308,703 B`.
9. Verified the official cvc5 release archive digest `279FE7...6A179`; extracted `cvc5.exe` reports `cvc5 1.3.4 [git f3b21c4]` and has SHA-256 `FC7138...6C3B`.
10. Ran the fixed official `qgu-fuzz-1-bool-sat.smt2` proof at every integer `dag-thresh=0..64`. The first non-claim preflight used an invalid fixed tail assumption (`4..64` name-free), returned `FAIL_CLOSED`, and was retained.
11. Corrected only that preflight guard to derive the highest named threshold from the actual output. Ran `primary_v2` and independent `replay_v2`: 65/65 exits per replay were zero, seven raw behaviors were found, `@p_10=3`, `@p_12=2`, and all preregistered nonvolatile fields matched (`0` mismatches).
12. Did not create or transform an `A*` proof: a postprocessor would violate the frozen mechanism. Did not claim expanded-AST equality or Carcara acceptance.

## 2026-08-09 — fail-closed toolchain boundary and closing

13. Confirmed no C/C++ compiler, MSYS2 shell, CMake, Make/Ninja, GMP development environment, Rust, Cargo, WSL, container runtime, or QEMU is available. The official cvc5 release requires an MSYS2 CLANG64 build path on Windows; the official Carcara 1.1.0 release provides only a Linux binary.
14. Per mainline's explicit v8.4 blocker instruction, stopped further toolchain download/installation. No scientific inference is drawn from this resource boundary.
15. The complete preclaim gate remains `FAIL_CLOSED`: `NATIVE_THRESHOLD_FAMILY_REPLAY` is established; `CANDIDATE_BUILD`, `CARCARA`, exact expanded-AST fidelity, coupling/nondecomposition, and `FULL_PRECLAIM` are unestablished.
16. The 60-instance natural corpus was not frozen or run. Stage B, formal large-scale experiments, existing projects and shared controls were untouched.
17. Closing recommendation: `BLOCKED_USER_ACTION_REQUIRED`; scientific revision consumed `false`; immutable resume entry is `stages\stageA\CVC5-ALETHE-SHAREMAP\resume1`; lane returns `IDLE_REUSABLE_AWAITING_MAINLINE` after mainline acceptance.

## Exact replay commands

Run from `<LEGACY_LOCAL_PROJECT_ROOT>` with the system Node executable:

```powershell
node 'stages\stageA\CVC5-ALETHE-SHAREMAP\scripts\enumerate_fixed_native_family.mjs' 'stages\stageA\CVC5-ALETHE-SHAREMAP\third_party\cvc5-bin\cvc5-Win64-x86_64-static\bin\cvc5.exe' 'stages\stageA\CVC5-ALETHE-SHAREMAP\third_party\cvc5-src\cvc5-f3b21c4483d3b88dc63cb7cd3e5eb092eee5e341\test\regress\cli\regress0\proofs\qgu-fuzz-1-bool-sat.smt2' 'stages\stageA\CVC5-ALETHE-SHAREMAP\results\preclaim' primary_v2
node 'stages\stageA\CVC5-ALETHE-SHAREMAP\scripts\enumerate_fixed_native_family.mjs' 'stages\stageA\CVC5-ALETHE-SHAREMAP\third_party\cvc5-bin\cvc5-Win64-x86_64-static\bin\cvc5.exe' 'stages\stageA\CVC5-ALETHE-SHAREMAP\third_party\cvc5-src\cvc5-f3b21c4483d3b88dc63cb7cd3e5eb092eee5e341\test\regress\cli\regress0\proofs\qgu-fuzz-1-bool-sat.smt2' 'stages\stageA\CVC5-ALETHE-SHAREMAP\results\preclaim' replay_v2
node 'stages\stageA\CVC5-ALETHE-SHAREMAP\scripts\validate_native_family_replay.mjs' 'stages\stageA\CVC5-ALETHE-SHAREMAP\results\preclaim\native-family-primary_v2.json' 'stages\stageA\CVC5-ALETHE-SHAREMAP\results\preclaim\native-family-replay_v2.json' 'stages\stageA\CVC5-ALETHE-SHAREMAP\results\preclaim\native-family-replay-validation.json'
```

The enumerator itself records each exact cvc5 invocation for `dag-thresh=0..64`. The failed original preflight remains in `results\preclaim\native-family-primary.json` and `results\preclaim\primary\`; it is not overwritten or used as claim evidence.
