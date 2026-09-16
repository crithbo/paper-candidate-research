# V8 exact-platform resource matrix

All rows concern V8 commit `c635f0d160b6e988b5ea5a907511a2929beb5d5e`. No archive, CAS tree, executable, source checkout, compiler package, or build output was downloaded in this assignment.

| Route or asset | Exact pin / public provenance | Windows x64 evidence | Candidate-capable writer? | Body action in R3F1 | Disposition |
|---|---|---|---|---|---|
| Official V8 Gitiles source | Commit object, tree `98d4847e...`, commit position `#109153`, BSD-style V8 license plus third-party notices | Exact commit is reachable; exact source defines native Win/x64 snapshot toolchain and reader checks | Yes, only after a source build that permits serializer instrumentation | Metadata and small source/license text only | `FEASIBLE_NEXT_ROUTE__NOT_ACQUIRED` |
| `V8 Win64 - builder` LUCI build | Build `8673841892324615937`, #29159, `SUCCESS` | Exact input/output revision; native Win10 x64 builder | No. The public `bot_default` test isolate is a stock test payload, not mutable source/symbols; its target graph does not promise `mksnapshot.exe` as archived data | 253-byte manifest metadata only | `STOCK_CONTROL_ASSET_METADATA_PASS` |
| `V8 Win64` LUCI tester | Build `8673841534126114753`, #71443, `SUCCESS` | The exact builder output was accepted by the matching Windows tester infrastructure | No | Metadata only | `NATIVE_PLATFORM_ROUTE_CORROBORATION` |
| `V8 Win64 - debug builder` LUCI build | Build `8673841892481508561`, #28922, `SUCCESS` | Exact commit has a debug Windows build route | Not established; no candidate source/build package was acquired | Metadata only | `DEBUG_ROUTE_EXISTS__PAYLOAD_UNINSPECTED` |
| `V8 Official Win64` exact-tag search | Official LUCI Buildbucket search | No exact-tag result for this builder name | No | Metadata only | `NOT_FOUND__NONBLOCKING` |
| Local official Windows source build | V8 official `fetch v8`, exact checkout, `gclient sync`, GN and Ninja flow | Ordinary native Win/x64 route is officially documented and exact CI independently succeeded | Yes | Forbidden in R3F1 | `PREFLIGHT_FEASIBLE__SEPARATE_AUTHORIZATION_REQUIRED` |
| User-provided candidate-capable Windows package | Must contain exact source, dependencies, symbols, `d8.exe`, `mksnapshot.exe`, exact effective GN args, toolchain identities, hashes and notices | Same platform contract as local route | Yes, if source can be modified/rebuilt or package includes the requested instrumented variants | Not provided | `ACCEPTABLE_ALTERNATIVE_NEXT_ROUTE` |
| Linux build or Linux platform refreeze (R3F2) | Authorization explicitly absent | Not needed: the frozen Stage A contract did not bind Linux, and Windows can be frozen before the first native claim | Potentially, but out of scope | Prohibited | `NOT_REQUIRED__NOT_AUTHORIZED__DO_NOT_EXECUTE` |

## Prebuilt isolate limits

The public object contains three root CAS directory digests: `bot_default`, `mozilla`, and `test262`. Exact source maps `bot_default` to `//test:v8_bot_default`; that group aggregates stock tests. Exact `BUILD.gn` only adds the `mksnapshot` executable as archived data when deterministic-mksnapshot verification is enabled, while the observed builder GN args do not enable that flag. The CAS root directory itself was not enumerated because the attempted metadata endpoint did not resolve; this does not authorize an archive download and does not support claims about unseen files.

Consequently, the isolate is useful as a future stock control only after separate body-download authorization. It cannot satisfy the candidate-writer requirement by itself.

## Host readiness

| Item | Observed | Requirement / effect |
|---|---:|---|
| OS / architecture | Windows `10.0.26200.8875`, x64 | Official route supports Windows 10+ x64 |
| Logical processors | 32 | CPU-only route is feasible |
| Physical RAM | 31.69 GiB | Exceeds official 8 GiB minimum and 16 GiB recommendation |
| D: filesystem / free space | NTFS / 304.91 GiB | Exceeds official 100 GB free-space requirement |
| Git | `2.53.0.windows.3` | Present |
| Node | `24.15.0`, V8 `13.6.233.17-node.48` | Present but not the pin; control inventory only |
| `depot_tools`, Python, GN, Ninja/autoninja | absent from PATH | Must be acquired inside the next assignment directory |
| Visual Studio C++ toolchain / Windows SDK | not discovered (`vswhere` and Windows Kits absent) | User must provision, or provide a candidate-capable build package; the agent must not install globally |
| `d8`, `mksnapshot` | absent from PATH | Must come from the exact next build/package |

The official Windows documentation currently requires Visual Studio 2026 (>=18.0.0), Desktop development with C++, MFC/ATL, Windows 11 SDK `10.0.28000.2270`, and suitable Debugging Tools. License suitability for Visual Studio Community is a user decision.

