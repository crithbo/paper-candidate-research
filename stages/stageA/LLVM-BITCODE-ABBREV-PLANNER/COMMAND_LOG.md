# Command log

Assignment: `STAGEA-L3-20260809-LLVM-BITCODE-ABBREV-PLANNER-INITIAL-V8.7`

This log records command intent, exit status, and evidence boundary. Exact stdout/stderr files are stored under `logs/` when material. No command before a recorded fidelity-gate PASS is claim-bearing.

| Seq | Phase | Command or action | Result | Evidence use |
|---:|---|---|---|---|
| 1 | intake | Fully read AGENTS, plan, registry, owner rule, ARS router/workflow/roles, frozen Discovery/PRIMARY/confirmation, and templates | PASS | authority and input freeze only |
| 2 | integrity | SHA-256 recomputation of 24 authoritative inputs | PASS; combined freeze `14887ea76079bcbb7e028af2bf5ae3252b3319939d6d09802cfd8d281afeac43` | provenance only |
| 3 | preflight | PATH audit for Git/CMake/Ninja/Clang/LLVM native tools | Git present; CMake/Ninja/Clang/llvm-as/llvm-dis/opt/llvm-bcanalyzer absent | resource discovery only |
| 4 | contamination guard | Project-wide executable name check | another candidate directory contains LLVM tools; rejected because not a registered shared asset | no reuse, no scientific inference |
| 5 | provenance | Resolve Google mirror `de8cb59` through official Gitiles JSON | full mirror commit and GitOrigin-RevId resolved | current-source pin only |
| 6 | provenance | Resolve official LLVM 22.1.8 annotated tag and release assets | full commit and official SHA-256/size resolved | executable toolchain pin only |

