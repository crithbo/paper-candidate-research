# CVC5-ALETHE-SHAREMAP Stage A Resource Resume Report

- Lane id: `CANDIDATE_EXECUTION_LANE_1`
- Assignment id: `RESOURCE-STAGEA-L1-20260811-CVC5-ALETHE-SHAREMAP-RESUME3-R3C1`
- Cross-assignment contamination declaration: `false`
- Decision: `BLOCKED_USER_ACTION_REQUIRED__ROUTES_EXHAUSTED__R3H_RECOMMENDED`
- Quality tier: inherited `TIER_B_Q2_VIABLE`; not rescored
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Novelty route: inherited `N2`; not tested here
- Stage semantics: resource recovery before Stage A claim-bearing execution

## Pre-claim contract fidelity gate

The resource prerequisite failed closed. Exact source, provenance, Apache-2.0
license and Rust/Cargo 1.72.0 closed, but the final authorized clean build could
not link the Rust GNU build scripts because the registered bootstrap exposes no
`libgcc_eh` or `libgcc`. No Carcara executable exists; therefore version/help,
stock checker smoke, exact expanded-AST equality, global-coupling witness and the
natural 60-instance probe were not run.

## Frozen contract and routes

The only object retained is Carcara 1.1.0 at commit
`5d817d86bd18ea2a850a580d602f17f36959ee99`, built from the unmodified source
archive and unchanged `Cargo.lock` with Rust 1.72.0. R3A bootstrap reuse, one clean
build and one mechanically corrected clean build were exercised. Details and
exact log hashes are in `ROUTES_EXHAUSTED.yaml`.

## Highest-risk probe result

No scientific probe occurred. The failure is a Windows GNU linker-resource
failure, not evidence about candidate legality, native-family absorption, checker
acceptance, action rate or full-cost residual. Scientific PASS and STOP are both
inadmissible.

## Reproducibility and safety

Commands, exact source/tool hashes and logs are retained. Source and `Cargo.lock`
hashes remained unchanged. No source/dependency/test patch, Cargo feature change,
third build, system install, global environment mutation, WSL/VM, GPU, Stage B,
automation, formal project, external submission or shared-control write occurred.

Post-entry plan/registry/role drift was recorded without importing new rules or
facts; the assignment retained its entry freeze.

## User-action blocker

- Claim-bearing observation obtained before failure: no
- Scientific revision consumed: no
- Immutable failure directory: `stages\stageA\CVC5-ALETHE-SHAREMAP\resume3`
- Blocker packet: `USER_BLOCKER_PACKET.md`
- R3H recommendation: reversible resource-blocked reserve, applied only by mainline
  after accepting route exhaustion; this lane does not modify registry state.

Stage B authorization remains false and approval remains null.
