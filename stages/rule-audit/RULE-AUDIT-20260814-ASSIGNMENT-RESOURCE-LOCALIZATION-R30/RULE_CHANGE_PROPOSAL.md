# Rule Change Proposal

## Proposal identity

- `audit_id`: `RULE-AUDIT-20260814-ASSIGNMENT-RESOURCE-LOCALIZATION-R30`
- `proposal_id`: `ASSIGNMENT_RESOURCE_LOCALIZATION_V1`
- `decision_label`: `PATCH_RECOMMENDED`
- `user_policy_approval_required`: `false__already_explicitly_approved`
- `backtest_required`: `false`
- `mainline_implementation_status`: `AUTHORIZED_AT_NEXT_SAFE_ASSIGNMENT_BOUNDARY`

## Problem statement

The project constrains write directories and resource envelopes but does not prove that assignment-controlled downloads, package caches, temporary data, environments and build products stay inside one removable subtree. This prevents reliable disk accounting and safe cleanup.

## Proposed minimum delta

| Shared file | Minimum change |
|---|---|
| `rules/RESOURCE_LOCALIZATION.md` | New canonical protocol using `PROPOSED_RESOURCE_LOCALIZATION_RULE.md` as the implementation source |
| `templates/RESOURCE_INVENTORY.yaml` | New canonical template using `RESOURCE_INVENTORY_TEMPLATE.yaml` |
| `AGENTS.md` | Add mandatory summary, `_assets` exception, common-rule read entry, safe-boundary rollout and system-cache distinction |
| `rules/CORE_POLICY.md` | Extend assignment invariant with unique root, process-local redirects, inventory and cleanup containment |
| `rules/ROLE_MAINLINE.md` | Mainline freezes roots/envelopes, is sole shared-asset registrar and default cleanup owner |
| Resource-producing roles | Add short mandatory reference to the common rule before download/build/env/cache/tmp actions |
| `.agents/skills/hardware-stageb-runner/SKILL.md` | Replace ambiguous “approved shared cache” language with registered `projects/_assets/<asset_id>` read-only reuse and local mutable copies |
| `templates/HANDOFF.yaml` | Add resource policy/root/inventory/hash/bytes/external-system-cache fields |
| `templates/STAGEB_EXECUTION_CONTRACT.yaml` | Add root, inventory, required dirs, redirect map/preflight and cleanup owner under resource envelope |
| `templates/USER_BLOCKER_PACKET.md` | Add root/inventory and redirect failure details |
| `templates/FORMAL_PROJECT_PLAN.md` and `templates/REPRODUCIBILITY_PACKAGE.yaml` | Add registered resource/shared-asset references and retention/deletion status |

Resource-producing roles are `ROLE_DISCOVERY`, `ROLE_DISCOVERY_BACKTEST`, `ROLE_STAGE0_REVIEW`, `ROLE_CANDIDATE_OWNER`, `ROLE_STAGEA_REVIEW`, `ROLE_STAGEB_INDEPENDENT_REVIEW`, and `ROLE_PAPER_PROJECT`. `ROLE_RULE_AUDIT` should add only a short statement that audit assignments remain download/build prohibited unless a later explicit audit assignment overrides that prohibition and freezes the common resource contract.

## Exact shared-summary semantics

The mainline patch should preserve these exact meanings:

1. `RESOURCE_ROOT = <frozen_unique_write_directory>\resources\` and is unique per assignment.
2. All eight standard children are mandatory.
3. No actively acquired project file, environment, build, configurable cache or configurable temp may persist outside the root.
4. Redirects are process-local; no system/user environment or registry change.
5. Unreliable redirect means fail closed before resource-producing action, then resource blocker if no authorized route remains.
6. Canonical inventory is outside the deletable root, updated each run, with immutable run snapshots inside `logs/`.
7. System/application caches are explicitly outside the guarantee and outside project ownership.
8. Only mainline registers shared assets at the exact `<LEGACY_LOCAL_PROJECT_ROOT>\projects\_assets\<asset_id>\` path.
9. Recursive cleanup is allowed only on the exact frozen root or inventoried descendant after containment, reparse, active-process and retention validation.
10. No existing scientific state, evidence, revision count or terminal decision changes.

## Rollout sequence

1. Mainline snapshots the affected shared-file hashes.
2. Add the new rule/template first.
3. Patch AGENTS/CORE/MAINLINE and minimal role references.
4. Patch templates and hardware Stage B skill.
5. Run the local no-network mechanical fixture described in the report.
6. Register cutover in `registry.yaml`, summarize in `plan.md/history.md`, and apply to new assignments only.
7. For an active assignment, issue `RESOURCE_LOCALIZATION_COMPATIBILITY_ADDENDUM` only before its next resource-producing action; do not move prior evidence.

## Safety invariants

- Q2 minimum preserved: yes
- Q1 priority preserved: yes
- Same-object preserved: yes
- Latest collision preserved: yes
- Fair current strong baseline preserved: yes
- Natural input/evidence preserved: yes
- Full-cost preserved: strengthened by storage/resource accounting
- Reproducibility preserved: strengthened by resource inventory
- Claim ceiling preserved: yes
- STOP non-revival preserved: yes
- User Stage B/formal approval preserved: yes
- System install/global environment authorization unchanged: yes

## Compatibility and rollback

- Existing assignments: frozen semantics unchanged; no automatic relocation.
- Existing files outside new roots: no scan of user directories, no automatic move/delete, no claim that they are project assets.
- Existing project-local resources: may be inventoried as `LEGACY_PROJECT_LOCAL` at a safe boundary; future acquisition/build uses the new root.
- Rollback: restore shared old hashes and stop applying the policy to new assignments; assignments already frozen under V1 retain it until handoff.

## Decision request

No new user decision is required. Mainline should implement exactly this approved policy without expanding scientific or resource authority. Any future exception that permits an assignment-controlled download/build/cache outside its root, system/global installation, or shared asset creation by a non-mainline lane requires a new explicit user decision.

