# Source / same-object / collision matrix

| Family | Current primary source | Same-object oracle | Strong subtractor | Decision |
|---|---|---|---|---|
| SFrame | Linux upstream `unwind_user`/SFrame patch series (2025) and compiler format routes | stock SFrame/frame-pointer unwind trace | SFrame encoding + existing compiler frame lowering | unfrozen; generic residual |
| GCC AArch64 IRA | GCC upstream 2025 callee-saved register cost-scale hook patch | AArch64 ABI/assembler-link behavior | GCC IRA + AArch64 frame cost | structural drop |
| arm-tv | OOPSLA 2025 primary paper/artifact | authoritative AArch64 semantics validator | arm-tv itself | raw drop |
| TPDE | 2025 primary paper/source | executable target behavior | TPDE's integrated backend | raw drop |
| CoSSJIT | OOPSLA 2025 artifact | VM execution behavior | CoSSJIT construction / JIT policy | raw drop |
| RyuJIT | dotnet/runtime current JIT source/docs | CoreCLR behavior | existing tiering/JIT union | raw drop |

Old issue text, missing source closure and unexecuted natural routes are not treated as absence or scientific negative evidence.

