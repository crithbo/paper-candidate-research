# V8.8-R3 consolidated Discovery/Stage 0 audit

Assignment: `BACKTEST-AUDITOR-20260810-CONSOLIDATED-V8.8-R3`  
Verdict: **FAIL — NOT_CALIBRATED**

This audit concerns only the frozen method replay. It changes no production rule, registry entry, candidate state, or workflow assignment.

## Input and contamination audit

Both supplied root manifests match their frozen SHA-256 values: PACKER `69357EE2B5F29FAE3CA590382EA36E87647DDAA031CFF6063AF1F6FF6AF59BBD`; EXECUTOR `070DEE14AE8D8B6EA713407CEA8AFF67B06E0A95354EBF6BB0267D8018B84194`.

- PACKER: all 85 manifest entries have matching SHA-256 values and paths remain below the PACKER root; its only unlisted file is its self-excluded manifest.
- EXECUTOR: all 3 manifest entries have matching SHA-256 values and paths remain below the EXECUTOR root; its only unlisted file is its self-excluded manifest.
- The sealed manifest declares 74 executor-readable files, 55 embedded sources, and 37,726,016 bytes. The boundaries and reported counts agree with the files inspected.
- No external material, auditor-key access, candidate execution, Stage 0/A/B work, formal-project work, or shadow wave is reported or detected in the permitted roots.

The supplied `validate_pack.py` is read-only but could not run because the bundled Python lacks PyYAML. Independent SHA-256, file-set, and path-boundary checks were performed directly, so this is an environment limitation rather than a contamination finding.

## Failed frozen requirements

1. `sentinel_minimum_set_recall`: **0/2**, required **2/2**.
   - C01 uses S01/S02/S03 but reports only `S02`; it does not name either required decisive subtractor `RUST_BVCOMPZ_COMPLETE_PIPELINE` or `ZUCKERLI`.
   - C02 uses S01–S04 but reports only `S03`; it does not name any keyed decisive subtractor (`FASTHNSW_FASTKCNA_GLOBAL_LAYER_BUILDER`, `GENERIC_B_MATCHING_KERNEL`, or `HNSWLIB_AND_FAISS_NATIVE_LOCAL_ACTIONS`).
   The protocol requires both explicit minimum-set source IDs **and** a named decisive current subtractor. A source token is not a substitute for the required named subtractor.

2. `structural_negatives_not_packaged`: **5/6**, required **6/6**.
   - C04 is not packaged, but the key requires `NOT_ADMITTED_UNFROZEN` for the unfrozen cache-residency/retention availability transition. The executor gives `STRUCTURAL_DROP` based on an asserted wrapper/composition absorption instead. That does not match the keyed structural reason.

## Passed thresholds

| Threshold | Result |
|---|---:|
| Sentinel broad-claim leakage | 0/2 — PASS |
| Positive candidate-grade deep review | 5/6 — PASS |
| Positive proposal-grade or explicit nonstructural unfrozen | 5/6 — PASS |
| Resource/unimplemented controls not made structural solely by event | 4/4 — PASS |
| Full atomic certificate for proposals | 7/7 — PASS |
| Correct model/native boundary | 7/7 — PASS |
| Terminal revival | 0 — PASS |
| Improper hard-gate bypass in proposed packaging | 0 — PASS |

C15 is a noted label discrepancy: the key's preferred resource disposition is `RESOURCE_BLOCKED`, while the executor gives a current-collision structural drop. The stated reason is source collision rather than the toolchain event, so it does not fail the frozen resource-control threshold; it remains visible for mainline review.

## Per-case dispositions

| Cases | Control → proposed | Audit result |
|---|---|---|
| C01, C02 | PROPOSE_STAGE0 → STRUCTURAL_DROP | Fail: decisive subtractor not named. |
| C03 | DROP → NOT_ADMITTED_UNFROZEN | Pass. |
| C04 | PROPOSE_STAGE0 → STRUCTURAL_DROP | Fail: keyed-reason mismatch. |
| C05 | PROPOSE_STAGE0 → NOT_ADMITTED_UNFROZEN | Pass. |
| C06–C08 | DROP → STRUCTURAL_DROP | Pass. |
| C09–C13 | PROPOSE_STAGE0 → DEEP_DIVE_REQUIRED | Pass; complete model certificates and finite native falsifiers. |
| C14 | PROPOSE_STAGE0 → STRUCTURAL_DROP | Pass. |
| C15 | PROPOSE_STAGE0 → STRUCTURAL_DROP | Pass resource-causality threshold; label discrepancy recorded. |
| C16, C17 | PROPOSE_STAGE0 → DEEP_DIVE_REQUIRED | Pass; resource event retained as non-scientific. |
| C18 | DROP → NOT_ADMITTED_UNFROZEN | Pass; pause/missing realization was not treated as STOP. |

## Completion boundary

No repack, revision, production activation, shadow-wave execution, or downstream dispatch has occurred. The sole mechanical handoff is provided for mainline acceptance. Completion status: `IDLE_REUSABLE_AWAITING_MAINLINE`.
