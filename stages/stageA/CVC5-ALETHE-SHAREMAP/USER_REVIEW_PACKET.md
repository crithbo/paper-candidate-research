# CVC5-ALETHE-SHAREMAP User Review Packet

- Stage: `Stage A`
- Lane id: `CANDIDATE_EXECUTION_LANE_1`
- Assignment id: `STAGEA-L1-20260809-CVC5-ALETHE-SHAREMAP-INITIAL-V8.7`
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: inherited conditional `TIER_B_Q2_VIABLE`; no new scientific adjudication
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NATIVE_THRESHOLD_FAMILY_REPLAY_ESTABLISHED__CANDIDATE_BUILD_CARCARA_FULL_PRECLAIM_UNESTABLISHED__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing observation obtained: `no`
- Scientific revision consumed: `no`
- Pending user Stage B review: `no`
- Stage B authorized: `false`
- Stage B user approval id: `null`

## What is established

The frozen upstream manifests match. Official cvc5 1.3.4 source and Windows binary were acquired and hashed. On the fixed official proof, every integer threshold `0..64` was run twice: the native output has `@p_10` count 3 and `@p_12` count 2, seven distinct raw outputs, and zero nonvolatile replay mismatches.

## What is not established

No printer-side candidate exists on this host; no Carcara run, expanded-AST equality, coupling witness, natural action-rate result, full-cost result, p50/p90 frontier, PASS, STOP, or paper conclusion exists.

## Exact object and narrow claim boundary

cvc5 1.3.4 commit `f3b21c4483d3b88dc63cb7cd3e5eb092eee5e341`, the unchanged fixed SMT-LIB input and proof, same step/rule/expanded AST semantics, Alethe, and Carcara 1.1.0. The only candidate action allowed is global scope-forest weighted named-term selection in the same printer-side construction path.

## Decisive evidence or preclaim boundary

The native mechanical portion passed. The full preclaim gate remains `FAIL_CLOSED` because candidate build/checker/equivalence/coupling components were not executable. The 60-instance corpus was correctly not started.

## Fair baseline and full-cost status

The complete native threshold envelope and sharing-disabled ablation are frozen. Candidate and checker costs are absent, so full-cost and Pareto status are undefined.

## Reproducibility and integrity

All acquired archives, key source files, fixed input, native outputs and validators are hashed. The initial failed tail-assumption control is retained. No previous assignment fact or path was reused.

## User action requested

- Why user action is needed: the host lacks the compiler/build/checker toolchains required by the non-relaxable same-printer-side and Carcara gates.
- Minimum action: provide/point to a frozen MSYS2 CLANG64 plus Rust/Cargo environment, provide equivalent portable assets, or explicitly authorize a bounded portable acquisition in the resume directory.
- Acceptable alternatives: a user-built Windows Carcara 1.1.0 binary plus a cvc5-capable compiler, or an authorized Linux/WSL environment keeping artifacts under the D-drive project root.
- Resume directory and frozen contract: `stages\stageA\CVC5-ALETHE-SHAREMAP\resume1`; `EXPERIMENT_CONTRACT.yaml` SHA-256 `27CDF36933F93B0C096AA73DA6A9DC49505872B0D0A7A565EE959F5EF7331FA3`.

## Recommended next state

`BLOCKED_USER_ACTION_REQUIRED`

This packet is a review aid. It does not authorize Stage B or a formal paper project.
