# Assignment Resource Localization — V1

Protocol revision: `ASSIGNMENT_RESOURCE_LOCALIZATION_V2_PLATFORM_PROFILES`

## Purpose and scope

This protocol makes project-controlled storage auditable and removable. It applies to every new assignment and to every resume or resource addendum issued after production cutover.

It governs files an assignment actively downloads, copies, extracts, installs into an isolated environment, builds, generates as a tool/package cache, or creates as temporary/log output. It does not claim ownership or location control over caches and files maintained by Codex, Windows, device drivers, browsers, IDEs or preinstalled runtimes. Existing system-managed dependencies may be read, but they are not project assets and must not be represented as residing under the workspace.

## Frozen assignment contract

Before the first resource-producing command, every assignment freezes:

- `RESOURCE_POLICY_VERSION` and this file's SHA-256;
- one absolute, normalized `RESOURCE_ROOT`;
- `RESOURCE_INVENTORY_PATH`;
- network, stored-byte, CPU/GPU/wall, attempt and tool/source envelope;
- allowed source, provenance and license selection rules;
- an exact process-local redirect map for every tool that may write downloads, temporary files, package caches, environments or build output;
- cleanup owner and retention rules.

The canonical root is `<assignment_unique_write_directory>/resources/` in the assignment's frozen native platform filesystem.

- `WINDOWS_NATIVE_V1`: the unique directory and root resolve under `<LOCAL_PROJECT_ROOT>`; they may not use the old D root.
- `WSL2_UBUNTU2404_X86_64_V1`: the unique directory and root resolve under the exact absolute Linux workspace frozen by MAINLINE, normally an ext4 path under `/home/<frozen-user>/code/<frozen-repo>`. The inventory also records the Windows VHDX backing identity, initially `E:\WSL\Ubuntu-24.04\ext4.vhdx`.

Neither profile may use the workspace root, a stage root, `projects/`, a drive/filesystem root, an unresolved variable, wildcard, reparse/junction or cross-assignment path. Linux build/env/cache/tmp/performance roots may not reside under `/mnt/c`, `/mnt/d`, `/mnt/e` or `\\wsl$`. A frozen Windows file may be a read-only transport source only when it is copied and hash-verified into the Linux `RESOURCE_ROOT` before execution.

The following eight directories are mandatory even when empty:

```text
downloads/
archives/
src/
build/
env/
cache/
tmp/
logs/
```

Recommended meanings are: immutable network responses in `downloads`; retained compressed packages, datasets or export bundles in `archives`; pinned non-shared source/data working copies in `src`; objects, generated code, build trees and experiment binaries in `build`; assignment-local environments, package prefixes and portable toolchains in `env`; assignment-controlled package/compiler/model/tool caches in `cache`; disposable intermediates in `tmp`; and preflights, command logs and inventory snapshots in `logs`.

## Process-local redirection and fail-closed preflight

Temporary/cache variables and tool flags are set only in the launched process. Do not change global `PATH`, Windows registry, machine/user environment variables, WSL configuration, Linux `/etc`, system package state, drivers or services. Linux assignment-local environments/package prefixes are permitted only inside `resources/env` under the frozen envelope; `sudo`, privileged containers and system installs require separate user authority.

At minimum redirect `TEMP`, `TMP` and `TMPDIR` to `tmp/`. Redirect every applicable tool surface, including when used: `PIP_CACHE_DIR`, `UV_CACHE_DIR`, `XDG_CACHE_HOME`, `HF_HOME`, `TORCH_HOME`, `NPM_CONFIG_CACHE`, `CARGO_HOME`, `RUSTUP_HOME`, `GRADLE_USER_HOME`, Maven local repository, `CUDA_CACHE_PATH`, `NUMBA_CACHE_DIR`, virtual-environment/prefix paths, clone/download destinations, build-directory flags and log paths. This is illustrative, not an allowlist; record the actual tools and controls.

Before an active download, package acquisition, source clone, archive extraction, environment creation or build, record for each tool:

- executable and version;
- all expected writable surfaces;
- environment variables and flags redirecting each surface;
- evidence that the redirect is reliable;
- preflight result.

If any project-controlled writable surface cannot be reliably redirected under `RESOURCE_ROOT`, fail closed before the resource-producing action. Try only pre-authorized bounded alternatives. If none works, return `BLOCKED_USER_ACTION_REQUIRED` with `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`.

Transient network responses or caches internal to the Codex application/browser connector and not exposed as project files are recorded only as unavailable system/tool telemetry when material. Any research file persisted for later use must be under `RESOURCE_ROOT` or a registered shared asset.

## Resource inventory

The durable canonical inventory is `<assignment_unique_write_directory>\RESOURCE_INVENTORY.yaml`, outside the deletable tree. Each resource-producing run updates it and writes an immutable snapshot to `resources\logs\resource-inventory\<run_id>.yaml`.

Every inventory records assignment/run identity, policy/version/hash and exact root; root logical size and measurement method; top-level resource entries and claim-critical retained files; relative and absolute path, class, logical bytes, source URI or local provenance, version/commit, license, hash and hash scope; creating command/run, retention reason, claim/evidence references, deletion status and preconditions; registered shared-asset IDs/hashes; and external system dependencies/caches marked `EXTERNAL_SYSTEM_MANAGED__LOCATION_NOT_GUARANTEED`.

Hash semantics:

- downloaded files, archives, pinned source snapshots and claim-critical outputs use content SHA-256;
- retained directories use a deterministic sorted tree-manifest SHA-256;
- mutable `build/env/cache/tmp/logs` may use an index SHA-256 over normalized relative path, logical size and timestamp, labeled `METADATA_INDEX_SHA256__NOT_CONTENT_INTEGRITY`; claim-critical files inside are listed separately with content SHA-256.

For lifecycle-enabled assignments, `rules/ARTIFACT_LIFECYCLE.md` is the sole retention/deletion taxonomy; this inventory records its retention class, deletion gate and receipt pointer rather than defining a second class set. Legacy `SAFE_TO_DELETE_NOW / SAFE_TO_DELETE_AFTER_ACCEPTED_HANDOFF` remains readable only through the lifecycle compatibility rule. Shared assets and external system-managed entries are references, never assignment cleanup targets.

Missing inventory, root mismatch, unrecorded persisted resource, over-budget root or redirect-preflight failure blocks further resource-producing commands. It does not invalidate already valid scientific evidence unless provenance or reproduction is affected.

## Shared reusable assets

The only reusable project asset root is `<LOCAL_PROJECT_ROOT>\projects\_assets\<asset_id>\`.

Only mainline may create, mutate, register or retire an asset. Each asset records stable ID, source/provenance, license, content/tree hash, size, immutable version, retention reason, consumers and deletion status in `registry.yaml` and an asset-local record.

Assignment lanes consume registered assets read-only and record asset ID/hash in their inventories. Copy material to the assignment's `src/` or `build/` before any mutation. An assignment-local cache is not a shared asset.

## Cleanup safety

Cleanup is a separate explicit operation. Before recursive deletion, the cleanup owner mechanically verifies:

1. the literal resolved target equals the frozen absolute `RESOURCE_ROOT` or an inventoried descendant;
2. it is under `<LOCAL_PROJECT_ROOT>` and ends at the intended assignment's `resources` boundary;
3. it is not the workspace root, `stages\`, a stage/topic/assignment parent, `projects\`, `projects\_assets\`, a drive root or a user/system directory;
4. no unresolved variable, wildcard, junction, symbolic-link traversal or reparse-point descent is involved;
5. no active lane/process owns the target;
6. the durable inventory and claim/reproduction references were checked;
7. lifecycle retention/deletion gates permit the exact entries, when lifecycle applies.

MAINLINE owns closeout, target selection, capsule acceptance, recursive-GC authority and shared-asset retirement. During an active run, a lane may clear only an assignment-authorized, inventoried ephemeral leaf such as one exact `tmp/` child; it must record the action and cannot treat it as closeout or recursively select computed parents. Recursive deletion outside the frozen root is forbidden. Because Windows MAINLINE cannot safely mutate the user's WSL filesystem through its sandbox identity, Linux cleanup is executed only by a Linux lane under a separate MAINLINE-signed packet naming exact inventoried leaves; authority remains MAINLINE and the Linux lane may not choose or broaden targets.

After cleanup, update the durable inventory with deleted paths, bytes, timestamp, actor, recoverability and retained material. Report material deletion under the project's risk-tiered acceptance policy.

## Artifact lifecycle integration

For assignments frozen after artifact-lifecycle production cutover, also read and freeze `rules/ARTIFACT_LIFECYCLE.md`. Resource localization answers where and how files may be created; artifact lifecycle answers what must be retained, transferred, capsule-sealed or deleted at closeout.

Before accepted handoff, every persisted entry must have downstream consumers, claim/reproducibility flags, deterministic reacquire/rebuild metadata, one lifecycle retention class and a deletion gate. Cleanup requires `PHASE_CLOSEOUT_RETENTION.yaml` or a terminal/resume capsule plus `CLEANUP_RECEIPT.yaml`. Missing or ambiguous lifecycle metadata blocks production cleanup and same-assignment over-budget resource growth, but does not change scientific state.

Legacy assignments remain `GRANDFATHERED`; this integration does not retroactively authorize cleanup. The only production-eligible automatic classes and every mechanical precondition are defined by `ARTIFACT_LIFECYCLE.md` and cannot be widened by an assignment owner.

## Compatibility and rollout

- New assignments after cutover: mandatory.
- Running frozen assignments: no retroactive semantic change or relocation. Before their next resource-producing boundary, mainline may issue a mechanical `RESOURCE_LOCALIZATION_COMPATIBILITY_ADDENDUM` under the existing unique write directory.
- Existing evidence: never move, rewrite or delete merely to satisfy this layout. Legacy project-local resources may be inventoried in place; subsequent acquisition/build uses the new root.
- Existing external system caches: no scan, move or deletion is implied, and no E-drive guarantee is made.
