# Paper Candidate Research Pipeline

Private research-control repository for the Discovery → Stage 0 → Stage A
pipeline. The canonical project state is maintained on `main`; Windows and
Linux execution are isolated on long-lived integration branches.

## Branches

- `main`: canonical rules, templates, plan, registry, accepted reports,
  manifests, receipts, handoffs and terminal evidence capsules.
- `exec/windows`: assignment-local Windows/CPU/RTX 4070 execution work.
- `exec/linux`: assignment-local Linux/CUDA/Triton/vLLM execution work.

Execution branches inherit `main`. They must not independently edit
`AGENTS.md`, `plan.md`, `registry.yaml`, `rules/` or `templates/`. Accepted
assignment outputs return through a pull request; MAINLINE performs the formal
state update after merge.

## Artifacts

Downloaded source archives, toolchains, virtual environments, builds, caches,
models and raw assignment resource roots are deliberately excluded from Git.
Git tracks their provenance, SHA-256 values, inventories, reacquisition routes
and the minimum claim-critical evidence only. See
[`ARTIFACT_CATALOG.yaml`](ARTIFACT_CATALOG.yaml) and
[`docs/GIT_BRANCHING_AND_EXECUTION.md`](docs/GIT_BRANCHING_AND_EXECUTION.md).

## Safety

This repository should be created as **private** first. Before any future
public release, run a separate privacy, secret, license and evidence-ceiling
audit. Historical absolute paths are retained as provenance and must not be
treated as portable executable commands.

