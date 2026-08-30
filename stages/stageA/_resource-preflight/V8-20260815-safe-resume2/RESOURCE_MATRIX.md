# V8 safe-resume2 resource matrix

Exact object: V8 commit `c635f0d160b6e988b5ea5a907511a2929beb5d5e`, native Windows x64.

| Resource / route | Current observation | Exact-object usability | Threshold / permission result |
|---|---|---|---|
| Existing Node | Node 24.15.0, embedded V8 13.6.233.17-node.48 | Mismatch/unproven pin; no mutable snapshot writer | Inventory control only |
| Existing `d8` / `mksnapshot` | Missing from PATH | Required writer/reader unavailable | Resource blocker remains |
| Existing V8 source/build in authorized inputs | 21 text/manifest files; zero V8 source or candidate binaries | No | Nothing reusable as candidate build |
| Visual Studio C++ / MFC/ATL | `vswhere`, standard VS roots, `cl`, `link`, `msbuild` absent | Required on public Windows route | System install is not authorized |
| Windows SDK / Debugging Tools | Windows Kits registry and standard roots absent | Required by official Windows build route | User-provided/license-appropriate prerequisite required |
| Git | 2.53.0.windows.3 present | Source transport only | Insufficient by itself |
| Python / GN / Ninja / depot_tools | No interpreter; GN/Ninja absent | Required for fetch/config/build | Could be assignment-local, but does not solve missing SDK or large-route thresholds |
| Official exact source + `gclient sync` + GN/Ninja build | Public official route, exact commit and DEPS closure | Candidate-capable after exact build and effective-args audit | Estimated 35 GiB network, 120 GiB high-water, 24 CPU-hours, 6 wall-hours: all automatic thresholds exceeded |
| User-provided exact candidate-capable package | Must contain exact source/DEPS, symbols or rebuild capability, `d8`, `mksnapshot`, `cctest`, effective args, toolchain identities, hashes and licenses | Yes if all pins validate | May be acceptable only after mainline freezes size/hash/license and the same thresholds are respected |

## Host feasibility

The machine has 32 logical processors, 31.69 GiB RAM and 287.13 GiB free on NTFS D:. A 120 GiB high-water build is physically plausible, though free space is 17.78 GiB lower than R3F1 observed. Physical feasibility does not authorize the build.

## Stop boundary

No source/archive/CAS/toolchain payload was downloaded and no build command was executed. The route is stopped before action because cumulative download, new persisted data, CPU and wall estimates exceed the autonomous limits, and because the Windows SDK/C++ prerequisite would require a user-provided environment or separately authorized system action.
