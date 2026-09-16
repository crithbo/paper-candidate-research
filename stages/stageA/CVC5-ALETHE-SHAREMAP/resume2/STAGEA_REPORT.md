# CVC5-ALETHE-SHAREMAP Stage A Resume2 Report

- Lane id: `CANDIDATE_EXECUTION_LANE_2`
- Assignment id: `RESOURCE-STAGEA-L2-20260811-CVC5-ALETHE-SHAREMAP-RESUME2-R2BC`
- Decision: `BLOCKED_USER_ACTION_REQUIRED`
- Quality tier: inherited conditional `TIER_B_Q2_VIABLE`; not reassessed
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Novelty route: conditional `N2`
- Cross-assignment contamination: `false`

## Resource phase

R2B required an unmodified Carcara 1.1.0 Windows x64 executable with official
release provenance, Apache-2.0 license, actual bytes/SHA-256, version/help and a
minimal stock checker smoke.

The official release metadata and exact tag commit were verified. GitHub reports
commit `5d817d86bd18ea2a850a580d602f17f36959ee99` as validly verified, and the
repository license as Apache-2.0. However, the release publishes only
`carcara-linux` (5,402,048 B). No Windows asset appears in the release, registry,
incoming directory or D-root filename scan.

Because no executable exists, bytes/SHA-256, version/help and checker smoke cannot
be completed. Downloading the Linux asset or weakening the checker contract is
forbidden. Resource status is therefore `FAIL_CLOSED`.

## Pre-claim contract fidelity gate

- Gate status: `FAIL_CLOSED_AT_RESOURCE_PREREQUISITE`
- Candidate/native action mapping: frozen from the original contract; not run
- Comparator semantics: current cvc5 letifier plus complete finite `dag-thresh`
  family and sharing-disabled ablation; not rerun
- Checker parity: unavailable
- Exact expansion/step/rule fidelity: not run
- Global coupling/decomposition: not run
- Full-cost dimensions: frozen but not instantiated
- Claim-bearing run after gate PASS: `false`; no run started

## Frozen StageA object

The object remains cvc5 1.3.4 commit
`f3b21c4483d3b88dc63cb7cd3e5eb092eee5e341`, the same theorem/proof
steps/rules/premises/expanded ASTs, standard Alethe and stock Carcara 1.1.0. The
candidate remains exact bounded-frontier scope-forest weighted selection in the
same printer-side contract. Postprocessing, threshold tuning, weak checkers and
generic-solver replacement remain prohibited.

## Evidence and scientific disposition

This assignment produced resource metadata only. It did not test `A*`, exact
expansion, Carcara acceptance, nondecomposition, outside-family natural incidence,
bytes/checker benefit or full-cost Pareto residual. The previous 65×2 threshold
replay is not a new resume2 observation.

No scientific PASS, STOP, reserve or tier change is supported. The scientific
revision remains unconsumed. R2C automatic StageA execution was correctly not
triggered because R2B did not PASS.

## Control-drift handling

The frozen plan and registry hashes matched at entry. A terminal check observed
later mainline versions (`plan` `41DA0FA8…6E08`, `registry`
`340DB5BB…F6C0`). The assignment retains its entry freeze; no later shared facts
were imported and this lane modified no shared control.

## Full-cost and AI ledger

- Network payload: `0 B`
- CPU-intensive execution: none
- New tool/data bytes: `0 B`
- Claim-bearing observations/natural instances: `0 / 0`
- AI work: provenance verification, resource search, contract and blocker closure
- Human/mainline dependency: supply a checksum/provenance-frozen Windows binary

## Mandatory boundaries

- `pending_user_stageb_review=false`
- `stageb_user_approval_id=null`
- `stageb_authorized=false`
- Independent StageA gate: not requested while resource-blocked
- Lane may be released; topic remains recoverable at StageA
