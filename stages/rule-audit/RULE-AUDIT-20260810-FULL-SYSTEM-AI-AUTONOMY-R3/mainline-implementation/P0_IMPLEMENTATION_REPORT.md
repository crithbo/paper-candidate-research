# R3 P0 Implementation Report

## Outcome

P0 passed. The changes clarify authority, evidence levels, revision/blocker semantics and Stage B refusal behavior without changing admission thresholds or scientific candidate states. AIGER's later Stage0→StageA transition and R4 scheduling cutover are separately authorized operations, not P0 side effects.

## Authority and compatibility

- `POLICY_AUTHORITY=USER`
- `SHARED_FILE_WRITER=MAINLINE`
- `AUDIT_PROPOSAL_AUTHOR=RULE_AUDIT_SENTRY`
- Active assignments keep their frozen rule revision; new rules apply only at a safe assignment boundary unless purely mechanical and decision-neutral.
- Stage0 now states the distinction among evidence, inference, hypothesis and claim ceiling; implementation/main result is not required for conditional paper-potential screening.
- Candidate/StageA rules distinguish `STAGEA_DIRECTIONAL_FULL_COST` from `STAGEB_PAPER_GRADE_FULL_COST_CLOSURE`; neither permits omission of a decisive cost.
- Resource failure before claim-bearing evidence remains `BLOCKED_USER_ACTION_REQUIRED`, never STOP/reserve or revision consumption.

## Exact baseline-to-current hashes

| File | R3 input SHA-256 | Current SHA-256 | Note |
|---|---|---|---|
| `AGENTS.md` | `C884157F7550B348CADAAEF8E28FE253289E40FACDC3DF33571CA27E80B8C2EF` | `2B0DA6CAD951C6E1E4F371B7BCF8E2BDF6A5E41CF53D9895614E118219A6AC8D` | P0 plus approved P3 entry |
| `rules/ROLE_MAINLINE.md` | `B935C31654EDADEAE09D537ED6DA3CB0E2BFE7A12D26D3CF983F7254CF6E1C23` | `079DAD36654A7D03DFCAEB96DD79DBE279037C7A4DC8175D9ED3A7F7987D076E` | P0 intermediate was `00BE2F4A...D326`; current also contains approved R4 |
| `rules/ROLE_STAGE0_REVIEW.md` | `601BA9FC4B0AD64B56AD7E51405ACDB7231609A4CE4D7161903FDFFAE3653665` | `AD00B257F80FB1AF3B842E652E395A0B964291E43B0BA2FD7526CA098D2546B9` | P0 evidence/hypothesis correction |
| `rules/ROLE_CANDIDATE_OWNER.md` | `77C34F7508063E9EF2AE5BD232E6CA8482CAA6212A15609F27DA52608ED8E4E5` | `30E23336CF339771821EAEC8B2C7011025BA815D613DB639E68121FDCDE54D1F` | P0 full-cost and authorization clarification |
| `rules/ROLE_STAGEA_REVIEW.md` | `97A256F17730F104A414F84853A3B447EDC61B537BE9A02857EE6FAFC9019066` | `7403DD87FD0091BA836F782EE215AFDFB231BB5AFBF37570571B09EC524E94A8` | P0 independent full-cost gate |
| `rules/ROLE_RULE_AUDIT.md` | `B19471A3B756B96BE693805B270C1B8A6BDA428526DBD52B12F40AEFDE552AEF` | `9D0064D8E448ECFD3761E7125E776074417F81EF7012C9C49967AB7FA7148C99` | P0 authority triad and no duplicate approval |

## Hardware Stage B runner repair

| File | Old SHA-256 | New SHA-256 |
|---|---|---|
| `SKILL.md` | `6650166A8208947E145A9571D475E4F24D5C58FD41D4B0486E05C9190B66EEE9` | `FB46BBD53915F717C306E22E342B281B899A54F05AA6F75164AD57DDE2228B04` |
| `references/evidence-and-escalation.md` | `CBD0B05DA8FD357035342D52A342280C5C8431C37BD3E46D3B3FA5AB690CFF5A` | `8DB3E910F140532DACAE7C50DDA9F484562446CA15BAA21240989F3DE81A37D5` |
| `scripts/init_stageb_task.py` | `D87E4AFD77FA1386E4B556582AB42D817C2DA6494781BDF00737DB34C22CB0C5` | `A851D777B3AA5B7D2D0EAE60C59B5ECAFF5BAFFE644BF5466260A161EDFAFD3A` |
| `assets/task-contract.yaml` | `B18256DAAE1F80BEB8A28692A14164ED352BA02838D686B4D06781AB74FA189F` | `989B646FA6F82499BF045565A0861ACC68ACC4244ABDBC4ADAFBCFCD8CCF164F` |

`skill-creator` quick validation returned `Skill is valid!`. The initializer's `--help` exposes exact workspace, assignment and approval inputs. Two negative smokes—blank approval and blank assignment—returned `AUTHORIZATION_REFUSAL`, exit 1, and created no `stages/stageB/R3P0-REFUSAL-SMOKE` directory. No system install or global environment change was retained; temporary PyYAML validation dependencies were removed.

## State and registry validation

- Two legacy duplicate mapping keys were repaired without value loss by distinguishing initial vs consumed scientific revision fields.
- `registry.yaml` parsed with a duplicate-rejecting YAML loader.
- P0 changed no topic disposition, Stage0/StageA PASS/STOP count, blocker, revision consumption or approval ID.
- Current counters after separately authorized AIGER routing are Stage0 PASS 14, StageA PASS 1, StageA STOP 6, StageB accepted 0 and formal candidate 0.

## Rollback

The R3 input content is pinned by `AUDIT_INPUT_SNAPSHOT.sha256`. P0 can be rolled back file-by-file to those hashes without changing scientific states. R4 scheduling is a later independent package and must not be removed by a P0 rollback. Hardware runner rollback restores the four old hashes above; no task directory migration is required.

