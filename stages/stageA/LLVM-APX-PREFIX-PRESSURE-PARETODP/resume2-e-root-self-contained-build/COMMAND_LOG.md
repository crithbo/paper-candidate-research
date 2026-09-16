# APX resource-gate command ledger

All mutating commands were confined to the unique assignment directory. Read-only monitoring commands are summarized rather than repeated line by line.

| Phase | Command/action | Outcome | Attempt effect |
|---|---|---|---|
| Bootstrap | Create eight standard resource directories | First invocation used unsupported `New-Item -LiteralPath` and created nothing; corrected fixed-path invocation passed | no asset/build attempt |
| Downloader setup | Windows PowerShell `.NET HttpClient` script | First launch lacked `System.Net.Http`; no request | no network attempt |
| Network | `.NET HttpClient` GET commit metadata | Failed before response headers with `HttpRequestException`; no bytes persisted | network attempt 1/6, route not retried |
| Network | Bundled Python HTTPS GET commit metadata | PASS, 8,174 bytes | attempt 2/6 |
| Network | Bundled Python HTTPS GET LLVM source archive | PASS, 278,674,752 bytes | attempt 3/6 |
| Network | Bundled Python HTTPS GET LLVM-MinGW 20260616 | PASS, 187,504,083 bytes and frozen hash | attempt 4/6 |
| Network | Bundled Python HTTPS GET CMake 4.4.2 wheel | PASS, 42,325,289 bytes and PyPI hash | attempt 5/6 |
| Network | Bundled Python HTTPS GET Ninja 1.13.0 wheel | PASS, 309,975 bytes and PyPI hash | attempt 6/6 |
| Archive preflight | Python tar/zip member validator | Initial link-string validator over-rejected six safe `..` links; retained as pass1. Parent-resolved validator passed all four archives | no extraction attempt consumed |
| Source extraction | `tar.exe -xf ... --strip-components 1` | Regular tree extracted; exFAT could not create 19 symlinks and wrapper exited 1 | one source extraction, not rerun |
| Source closure | Long-path-aware Python verification | All regular files/directories size-closed; symlink creation failed because exFAT; no copied-link substitution | no source patch |
| Tool extraction | Long-path-aware Python exact ZIP extraction | LLVM-MinGW, CMake and Ninja passed | one extraction each |
| Configure wrapper | PowerShell log encoding and empty-array corrections | Both stopped before CMake | no configure attempt |
| CMake configure | Initial exact configure | Compiler identified; failed before compile because backslash RC path serialized as `\p` | configure 1/1 |
| CMake corrected reconfigure | Same build directory, tool paths normalized to `/` | CMake terminal markers and `build.ninja` prove PASS | corrected reconfigure 1/1 |
| Configure validation | Python cache/source/graph/budget validation | PASS; 19 missing symlink paths have zero Ninja graph references | no build |
| Build | Ninja `-j2 llc llvm-mc llvm-objdump llvm-readobj opt FileCheck clang` | Exit 1 at 2407/3156 due 266-character mkdir on exFAT | clean build 1/1; no retry |
| Smoke | Version/target/APX MC/tiny MIR | Not run because required outputs were absent | 0 claim/smoke observations |
| Closeout | Inventory, failure capsule and reports | Completed; no deletion | MAINLINE cleanup only |

Raw commands, arguments, stdout, stderr, response headers, timestamps and hashes are under `resources/logs/`. Signed redirect query strings were redacted after the responses were persisted and hashed.
