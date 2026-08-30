# APX r3 exact resource/build gate report

## Outcome

The frozen short-path resource gate completed successfully. LLVM commit `a1194be1baefa99d20a09bd04b16056be0ab7225` was configured exactly once and built exactly once with Ninja `-j2`; all 3,156 build steps completed. The required seven tools, two portable runtime DLLs, 87 license/notice files, and immutable provenance were packaged at `resources/env/apx-toolchain`.

This is a resource-gate result only. No natural function, candidate, baseline, benchmark, performance, full-cost, or other claim-bearing run was started, and no scientific or stage-state conclusion is proposed.

## Frozen input and path closure

- Network use: `0` bytes.
- Exact same-topic parent assets copied and hash-accepted: `5/5`.
- Source root: `resources/src/s`; bootstrap tool root: `resources/env/t`; build root: exact `resources/build` with no extra prefix.
- Predicted and actual longest object directory: `224` characters, strictly below the frozen `240` threshold.
- Subst, junction, symlink, reparse, WSL, system install, global environment, registry, and source patch use: none.
- The source archive had 19 symlink entries that exFAT cannot represent; they were recorded and omitted without substitution, and the generated Ninja graph referenced none of them.

## Exact configure/build

- Configure: `1/1`, Release, assertions ON, X86 target, Clang project, exit 0, 92.385 s.
- Clean build: `1/1`, 2 jobs, required seven targets, exit 0, 1,630.356 s, no retry.
- CMake cache SHA-256: `AFAFA39C04D66DA877E5110D88946FF949A39212F1437426C8AF1705178F6A6C`.
- `build.ninja` SHA-256: `1D651B2D5EF822248AB4167FFF864AC6479898AB1EC85992B20E08ACBBCA735D`.
- Tool bundle manifest SHA-256: `0BE2C3F60A6F42886F7951D2887D1A3D936B0E1A26E0C6B9B0B89D421944FB91`.

## Authorized non-claim smoke

- Version and registered X86 targets: PASS; LLVM/Clang `24.0.0git`, optimized assertions build.
- APX MC parse/encode/FileCheck/object/disassembly: PASS; frozen smoke bytes `62 f4 6c 18 83 c1 7b`.
- Tiny stock MIR parse plus MachineVerifier: PASS.

These observations establish only that the exact tool bundle was built and exposes the frozen mechanical capabilities.

## Resource and closeout

- Resource root: 6,020,974,435 logical bytes in 198,251 files; below 8 GiB.
- Reparse entries: 0; active build/configure/smoke processes at closeout: 0.
- Retained bundle plus logs/scripts: projected 322,158,611 bytes, below the 2 GiB post-close budget.
- Exact MAINLINE-only cleanup candidates: 5,698,815,824 bytes. The owner deleted nothing.

Next action: MAINLINE mechanically accepts or rejects this handoff, seals the capsule/downstream input, and owns any closeout GC. Any scientific preclaim work requires a separate frozen assignment.

