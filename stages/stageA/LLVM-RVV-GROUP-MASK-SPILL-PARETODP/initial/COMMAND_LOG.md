# Command Log

All commands were run from `<LEGACY_LOCAL_PROJECT_ROOT>`. No command modified a
shared control file or another candidate directory.

| ID | Purpose | Command class | Result |
|---|---|---|---|
| CMD-READ-001 | Read/hashes for `AGENTS.md`, `plan.md`, `registry.yaml`, role rule | PowerShell `Get-Content`, `Get-FileHash` | Initial foreach/pipeline syntax error; corrected read completed. Entry hashes matched the assignment freeze. |
| CMD-READ-002 | Read complete `academic-research-suite/SKILL.md` and experiment/code-runner instructions | PowerShell read-only file access | Completed. ARS evidence hierarchy, pre-registration, exact reproducibility and no-proxy policy applied. |
| CMD-UPSTREAM-001 | Enumerate and hash minimal Discovery/Stage-0 closing/revision materials | `rg --files`, `Get-FileHash`, `Get-Content` | Completed. Closing handoff and manifest matched; manifest verified `2/2`. |
| CMD-TEMPLATE-001 | Read StageA, StageB, Q1, handoff and blocker templates required by the role | PowerShell read-only file access | Completed. |
| CMD-ENV-001 | Inventory `llc`, LLVM companions and build commands on PATH | PowerShell `Get-Command` | Initial foreach/pipeline syntax error; corrected inventory completed. Exact LLVM tools absent. |
| CMD-SEARCH-001 | Search workspace filenames and text for LLVM toolchains/commit | `rg --files`, `rg` | No exact-commit source/build/tool manifest found. Two unregistered cross-candidate `llc.exe` paths found and rejected without execution. |
| CMD-WEB-001 | Attempt official GitHub lookup for frozen commit/PR | Read-only web open/search | Direct safe-open failed; official-domain search did not return an exact usable asset. No result was used as scientific evidence. |
| CMD-HASH-001 | Hash ARS/templates | `Get-FileHash` | One guessed ARS subpath did not exist; actual paths were located. Root skill and templates hashed successfully. |
| CMD-DIR-001 | Create the sole authorized output directory | PowerShell `New-Item` | Completed. |
| CMD-CIM-001 | Capture optional OS/CPU details | `Get-CimInstance` | Access denied; nonessential because no run occurred. |
| CMD-WRITE-001 | Create frozen contract and canonical blocker package | `apply_patch` | Completed within the sole write directory. |
| CMD-YAML-001 | Attempt optional YAML parser validation using bundled workspace Python | Python import/read-only | PyYAML was absent; no files changed. Mechanical manifest and manual schema review remain the validators. |
| CMD-CLOSE-001 | Recompute every artifact hash, verify manifest entries and count directory files | PowerShell `Get-FileHash` | Final closure performed after the last content edit; exact result is reported by the terminal handoff. |

Commands deliberately not run:

- no `git clone`, archive download, package install, LLVM build or system install;
- no `llc`, MachineVerifier, MIR execution, candidate, baseline or natural trace;
- no synthetic/proxy model and no Stage B action.
