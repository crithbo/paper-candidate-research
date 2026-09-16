# Windows Native Execution Profile — V1

Profile ID: `WINDOWS_NATIVE_V1`

## Authority and scope

This file is a platform-mechanics overlay for Stage A/B candidate execution on the Windows host. It does not define scientific quality, state transitions, revision, evidence, baseline, full-cost or Stage B authority. Those remain owned by `AGENTS.md`, `rules/ROLE_MAINLINE.md`, `rules/ROLE_CANDIDATE_OWNER.md`, `rules/RESOURCE_LOCALIZATION.md` and `rules/ARTIFACT_LIFECYCLE.md`.

New Windows candidate assignments must freeze:

```yaml
execution_platform:
  profile: WINDOWS_NATIVE_V1
```

Missing or mismatched profile/hash fails closed before resource or tool action. Existing frozen assignments are grandfathered and keep their original Windows semantics and hashes.

## Role boundary

- MAINLINE remains the only shared-file and formal-state writer.
- Candidate owners execute only a frozen Stage A/B assignment in its unique directory.
- Discovery and Stage 0 remain controlled by the Windows MAINLINE workflow and do not use this candidate-execution profile.
- Stage B requires an exact topic-level `stageb_user_approval_id` and contract.

## Host and shell binding

Each assignment freezes Windows edition/build, architecture, PowerShell version, native shell, locale/timezone where material, and whether the task uses Codex Windows sandbox or another explicitly authorized local mode.

- PowerShell is the default shell.
- `cmd.exe`, batch files or another shell are allowed only when the exact argv/cwd/env/output contract requires them.
- Native invocations must capture process exit code, timeout, stdout, stderr and required outputs explicitly. PowerShell success is not inferred from host return alone.
- `.exe`/`.dll`, PATH lookup, file extension, quoting and call-operator behavior are part of the frozen interface when they can change execution.

## Workspace and resources

The authoritative Windows workspace root is `<LOCAL_PROJECT_ROOT>`. The assignment `unique_write_directory`, `RESOURCE_ROOT`, inventory and all writable tool surfaces follow `rules/RESOURCE_LOCALIZATION.md`.

- Assignment resources use the eight canonical `resources\` children.
- Process-local environment and command flags redirect writable caches/temp/build outputs.
- Global/user PATH, registry, machine/user environment variables, system packages, drivers and security settings are unchanged unless separately and explicitly authorized by the user.
- Reparse points, junctions, symlinks and recursive cleanup require the common containment and lifecycle gates.
- Windows tools may consume a MAINLINE-registered shared asset read-only; mutable transformations occur only after an authorized assignment-local copy.

## Tool and dependency closure

Every executable dependency is bound by path, version, size and hash when claim-critical. Runtime DLLs, compiler/linker tools, SDKs and data/input manifests must be complete before the relevant command starts. A representative binary does not prove toolchain closure.

Windows-native evidence may not be presented as Linux/POSIX evidence. If a valid route requires POSIX, ELF, Linux CUDA, Linux-only packages or Linux filesystem semantics, MAINLINE must freeze a new `WSL2_UBUNTU2404_X86_64_V1` assignment instead of silently invoking WSL from this profile.

## Git and shared-state boundary

Windows candidate work uses the MAINLINE-selected Windows execution branch/worktree. Candidate owners do not edit `AGENTS.md`, `plan.md`, `registry.yaml`, `history.md`, `rules/`, `templates/` or `projects/_assets/`. Handoffs include platform profile/hash, Windows environment identity, exact command/capture records and resource inventory.

## Stop conditions

Fail closed before scientific inference when any of these is unresolved:

- profile, cwd, unique write directory or resource containment;
- exact native argv/cwd/env/output schema;
- executable/DLL/SDK/input closure;
- required process exit/timeout/stdout/stderr capture;
- platform mismatch that would change object, comparator, denominator or claim ceiling;
- system/admin/driver/SDK action lacking user authority.

