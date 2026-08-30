# Command log

All commands were read-only except creation of the files in this assignment's unique directory. Commands were run from `D:\project\writing\reserch`. No network command, download, source build, installer, global environment edit, witness replay, candidate, baseline or natural-corpus run was issued.

| ID | Command/action | Result |
|---|---|---|
| C01 | UTF-8 read and SHA-256 of `AGENTS.md`, `plan.md`, `registry.yaml`, candidate-owner rule and Stage A/Q1 templates | all frozen controls match except live registry |
| C02 | complete read of `academic-research-suite/SKILL.md`, experiment workflow, code-runner, reproducibility and stall protocols | validation must be exact; missing environment implies `CANNOT_VERIFY` |
| C03 | `rg -n -C 12` for lane/topic/assignment in live registry | active assignment, topic, write directory and StageB=false match; observed registry SHA-256 `6D4973A1…845` |
| C04 | UTF-8 read and SHA-256 of the eight frozen Discovery/Stage0 files | 8/8 hashes match |
| C05 | `Get-Command` for `clang`, `clang++`, `llc`, `llvm-dwarfdump`, `llvm-dis`, `llvm-objdump`, `llvm-readelf`, `llvm-mc`, `opt`, `lld`, `ld.lld` | none present on PATH |
| C06 | `rg --files` for local LLVM executables and decisive LLVM source files | found only tools/source owned by prior immutable assignments; no exact frozen commit asset |
| C07 | `--version` on selected local tools | LLVM 22.1.8 general tools mismatch; LLVM 24.0.0git custom `llc` is tied to `1f112d…` and has AMDGPU targets only |
| C08 | exact commit/path/source/archive search | exact `e72ba6…` appears in reports/contracts only; only decisive source copy is under the different `1f112d…` archive |
| C09 | WSL status/list plus `HKCU\...\Lxss` check | Windows reports WSL not installed; no distro registry key |
| C10 | SHA-256 and sizes for representative mismatched local assets | recorded in `LOCAL_ASSET_INVENTORY.md` |
| C11 | additive creation of the blocker/fidelity/handoff package | no upstream or shared file modified |
| C12 | UTF-8 decode, required-file, YAML-tab and manifest item-by-item checks | UTF-8/required files/tabs/manifest all pass; no YAML library was locally available and none was installed |

## Execution controls

- Hard timeout for any prospective claim run: not armed because gate did not pass.
- Auto-retry: none.
- Process killed: none.
- Exact per-command CPU/RSS: unavailable from this run environment and not estimated.
- Longest read-only filesystem search returned within the assignment's wall envelope.
- The exact final package byte count and manifest SHA-256 are reported in the final handoff message rather than embedded here, avoiding a self-referential hash cycle.
