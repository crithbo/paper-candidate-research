# Proposed canonical content for `rules/RESOURCE_LOCALIZATION.md`

## Purpose and scope

This protocol makes project-controlled storage auditable and removable. It applies to every new assignment and to every resume/resource addendum issued after its production cutover.

It governs files that an assignment actively downloads, copies, extracts, installs into an isolated environment, builds, generates as tool/package cache, or creates as temporary/log output. It does not claim ownership or location control over caches and files already maintained by Codex, Windows, device drivers, browsers, IDEs or preinstalled runtimes. Existing system-managed dependencies may be read, but they are not project assets and must not be represented as residing under the workspace.

## Frozen assignment contract

Every assignment freezes, before the first resource-producing command:

- `RESOURCE_POLICY_VERSION` and policy SHA-256;
- one absolute, normalized `RESOURCE_ROOT`;
- `RESOURCE_INVENTORY_PATH`;
- network, stored-byte, CPU/GPU/wall, attempt and tool/source envelope;
- allowed source/provenance/license selection rules;
- an exact process-local redirect map for every tool that may write downloads, temporary files, package caches, environments or build output;
- cleanup owner and retention rules.

The canonical root is `<assignment_unique_write_directory>\resources\`. A historical directory topology may be retained, but the root must still be the `resources\` child of that assignment's frozen unique write directory and must resolve under `<LEGACY_LOCAL_PROJECT_ROOT>`. It may not be the workspace root, a stage root, `projects\`, a drive root, a user directory, an unresolved variable, a wildcard or a reparse/junction target.

The following eight directories are created beneath the root even when some remain empty:

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

Recommended semantics:

- `downloads/`: immutable network responses before unpacking;
- `archives/`: retained compressed packages/datasets and export bundles;
- `src/`: pinned source/data working copies that are not shared assets;
- `build/`: object files, generated code, build trees and experiment binaries;
- `env/`: assignment-local virtual environments, package prefixes and portable toolchains;
- `cache/`: package, compiler, model and tool caches controlled by the assignment;
- `tmp/`: disposable intermediates;
- `logs/`: resource preflights, command logs and immutable inventory snapshots.

## Process-local redirection and fail-closed preflight

The assignment must set temporary/cache variables and tool flags in the launched process only. It must not change global PATH, the Windows registry, machine/user environment variables or system package state.

At minimum, redirect `TEMP`, `TMP` and `TMPDIR` to `tmp/`. Redirect every applicable tool surface, for example `PIP_CACHE_DIR`, `UV_CACHE_DIR`, `XDG_CACHE_HOME`, `HF_HOME`, `TORCH_HOME`, `NPM_CONFIG_CACHE`, `CARGO_HOME`, `RUSTUP_HOME`, `GRADLE_USER_HOME`, Maven local repository, `CUDA_CACHE_PATH`, `NUMBA_CACHE_DIR`, virtual-environment/prefix paths, clone/download destinations, build-directory flags and log paths. This list is illustrative, not an allowlist; the assignment records the actual tools and controls used.

Before an active download, package acquisition, source clone, archive extraction, environment creation or build, record for each tool:

- executable and version;
- all expected writable surfaces;
- environment variables/flags that redirect each surface;
- the evidence used to determine that the redirect is reliable;
- whether the preflight passed.

If any project-controlled writable surface cannot be reliably redirected under `RESOURCE_ROOT`, fail closed before starting that resource-producing action. Try only pre-authorized, bounded alternatives. If none works, return `BLOCKED_USER_ACTION_REQUIRED` with `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`; do not infer scientific failure.

Transient network responses or caches internal to the Codex application/browser connector that are not exposed as project files are recorded only as unavailable system/tool telemetry when material. Any research file persisted for later use must be written under `RESOURCE_ROOT` or be a registered shared asset.

## Resource inventory

The durable canonical inventory is `<assignment_unique_write_directory>\RESOURCE_INVENTORY.yaml`, outside the deletable resource tree. Each resource-producing run updates it and writes an immutable run snapshot to `resources\logs\resource-inventory\<run_id>.yaml`.

Every inventory records:

- assignment/run identity, policy/version/hash and exact root;
- root logical size and the measurement method;
- every top-level resource entry and every claim-critical retained file;
- relative and absolute path, resource class, logical bytes, source URI or local provenance, version/commit, license when applicable, hash and hash scope;
- creating command/run, retention reason, claim/evidence references, deletion status and deletion preconditions;
- shared-asset references by registered asset ID/hash, never by unregistered path;
- external system dependencies/caches used but not owned, explicitly marked `EXTERNAL_SYSTEM_MANAGED__LOCATION_NOT_GUARANTEED`.

Hash semantics must be honest:

- downloaded files, archives, pinned source snapshots and claim-critical outputs use content SHA-256;
- retained directories use a deterministic sorted tree-manifest SHA-256;
- mutable `build/env/cache/tmp/logs` may use an inventory-index SHA-256 over normalized relative path, logical size and timestamp, but must label it `METADATA_INDEX_SHA256__NOT_CONTENT_INTEGRITY`; any claim-critical file inside them is listed separately with content SHA-256.

Deletion status is one of:

- `RETAIN_CLAIM_CRITICAL`;
- `RETAIN_REPRODUCIBILITY_DEPENDENCY`;
- `SAFE_TO_DELETE_AFTER_ACCEPTED_HANDOFF`;
- `SAFE_TO_DELETE_NOW`;
- `BLOCKED_BY_ACTIVE_PROCESS_OR_ASSIGNMENT`;
- `SHARED_ASSET_READ_ONLY`;
- `EXTERNAL_SYSTEM_MANAGED__NOT_PROJECT_OWNED`.

Missing inventory, a root mismatch, unrecorded persisted resource, an over-budget root or a redirect preflight failure blocks further resource-producing commands. It does not invalidate already valid scientific evidence unless provenance/reproduction is affected.

## Shared reusable assets

The only reusable project asset root is:

`<LEGACY_LOCAL_PROJECT_ROOT>\projects\_assets\<asset_id>\`

Only mainline may create, mutate, register or retire an asset. Each asset has a stable ID, provenance/source, license, content/tree hash, size, immutable version, retention reason, consumers and deletion status in registry plus an asset-local record.

Assignment lanes consume registered assets read-only and record the asset ID/hash in their inventory. If a build or transformation would mutate an asset, copy the necessary material into that assignment's `src/` or `build/`; never modify the shared asset in place. An assignment-local cache is never promoted to a shared asset merely because another lane could use it.

## Cleanup safety

Cleanup is a separate, explicit operation. Before any recursive deletion, the cleanup owner must mechanically verify:

1. the literal resolved target equals the frozen absolute `RESOURCE_ROOT` or an inventoried descendant;
2. it is under `<LEGACY_LOCAL_PROJECT_ROOT>` and ends at the intended assignment's `resources` boundary;
3. it is not the workspace root, `stages\`, a stage/topic/assignment parent, `projects\`, `projects\_assets\`, a drive root or any user/system directory;
4. no unresolved variable, wildcard, junction, symbolic-link traversal or reparse-point descent is involved;
5. no active lane/process owns the target;
6. the durable inventory and claim/reproduction references have been checked;
7. only entries whose deletion status and preconditions permit deletion are included.

Default cleanup owner is mainline. A lane may clear only an explicitly authorized descendant such as `tmp/` and only when the assignment says so. Recursive deletion outside the frozen root is forbidden. Shared assets have their own mainline-only retirement procedure and are never removed as part of assignment cleanup.

After cleanup, update the durable inventory with deleted paths, bytes, timestamp, actor, recoverability and retained material. Report material deletion to the user according to the project's risk-tiered acceptance policy.

## Compatibility and rollout

- New assignments after cutover: mandatory.
- Running frozen assignments: no retroactive rule change or relocation. At the next resume or resource-producing boundary, mainline may issue a mechanical `RESOURCE_LOCALIZATION_COMPATIBILITY_ADDENDUM` that creates a root under the existing unique write directory without changing scientific semantics.
- Existing evidence: never move, rewrite or delete merely to satisfy the new layout. Registered project-local legacy resources may be inventoried in place as legacy; further active acquisition/build must use the new root.
- Existing external system caches: no scan, move or deletion is implied, and no D-drive guarantee is made.

