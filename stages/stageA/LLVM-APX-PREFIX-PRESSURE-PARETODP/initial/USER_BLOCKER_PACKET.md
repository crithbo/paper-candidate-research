# LLVM-APX-PREFIX-PRESSURE-PARETODP User Blocker Packet

- Stage and assignment: StageA / `STAGEA-L1-20260811-LLVM-APX-PREFIX-PRESSURE-PARETODP-INITIAL-V8.7`
- Status: `BLOCKED_USER_ACTION_REQUIRED`
- Blocker kind: `TOOLCHAIN`
- Exact failure and timestamp: on `2026-08-11` (Asia/Shanghai), PATH lookup found no `clang`, `clang-cl`, `llc`, `llvm-mc`, `llvm-objdump`, `llvm-readobj`, `llvm-lit`, `opt`, `objdump`, `cmake`, `ninja`, `python`, or `python3`; the registered same-topic inputs contained no pinned LLVM source/build tree.
- Claim-bearing observation obtained before failure: `no`
- Scientific inference allowed: `none`
- Evidence ceiling: `RESOURCE_FAILURE_ONLY__NO_SCIENTIFIC_INFERENCE`
- Scientific revision consumed: `no`
- Immutable failure directory: this `initial` directory; exact hashes are in `HASH_MANIFEST.sha256`.

## Exact resource needed

- Name/version/commit: unmodified LLVM monorepo commit `a1194be1baefa99d20a09bd04b16056be0ab7225`, Windows x86-64, with X86/APX targets and assertions/MachineVerifier-capable codegen.
- Required executables/capabilities: `llc`, `llvm-mc`, `llvm-objdump`, `llvm-readobj`, `opt`, `FileCheck` and the LLVM test/MIR support needed to run `-verify-machineinstrs`; `llvm-mc` must accept the frozen APX NDD syntax and `llvm-objdump` must decode it.
- Expected size and SHA-256/signature: preferred prebuilt bundle no more than `3.5 GiB` unpacked and `2 GiB` transferred. Its archive SHA-256 must be supplied or independently frozen before extraction; no archive hash is invented here because no authoritative binary was obtained. Commit identity must resolve exactly to the 40-hex pin.
- License: Apache License v2.0 with LLVM Exceptions; retain upstream `LICENSE.TXT` and third-party notices.
- Accepted form A (minimum): a reproducible, unmodified, prebuilt pinned LLVM tree.
- Accepted form B: pinned source plus a portable Windows build stack inside the future resume directory (MSVC/clang compiler, CMake, Ninja, Python), with versions/hashes/licenses frozen. No system-level install or global PATH change is acceptable.
- Independent oracle: if the resumed contract retains the Stage0 binutils cross-check, provide an APX-capable GNU `objdump` bundle with exact version, SHA-256, and GPL notice; otherwise LLVM's native disassembler can close only the LLVM-native subgate and the independent-oracle boundary remains explicit.

## Minimum user action

- Ask mainline to authorize a `resume1` assignment and place or authorize download of the prebuilt pinned tree under:
  `<LEGACY_LOCAL_PROJECT_ROOT>\stages\stageA\LLVM-APX-PREFIX-PRESSURE-PARETODP\resume1\resources\llvm-a1194be1-windows-x86_64\`
- Include the archive SHA-256, byte size, source URL/provenance, build command/configuration, and license files.
- Minimum safe checks after placement: compute SHA-256 for every delivered archive/executable; run each tool's `--version`; resolve the source HEAD to the exact commit; then run a non-claim-bearing stock APX MC smoke before any candidate or natural input.

## Resume contract

- Frozen contract: `EXPERIMENT_CONTRACT.yaml` in this package; its exact SHA-256 is in the canonical manifest.
- New resume directory: `stages\stageA\LLVM-APX-PREFIX-PRESSURE-PARETODP\resume1`; never overwrite `initial`.
- First command after unblocking: read-only asset inventory, SHA-256/license verification, exact commit check, and `--version` smoke.
- Resource boundary: public CPU only, no system install/global environment modification/GPU/exclusive device; remain within the role's StageA resource ceiling and obtain mainline authorization before any resource expansion.

## Work already performed and cost

- Network bytes/time: `0`; no network request.
- CPU/storage/device use: only file hashing/reading and a `6.8 s` PATH inventory; no scientific compute, GPU, or exclusive device.
- Explicitly not executed: native witness, MachineVerifier, candidate, tiny oracle, natural corpus, current LLVM/tuning/Unison comparisons, benchmarks, and StageB.
