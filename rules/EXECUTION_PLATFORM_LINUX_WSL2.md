# Linux WSL2 Execution Profile — V1

Profile ID: `WSL2_UBUNTU2404_X86_64_V1`

## Authority and scope

This file is the platform-mechanics overlay for Linux-dependent Stage A/B candidate execution in Ubuntu 24.04 under WSL2. It does not redefine scientific gates, state, revisions, comparators, denominators, claim ceilings or Stage B authority. The common owners remain `AGENTS.md`, `rules/ROLE_MAINLINE.md`, `rules/ROLE_CANDIDATE_OWNER.md`, `rules/RESOURCE_LOCALIZATION.md` and `rules/ARTIFACT_LIFECYCLE.md`.

OpenAI's documented WSL mode runs Codex inside Linux rather than the native Windows sandbox. New Linux assignments must freeze:

```yaml
execution_platform:
  profile: WSL2_UBUNTU2404_X86_64_V1
```

Missing profile/hash or a WSL1 environment fails closed. This profile applies only at a new safe assignment boundary; existing Windows assignments are not migrated in place.

## Fixed role boundary

The reusable Linux owner lane may:

- bootstrap and execute a MAINLINE-frozen Linux-dependent Stage A assignment;
- execute Stage B only when the exact topic has a matching user approval and Stage B contract;
- write only the assignment's Stage A/B directory and its local resources;
- produce raw evidence, reports, inventory, retention, manifest and handoff.

It may not:

- perform Discovery, Measurement M1 or Stage 0 PRIMARY/SENTRY work;
- modify `AGENTS.md`, `plan.md`, `registry.yaml`, `history.md`, `rules/`, `templates/` or `projects/_assets/`;
- create formal state transitions or self-accept PASS/STOP;
- read another queued topic before its current handoff is accepted;
- enter Stage B without a non-empty matching `stageb_user_approval_id`;
- use Windows execution results as Linux-native results without an explicit comparator/transfer contract.

Windows MAINLINE remains `SHARED_FILE_WRITER` and accepts Linux handoffs. An independent reviewer must not be the Linux owner session; a native Linux replay gate requires a separate reviewer task/lane.

## Environment and Codex binding

Every assignment freezes and verifies before action:

- WSL version and WSL2 distribution identity;
- Ubuntu version, kernel, `x86_64`, glibc and default shell;
- Linux user and absolute native workspace root;
- Codex surface (`DESKTOP_WSL_PROJECT` or `CLI`), Codex version and sandbox mode;
- Git repository/branch/commit and clean/dirty boundary;
- Windows VHDX backing location when used for resource governance;
- Python/compiler/runtime versions required by the topic;
- GPU identity, driver mapping and compute capability when GPU work is authorized.

Codex `0.115+` is required because the Linux sandbox uses `bubblewrap` and WSL1 is unsupported. Authentication tokens, browser state and Codex configuration are external system-managed data, never project evidence, inventory content or Git material.

## Workspace, branch and shared files

The initial registered Linux workspace is expected under an exact absolute path such as `<WSL_USER_HOME>/code/paper-candidate-research`, on branch `exec/linux`. The actual path and commit must be frozen per assignment; `~`, unresolved variables and guessed paths are forbidden in contracts.

- Common rule updates flow from MAINLINE/main into `exec/linux` before bootstrap.
- Linux owner commits only authorized assignment-directory changes.
- Shared-file diffs in a Linux handoff are a hard conflict and are not accepted.
- Large resource/build/env/cache/tmp files are not pushed to Git; the handoff carries inventory, provenance, decisive raw and reproducibility material under the common lifecycle rule.

## Linux resource localization

Linux resource-producing work uses an absolute assignment-local `RESOURCE_ROOT` under the native Linux workspace and the eight canonical children. The Ubuntu ext4 VHDX may be physically backed by `E:\WSL\Ubuntu-24.04\ext4.vhdx`; the assignment records both the Linux logical root and Windows backing-store path.

- Build, environment, compiler cache, model cache, temporary and performance-sensitive data stay on the Linux ext4 filesystem.
- `/mnt/c`, `/mnt/d`, `/mnt/e` and `\\wsl$` are transport/read surfaces, not valid build, cache, temp or claim-performance roots.
- A hash-pinned Windows input may be read from a mounted Windows path only to copy it once into the Linux assignment's `resources/src` or `resources/archives`; execution uses the Linux copy.
- System-managed WSL, kernel, `/dev/dxg`, Windows GPU driver mapping and Codex caches are external dependencies, not assignment resources.
- No writable surface may escape the Linux `RESOURCE_ROOT`; fail closed before action if a tool cannot be redirected.

## Shell and process contract

- Bash is the default shell, but scientific commands should use literal argv arrays or `shell=false` execution when possible.
- `bash -lc` or pipelines are allowed only when shell semantics are frozen and necessary.
- Each process records absolute executable, argv, cwd, process-local env, timeout, exit/signal, stdout, stderr, inputs, outputs and hashes.
- POSIX permissions, symlinks, case sensitivity, executable bits, locale and line endings are part of the evidence boundary when material.
- No silent retry, shell substitution, implicit PATH fallback or unrecorded package resolution is allowed.

## GPU and CUDA under WSL2

GPU assignments verify `/dev/dxg`, NVIDIA identity, Windows driver, compute capability, available memory and assignment-specific CUDA/PyTorch/Triton/vLLM compatibility before GPU action.

- The initial validated local GPU identity is RTX 4070 Laptop, compute capability 8.9 (`sm89`), 8188 MiB, Windows driver 591.74; every assignment rechecks rather than inheriting it blindly.
- Do not install a Linux NVIDIA display driver inside WSL.
- CUDA toolkit, PyTorch, Triton, vLLM and model artifacts are installed only when the topic assignment freezes their exact version/source/hash, budget and isolated destination.
- WSL-specific NVML, pinned-memory, unified-memory and host/device behavior limits constrain the claim ceiling. WSL results are labeled as WSL2 results and are not silently generalized to native bare-metal Linux.

## System and package changes

The Linux lane may create assignment-local virtual environments, package prefixes, source/build trees and caches within its authorized resource envelope. It may not change Windows/WSL global configuration, install drivers, modify `/etc` or system package state, use `sudo`, start privileged containers or change system services unless the user and MAINLINE freeze exact system authority in a separate assignment.

## Lifecycle and cleanup

MAINLINE remains cleanup/capsule authority. Because Windows MAINLINE cannot safely mutate a user-scoped WSL filesystem through its sandbox identity, a Linux lane may execute cleanup only under a separate MAINLINE-signed cleanup packet naming exact inventoried leaves. It never chooses targets, deletes roots, performs cross-assignment cleanup or treats cleanup as a scientific transition.

Handoffs record Linux path, Windows VHDX backing path, distro/kernel/Codex/Git identity, process summary, active-process check, inventory, retained evidence, cleanup proposal and branch commit.

## Stop conditions

Fail closed and return to MAINLINE when any of these is unresolved:

- platform/profile or WSL2 environment mismatch;
- Linux workspace, branch, commit or shared-file drift;
- unauthorized Discovery/Stage 0/Stage B activity;
- exact resource root or path mapping;
- native executable/argv/cwd/env/output schema;
- Linux dependency/input/runtime closure;
- GPU mapping or version compatibility required by the topic;
- system/sudo/driver/container action without authority;
- owner/reviewer independence conflict;
- result-aware change to object, input selection, comparator, denominator or claim.

