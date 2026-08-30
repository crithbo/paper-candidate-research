# Command Log

All commands ran from `D:\project\writing\reserch`. Writes were confined to the
assignment's `initial` directory.

| ID | Purpose | Command class | Result |
|---|---|---|---|
| C01 | Hash control files and fully read registry | `Get-FileHash`, `Get-Content`, `rg` | Frozen plan, registry and role hashes matched; exact assignment/write boundary and StageB=false confirmed. |
| C02 | Fully read `AGENTS.md` and `plan.md` | `Get-Content -Raw` | Completed. |
| C03 | Fully read candidate-owner rule | `Get-Content -Raw` | Completed. |
| C04 | Fully read ARS router, experiment workflow and code-runner role | `Get-Content -Raw` | Completed; exact reproducibility/no-proxy evidence rules applied. |
| C05 | Enumerate and hash the registered primary, confirmation, revision1 and closing packets plus required templates | `Get-ChildItem`, `Get-FileHash` | Completed. Closing report/handoff/manifest matched the user freeze. |
| C06 | Fully read all files in the four registered Stage0 packets and five role-required templates | `Get-Content -Raw` | Completed; no other candidate packet was read. |
| C07 | Inventory exact LLVM/PPC tools and exact-commit workspace references | `Get-Command`, `rg --files`, `rg` | Required tools absent; commit occurs only in Stage0 text. No registered exact build found. |
| C08 | Recompute all four upstream manifests | PowerShell manifest verifier | Primary `4/4`, confirmation `2/2`, revision1 `4/4`, closing `2/2`. |
| C09 | Create sole authorized output directory | `New-Item` | Completed. |
| C10 | Freeze contract, fidelity gate and resource failure record | `apply_patch` | Completed. |
| C11 | Generate standard StageA blocker reports and handoff package | `apply_patch` | Completed. |
| C12 | Terminal control-drift and package check | `Get-FileHash` plus manifest entry verifier | Mainline had rewritten plan/registry after entry; drift recorded without importing facts. Final package closure was rerun after this record. |

Commands explicitly not executed:

- no network download, `git clone`, LLVM build, package/system installation or
  global environment change;
- no `llc`, `llvm-mc`, `llvm-readobj`, `llvm-objdump`, `ld.lld`, MachineVerifier,
  witness, candidate, baseline, oracle or natural function;
- no GOT substitution, generic solver, register-renaming proxy, post-result
  tuning, GPU or Stage B action.
