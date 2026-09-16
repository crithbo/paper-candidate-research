# Blinded executor report — Consolidated Discovery/Stage 0 V8.8-R3

## Material passport

- Assignment: `BACKTEST-EXECUTOR-20260810-CONSOLIDATED-V8.8-R3`
- Role: `DISCOVERY_BACKTEST_EXECUTOR_LANE_1`
- Method order: `CONTROL_V8_7` followed by `PROPOSED_V8_8`
- PACKER manifest SHA-256: `69357EE2B5F29FAE3CA590382EA36E87647DDAA031CFF6063AF1F6FF6AF59BBD`
- Verified sealed files: 74/74; verified bytes: 37,726,016
- External material used: `false`; auditor-key access: `false`

## Method result

All 18 opaque cases were evaluated first with the frozen control behavior and
then with the proposed behavior. The proposed run records eight structural
drops, three nonstructural-but-unfrozen cases, and seven cases requiring deep
review. Two sealed resource events remain resource-only and do not supply a
scientific negative result. No auditor threshold, calibration score, or
backtest-pass determination was made.

`EXECUTOR_RESULTS.yaml` contains every required per-case output: both run
dispositions, source-limited minimum set, collision subtraction, O/I/A_b/A_c/
P/W_m/C/F_n certificate fields, boundary statement, gate failures, and source
IDs used.

## Blindness and scope

Read PACKER material only from `sealed_input_manifest.yaml`,
`sealed_method_contract.yaml`, and `sealed_cases/C01/**` through `C18/**` after
manifest validation. Did not read auditor keys, PACKER reports, handoff/hash
files, provenance directories, historical outcomes, or external materials.
No candidate implementation, experiment, Stage 0/A/B, production-rule, or
formal-project action was performed.

## Completion

The lane is `IDLE_REUSABLE_AWAITING_MAINLINE`. This executor has not contacted
or self-dispatched an auditor; mainline acceptance is required before any
downstream handoff.
