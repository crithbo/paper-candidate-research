# R5 P0 mainline implementation report

## Identity and authority

- Audit: `RULE-AUDIT-20260810-SCREENING-YIELD-INITIAL-TOPIC-QUALITY-R5`
- Proposal: `DISCOVERY-SOURCE-QUALITY-FUNNEL-CLARITY-R5`
- User directive SHA-256: `D3ACE00D99D609EB9C7C75D182BFF54E906358FF86749AE46F9FEE9ECE1BC0CE`
- Approved scope implemented: P0 nonbehavioral funnel terminology and telemetry only
- P1/P2: `BLOCKED_PENDING_V8_8_NOT_CALIBRATED_RESOLUTION__NOT_STARTED`
- Shared writer: mainline only
- Safe boundary: after the frozen v8.8 PACKER, EXECUTOR and independent AUDITOR assignments completed

## Exact shared-file hashes

The `registry.yaml`, `plan.md`, and `history.md` new hashes below identify the exact P0 completion boundary, before the later read-only R6 resolution-audit assignment was registered. The two role-rule hashes remain the current authoritative P0 policy hashes; subsequent control-plane bookkeeping does not alter the P0 semantic delta.

| File | Old SHA-256 | New SHA-256 | Meaning |
|---|---|---|---|
| `rules/ROLE_MAINLINE.md` | `079DAD36654A7D03DFCAEB96DD79DBE279037C7A4DC8175D9ED3A7F7987D076E` | `538C9121A0F91C9AD62261692CCB9CD19C9A1CC35AACDD23808616914496BDE5` | Defines seven noninterchangeable funnel units, replaces the ambiguous 6–10 grounded-brief diagnostic, and separates future telemetry fields. |
| `rules/ROLE_DISCOVERY.md` | `F669980E485855F499D0046FBB1B1502F84ADABADDD1229104A2B470CDACB667` | `D2F04CDD642DB8E1FF5E632E9B08555D45742DEB0ED884CDD578B7F2AC0EFFCA` | Defines five raw-log-only statuses and separate wave funnel counts while preserving final `PROPOSE_STAGE0 / DROP`. |
| `registry.yaml` | `5D4BD59A5AEF59080822812FC87E9D0E62B9CF03CB6CB555E09F62372F65EB50` | `88DD03BDE8CF92927C72D84DC837185D95437A63F9777F9F526F5F1884A130AA` | Records approval, P0 completion, v8.8 NOT_CALIBRATED, and P1/P2 no-start boundary. |
| `plan.md` | `62FEDDA78695D8B19D59B65799DCF80BF2D91172A460C0A2883194AB067C2105` | `D993FB472F7CEDDE70387CD0134C171DFE5079A83AD06E0C3A1B383EEF875B74` | Replaces pending status with the current completion and blocker state. |
| `history.md` | `8610BC6B82A233B00176E164CFDADAFB79F431A98536A140B46D8AE8D205C689` | `A70A99DC2E8BA41FCB51018434C822239760063B40B96A3FB5409AB8FC81967B` | Preserves the v8.8 audit failure kernel and exact R5 P0 rule hashes. |

## Mechanical consistency

- Approval package: 5/5 entries verified; canonical manifest self SHA-256 `0785F324DCAD84A53DE3CD0D90E46C9F702AE28943A83AC65148BDBAC5DC3399`.
- Registry: duplicate-reject YAML parse `PASS` after preserving the previous backtest lane assignments as `prior_assignment_id`.
- Funnel terms present: `RAW_SCREEN_ROW_EVENT`, `UNIQUE_OPPORTUNITY_FAMILY`, `CANDIDATE_GRADE_DEEP_REVIEW`, `STAGE0_BRIEF`, `CLEAN_STAGE0_BRIEF`, `DECISIVE_STAGEA_OBSERVATION`, `STAGEA_PASS`.
- Raw log states present: `STRUCTURAL_DROP`, `NOT_ADMITTED_UNFROZEN`, `RESOURCE_BLOCKED`, `DEEP_DIVE_REQUIRED`, `EXCLUDED`.
- Ambiguous `6–10 grounded briefs` target: 0 occurrences in the two authoritative role files.
- Zero proposals legal: present in both mainline and Discovery use points.
- Mixed-unit recall denominator: explicitly prohibited.
- Candidate states changed: 0.
- Quality gates, Stage B user gate, per-stage concurrency, scheduling behavior and revision limits changed: 0.
- Active v8.8 assignment rule drift: 0; the rule patch occurred only after all three assignments completed.

## v8.8 dependency outcome

The independent v8.8 AUDITOR returned `FAIL / NOT_CALIBRATED`: sentinel minimum-set recall was 0/2 versus required 2/2, and structural negatives were 5/6 versus required 6/6. Eight other frozen thresholds passed; hashes, boundaries and contamination checks passed. No production v8.8 behavior was activated and no automatic repack or revision was started.

Therefore this implementation does not activate R5 P1/P2. Their historical replay and two noncanonical shadow waves remain blocked until the v8.8 result is explicitly resolved; any later P1/P2 production patch remains separately user-gated.
