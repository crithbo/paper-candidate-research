# V8-SNAPSHOT-CONSTRAINT-SCHEDULER User Blocker Packet

- Stage and assignment: StageA / `STAGEA-L1-20260811-V8-SNAPSHOT-CONSTRAINT-SCHEDULER-INITIAL-V8.7`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TOOLCHAIN`
- Exact failure and date: `2026-08-11` Asia/Shanghai; no pinned V8 source/build, `mksnapshot`, `d8`, GN, Ninja, Python or compiler was available. Installed Node `v24.15.0` reports V8 `13.6.233.17-node.48` and cannot establish the frozen commit or candidate writer path.
- Claim-bearing observation obtained before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory and hashes: this `initial` directory; canonical hashes are in `HASH_MANIFEST.sha256`.

## Exact resource needed

- Name/version/commit: unmodified V8 checkout at `c635f0d160b6e988b5ea5a907511a2929beb5d5e`, with a matching Windows x64 build capable of serializer instrumentation and regeneration.
- Required executables/capabilities: `mksnapshot`, `d8` or an equivalently matching stock-deserializer harness, V8 tests needed for snapshot bytecode/heap verification, symbols/source for `serializer.cc`, `serializer.h`, `serializer-deserializer.*`, `startup-serializer.cc`, `snapshot*.cc` and `mksnapshot.cc`; a usable GN/Ninja/Python/compiler path if code must be rebuilt.
- Required configuration: exact GN args, target CPU/OS, snapshot compression state, pointer compression/sandbox and other format-affecting flags, compiler identity, source HEAD, build command and output hashes must be frozen before the first native witness.
- Expected size and SHA-256/signature: no authoritative artifact was obtained, so no hash or byte count is invented. The provider must declare archive byte size and SHA-256 before placement. A source-plus-symbolized build is expected to be multi-GiB and therefore requires explicit mainline resource authorization if it exceeds standing StageA limits.
- License/ownership: V8 BSD-style license and third-party notices must accompany the source/build; public, redistributable CPU-only artifacts only.
- Accepted alternative A: a prebuilt, candidate-capable pinned checkout/build tree with source, symbols, exact GN args and all executable hashes.
- Accepted alternative B: pinned source plus a portable, versioned depot_tools/GN/Ninja/Python/compiler toolchain inside the new resume directory, with explicit download/disk/CPU authorization. No system install or global PATH modification.

## Minimum user action

- Ask mainline to create a new `resume1` assignment and either provide the candidate-capable pinned tree or authorize its bounded acquisition/build.
- Preferred destination: `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\V8-SNAPSHOT-CONSTRAINT-SCHEDULER\resume1\resources\v8-c635f0d-win-x64\`.
- Provide/record archive size, SHA-256, official source URL/provenance, license, exact build args, compiler/tool versions and expected executable list.
- Safe first checks: compute archive/file hashes, resolve `git rev-parse HEAD`, inspect GN args, run `mksnapshot --help` and `d8 --version`, then execute only a stock non-claim-bearing snapshot round trip before modifying the writer.

## Resume contract

- Frozen contract: `EXPERIMENT_CONTRACT.yaml`; exact SHA-256 is recorded in the canonical manifest.
- New resume directory: `stages\stageA\V8-SNAPSHOT-CONSTRAINT-SCHEDULER\resume1`; never overwrite this failure record.
- First resumed phase: read-only provenance/version/license/build-config verification, followed by stock writer/deserializer smoke.
- Resource boundary: public CPU only; no system install, global environment change, automation or StageB. Mainline must explicitly authorize any multi-GiB download/build and record storage/CPU ceilings.

## Work already performed and cost

- Network bytes/time: `0`; no network request.
- CPU/storage/device: file hashing/reading plus `6.9 s` environment inventory; no scientific compute or exclusive device.
- Explicitly not executed: V8 build, writer modification, R/A/B/C snapshot, tiny oracle, natural carrier, current-union comparison, performance/RSS/page measurements and StageB.
