# Windows x64 platform-semantic parity preflight

## Decision

`PASS_FOR_NEXT_RESOURCE_REQUEST__WINDOWS_X64_NATIVE_PLATFORM_CAN_BE_FROZEN`

This is not cross-platform byte parity. It means every later candidate and comparator arm can use one exact native Windows x64 build/reader/format contract before any claim-bearing observation. The frozen Stage A object did not name Linux; its initial blocker explicitly required the OS/CPU/GN/compiler/snapshot settings to be frozen before the first native witness. Therefore no Linux refreeze is required and R3F2 remains unauthorized.

## Static evidence chain

1. Official Gitiles resolves the exact commit, tree, parent, version `15.3.0` candidate and commit position `refs/heads/main@{#109153}`.
2. Official LUCI records show that `V8 Win64 - builder`, `V8 Win64`, and `V8 Win64 - debug builder` all completed successfully for the exact commit.
3. Exact `gni/snapshot_toolchain.gni` states that a non-cross build with matching current/host OS and CPU uses the current toolchain. It also treats cross-OS builds separately, so host/target identity cannot be ignored.
4. Exact `BUILD.gn` invokes the matching `mksnapshot` target and passes `--target_os=$current_os` and `--target_arch=$current_cpu`; with external startup data it writes `snapshot_blob.bin`.
5. Exact `mksnapshot.cc` forces predictable mode, writes the startup blob, and configures embedded output with the target OS and architecture.
6. Exact `snapshot.cc` embeds the V8 version string, checks it in the reader, and verifies the snapshot checksum when enabled. A different-version or corrupted blob cannot silently count as parity.

## Frozen same-object rule for the next assignment

- Platform: native Windows x64 only.
- Source: exact V8 commit and exact dependency revisions from its `DEPS`.
- One compiler/SDK/GN/Ninja/depot_tools identity and one complete resolved GN-argument dump.
- Identical builtins roots, logical heap graph, object identities/aliasing, read-only/shared/startup/context partitions, startup/warmup scripts, profile inputs, random/predictable settings, snapshot compression mode, external-startup-data mode and native bytecode format across stock, baselines and candidate.
- One matching `d8.exe` or stock-deserializer harness built from the same configuration as `mksnapshot.exe`.
- Same raw snapshot denominator and matching-reader version/checksum/behavior checks for every arm.
- No Linux result, Node-bundled V8, Chrome binary, external codec, or cross-OS byte comparison may substitute for this contract.

## Remaining preclaim obligations

Resource PASS in the next assignment must precede every scientific observation. It must freeze all binary/source hashes and effective args, run an unmodified stock writer/reader smoke, then return to the original five-item `PRE_CLAIM_CONTRACT_FIDELITY_GATE`. This preflight neither passes that gate nor consumes a scientific revision.

