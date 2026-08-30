# R13B mainline implementation report

## Outcome

Mainline mechanically accepted audit package `RULE-AUDIT-20260813-R11A-MINIMUM-VIABLE-CALIBRATION-R13B` under user approval `R11A-MINIMUM-VIABLE-CALIBRATION-20260813-R13B` and installed an additive assignment-local amendment. No shared scientific rule, threshold, candidate state or prior evidence file was overwritten.

The former R13 capacity proposal with manifest `892996FB695776CE47277C51A28CB3C5EB4FB58CAF614544E5D8157804C4F933` is recorded exactly as `SUPERSEDED_NOT_APPROVED`; its 128-unique/160-raw design is neither pending nor a fallback.

## Mechanical acceptance

- R13B audit manifest: `185027D0FD75EB554C0EF7B0E72095F8FA7CAD7B788175C9DF2EFB46F5D36E79`, 7/7 entries verified.
- Frozen anchors: master contract `2B61BBD...158F`, Phase-1 contract `641E28EA...485A`, checkpoint 011 `BC280D6E...A43B`, blocker 012 `87F5CCE1...129B`.
- R12A exclusion remained immutable: private manifest `F05A6E2C...9A0`; visible result `2007C7F9...39C3`; four checked, zero matched.
- Existing eligible admission audit: `f6c1` and `q7m2` each pass commitment-before-intersection, R12A nonmatch, complete source qualification, old-development/prior-blind exclusion, blind nonexposure and deterministic stratum/contribution eligibility. Admitted count is 2; no scientific inference was made.
- Capacity arithmetic: existing 4 + new unique caps `20+20+20+8=68` gives 72; existing 4 + new raw caps `24+24+24+12=84` gives 88.
- Blind schedule: exact core 24 = six strata x 4; only complete balanced +6 tranches may produce 30 and 36. At least five contribution types and 30% cap remain.
- Canonical `DISCOVERY_CLAIM_PACK_MODE` remains `OFF`; Phase 2, Executor, Auditor, shadows and production are not authorized by this installation.

## Installed immutable controls

- `R13B_POLICY_ALIGNMENT_AMENDMENT.yaml`: `49E6DB3D2D6261DF39BD449664E37C36A3B3449CD2EC17D4E39DAF5CCD51122C`
- `R13B_SUPERSESSION_RECORD.yaml`: `E362EF0F1E4D4CA9E8EDFE53A9153C1BB73EA65E4D44ED28D350473C2199FB5A`
- `R13B_OPEN_DEVELOPMENT_SEPARATION.yaml`: `7D8D9F681B2F0A3E8FE114AD5F9F528A783874253BE316B5B9440C6F4E3B3597`
- `R13B_EXISTING_ELIGIBLE_ADMISSION_AUDIT.yaml`: `83D83CB53D74981D51C5C58FE0E148C39E706190BB70B35F976F9C3102521826`
- `R13B_ROLLING_COMMITMENT_CONTROL.yaml`: `2861E3D439BFCDDA8D9AB615D112FB9929C34F91C1D8B1BBCFBF082092A4D176`
- `R13B_AUDITOR_TRIGGER_CONTRACT.yaml`: `4CF7B3FCE5C43F0CF8780CAA404DDBEABE9FD18D1990C8F4582E2834D7FCB0F2`
- `R13B_PHASE1_RESUME_GATE.yaml`: `B5E53547C2538004CF57B36DABB6DE9DA3FF964E2E1F2BB4FE04750536DE0504`

## Shared control old to new

- `registry.yaml`: `8FBF687E70C66B1CCD3E66A7CEFE2BFBE1B9BEAE94E7DA4A07A4F353C521DF17` -> `60C67E339E034228AFA2086250F2AE7A41119A6780B0F454131963CD7DE1425D`
- `plan.md`: `E99ABA11DB753F03CED93B811006ABA3A37E197C9073E209A661EC67DF32C81F` -> `36153CBC81EDD387B9FC585DBAE3278D50D4CA484FDC9DB20644F477B8D55217`
- `history.md`: `DEDC11E067B1B87FD21476F04714F3DF6F4E2D7FBA56621570C8A9E264A51EC4` -> `B4DC378AE6EA2CABF4F5336582534417599F351DCCDDCBA786C3C0E999AB1880`

## Resume boundary

The same long-lived PACKER task and the same Phase-1 assignment/index directory may resume from checkpoint 011. It must first create append-only batch-01 candidate commitment and manifest, then stop and notify mainline. Mainline alone performs the private R12A hash intersection and returns only the allowlisted Packer-visible result. The Packer may source-qualify only nonmatches and must return a checkpoint for mainline acceptance before any later batch.

No Phase-2 or scientific lane was launched by this implementation.
