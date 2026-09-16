# Audit input snapshot

## Identity and boundary

- `audit_id`: `RULE-AUDIT-20260813-R11A-R13B-BATCH01-RAW-CAP-RECOVERY-R14`
- `date`: `2026-08-13` (`Asia/Shanghai`)
- `status`: `USER_POLICY_DECISION_REQUIRED`
- `shared_files_modified`: `false`
- Sole write directory: `stages/rule-audit/RULE-AUDIT-20260813-R11A-R13B-BATCH01-RAW-CAP-RECOVERY-R14/`

This audit read only the frozen blocker, public R13B control contracts, current control-plane summaries, the rule-audit role, and the two report templates. It did not read candidate identities, public-response bodies, request-result rows, historical identity plaintext, private denylist material, outcomes, answers, case semantics, class/stratum labels, or method labels. It did not contact PACKER or any external service.

## Frozen anchors

| Artifact | SHA-256 | Use in this audit |
|---|---|---|
| `stages/discovery/_method-backtests/DISCOVERY_CLAIM_PACK/V9-R0/paired-blind-r11a/index/R13B_BATCH01_RAW_CAP_BREACH_BLOCKER.yaml` | `01C22B29C05051925A9D508FD216F087679EE8D3B12760B2CE6C68B5CC1A6EB5` | Authoritative failure facts and aggregate resource ledger |
| `control/minimum-viable-calibration-r13b/R13B_ROLLING_COMMITMENT_CONTROL.yaml` | `2861E3D439BFCDDA8D9AB615D112FB9929C34F91C1D8B1BBCFBF082092A4D176` | Frozen raw/unique ceilings, batch caps, ordering and fail-closed behavior |
| `control/minimum-viable-calibration-r13b/R13B_POLICY_ALIGNMENT_AMENDMENT.yaml` | `49E6DB3D2D6261DF39BD449664E37C36A3B3449CD2EC17D4E39DAF5CCD51122C` | R13B sample, blind and scientific invariants |
| `control/minimum-viable-calibration-r13b/R13B_PHASE1_RESUME_GATE.yaml` | `B5E53547C2538004CF57B36DABB6DE9DA3FF964E2E1F2BB4FE04750536DE0504` | Same-assignment/additive-file resume boundary |
| R13B implementation manifest | `7586075114C2A766E4D4A2C919876A91BB51B830D705B29E99C221BA8AD2CBD1` | Installed package identity |
| R13B audit manifest | `185027D0FD75EB554C0EF7B0E72095F8FA7CAD7B788175C9DF2EFB46F5D36E79` | User-approved proposal identity |
| Checkpoint 011 | `BC280D6E3D9D86841A1B889E308129DED101EF3FEDC4FD5072018E7DEE83A43B` | Immutable resume anchor |

## Authoritative aggregate facts

- Frozen Batch01 raw cap: `24`.
- Actual pre-commit public locator requests: `20 + 20 = 40` raw attempts.
- Frozen overage: `16`.
- Valid persistent locators returned: `10 + 10 = 20` in aggregate.
- Commitment/hash/source qualification/private intersection/new frozen artifact: all absent.
- External response bodies and per-row return ordering: not persisted.
- Scientific inference: none.
- Resource ledger after the breach remains inside the original envelope: new frozen bytes `0`; nonpersisted response bytes `45,639`; cumulative network lower bound `3,626,270`; CPU estimate `0.22 h`; wall estimate `0.76 h`.

## Counter reconciliation used by the proposal

R13B begins with `existing_raw=4`, `existing_unique=4`, `total_raw_ceiling=88`, and `total_unique_ceiling=72`.

- Charge all failed preflight attempts: `4 + 40 = 44 raw consumed`.
- Global raw remaining: `88 - 44 = 44`.
- No new identity commitment exists: unique remains `4`; unique headroom remains `68`.
- Existing source-qualified blind pool remains `2`.
- Under recovery option B, at most `44` additional raw leads can be observed. Therefore the arithmetic upper bound on the eligible pool is `2 + 44 = 46`, so 24, 30 and 36 remain arithmetically reachable without increasing any ceiling. This is a possibility bound, not a yield forecast.

## Evidence limitation controlling the A/B decision

The blocker preserves only request-level counts. It does not preserve a row-level chronological roster, a locator-to-request-position map, response bytes, or identity hashes. Because each response produced only ten valid persistent locators, the frozen evidence also does not contain 24 valid returned locators from which a first-24 commitment set could be formed. A retrospective first-24 set would therefore require replay, recollection, reconstruction or content-based selection. All are outside the frozen evidence and fail the requested contamination-safe test.
