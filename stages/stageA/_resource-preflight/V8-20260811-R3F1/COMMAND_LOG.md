# Command log

- Assignment: `RESOURCE-PREFLIGHT-L3-20260811-V8-EXACT-PLATFORM-R3F1`
- Date/time zone: `2026-08-11 / Asia/Shanghai`
- Workflow: `academic-research-suite` experiment-planning and reproducibility protocol.
- Write boundary: only this R3F1 directory.

## Control and continuity

1. Read the complete `AGENTS.md`, `plan.md`, `registry.yaml`, candidate-owner rule, ARS router and relevant experiment/reproducibility instructions. All four frozen control hashes matched.
2. The registry's older R3F1/topic fields contain `...-LX-...`, while the user dispatch and active lane contain `...-L3-...`. The L3 dispatch was retained as controlling; scope, exact commit and directory are identical.
3. Recomputed the previous V8 initial manifest: SHA-256 `416B9CA7...D301`, `10/10` entries verified. Read only its contract, blocker, report, handoff, input freeze, results, tool inventory and command log.

## Official static metadata

4. Initial sandboxed `curl` to official Gitiles failed with Windows Schannel `SEC_E_NO_CREDENTIALS`; one approved read-only retry outside the sandbox succeeded. No archive was requested.
5. Queried official Gitiles commit/tree metadata and small exact source/license files. Recorded commit tree/parent/position/version, license SHA-256 and snapshot-relevant blob IDs.
6. Queried official LUCI Buildbucket by exact `buildset` tag. Found successful Win64 builder/tester/debug-builder builds and no exact result for `V8 Official Win64`.
7. Read exact Win64 builder GN-args and isolate-output logs. Read only the 253-byte public Google Storage JSON manifest, verified generation/size/MD5/CRC metadata, and recomputed SHA-256 `41732913...C00A`.
8. An optional 320-byte CAS root-directory metadata request to `cas.chromium.org` failed DNS resolution. No CAS/archive body was downloaded and no unseen file-list claim was made.
9. Two large Gitiles source reads developed network long tails and were interrupted. Smaller bounded exact-file requests then returned the required snapshot toolchain, target OS/arch, reader version/checksum, flag and isolate-target evidence.

## Local read-only inventory

10. Observed Windows x64 `10.0.26200.8875`, 32 logical processors, 31.69 GiB RAM, NTFS D: with 304.91 GiB free, Git `2.53.0.windows.3`, and Node/V8 mismatch `24.15.0 / 13.6.233.17-node.48`.
11. `depot_tools`, Python, GN, Ninja/autoninja, Visual Studio discovery, Windows Kits, `d8`, and `mksnapshot` were absent. The system inventory command `systeminfo.exe` returned access denied; Node and .NET read-only APIs supplied the needed host values.

## Prohibited actions retained at zero

- Archive, CAS tree, executable, source checkout and compiler payload bodies downloaded: `0`.
- Source build, Linux/WSL action, system install, global PATH/environment mutation, candidate/baseline/scientific experiment, automation and Stage B: none.
- Claim-bearing observations: `0`.
- Scientific revision consumed: `false`.
- Metadata response bytes were not globally instrumented; the two retained body-level metadata reads were 253-byte isolate JSON and 3,093-byte license text.

