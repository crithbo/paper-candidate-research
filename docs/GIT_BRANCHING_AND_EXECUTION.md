# Git branching and execution design

## Repository roles

### `main`

`main` is the only canonical state branch. MAINLINE is the sole writer for
shared rules and formal state. It owns `AGENTS.md`, `plan.md`, `registry.yaml`,
`history.md`, `rules/`, `templates/` and accepted cross-stage artifacts.

### `exec/windows`

Windows work uses the authoritative local execution root and assignment-local
resource directories. Typical topics include LeRobot, ORT, TorchDynamo,
ExecuTorch and other CPU/RTX 4070 or Windows toolchain assignments.

The branch may write only its frozen assignment directory. It must not install
software system-wide, modify user/system environment state, or edit shared
control files.

### `exec/linux`

Linux work is performed in a separate clone or worktree on the Linux host.
Typical topics include vLLM, SGLang, Triton and Linux-native CUDA assignments.
Every assignment must freeze:

```yaml
execution_target: LINUX_REMOTE
base_commit: <main commit SHA>
execution_branch: exec/linux
linux_workspace_root: <absolute Linux path>
resource_bundle_id: <hash-pinned bundle ID>
```

Historical Windows absolute paths remain evidence only. New executable plans
use repository-relative paths plus the frozen execution root.

## Assignment lifecycle

1. MAINLINE freezes the assignment on `main`, including the base commit and
   target execution branch.
2. The execution branch synchronizes from `main` before any scientific or
   resource action.
3. The worker writes only the unique assignment directory and external
   artifact store.
4. The branch commits code, contracts, reports, manifests, receipts and
   minimum evidence; resource bytes stay external.
5. A pull request targets `main`.
6. MAINLINE validates the handoff and merges it with a merge commit.
7. Only after merge does MAINLINE update the formal state in `registry.yaml`.
8. The execution branch synchronizes to the accepted `main` before reuse.

## Merge and protection policy

- No direct push to `main` after the initial bootstrap.
- No force-push to protected branches.
- Preserve assignment commits; use a merge commit rather than squash for
  claim-bearing or terminal evidence.
- `exec/windows` and `exec/linux` may not change shared-control paths relative
  to `main`.
- Every pull request must pass repository safety checks and targeted manifest
  validation.
- Large resources are exchanged by SHA-256 identity, never by unverified path
  or branch membership.

## Cloud execution

GitHub-hosted runners may perform metadata, schema, path and lightweight CPU
checks. CUDA experiments require a user-controlled self-hosted Linux runner or
an explicitly authorized Linux host. GitHub Actions is not an artifact store
for model, toolchain or raw experiment resources.

## Initial routing

| Route | Initial topics |
|---|---|
| Windows | LeRobot, ORT, TorchDynamo, ExecuTorch, VHLO |
| Linux | vLLM CUDA-Graph capture-set, QRefine/Triton W4A16, future vLLM/SGLang CUDA work |
| Main only | Discovery, Stage 0, shared rules, accepted reports, STOP/terminal capsules |

