# User policy record

- Proposed approval ID for mainline registration: `USER_ASSIGNMENT_RESOURCE_LOCALIZATION_20260814`
- Source: user direct instruction in the long-lived RULE-AUDIT-SENTRY task, `2026-08-14 22:47 Asia/Shanghai`.
- Approval status: `EXPLICIT_USER_POLICY_APPROVAL__MAINLINE_IMPLEMENTATION_AUTHORIZED`

## Approved policy

1. Every assignment freezes one unique `RESOURCE_ROOT`, normally `<assignment_unique_write_directory>/resources/` and therefore under `<LEGACY_LOCAL_PROJECT_ROOT>`.
2. Every root contains `downloads/`, `archives/`, `src/`, `build/`, `env/`, `cache/`, `tmp/`, and `logs/`.
3. Every configurable temporary directory, download destination and package/tool cache is redirected with process-local environment variables or command flags. If the tool cannot be shown to respect a safe redirect, the assignment fails closed before an active download/build/install/extract operation.
4. Every run produces a `RESOURCE_INVENTORY.yaml` recording path, size, source/provenance, hash, retention reason and deletion status.
5. Reusable shared assets may be created only by mainline under `<LEGACY_LOCAL_PROJECT_ROOT>\projects\_assets\<asset_id>\` and must be registered before reuse.
6. Cleanup starts only from the exact frozen `RESOURCE_ROOT`; recursive deletion of the workspace root, a stage root, a drive root or any user directory is forbidden.
7. Existing caches owned by the Codex application, Windows, drivers, browsers, IDEs and preinstalled runtimes are not project assets, and the project cannot promise that those existing system-managed caches are on drive D. The policy applies to research material, tools, environments, caches and build products that a project assignment actively downloads, installs, copies, extracts or builds.

## Authorization boundary

This approval authorizes the mainline single writer to install the shared policy, template and role references at the next safe assignment boundary. It does not authorize this audit lane to edit shared files, does not expand any scientific/resource budget, does not authorize system installation or global environment changes, and does not permit moving or deleting existing evidence without a separately validated migration/cleanup action.

