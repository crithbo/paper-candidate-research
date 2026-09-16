# APX exact-asset safe-reuse preflight

## Outcome

`BLOCKED_USER_ACTION_REQUIRED__NO_SCIENTIFIC_INFERENCE`

The frozen control plane did not validate, so the asset inventory was not started. The assignment freezes `plan.md` at SHA-256 `FB9DC7A1C04B799CEB9B958ADC3494C8F3757ECADE0BACA06840E8380FC022E6`; the file present at preflight start hashes to `EAD879F05564860EDAA64A1A6259E8A6091E73BA5E6FECE7F6C080C7F4C68D6C`.

This is a control-input blocker, not evidence that an exact LLVM asset is absent. No large-resource estimate or request is asserted because the prerequisite read-only inventory did not legally begin.

## Frozen-input audit

| Input | Frozen SHA-256 | Observed SHA-256 | Result |
|---|---|---|---|
| `AGENTS.md` | `26DB9F4C2D43349A2BA5B741947561D4FED2FE5EC65327C02D273D3905F5A522` | same | PASS |
| `plan.md` | `FB9DC7A1C04B799CEB9B958ADC3494C8F3757ECADE0BACA06840E8380FC022E6` | `EAD879F05564860EDAA64A1A6259E8A6091E73BA5E6FECE7F6C080C7F4C68D6C` | FAIL |
| `registry.yaml` | `D26887171D5FE1DDDD3F35F48D863D3302F21F985501AD006410D367D81206F5` | same | PASS |
| `rules/ROLE_CANDIDATE_OWNER.md` | `A703F21B9F33EE341A942501948BC313FACC9D0BAB15F3EE943FC590B65BF519` | same | PASS |
| `control/ASSIGNMENT.yaml` | user-frozen `50EC4757529A20A7BF4F8C127B63B7D436B6DC84FFCECD7DF979A32561F95761` | same | PASS |

The assignment file was last written at `2026-08-15T16:00:40.9124038Z`; the observed `plan.md` was last written later, at `2026-08-15T16:03:39.9004463Z`. This timing is consistent with post-freeze plan drift but does not authorize this lane to infer compatibility.

## Completed

- Fully read the assignment and the required minimal control entry.
- Fully read `academic-research-suite/SKILL.md` and its experiment-agent workflow.
- Recomputed the frozen control hashes and recorded the single mismatch.
- Confirmed the current registry still identifies exact LLVM commit `a1194be1baefa99d20a09bd04b16056be0ab7225` and the prior Stage A resource blocker; this did not cure the frozen-plan mismatch.

## Deliberately not started

- No workspace or preinstalled-tool asset inventory.
- No APX or MachineVerifier capability query.
- No read of RVV or PPC material.
- No network request, download, copy, extraction, build, compile, link, test, or claim-bearing observation.
- No source, lockfile, system, WSL, PATH, registry, Stage B, stage-state, or shared-control modification.

## Minimum user/mainline action

Reissue this same read-only APX preflight at a new safe assignment boundary with either:

1. the current `plan.md` SHA-256 frozen explicitly; or
2. an immutable readable snapshot whose SHA-256 is the frozen `FB9DC7A1C04B799CEB9B958ADC3494C8F3757ECADE0BACA06840E8380FC022E6`.

Keep the exact commit, object, prohibitions, budgets, and write boundary unchanged. After that mechanical correction, the lane can perform the originally requested inventory and, only if reuse is disproved, calculate the minimum large-resource request.

## Evidence and state

- Evidence ceiling: `RESOURCE_PREFLIGHT_ONLY__NO_SCIENTIFIC_INFERENCE`
- Claim-bearing observation: `false`
- Scientific revision consumed: `false`
- Stage B authorized or started: `false`
- Exact reusable asset found: `unknown_not_assessed`
- Lane release after this handoff: `IDLE_REUSABLE`

